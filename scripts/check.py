#!/usr/bin/python3.4

'''
This script checks if we have \myEndLine in voice
'''

import glob # for glob

##############
# parameters #
##############
debug=False

def error(num, line, file):
	print('{0}:{1}: {2}'.format(file, num, line))

def check_file(file):
	insideVoice=False
	insideChords=False
	prevprev=None
	prev=None
	for num,line in enumerate(open(file, 'r')):
		line=line.rstrip('\n')
		if line.startswith('% if part==\'Voice'):
			insideVoice=True
		if line=='% endif':
			insideVoice=False
		if insideVoice:
			if line.find('\myEndLine')!=-1:
				error(num, line, file)
		if line.startswith('% if part==\'Chords'):
			insideChords=True
		if line=='% endif':
			insideChords=False
		if insideChords and line.find('\myMark')!=-1 and prev!='':
			error(num, line, file)
		if line.find('%% part')!=-1 and prev!='':
			error(num, line, file)
		if line.find('%% part')!=-1 and prev=='' and prevprev=='':
			error(num, line, file)
		if line.find('\myEndLine')!=-1 and line.find('%%')!=-1:
			error(num, line, file)
		if line.find('relative')!=-1 and not line.endswith('\\relative {'):
			error(num, line, file)
		if line=='}' and prev=='':
			error(num, line, file)
		if line.find(':min')!=-1 or line.find('___')!=-1 or line.find('chordChanges')!=-1 or line.find('_ --')!=-1:
			error(num, line, file)
		if line.find('copyright=""')!=-1:
			error(num, line, file)
		if line.endswith('\t') or line.endswith(' '):
			error(num, line, file)
		if line.find(' \t')!=-1 or line.find('\t ')!=-1:
			error(num, line, file)
		if line.find(']=""')!=-1:
			error(num, line, file)
		if line.find('\bar')!=-1 or line.find('\include')!=-1 or line.find('\break')!=-1:
			error(num, line, file)
		prevprev=prev
		prev=line

for file in glob.glob('src/**/*.mako'):
	if debug:
		print('doing [{0}]'.format(file))
	check_file(file)
