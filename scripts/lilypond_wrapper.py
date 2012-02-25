#!/usr/bin/python

# run lilypond to produce the book
# lilypond --ps --pdf --output=$(OUT_BASE) $(OUT_LY)

import sys # for argv
import os # for chmod
import subprocess # for Popen

# this function is here because python2.6 does not have subprocess.check_output
def system_check_output(args):
	pr=subprocess.Popen(args,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
	(output,errout)=pr.communicate()
	status=pr.returncode
	if status:
		print output
		print errout
		raise ValueError('error in executing',args)

if len(sys.argv)!=5:
	raise ValueError('command line issue')

p_ps=sys.argv[1]
p_pdf=sys.argv[2]
p_out=sys.argv[3]
p_ly=sys.argv[4]

# remove the target files, do nothing if they are not there
try:
	os.unlink(p_ps)
	os.unlink(p_pdf)
except:
	pass
# run the command
args=[]
args.append('lilypond')
args.append('--ps')
args.append('--pdf')
args.append('--output='+p_out)
args.append(p_ly)
system_check_output(args)

# chmod the results
os.chmod(p_ps,0444)
os.chmod(p_pdf,0444)
