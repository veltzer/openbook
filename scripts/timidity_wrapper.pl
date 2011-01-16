#!/usr/bin/perl -w

# This is a script that wraps the running of timidity.
#
# Why do I need this ?
# - timidity runs even if it doesnt have any input!
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
my($input)=$ARGV[0];
if($debug) {
	print 'input is ['.$input.']'."\n";
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
exit($res);
