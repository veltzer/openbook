#!/usr/bin/perl -w

# this script analyzes gpp dependency information...

use strict;
use diagnostics;

my($debug)=0;

if(@ARGV!=2) {
	die('usage: infile outfile');
}
my($infile)=$ARGV[0];
my($outfile)=$ARGV[1];

if($debug) {
	print 'infile is ['.$infile.']'."\n";
	print 'outfile is ['.$outfile.']'."\n";
}

my(@inc);
open(IN,$infile) || die('unable to open input file for reading');
open(FILE,'> '.$outfile) || die('unable to open output file for writing');
#print FILE "<%page args=\"part\"/>"."\n";
my($line);
while($line=<IN>) {
	chop($line);
	if($line=~/attributes\[\'do/) {
		$line="\t".$line;
	}
	if($line eq "\tattributes['type']=\"tune\"") {
		print FILE "\tattributes['doVoice']=True"."\n";
	} else {
		print FILE $line."\n";
	}
}
close(IN) || die('unable to close input file');
close(FILE) || die('unable to close output file');

