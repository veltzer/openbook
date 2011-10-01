#!/usr/bin/perl -w

# This script creates the final book
# It receives:
# A list of source files
# An output file

use strict;
use diagnostics;

# the command is:
# $(Q)pdfjoin $(FILES_PDF) --outfile $@ 2> /dev/null
