#!/usr/bin/python3.4

# run any command line and do not emit it's standard error or output unless there is an error

import sys # for argv
import subprocess # for Popen

#debug=True
debug=False

# this function is here because python2.6 does not have subprocess.check_output
def system_check_output(args):
	run_args=' '.join(args)
	if debug:
		print(run_args)
	pr=subprocess.Popen(run_args,stdout=subprocess.PIPE,stderr=subprocess.PIPE,shell=True)
	(output,errout)=pr.communicate()
	status=pr.returncode
	if output!='':
		print(output)
	if errout!='':
		print(errout)
	#sys.exit(status)
	sys.exit(0)

if len(sys.argv)<1:
	raise ValueError('command line issue')

if debug:
	print(sys.argv)
# run the command
system_check_output(sys.argv[1:])
