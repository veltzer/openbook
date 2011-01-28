#!/usr/bin/perl -w

# This is a script that wraps the running of lilypond.
#
# Why do I need this ?
# - lilypond is quite noisy when running and I really want to shut it up.
#	It has no quiet flag that will only show me errors
# - lilypond is quite idiotic in how it produced output (funny names to files
# 	that it produces that cannot be controlled and more).
# - I want to chmod 444 the files after they are created so that I will not
# 	accidentaly change them.
# - I want to remove the files before the process begins to make sure that
# 	I will not use old files coupled with new.
# - I want to remove any files that were generated in case of error.
#
# Design:
# - this script will run lilypond as a child process and will communicate with it using a
# pipe.
# - unfortunately this design is not currently implemented since there was a problem with
# collecting the childs return status while also piping from it. I don't know how to do
# that in perl.

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

use strict;
use diagnostics;
use File::Spec qw();
use File::Basename qw();

# parameters
# do you want debugging...
my($debug)=0;
my($volume,$directories,$myscript) = File::Spec->splitpath($0);
# temporary file name to store errors...
my($tmp_fname)='/tmp/'.$myscript.$$;
# maximum number of pages produced per lily invocation...
my($max_pages)=10;
my($remove_tmp)=1;


#	-$(Q)chmod 444 $@ $(dir $@)$(basename $(notdir $@))*.png $(dir $@)$(basename $(notdir $@)).ps $(dir $@)$(basename $(notdir $@)).pdf $(dir $@)$(basename $(notdir $@)).midi

# this is a function that removes a file and can optionally die if there is a problem
sub unlink_check($$) {
	my($file,$check)=@_;
	if($debug) {
		print 'unlinking ['.$file.']'."\n";
	}
	my($ret)=unlink($file);
	if($check) {
		if($ret!=1) {
			die('problem unlinking file ['.$file.']');
		}
	}
}
# this is a function that removes a file and can optionally die if there is a problem
sub chmod_check($$) {
	my($file,$check)=@_;
	if($debug) {
		print 'chmodding ['.$file.']'."\n";
	}
	my($ret)=chmod(0444,$file);
	if($check) {
		if($ret!=1) {
			die('problem chmodding file ['.$file.']');
		}
	}
}
# sub do file
sub do_file($$$) {
	my($file,$unlink,$check)=@_;
	if($unlink) {
		unlink_check($file,0);
	} else {
		chmod_check($file,$check);
	}
}

# a function that messes with the list of files associated with a certain lilypond file...
sub do_files($$) {
	my($output,$unlink)=@_;
	my($volume,$directories,$file)=File::Spec->splitpath($output);
	my($base)=File::Basename::basename($file,'.stamp');
	my($ps_file)=File::Spec->catpath($volume,$directories,$base.'.ps');
	my($pdf_file)=File::Spec->catpath($volume,$directories,$base.'.pdf');
	my($midi_file)=File::Spec->catpath($volume,$directories,$base.'.midi');
	my($png_file)=File::Spec->catpath($volume,$directories,$base.'.png');
	do_file($ps_file,$unlink,1);
	do_file($pdf_file,$unlink,1);
	do_file($midi_file,$unlink,1);
	do_file($png_file,$unlink,0);
	for(my($i)=0;$i<$max_pages;$i++) {
		my($png_file)=File::Spec->catpath($volume,$directories,$base.'-page'.$i.'.png');
		do_file($png_file,$unlink,0);
	}
}

# here we go...
my($input)=shift(@ARGV);
my($output)=shift(@ARGV);
if(-f $output) {
	unlink_check($output,1);
}
do_files($output,1);
my($cmd)='lilypond '.join(' ',@ARGV).' 1> /dev/null 2> '.$tmp_fname;
if($debug) {
	print 'input is ['.$input.']'."\n";
	print 'output is ['.$output.']'."\n";
	print 'tmp_fname is ['.$tmp_fname.']'."\n";
	print 'cmd is ['.$cmd.']'."\n";
}
my($res)=system($cmd);
if($debug) {
	print 'system returned ['.$res.']'."\n";
}
if($res) {
	# remove the generated files (if any) 
	do_files($output,1);
	# print the errors
	open(FILE,$tmp_fname) || die('unable to open');
	my($line);
	while($line=<FILE>) {
		print $line;
	}
	close(FILE) || die('unable to close');
	# remove the tmp file for the errors
	if($remove_tmp) {
		unlink_check($tmp_fname,1);
	}
	# exit with error code of the child...
	exit($res << 8);
} else {
	# remove the tmp file for the errors
	if($remove_tmp) {
		unlink_check($tmp_fname,1);
	}
	# touch the output
	# TODO - do this better (using open) and check the result code
	system('touch '.$output);
	chmod_check($output,1);
	# chmod the files
	do_files($output,0);
}
