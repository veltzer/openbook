#!/usr/bin/perl -w

# This script creates the final book
# It receives:
# A list of source files
# An output file

use strict;
use diagnostics;

# here we go...
my($output)=shift(@ARGV);
system('pdfjoin out/src/jazz/*.pdf --outfile '.$output.' 2> /dev/null');
