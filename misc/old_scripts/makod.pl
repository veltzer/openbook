#!/usr/bin/perl -w

# this script analyzes gpp dependency information...

use strict;
use diagnostics;

my($debug)=0;

if(@ARGV<3) {
	die('usage: infile outfile [deps files...]');
}
my($infile)=$ARGV[0];
my($outfile)=$ARGV[1];
my($targets)=join(' ',@ARGV[2..$#ARGV]);

if($debug) {
	print 'infile is ['.$infile.']'."\n";
	print 'outfile is ['.$outfile.']'."\n";
	print 'targets is ['.$targets.']'."\n";
}

# this is a function that removes a file and can optionally die if there is a problem
sub chmod_check($$) {
	my($file,$check)=@_;
	if($debug) {
		print 'chmodding ['.$file.']'."\n";
	}
	my($ret)=chmod(0444,$file);
	if($check) {
		if($ret!=1) {
			die('problem chmodding file ['.$file.']');
		}
	}
}

my(@inc);
open(IN,$infile) || die('unable to open input file for reading');
my($line);
while($line=<IN>) {
	# check if its an include line...
	if($line=~/^include\(.*\)/) {
		my($include)=($line=~/^include\((.*)\)/);
		if(-f $include) {
			push(@inc,$include);
		}
	}
}
close(IN) || die('unable to close input file');

unlink($outfile);
open(FILE,'> '.$outfile) || die('unable to open file for writing');
print FILE $targets.': '.join(' ',@inc)."\n";
close(FILE) || die('unable to close file');
chmod_check($outfile,1);
