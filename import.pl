#!/usr/bin/perl -w

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

my($debug)=1;

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

# gulp down an entire file...
sub read_file($) {
	my($file)=$_[0];
	return "foo";
}

sub get_meta_data($) {
	my($file)=$_[0];
	if($debug) {
		print "meta file is $file\n";
	}
	my($hash)={};
	return $hash;
}

sub handler() {
	my($file)=$File::Find::name;
	if($file=~/\.ly$/) {
		my($source)=$file;
		my($name,$path,$suffix)=File::Basename::fileparse($source,".ly");
		my($pdf)=$path.$name.".pdf";
		my($dt_source)=read_file($source);
		my($dt_pdf)=read_file($pdf);
		if($debug) {
			print "file is $file\n";
			print "name is $name\n";
			print "path is $path\n";
			print "suffix is $suffix\n";
			print "pdf is $pdf\n";
		}
		my($hash)=get_meta_data($file);
		$dbh->do("insert into TbMsLilypond (source,pdf) values(?,?)",undef,$dt_source,$dt_pdf);
	}
}

$dbh->do("delete from TbMsLilypond",undef);
$dbh->do("alter table TbMsLilypond AUTO_INCREMENT=1",undef);
File::Find::find(\&handler,".");

# now commit all the changes...
$dbh->commit();

$dbh->disconnect();
