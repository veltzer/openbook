#!/usr/bin/python3

'''
run any command line and do not emit it's standard error or output unless there is an error
or there was an error.

Notice that we run the commands via a shell so that we will be able to do the following:
this_script.py 'ls -l 2> /dev/null'
In this case we will have on argument and we MUST run it to preserve the intention of the user.
if on the other hand we are run this way:
this_script.py ls -l
in which case we get many arguments, its ok to run them without a shell and save some resources.
'''

###########
# imports #
###########
import sys # for argv, exit, stderr
import subprocess # for Popen

##############
# parameters #
##############
opt_debug=False

#############
# functions #
#############
def run_no_error(args):
	if len(args)==1:
		pr=subprocess.Popen(args[0], stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
	else:
		pr=subprocess.Popen(args,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
	(output,errout)=pr.communicate()
	output=output.decode()
	errout=errout.decode()
	print(output, end='')
	print(errout, end='')
	sys.exit(0)

########
# code #
########
if opt_debug:
	print(sys.argv)
if len(sys.argv)<2:
	print('{0}: usage: {0} [arguments...]'.format(sys.argv[0]), file=sys.stderr)
	sys.exit(1)

# run the command
run_no_error(sys.argv[1:])

'''
This version is intersting but alas wrong. If you pass a command that generates errors
and fails the errors will not be printed out. Example: this_script.py 'ls nonexistant'
This will succeed: this_script.py 'ls nonexistant; exit 0'
'''

'''
try:
	if len(sys.argv)==2:
		out=subprocess.check_output(sys.argv[1], stderr=subprocess.STDOUT, shell=True)
	else:
		out=subprocess.check_output(sys.argv[1:], stderr=subprocess.STDOUT)
	print(out.decode(), end='')
except:
	pass
'''
