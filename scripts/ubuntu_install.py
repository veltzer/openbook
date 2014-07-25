#!/usr/bin/python

# this scrip will install all the required packages that you need on
# ubuntu to compile and work with this package.

import subprocess # for check_call
import check_version # for check_version

# first check that we are using the correct version of python
check_version.check_version()

packs=[
	'perl', # for the old perl scripts
	'python', # for the python scripts
	'python3', # for the python scripts
	'python-mako', # this is out template processor
	'python3-mako', # mako for python 3 (we are not really using it)
	'python-mako-doc', # documentation for the template preprocessor
	'python-tweepy', # this is for tweeting new releases
	'python-tweepy-doc', # this is for tweeting new releases
	'python-facebook', # this is for facebooking releases
	'python-simplejson', # this make facebook work better
	'texi2html', # needed to install lilypond from source
	'guile-1.8-dev', # needed to install lilypond from source
	'lilypond', # this is the main tool we use
	'lilypond-doc', # documentation for lilypond
	'timidity', # play output midi and convert midi to wav
	'lame', # convert audio (encode ogg)
	'pdfjam', # join pdfs (using pdfjoin(1))
	'ghostscript', # for pdfopt(1)
	'grive', # for grive(1)
]

args=['sudo','apt-get','install']
args.extend(packs)
subprocess.check_call(args)
