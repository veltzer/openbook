#!/usr/bin/python3

'''
This script checks if we have \myEndLine in voice
'''

import glob # for glob

def check_file(file):
	inside=False
	for line in open(file, 'r'):
		line=line.rstrip('\n')
		if line.startswith('% if part==\'Voice'):
			inside=True
		if line=='% endif':
			inside=False
		if inside:
			if line.find('\myEndLine')!=-1:
				print(line)

for file in glob.glob('src/jazz/*.mako'):
	#print('doing [{0}]'.format(file))
	check_file(file)
