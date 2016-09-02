#!/usr/bin/python3

'''
wrapper to run lilypond.
run lilypond to produce the book
lilypond --ps --pdf --output=$(OUT_BASE) $(OUT_LY)

Why do we need this script?
- To make sure to remove the outputs (all of them - ps, pdf, ...) in any case of error.
- To get over lilypond printing junk on the console that I don't want to see when building.
- To get over the fact that lilypond does not have a "treat warnings as errors and stop" flag.
- To print the lilypond output, but only in case of error.
- To do extra stuff on the output coming out from lilypond like reduce the size of the pdf and more.
'''

import sys # for argv, exit, stderr
import os # for chmod
import subprocess # for Popen
import os.path # for isfile
import shutil # for move
import tempfile # for NamedTemporaryFile

#############
# functions #
#############
# remove the target files, do nothing if they are not there
def remove_outputs_if_exist():
    if os.path.isfile(p_ps):
        os.unlink(p_ps)
    if os.path.isfile(p_pdf):
        os.unlink(p_pdf)

# print output of the program in case of error
def print_outputs(output, errout, status, args):
    if output!='':
        print('{0}: stdout is'.format(sys.argv[0]), file=sys.stderr)
        print(output, file=sys.stderr)
    if errout!='':
        print('{0}: stderr is'.format(sys.argv[0]), file=sys.stderr)
        print(errout, file=sys.stderr)
    print('{0}: return code is [{1}]'.format(sys.argv[0], status), file=sys.stderr)
    print('{0}: error in executing {1}'.format(sys.argv[0], args), file=sys.stderr)

# this function is here because we want to supress output until we know
# there is an error (and subprocess.check_output does not do this)
def system_check_output(args):
    if p_debug:
        print('{0}: running [{1}]'.format(sys.argv[0], args), file=sys.stderr)
    pr=subprocess.Popen(args,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
    (output,errout)=pr.communicate()
    output=output.decode()
    errout=errout.decode()
    if p_debug or pr.returncode or (p_stop_on_output and (output!='' or errout!='')):
        print_outputs(output, errout, pr.returncode, args)
        remove_outputs_if_exist()
        sys.exit(1)

##############
# parameters #
##############
# do postscript?
p_do_ps=True
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
p_loglevel='WARN'
#p_loglevel='ERROR'
# should we reduce the pdf size?
p_do_pdfred=False
# should we stop on errors? (This should be set to True!)
p_stop_on_output=True

########
# code #
########
if len(sys.argv)!=5:
    print('{0}: usage: [ps] [pdf] [pdf without suffix] [lilypond input]'.format(sys.argv[0]))
    sys.exit(1)

p_ps=sys.argv[1]
p_pdf=sys.argv[2]
p_out=sys.argv[3]
p_ly=sys.argv[4]

if p_debug:
    print('{0}: arguments are [{1}]'.format(sys.argv[0], sys.argv), file=sys.stderr)

remove_outputs_if_exist()

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
    remove_outputs_if_exist()
    print('{0}: exiting because of errors'.format(sys.argv[0]), file=sys.stderr)
    sys.exit(1)

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
    os.unlink(p_pdf)
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
