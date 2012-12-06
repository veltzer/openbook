#!/usr/bin/perl -w

# this is a wrapper script that makes return code always
# be ok. It calls anything you like but supresses it's return
# code and always returns 0. The idea is to stop make shouting about
# errors in the make process when checking sutff.

use strict;
use diagnostics;

system @ARGV
