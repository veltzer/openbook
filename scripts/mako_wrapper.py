#!/usr/bin/python3.4

import sys # for argv
import mako.template # for Template
import mako.lookup # for TemplateLookup
import os # for chmod, unlink
import glob # for glob
import check_version # for check_version
import os.path # for isfile
import attributes # for Attributes

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

# We really need the unlink, even though we have "open a file
# for writing" later on which is supposed to truncate the file to 0
# since we chmod the output to be unwritable which means that the
# "open a file for writing" later would fail...
if os.path.isfile(p_output):
	os.unlink(p_output)

# if there is any error, remove the output to prevent having
# bad output...
try:
	mylookup=mako.lookup.TemplateLookup(
		directories=['.'],
		input_encoding=input_encoding,
		output_encoding=output_encoding,
	)
	template=mako.template.Template(
		filename=common,
		lookup=mylookup,
		input_encoding=input_encoding,
		output_encoding=output_encoding,
	)
	gattr={}
	if p_book:
		filelist=glob.glob(p_input)
		filelist=list(filter(is_ready,filelist))
		filelist.sort()
		gattr['files']=filelist
		gattr['book']=True
		gattr['toc']=True
		gattr['midi']=False
		gattr['parts']=True
	else:
		gattr['files']=[ p_input ]
		gattr['book']=False
		gattr['toc']=False
		gattr['midi']=True
		gattr['parts']=False
	gattr['inline']=True
	file=open(p_output,'wb')
	attr=attributes.Attributes()
	file.write(template.render(attributes=attr, gattr=gattr, scratch={}))
	file.close()
	os.chmod(p_output,0o0444)
except Exception as e:
	os.unlink(p_output)
	raise e
