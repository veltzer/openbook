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

sub get_meta_data($) {
	my($file)=$_[0];
	if($debug) {
		print "meta file is $file\n";
	}
	my($hash)={};
	return $hash;
}

sub handler() {
	#print $_."\n";
	#print $File::Find::name."\n";
	#print "in here ".$_[0]."\n";
	#print "============\n";
	my($file)=$File::Find::name;
	if($file=~/\.ly$/) {
		if($debug) {
			print "file is $file\n";
		}
		my($hash)=get_meta_data($file);
	}
}

File::Find::find(\&handler,".");

#$dbh->do("update TbWkWork set length=? where id=?",undef,$stat_secs,$row_id);
#$dbh->do("update TbWkWork set size=? where id=?",undef,$stat_size,$row_id);
#$dbh->commit();

$dbh->disconnect();
