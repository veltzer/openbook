#!/usr/bin/python3.4

import sys # for argv
import mako.template # for Template
import mako.lookup # for TemplateLookup
import os # for chmod, unlink
import glob # for glob
import check_version # for check_version

#############
# functions #
#############
def is_ready(file):
	for line in open(file):
		#print line
		if line=="\tattributes['completion']=\"5\"\n":
			return True
	return False

########
# code #
########
# first check that we are using the correct version of python
check_version.check_version()

if len(sys.argv)!=3:
	raise ValueError('command line issue')

input_encoding='utf-8'
output_encoding='utf-8'
p_output=sys.argv[1]
p_glob=sys.argv[2]
common='src/include/common.makoi'

mylookup=mako.lookup.TemplateLookup(directories=['.'],input_encoding=input_encoding,output_encoding=output_encoding)
template=mako.template.Template(filename=common,lookup=mylookup,output_encoding=output_encoding,input_encoding=input_encoding)
attr={}
filelist=glob.glob(p_glob)
filelist=list(filter(is_ready,filelist))
filelist.sort()
attr['files']=filelist
attr['book']=True
attr['toc']=True
attr['inline']=True
attr['midi']=False
attr['parts']=True
attr['doChordBars']=False

file=open(p_output,'wb')
# if there is any error, remove the output to prevent having
# bad output...
try:
	file.write(template.render(attributes=attr))
	file.close()
	os.chmod(p_output,0o0444)
except Exception as e:
	file.close()
	os.unlink(p_output)
	raise e
