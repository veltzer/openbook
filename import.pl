#!/usr/bin/perl -w
#!/usr/bin/env perl

# this script imports all of my lilypond sources, targets and meta data (extracted
# from the lilypond files themselves) into my database (into a lilypond table).

# TODO:
# - use a real lilypond parser instead of the current hack (see the get_meta_data function).

use strict;
use diagnostics;
use DBI;
use Error qw(:try);
use File::Find qw();
use File::Basename qw();
use Perl6::Slurp qw();
use Parse::RecDescent qw();

my($debug)=1;
my($limit_imports)=0;

my($dbh)=DBI->connect('dbi:mysql:myworld','','',{
	RaiseError => 1,
	AutoCommit => 0,
});
sub handle_error() {
	my($rc)=$dbh->err;
	my($str)=$dbh->errstr;
	my($rv)=$dbh->state;
	throw Error::Simple($str.",".$rv.",".$rv);
}
$dbh->{HandleError} =\&handle_error;

my($grammer);
$grammer=Perl6::Slurp::slurp("lilypond.grammer");
#print "grammer is $grammer";
$::RD_HINT=1;
$::RD_WARN=1;
#$::RD_TRACE=1;
#$Parse::RecDescent::skip='[ \v\t\n]*';

sub get_meta_data($) {
	my($file)=$_[0];
	if($debug) {
		print "meta file is $file\n";
	}
	my($data);
	$data=Perl6::Slurp::slurp($file);
	my($parser)=Parse::RecDescent->new($grammer);;
	my($ret)=$parser->lilyfile(\$data);
	if(!$ret) {
		die("ERROR!");
	}
	# check that there is no more data which is not parsed...
	if($data!~/^\s*/) {
		die("rest of data is [$data]");
	}
	return $ret;
}

#get_meta_data('test.ly');
#die("end of debug");

sub handler() {
	my($file)=$File::Find::name;
	if($file=~/\.ly$/) {
		my($source)=$file;
		my($name,$path,$suffix)=File::Basename::fileparse($source,".ly");
		my($pdf)=$path.$name.".pdf";
		my($ps)=$path.$name.".ps";
		my($dt_source);
		$dt_source=Perl6::Slurp::slurp($source);
		my($dt_pdf);
		$dt_pdf=Perl6::Slurp::slurp($pdf);
		my($dt_ps);
		$dt_ps=Perl6::Slurp::slurp($ps);
		if($debug) {
			print "file is $file\n";
			print "name is $name\n";
			print "path is $path\n";
			print "suffix is $suffix\n";
			print "pdf is $pdf\n";
			print "ps is $ps\n";
		}
		my($hash)=get_meta_data($file);
		if($limit_imports) {
			if(!exists($hash->{"completion"})) {
				next;
			}
			if($hash->{"completion"}<3) {
				next;
			}
			if(exists($hash->{"dontimport"})) {
				next;
			}
		}
		#also use $hash->{"completion"}
		$dbh->do("insert into TbMsLilypond (source,pdf,ps,title,subtitle,composer,copyright,style,piece,poet) values(?,?,?,?,?,?,?,?,?)",
			undef,
			$dt_source,
			$dt_pdf,
			$dt_ps,
			$hash->{"title"},
			$hash->{"subtitle"},
			$hash->{"composer"},
			$hash->{"copyright"},
			$hash->{"style"},
			$hash->{"piece"},
			$hash->{"poet"}
		);
	}
}

$dbh->do("delete from TbMsLilypond",undef);
$dbh->do("alter table TbMsLilypond AUTO_INCREMENT=1",undef);
File::Find::find({"no_chdir"=>1,"wanted"=>\&handler},".");

# now commit all the changes...
$dbh->commit();

$dbh->disconnect();
