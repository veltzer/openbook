#!/usr/bin/python

# this is a release script.
# it runs git status -s in order to see that everything is commited.
# it then tags the current tree with one + the old tag.
# it then clean and then rebuilds everything and puts the results in the output.

import subprocess

debug=True
# do you want to check if everything is commited ? Answer True to this
# unless you are doing development on this script...
check=True
out=subprocess.check_output(['git','status','-s'])
if check and out!='':
	raise ValueError('first commit everything, then call me...')
tag=subprocess.check_output(['git','tag']).strip().split('\n')[-1]
tag=int(tag)
if debug:
	print 'old tag is '+str(tag)
tag+=1
if debug:
	print 'new tag is '+str(tag)
# tag the new tag
subprocess.check_output(['git','tag',str(tag)])
subprocess.check_output(['make','clean'])
subprocess.check_output(['make','install'])
