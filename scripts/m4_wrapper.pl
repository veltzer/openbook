#!/usr/bin/perl -w

# This is a script that wraps the running of m4.
#
# Why do I need this ?
# - m4 does not have a command line option for specifying an output file name so we
# use redirection and so we need to make sure that if we fail we clean the output file.
#
# Design:
# - this script runs m4 as a child process

use strict;
use diagnostics;

# parameters
my($debug)=0;
my($args)='-I /usr/share/lilypond/2.12.3/ly';
my($prog)='m4';

# here we go...
my($input)=shift(@ARGV);
my($output)=shift(@ARGV);
if($debug) {
	print 'input is ['.$input.']'."\n";
	print 'output is ['.$output.']'."\n";
}
# remove the output if it exists
if(-f $output) {
	unlink($output);
	#die('['.$output.'] exists');
}
my($cmd)=$prog.' '.$input.' > '.$output.' '.$args.' '.join(' ',@ARGV);
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
