#!/usr/bin/python3

'''
run any command line and do not emit it's standard error or output unless there is an error
'''

import sys # for argv
import subprocess # for check_output

if len(sys.argv)<2:
	raise ValueError('command line issue')

# run the command
subprocess.check_output(sys.argv[1:])
