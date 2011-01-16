#!/usr/bin/perl -w

# This is a test script that outputs some data to standard output and some data to standard
# error

use strict;
use diagnostics;

print STDOUT "Hello Stdout!\n";
print STDERR "Hello Stderr!\n";
exit(7);
