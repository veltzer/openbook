#!/usr/bin/python

"""
this script gets the graph data for the openbook progress report
the idea is to be able to see in a graph the progress being made in
this project.

CHANGELOG:
19/11/11: wrote the damn script.
21/11/11: added insertion of graph data into the database.

TODO:
	- show this graph in the website.
	- modify this script to produce counts for both jazz and non-jazz tunes.
		(very easy). This way the data that is outputted will be related to the openbook pdf.
		And do this also for completion level 5.
	- take care of the corrupt commits. either:
		- get their uncorrupted data from github or something.
		- erase them from the history altogether (in that case document how I did
			that in the git hints file).
"""

import subprocess
import dateutil.parser
import MySQLdb
import warnings
import versioncheck # for checkversion

# first check that we are using the correct version of python
versioncheck.checkversion()
# turn warnings into errors
warnings.filterwarnings("error")
debug=False
doDb=True

# these are corrupt commits for which there is no meta data or there
# is no tree...
corrupt={
	'cb6eaf130fdcfe0e46254ee2ecf9aa6e5fb98be4',
	'7f9eec3d2843f9b7cb1266b9e2f274e22f938f93',
	'd5a7675bb3132d5b89715b637368e9eace672a2f',
	'3ebc2b5854a94b96d351ede91fabb9e20c440ecc',
	'4d6523fbc7066b6f436f89d50506a6a7af7b7f0c',
	'1284db847767666779a0ffcf7fc3de32bb62a931',
}

conn=MySQLdb.connect(
	host="localhost",
	user="mark",
	passwd="",
	db="myworld"
)

if doDb:
	# remove the old data
	cursor=conn.cursor()
	cursor.execute('SELECT id FROM TbGraph WHERE name=\'openbook_progress\'')
	row=cursor.fetchone()
	# only remove data if we already have data
	if row!=None:
		id=int(row[0])
		if debug:
			print "id is",id
		cursor.execute('DELETE from TbGraphData WHERE graphId=%s',(id,))
		cursor.execute('DELETE from TbGraph WHERE id=%s',(id,))
	# insert a new row into the graph meta data
	cursor.execute('INSERT INTO TbGraph (name) VALUES(\'openbook_progress\')')
	id=cursor.lastrowid
	if debug:
		print "id is",id
# this gets all commits in the right order
commits=subprocess.check_output(["git","log","--format=%H","--reverse"]).split("\n")
# removes the extra element that I don't need
commits.pop()
for commit in commits:
	if commit in corrupt:
		continue
	d1=subprocess.check_output(["git","show","-s","--format=%ci",commit]).strip()
	d2=dateutil.parser.parse(d1)
	dt=d2.astimezone(dateutil.tz.tzutc())
	count=0
	lines=subprocess.check_output(["git","ls-tree","-r",commit]).split("\n");
	for line in lines:
		if line.endswith('.ly') or line.endswith('.temp') or line.endswith('.mako') or line.endswith('.gpp'):
			count=count+1
	if debug:
		print "commit is "+commit
		print "dt is "+str(dt)
		print "count is "+str(count)
	if doDb:
		cursor.execute('INSERT INTO TbGraphData (tag,dt,value,graphId) VALUES(%s,%s,%s,%s)',(commit,dt,count,id))

# commit everything...
if doDb:
	cursor.close()
	conn.commit()
	conn.close()
