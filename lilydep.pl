#!/usr/bin/perl -w
#!/usr/bin/env perl

# this script analyzes lilypond dependency information...

use strict;
use diagnostics;
use Perl6::Slurp qw();
use Parse::RecDescent qw();

my($debug)=1;

if(@ARGV!=2) {
	die("usage: infile outfile");
}
my($infile)=$ARGV[0];
my($outfile)=$ARGV[1];

if($debug) {
	print "infile is [$infile]\n";
	print "outfile is [$outfile]\n";
}

my($grammer);
$grammer=Perl6::Slurp::slurp("lilypond.grammer");
#print "grammer is $grammer";
$::RD_HINT=1;
$::RD_WARN=1;
#$::RD_TRACE=1;
#$Parse::RecDescent::skip='[ \v\t\n]*';
my($data);
$data=Perl6::Slurp::slurp($infile);
my($parser)=Parse::RecDescent->new($grammer);;
my($ret)=$parser->lilyfile(\$data);
if(!$ret) {
	die("ERROR!");
}
# check that there is no more data which is not parsed...
if($data!~/^\s*/) {
	die("rest of data is [$data]");
}

open(FILE,"> ".$outfile) || die("unable to open file for writing");
my($inc)=$ret->{"inc"};
print FILE $infile.": ".join(" ",@$inc)."\n";
close(FILE) || die("unable to close file");
