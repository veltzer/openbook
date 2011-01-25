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
use File::Spec qw();

# parameters (edit these to change the way this script works)
my($debug)=0;
my($volume,$directories,$myscript)=File::Spec->splitpath($0);
my($tmp_fname)='/tmp/'.$myscript.$$;
my($prog)='timidity';

# script starts here
my($input)=shift(@ARGV);
my($output)=shift(@ARGV);
if($debug) {
	print 'tmp_fname is ['.$tmp_fname.']'."\n";
	print 'input is ['.$input.']'."\n";
	print 'output is ['.$output.']'."\n";
}
# check that the input exists and if not then die...
if(! -f $input) {
	die('no input provided');
}
# make sure that there is no output...
if(-f $output) {
	my($fnum)=unlink($output);
	if($fnum!=1) {
		die('unable to remove file ['.$output.']');
	}
}
my($cmd)=$prog.' '.join(' ',@ARGV).' 2> '.$tmp_fname;
if($debug) {
	print 'cmd is ['.$cmd.']'."\n";
}
my($res)=system($cmd);
if($debug) {
	print 'system returned ['.$res.']'."\n";
}
if($res) {
	# remove the output to make sure that we leave no output behind...
	my($fnum)=unlink($output);
	if($fnum!=1) {
		die('unable to remove file ['.$output.']');
	}
	# print the error log
	open(FILE,$tmp_fname) || die('unable to open');
	my($line);
	while($line=<FILE>) {
		print $line;
	}
	close(FILE) || die('unable to close');
	# exit with error code of the child...
	$fnum=unlink($tmp_fname);
	if($fnum!=1) {
		die('unable to remove file ['.$tmp_fname.']');
	}
	exit($res << 8);
} else {
	my($fnum)=chmod(0444,$output);
	if($fnum!=1) {
		die('unable to chmod file ['.$tmp_fname.']');
	}
	$fnum=unlink($tmp_fname);
	if($fnum!=1) {
		die('unable to remove file ['.$tmp_fname.']');
	}
}
