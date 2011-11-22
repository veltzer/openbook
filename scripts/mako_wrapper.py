#!/usr/bin/python

import sys
import mako.template
import mako.lookup
import os # for os.chmod, os.unlink

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
file.write(template.render(attributes=attr))
file.close()
# python 3
#os.chmod(p_output,0o0444)
# python 2
os.chmod(p_output,0444)
