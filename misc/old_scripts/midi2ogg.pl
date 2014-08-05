#!/usr/bin/perl -w

# This is a script that wraps the running of timidity.
#
# Why do I need this ?
# - timidity runs even if it doesnt have any input!
# - timidity does not set the output to be read only.
# - I don't know if timidity takes care to remove any output on failuer (need to check this).
# - I want the ability to keep timidity silent.
#
# Design:
# - this script will run timidiy as a child process
# TODO:
# - bring support functions from other project and use them here...

use strict;
use diagnostics;
use File::Spec qw();

# parameters (edit these to change the way this script works)
# do you want to debug the script?
my($debug)=0;
my($volume,$directories,$myscript)=File::Spec->splitpath($0);
my($tmp_fname_out)='/tmp/'.$myscript.$$.'.out';
my($tmp_fname_err)='/tmp/'.$myscript.$$.'.err';
my($prog)='timidity';

# script starts here
my($input)=shift(@ARGV);
my($output)=shift(@ARGV);
if($debug) {
	print 'tmp_fname_out is ['.$tmp_fname_out.']'."\n";
	print 'tmp_fname_err is ['.$tmp_fname_err.']'."\n";
	print 'input is ['.$input.']'."\n";
	print 'output is ['.$output.']'."\n";
}
# check that the input exists and if not then die...
if(! -f $input) {
	die('input file ['.$input.'] doesnt exist');
}
# make sure that there is no output...
if(-f $output) {
	my($fnum)=unlink($output);
	if($fnum!=1) {
		die('unable to remove file ['.$output.']');
	}
}
my($cmd)=$prog.' '.$input.' -idq -Ov -o '.$output.' 2> '.$tmp_fname_err.' > '.$tmp_fname_out;
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
	open(FILE,$tmp_fname_err) || die('unable to open');
	my($line);
	while($line=<FILE>) {
		print $line;
	}
	close(FILE) || die('unable to close');
	# exit with error code of the child...
	$fnum=unlink($tmp_fname_out);
	if($fnum!=1) {
		die('unable to remove file ['.$tmp_fname_out.']');
	}
	$fnum=unlink($tmp_fname_err);
	if($fnum!=1) {
		die('unable to remove file ['.$tmp_fname_err.']');
	}
	exit($res >> 8);
} else {
	my($fnum)=chmod(0444,$output);
	if($fnum!=1) {
		die('unable to chmod file ['.$output.']');
	}
	$fnum=unlink($tmp_fname_out);
	if($fnum!=1) {
		die('unable to remove file ['.$tmp_fname_out.']');
	}
	$fnum=unlink($tmp_fname_err);
	if($fnum!=1) {
		die('unable to remove file ['.$tmp_fname_err.']');
	}
}
