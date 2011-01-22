#!/usr/bin/perl -w

# This is a script that wraps the running of timidity.
#
# Why do I need this ?
# - timidity runs even if it doesnt have any input!
# - timidity does not set the output to be read only.
# - I don't know if timidity takes care to remove any output on failuer (need to check this).
#
# Design:
# - this script will run timidiy as a child process

use strict;
use diagnostics;

# parameters
my($debug)=0;
my($prog)='timidity';
#my($prog)='cpp';

# here we go...
my($input)=shift(@ARGV);
my($output)=shift(@ARGV);
if($debug) {
	print 'input is ['.$input.']'."\n";
	print 'output is ['.$output.']'."\n";
}
#check that the input exists and if not then die...
if(! -f $input) {
	die("no input provided");
}
my($cmd)=$prog.' '.join(' ',@ARGV);
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
exit($res);
