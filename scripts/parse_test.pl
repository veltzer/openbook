#!/usr/bin/perl -w

# This is a script to test the parsing of lilypond

use strict;
use diagnostics;
use Perl6::Slurp qw();
use Parse::RecDescent qw();

my($debug)=1;

if(@ARGV!=1) {
	die('usage: infile');
}
my($infile)=$ARGV[0];

if($debug) {
	print 'infile is ['.$infile.']'."\n";
}

my($grammer);
my($grammer_file)='scripts/lilypond.grammer';
$grammer=Perl6::Slurp::slurp($grammer_file);
#print 'grammer is ['.$grammer.']'."\n";
$::RD_HINT=1;
$::RD_WARN=1;
#$::RD_TRACE=1;
#$Parse::RecDescent::skip='[ \v\t\n]*';
my($data);
$data=Perl6::Slurp::slurp($infile);
my($parser)=Parse::RecDescent->new($grammer);;
my($ret)=$parser->lilyfile(\$data);
if(!$ret) {
	die('ERROR!');
}
if($debug) {
	print('printing returned hash...'."\n");
	while(my($key,$val)=each(%$ret)) {
		print('key is ['.$key.'], val is ['.$val.']'."\n");
	}
}
# check that there is no more data which is not parsed...
if($data!~/^\s*/) {
	die('rest of data is ['.$data.']');
}
if($debug) {
	print 'done...'."\n";
}
