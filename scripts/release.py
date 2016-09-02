#!/usr/bin/python3

'''
this is a release script.
it runs git status -s in order to see that everything is commited.
it then tags the current tree with one + the old tag.
it then cleans and then rebuilds everything and puts the results in the output.
we use -a so that the tags will be annotated and therefor seen in all branches
(say gh-pages branch)

TODO:
- add integration with twitter and facebook to announce new versions.
- try to use a better git interface (there are native python git interfaces).
'''

###########
# imports #
###########
import subprocess # for check_output, check_call
import os # for getcwd
import sys # for stderr, exit

##############
# parameters #
##############
# do you want debug info printed?
opt_debug=True
# do you want to check if everything is commited ? Answer True to this
# unless you are doing development on this script...
opt_check=True
# what is the name of the project?
opt_project=os.getcwd().split('/')[-1]
# do we want to use the release manager?
opt_release=False

########
# code #
########

# check that everything is committed
if opt_check:
    out=subprocess.check_output(['git','status','-s']).decode().rstrip()
    if out!='':
        print('first commit everything, then call me...', file=sys.stderr)
        sys.exit(1)

# tag the new version
tag=int(subprocess.check_output(['git','describe','--abbrev=0']).decode().rstrip())
if opt_debug:
    print('old tag is [{0}]'.format(tag))
tag+=1
if opt_debug:
    print('new tag is [{0}]'.format(tag))
tag=str(tag)
subprocess.check_output(['git','tag','-a','-s','-m',opt_project+' version '+tag,tag])

# clean
subprocess.check_call(['make','clean'])

# build and install
subprocess.check_call(['make','install'])

# call the release manager
if opt_release:
    import releasemanager # for ReleaseManager
    rm=releasemanager.ReleaseManager()
    rm.release()
