#!/usr/bin/python3

'''
Implementing grep in python
'''

import re # for .compile, .finditer
import sys # for argv, exit
import os # for .path.join

# command line usage...
if len(sys.argv)!=4:
    print('usage: grep.py [expr] [fileregexp] [folder]')
    sys.exit(1)
# first compile the regular expression to search for...
c=re.compile(sys.argv[1])
cf=re.compile(sys.argv[2])
folder=sys.argv[3]
debug=False
#debug=True
printOnlyFiles=False
printedFiles=set()

if debug:
    print('folder is', folder)

for root,dirs,files in os.walk(folder):
    for file in files:
        full=os.path.join(root,file)
        if debug:
            print('file is [{0}]'.format(full))
        if cf.match(full):
            if debug:
                print('doing file [{0}]'.format(full))
            for num,line in enumerate(open(full)):
                for x in c.finditer(line):
                    if printOnlyFiles:
                        if not full in printedFiles:
                            print(full)
                            printedFiles.add(full)
                    else:
                        print('{0}, {1}: {2}'.format(full, num, line[:-1]))
