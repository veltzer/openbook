#!/usr/bin/perl -w

# This is a general script to grep using perl to overcome some of the definiencies
# of grep(1) grepping...
# The reason this script is here is to make this source repository independant of any
# of my other stuff...

# TODO
# - better command line interaction (help, better command line assurence).
# - enable to scan whole files and not just lines.
# 	What if I'm looking for a pattern that spans more than one line?

use strict;
use diagnostics;

my($pattern)=$ARGV[0];
my($debug)=0;
my($print_filename)=1;

for(my($i)=1;$i<@ARGV;$i++) {
	my($filename)=$ARGV[$i];
	if($debug) {
		print "filename is [$filename]\n";
	}
	open(FILE,$filename) || die "Can't open file [$filename]: $!";
	my($line);
	my($line_number)=1;
	while($line=<FILE>) {
		if($line=~$pattern) {
			if($print_filename) {
				print $filename.":".$line_number." ";
			}
			print $line;
		}
		$line_number++;
	}
	close(FILE) || die("unable to close file [$filename]: $!");
}
