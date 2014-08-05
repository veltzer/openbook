#!/usr/bin/python

# run any command line and do not emit it's standard error or output unless there is an error

from __future__ import print_function
import os # for system
import sys # for argv
import subprocess # for call

#print(' '.join(sys.argv[1:]))
#os.system(' '.join(sys.argv[1:]))
subprocess.call(sys.argv[1:])
