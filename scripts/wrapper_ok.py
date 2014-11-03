#!/usr/bin/python3

'''
run any command line, emit its output and error but always return an OK (0) return code
'''

import sys # for argv
import subprocess # for call

if len(sys.argv)<2:
	raise ValueError('command line issue')

# run the command
subprocess.call(sys.argv[1:])
