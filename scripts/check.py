#!/usr/bin/python3

'''
This script checks if we have \myEndLine in voice
'''

import glob # for glob

##############
# parameters #
##############
debug=False

def check_file(file):
	inside=False
	prevprev=None
	prev=None
	for line in open(file, 'r'):
		line=line.rstrip('\n')
		if line.startswith('% if part==\'Voice'):
			inside=True
		if line=='% endif':
			inside=False
		if inside:
			if line.find('\myEndLine')!=-1:
				print(line)
		if line.find('%% part')!=-1 and prev!='':
			print(line)
		if line.find('%% part')!=-1 and prev=='' and prevprev=='':
			print(line)
		prevprev=prev
		prev=line

for file in glob.glob('src/jazz/*.mako'):
	if debug:
		print('doing [{0}]'.format(file))
	check_file(file)
