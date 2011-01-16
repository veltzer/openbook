#!/usr/bin/perl -w

# This is a script that wraps the running of gpp.
#
# Why do I need this ?
# - gpp does not overwrite the target if it exists.
# - gpp does not erase the output file if it fails.
# - gpp does not chmod the output file properly
#
# Design:
# - this script will run gpp as a child process

use strict;
use diagnostics;

# parameters
my($debug)=0;
my($args)='-U "" "" "(" "," ")" "(" ")" "#" "UNRELIABLE" -M "#" "\n" " " " " "\n" "(" ")"';

# here we go...
my($output)=shift(@ARGV);
if($debug) {
	print 'output is ['.$output.']'."\n";
}
# unlink the target if it exists
if(-f $output) {
	unlink($output);
}
my($cmd)='gpp '.$args.' '.join(' ',@ARGV);
if($debug) {
	print 'cmd is ['.$cmd.']'."\n";
}
my($res)=system($cmd);
if($debug) {
	print 'system returned ['.$res.']'."\n";
}
if($res) {
	unlink($output);
} else {
	chmod(0444,$output);
}
