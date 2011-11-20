#!/usr/bin/python

"""
this script gets the graph data for the openbook progress report
TODO:
	- create a pair of tables in the database to hold date based graphs.
		each entry will have a string, date and value.
	- add code to this script to put the data in the database under a name.
	- add code to this script to delete the data in the database under the same name
		at the start.
	- then you can go ahead and show this graph in the website.
"""

import subprocess
import dateutil.parser

# these are corrupt commits for which there is no meta data or there
# is no tree...
corrupt={
	'cb6eaf130fdcfe0e46254ee2ecf9aa6e5fb98be4',
	'7f9eec3d2843f9b7cb1266b9e2f274e22f938f93',
	'd5a7675bb3132d5b89715b637368e9eace672a2f',
	'3ebc2b5854a94b96d351ede91fabb9e20c440ecc',
	'4d6523fbc7066b6f436f89d50506a6a7af7b7f0c',
};

# this gets all commits in the right order
output=subprocess.check_output(["git","log","--format=%H","--reverse"])
commits=output.split("\n")
# removes the extra element that I don't need
commits.pop()
for commit in commits:
	if commit in corrupt:
		continue
	d1=subprocess.check_output(["git","show","-s","--format=%ci",commit]).strip()
	d2=dateutil.parser.parse(d1)
	dt=d2.astimezone(dateutil.tz.tzutc())
	count=0
	lines=subprocess.check_output(["git","ls-tree","-r",commit]);
	lines=lines.split("\n")
	for line in lines:
		if line.endswith('.ly') or line.endswith('.temp') or line.endswith('.mako') or line.endswith('.gpp'):
			count=count+1
	print "commit is "+commit
	print "dt is "+str(dt)
	print "count is "+str(count)
