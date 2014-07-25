#!/usr/bin/python3.4

import sys # for argv
import mako.template # for Template
import mako.lookup # for TemplateLookup
import os # for chmod, unlink
import glob # for glob
import check_version # for check_version
import os.path # for isfile

#############
# functions #
#############
def is_ready(file):
	for line in open(file):
		if line=="\tattributes['completion']=\"5\"\n":
			return True
	return False

########
# code #
########
# first check that we are using the correct version of python
check_version.check_version()

if len(sys.argv)!=4:
	raise ValueError('command line issue')

input_encoding='utf-8'
output_encoding='utf-8'
p_output=sys.argv[1]
p_input=sys.argv[2]
p_book=int(sys.argv[3])
common='src/include/common.makoi'

# I really need the unlink, even though we have open a file
# for writing later on since we chmod the output to be unwritable.
if os.path.isfile(p_output):
	os.unlink(p_output)

# if there is any error, remove the output to prevent having
# bad output...
try:
	mylookup=mako.lookup.TemplateLookup(directories=['.'],input_encoding=input_encoding,output_encoding=output_encoding)
	template=mako.template.Template(filename=common,lookup=mylookup,output_encoding=output_encoding,input_encoding=input_encoding)
	attr={}
	if p_book:
		filelist=glob.glob(p_input)
		filelist=list(filter(is_ready,filelist))
		filelist.sort()
		attr['files']=filelist
		attr['book']=True
		attr['toc']=True
		attr['inline']=True
		attr['midi']=False
		attr['parts']=True
		attr['doChordBars']=False
	else:
		attr['files']=[ p_input ]
		attr['book']=False
		attr['toc']=False
		attr['inline']=True
		attr['midi']=True
		attr['parts']=False
		attr['doChordBars']=False
	file=open(p_output,'wb')
	file.write(template.render(attributes=attr))
	file.close()
	os.chmod(p_output,0o0444)
except Exception as e:
	os.unlink(p_output)
	raise e
