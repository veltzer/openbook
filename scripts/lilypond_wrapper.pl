#!/usr/bin/perl -w

# This is a script that wraps the running of lilypond.
#
# Why do I need this ?
# - lilypond is quite noisy when running and I really want to shut it up.
#	It has no quiet flag that will only show me errors
# - lilypond is quite idiotic in how it produced output (funny names to files
# 	that it produces that cannot be controlled and more).
#
# Design:
# - this script will run lilypond as a child process and will communicate with it using a
# pipe.
# - unfortunately this design is not currently implemented since there was a problem with
# collecting the childs return status while also piping from it. I don't know how to do
# that in perl.


use strict;
use diagnostics;

=head previous attempt
# run lilypond with all the arguments that I was given,
# redirecting stderr to stdout and stdout to ourselves
my($res)=open(FILE,'./test.pl 2>&1 |') || die('unable to open');
print 'open returned '.$res."\n";
my($line);
while($line=<FILE>) {
	print 'line is '.$line;
}
$res=close(FILE);
print 'close returned '.$res."\n";

=cut

# parameters
my($debug)=0;
my($tmp_fname)='/tmp/'.$ARGV[1].$$;

# here we go...
my($output)=shift(@ARGV);
my($cmd)='lilypond '.join(' ',@ARGV).' 1> /dev/null 2> '.$tmp_fname;
if($debug) {
	print 'cmd is ['.$cmd.']'."\n";
}
my($res)=system($cmd);
if($debug) {
	print 'system returned ['.$res.']'."\n";
}
if($res) {
	open(FILE,$tmp_fname) || die('unable to open');
	my($line);
	while($line=<FILE>) {
		print $line;
	}
	close(FILE) || die('unable to close');
	# exit with error code of the child...
	exit($res << 8);
} else {
	system("touch $output");
}
