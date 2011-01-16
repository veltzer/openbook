#!/usr/bin/perl -w

# This is a general script to grep using perl to overcome some of the definiencies
# of grep(1) grepping...
# The reason this script is here is to make this source repository independant of any
# of my other stuff...

use strict;
use diagnostics;

my($pattern)=$ARGV[0];
my($debug)=0;
my($pring_filename)=1;

for(my($i)=1;$i<@ARGV;$i++) {
	my($filename)=$ARGV[$i];
	if($debug) {
		print "filename is [$filename]\n";
	}
	open(FILE,$filename) || die "Can't open file [$filename]: $!";
	my($line);
	while($line=<FILE>) {
		if($line=~$pattern) {
			if($pring_filename) {
				print $filename.": ";
			}
			print $line; 
		}
	}
	close(FILE) || die("unable to close file [$filename]: $!");
}
