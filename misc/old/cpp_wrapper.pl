#!/usr/bin/perl -w

# This is a script that wraps the running of cpp.
#
# Why do I need this ?
# - cpp does not erase the output file if it fails.
# - gpp does not chmod the output file properly
#
# Design:
# - this script runs cpp as a child process

use strict;
use diagnostics;

# parameters
my($debug)=0;
my($args)='';
my($prog)='cpp';

# here we go...
my($output)=shift(@ARGV);
if($debug) {
	print 'output is ['.$output.']'."\n";
}
# error if the output exists
if(-f $output) {
	die('['.$output.'] exists');
}
my($cmd)=$prog.' '.$args.' '.join(' ',@ARGV);
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
