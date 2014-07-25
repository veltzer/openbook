#!/usr/bin/python3.4

import sys # for argv
import mako.template # for Template
import mako.lookup # for TemplateLookup
import os # for os.chmod, os.unlink
import check_version # for check_version

# first make sure that we are using the correct version of python
check_version.check_version()

if len(sys.argv)!=3:
	raise ValueError('command line issue')

input_encoding='utf-8'
output_encoding='utf-8'
p_input=sys.argv[1]
p_output=sys.argv[2]
common='src/include/common.makoi'

try:
	mylookup = mako.lookup.TemplateLookup(directories=['.'],input_encoding=input_encoding,output_encoding=output_encoding)
	template=mako.template.Template(filename=common,lookup=mylookup,output_encoding=output_encoding,input_encoding=input_encoding)
	file=open(p_output,'wb')
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
	os.chmod(p_output,0o0444)
except Exception as e:
	os.unlink(p_output)
	raise e
