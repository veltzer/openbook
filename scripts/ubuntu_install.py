#!/usr/bin/python

# this scrip will install all the required packages that you need on
# ubuntu to compile and work with this package.

# packages and their reasons:
# perl: old scripts
# python: for scripts
# python-mako: the templating system we use
# python-mako-doc: documentation for the templating system
# lilypond-doc: documentation for lilypond
# lilypond: the main system we use.
# timidity: convert midi to wav.
# lame: encode ogg
# pdfjam: pdfjoin for creaing pdfs.
# python3-mako: mako for python3 (we are not really using it).

import subprocess

packs=[
	'perl', # for the perl scripts
	'python', # for the python scripts
	'python-mako', # this is out template processor
#	'python3-mako',
#	'python-mako-doc',
	'lilypond', # this is the main tool we use
	'python-tweepy', # this is for tweeting new releases
	'python-tweepy-doc', # this is for tweeting new releases
#	'lilypond-doc',
#	'timidity',
#	'lame',
#	'pdfjam',
]

args=['sudo','apt-get','install']
args.extend(packs)
subprocess.check_call(args)
