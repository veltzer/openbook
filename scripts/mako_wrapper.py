#!/usr/bin/env python

import sys
import mako.template
import mako.lookup
import os # for os.chmod, os.unlink
import versioncheck # for checkversion

# first make sure that we are using the correct version of python
versioncheck.checkversion()

if len(sys.argv)!=3:
	raise ValueError('command line issue')

input_encoding='utf-8'
output_encoding='utf-8'
p_input=sys.argv[1]
p_output=sys.argv[2]
common='src/include/common.makoi'

try:
	os.unlink(p_output)
except:
	# handle the error better, only non existant file should be glossed over...
	pass
try:
	mylookup = mako.lookup.TemplateLookup(directories=['.'],input_encoding=input_encoding,output_encoding=output_encoding)
	template=mako.template.Template(filename=common,lookup=mylookup,output_encoding=output_encoding,input_encoding=input_encoding)
	file=open(p_output,'w')
	# python 3
	#file.write((template.render_unicode(attributes={})))
	# python 2
	attr={}
	attr['files']=[ p_input ]
	attr['book']=False
	attr['toc']=False
	attr['inline']=True
	attr['midi']=True
	attr['parts']=False
	attr['doChordBars']=False
	file.write(template.render(attributes=attr))
	file.close()
	# python 3
	#os.chmod(p_output,0o0444)
	# python 2
	os.chmod(p_output,0444)
except Exception,e:
	os.unlink(p_output)
	raise e
