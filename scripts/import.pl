#!/usr/bin/perl -w
#!/usr/bin/env perl

# this script imports all of my lilypond sources, targets and meta data (extracted
# from the lilypond files themselves) into my database (into a lilypond table).

# TODO:
# - improve the lilypond parser to get more data. 

use strict;
use diagnostics;
use DBI;
use Error qw(:try);
use File::Find qw();
use File::Basename qw();
use Perl6::Slurp qw();
use Parse::RecDescent qw();

my($debug)=0;
my($report)=1;
my($limit_imports)=1;

my($dbh)=DBI->connect('dbi:mysql:myworld','','',{
	RaiseError => 1,
	AutoCommit => 0,
	mysql_enable_utf8 => 1,
});
sub handle_error() {
	my($rc)=$dbh->err;
	my($str)=$dbh->errstr;
	my($rv)=$dbh->state;
	throw Error::Simple($str.",".$rv.",".$rv);
}
$dbh->{HandleError} =\&handle_error;

my($grammer);
my($grammer_file)="data/lilypond.grammer";
$grammer=Perl6::Slurp::slurp($grammer_file);
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
		my($name,$path,$suffix)=File::Basename::fileparse($file,".ly");
		my($file_ly)=$path.$name.".ly";
		my($file_pdf)=$path.$name.".pdf";
		my($file_ps)=$path.$name.".ps";
		my($file_midi)=$path.$name.".midi";
		my($file_wav)=$path.$name.".wav";
		my($filebasename)=$name;
		my($dt_ly);
		$dt_ly=Perl6::Slurp::slurp($file_ly);
		my($dt_pdf);
		$dt_pdf=Perl6::Slurp::slurp($file_pdf);
		my($dt_ps);
		$dt_ps=Perl6::Slurp::slurp($file_ps);
		my($dt_midi);
		$dt_midi=Perl6::Slurp::slurp($file_midi);
		my($dt_wav);
		$dt_wav=Perl6::Slurp::slurp($file_wav);
		if($debug) {
			print "name is $name\n";
			print "path is $path\n";
			print "suffix is $suffix\n";
			print "file_ly is $file_ly\n";
			print "file_pdf is $file_pdf\n";
			print "file_ps is $file_ps\n";
			print "file_midi is $file_midi\n";
			print "file_wav is $file_wav\n";
		}
		my($hash)=get_meta_data($file);
		if($limit_imports) {
			if(!exists($hash->{"completion"})) {
				return;
			}
			if($hash->{"completion"}<3) {
				return;
			}
			if(exists($hash->{"dontimport"})) {
				return;
			}
		}
		if($report) {
			print "importing [".$hash->{"title"}."]\n";
		}
		$dbh->do("insert into TbMsLilypond (filebasename,ly,pdf,ps,midi,wav,title,subtitle,composer,copyright,style,piece,poet) values(?,?,?,?,?,?,?,?,?,?,?,?,?)",
			undef,
			$filebasename,
			$dt_ly,
			$dt_pdf,
			$dt_ps,
			$dt_midi,
			$dt_wav,
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
