#!/usr/bin/python3

'''
This script checks if we have \myEndLine in voice
'''

import glob # for glob

##############
# parameters #
##############
debug=False

def error(line, file):
	print("{0}: {1}".format(file, line))

def check_file(file):
	insideVoice=False
	insideChords=False
	prevprev=None
	prev=None
	for line in open(file, 'r'):
		line=line.rstrip('\n')
		if line.startswith('% if part==\'Voice'):
			insideVoice=True
		if line=='% endif':
			insideVoice=False
		if insideVoice:
			if line.find('\myEndLine')!=-1:
				error(line, file)
		if line.startswith('% if part==\'Chords'):
			insideChords=True
		if line=='% endif':
			insideChords=False
		if insideChords and line.find('\myMark')!=-1 and prev!='':
			error(line, file)
		if line.find('%% part')!=-1 and prev!='':
			error(line, file)
		if line.find('%% part')!=-1 and prev=='' and prevprev=='':
			error(line, file)
		prevprev=prev
		prev=line

for file in glob.glob('src/jazz/*.mako'):
	if debug:
		print('doing [{0}]'.format(file))
	check_file(file)
