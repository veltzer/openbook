#!/usr/bin/python3.4

'''
wrapper to run lilypond.
run lilypond to produce the book
lilypond --ps --pdf --output=$(OUT_BASE) $(OUT_LY)
'''

import sys # for argv
import os # for chmod
import subprocess # for Popen
import os.path # for isfile
import check_version # for check_version

#############
# functions #
#############
# this function is here because we want to supress output until we know
# there is an error (and subprocess.check_output does not do this)
def system_check_output(args):
	if debug:
		print('running:', args)
	pr=subprocess.Popen(args,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
	(output,errout)=pr.communicate()
	output=output.decode()
	errout=errout.decode()
	if debug:
		print('stdout is',output)
		print('stderr is',errout)
		print(pr.returncode)
	status=pr.returncode
	if status or (stopOnOutput and (output!='' or errout!='')):
		print('stdout is',output)
		print('stderr is',errout)
		raise ValueError('error in executing',args)
	if showOutput:
		print('stdout is',output)
		print('stderr is',errout)

# remove the target files, do nothing if they are not there
def remove_output_if_exists():
	#if doPs and os.path.isfile(p_ps):
	#	os.unlink(p_ps)
	#if doPdf and os.path.isfile(p_pdf):
	#	os.unlink(p_pdf)
	if os.path.isfile(p_ps):
		os.unlink(p_ps)
	if os.path.isfile(p_pdf):
		os.unlink(p_pdf)

##############
# parameters #
##############
# I want errors to happen if there is any output...
showOutput=False
doPs=False
doPdf=True
debug=False
unlinkPs=False

########
# code #
########
# first check that we are using the correct version of python
check_version.check_version()

if len(sys.argv)!=7:
	raise ValueError('command line issue')

p_ps=sys.argv[1]
p_pdf=sys.argv[2]
p_out=sys.argv[3]
p_ly=sys.argv[4]
p_do_pdfred=int(sys.argv[5])
stopOnOutput=bool(int(sys.argv[6]))

if debug:
	print('arguments are',sys.argv)

remove_output_if_exists()

# run the command
args=[]
args.append('lilypond')
# we really need to work with warnings and solve all of them
#args.append('--loglevel=WARN')
args.append('--loglevel=ERROR')
if doPs:
	args.append('--ps')
if doPdf:
	args.append('--pdf')
args.append('--output='+p_out)
args.append(p_ly)
try:
	# to make sure that lilypond shuts up...
	#subprocess.check_output(args)
	system_check_output(args)
	# chmod the results
	if doPs:
		os.chmod(p_ps,0o0444)
	if doPdf:
		os.chmod(p_pdf,0o0444)
except Exception as e:
	remove_output_if_exists()
	raise e

# do pdf reduction
if p_do_pdfred:
	if os.path.isfile(p_ps):
		os.unlink(p_ps)
	# language 2 is the default
	system_check_output(['pdf2ps', '-dLanguageLevel=3', p_pdf, p_ps])
	os.unlink(p_pdf)
	system_check_output(['ps2pdf', p_ps, p_pdf])
	if os.path.isfile(p_ps) and unlinkPs:
		os.unlink(p_ps)
	else:
		os.chmod(p_ps,0o0444)
	os.chmod(p_pdf,0o0444)
