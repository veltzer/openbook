#!/usr/bin/python

import sys
import mako.template
import mako.lookup

if len(sys.argv)<2:
	raise ValueError('command line issue')

input_encoding='utf-8'
output_encoding='utf-8'
p_input=sys.argv[1]
p_output=sys.argv[2]

#import jinja2
#loader=jinja2.FileSystemLoader('.',encoding=encoding)
#env=jinja2.Environment(loader=loader)
#template=env.get_template(p_input)
#result=template.render()
#file=open(p_output,'w')
#file.write(result.encode(encoding))
#file.close()

mylookup = mako.lookup.TemplateLookup(directories=['.'],input_encoding=input_encoding)
template=mako.template.Template(filename=p_input,lookup=mylookup,output_encoding=output_encoding)
file=open(p_output,'w')
file.write(template.render(attributes={}))
file.close()
