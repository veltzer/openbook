#!/usr/bin/python

import sys # for version_info

def checkversion():
	if sys.version_info[0:2] != (2,7):
		raise Exception('you must use python 2.7 (ubuntu 11 or 12 carry it)')

#if __name__=='__main__':
#	checkversion()

#checkversion()
