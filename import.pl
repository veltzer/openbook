#!/usr/bin/perl -w

# this script imports all of my lilypond sources, targets and meta data (extracted
# from the lilypond files themselves) into my database (into a lilypond table).

use strict;
use diagnostics;
use DBI;
use Error qw(:try);

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

my($debug)=0;
my($prog)=1;

#$dbh->do("update TbWkWork set length=? where id=?",undef,$stat_secs,$row_id);
#$dbh->do("update TbWkWork set size=? where id=?",undef,$stat_size,$row_id);
#$dbh->commit();

$dbh->disconnect();
