#!/usr/bin/env python

import sys
import mako.template
import mako.lookup
import os # for os.chmod, os.unlink
import glob # for glob.glob
import versioncheck # for checkversion

# first check that we are using the correct version of python
versioncheck.checkversion()

if len(sys.argv)!=3:
	raise ValueError('command line issue')

input_encoding='utf-8'
output_encoding='utf-8'
p_output=sys.argv[1]
p_glob=sys.argv[2]
common='src/include/common.makoi'

def is_ready(file):
	for line in open(file):
		#print line
		if line=="\tattributes['completion']=\"5\"\n":
			return True
	return False

def get_results(lst):
	(pin,pout)=os.popen2(lst)
	res=''
	for line in pout:
		res+=line
	return res

# unlink the file if it exists
if os.path.isfile(p_output):
	os.unlink(p_output)

mylookup=mako.lookup.TemplateLookup(directories=['.'],input_encoding=input_encoding,output_encoding=output_encoding)
template=mako.template.Template(filename=common,lookup=mylookup,output_encoding=output_encoding,input_encoding=input_encoding)
file=open(p_output,'w')
# python 3
#file.write((template.render_unicode(attributes={})))
# python 2
attr={}
filelist=glob.glob(p_glob)
filelist=filter(is_ready,filelist)
filelist.sort()
attr['files']=filelist
attr['book']=True
attr['toc']=True
attr['inline']=True
attr['midi']=False
attr['parts']=True
attr['doChordBars']=False

# if there is any error, remove the output to prevent having
# bad output...
try:
	file.write(template.render(attributes=attr))
	file.close()
	# python 3
	#os.chmod(p_output,0o0444)
	# python 2
	os.chmod(p_output,0444)
except Exception, e:
	file.close()
	os.unlink(p_output)
	raise e
