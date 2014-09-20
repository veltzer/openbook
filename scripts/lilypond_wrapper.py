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
import shutil # for move
import tempfile # for NamedTemporaryFile

#############
# functions #
#############
# this function is here because we want to supress output until we know
# there is an error (and subprocess.check_output does not do this)
def system_check_output(args):
	if p_debug:
		print('running:', args)
	pr=subprocess.Popen(args,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
	(output,errout)=pr.communicate()
	output=output.decode()
	errout=errout.decode()
	if p_debug:
		print('stdout is',output)
		print('stderr is',errout)
		print(pr.returncode)
	status=pr.returncode
	if status or (p_stop_on_output and (output!='' or errout!='')):
		print('stdout is',output)
		print('stderr is',errout)
		raise ValueError('error in executing',args)
	if p_show_output:
		print('stdout is',output)
		print('stderr is',errout)

# remove the target files, do nothing if they are not there
def remove_outputs_if_exists():
	if os.path.isfile(p_ps):
		os.unlink(p_ps)
	if os.path.isfile(p_pdf):
		os.unlink(p_pdf)

##############
# parameters #
##############
# I want errors to happen if there is any output...
p_show_output=False
# do postscript?
p_do_ps=False
# do pdf?
p_do_pdf=True
# emit debug info?
p_debug=False
# unlink the postscript file at the end?
p_unlink_ps=False
# do you want to linearize the pdf file afterwards?
p_do_qpdf=True
# what warning level do you want?
# we really need to work with warnings and solve all of them
#p_loglevel='WARN'
p_loglevel='ERROR'

########
# code #
########
# first check that we are using the correct version of python
check_version.check_version()

if len(sys.argv)!=7:
	raise ValueError('usage: [ps] [pdf] [pdf without suffix] [lilypond input] [reducepdf] [stoponoutput]')

p_ps=sys.argv[1]
p_pdf=sys.argv[2]
p_out=sys.argv[3]
p_ly=sys.argv[4]
p_do_pdfred=int(sys.argv[5])
p_stop_on_output=bool(int(sys.argv[6]))

if p_debug:
	print('arguments are',sys.argv)

remove_outputs_if_exists()

# run the command
args=[]
args.append('lilypond')
args.append('--loglevel={0}'.format(p_loglevel))
if p_do_ps:
	args.append('--ps')
if p_do_pdf:
	args.append('--pdf')
args.append('--output='+p_out)
args.append(p_ly)
try:
	# to make sure that lilypond shuts up...
	#subprocess.check_output(args)
	system_check_output(args)
	# chmod the results
	if p_do_ps:
		os.chmod(p_ps,0o0444)
	if p_do_pdf:
		os.chmod(p_pdf,0o0444)
except Exception as e:
	remove_outputs_if_exists()
	raise e

# do pdf reduction
if p_do_pdfred:
	t=tempfile.NamedTemporaryFile()
	# LanguageLevel=2 is the default
	system_check_output(['pdf2ps', '-dLanguageLevel=3', p_pdf, t.name])
	os.unlink(p_pdf)
	system_check_output(['ps2pdf', t.name, p_pdf])

# do linearization
if p_do_qpdf:
	# delete=False since we are going to move the file
	t=tempfile.NamedTemporaryFile(delete=False)
	system_check_output(['qpdf', '--linearize', p_pdf, t.name])
	shutil.move(t.name, p_pdf)

# remove the postscript file if need be or chmod it
if os.path.isfile(p_ps):
	if p_unlink_ps:
		os.unlink(p_ps)
	else:
		os.chmod(p_ps,0o0444)

# chmod the pdf file
if os.path.isfile(p_pdf):
	os.chmod(p_pdf,0o0444)
