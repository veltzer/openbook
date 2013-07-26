#!/usr/bin/python

# this is a release script.
# it runs git status -s in order to see that everything is commited.
# it then tags the current tree with one + the old tag.
# it then cleans and then rebuilds everything and puts the results in the output.

# TODO:
# - add integration with twitter and facebook to announce new versions.
# - try to use a better git interface (there are native python git interfaces).

# this is for running the various commands that we need
import subprocess
import os # for getcwd
import releasemanager
import versioncheck # for checkversion

# first check that we are using the correct version of python
versioncheck.checkversion()

##############
# parameters #
##############
# do you want debug info printed?
debug=True
# do you want to check if everything is commited ? Answer True to this
# unless you are doing development on this script...
check=True
# what is the name of the project?
project=os.getcwd().split('/')[-1]

######################
# script starts here #
######################
if check:
	out=subprocess.check_output(['git','status','-s'])
	if out!='':
		raise ValueError('first commit everything, then call me...')
tag=int(subprocess.check_output(['git','describe','--abbrev=0']).strip())
if debug:
	print 'old tag is '+str(tag)
tag+=1
if debug:
	print 'new tag is '+str(tag)
tag=str(tag)
# tag the new tag
subprocess.check_output(['git','tag','-s','-m',project+' version '+tag,tag])
subprocess.check_call(['make','clean'])
subprocess.check_call(['make','install'])
rm=releasemanager.ReleaseManager()
rm.release()
