#!/usr/bin/python3.4

# run any command line and do not emit it's standard error or output unless there is an error

import sys # for argv
import subprocess # for call

subprocess.call(sys.argv[1:])
