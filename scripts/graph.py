#!/usr/bin/python3

'''
this script gets the graph data for the openbook progress report
the idea is to be able to see in a graph the progress being made in
this project.

CHANGELOG:
19/11/11: wrote the damn script.
21/11/11: added insertion of graph data into the database.
25/07/14: moved to python3, removed corrupt handling and added progress report.

TODO:
    - modify this script to produce counts for both jazz and non-jazz tunes.
        (very easy). This way the data that is outputted will be related to the openbook pdf.
        And do this also for completion level 5.
'''

import subprocess # for check_output
import dateutil.parser # for parse
import mysql.connector # for Connect
import os.path # for isfile, expanduser
import configparser # for ConfigParser
import getpass # for getuser
import progressbar # for ProgressBar

##############
# parameters #
##############
debug=False
doDb=True

#############
# functions #
#############

'''
get the configuration, including user and password from the ~/.my.cnf
file of the user

if no such file exists then use sensible defaults
'''
def get_config():
    d={}
    inifile=os.path.expanduser('~/.my.cnf')
    if os.path.isfile(inifile):
        config=configparser.ConfigParser()
        config.read(inifile)
        if config.has_option('mysql', 'user'):
            d['user']=config.get('mysql', 'user')
        else:
            d['user']=getpass.getuser()
        if config.has_option('mysql', 'database'):
            d['database']=config.get('mysql', 'database')
        else:
            d['database']='mysql'
        if config.has_option('mysql', 'password'):
            d['password']=config.get('mysql', 'password')
        return d
    else:
        d['user']=getpass.getuser()
        d['database']='mysql'
        return d

########
# code #
########

conn=mysql.connector.Connect(**get_config())

if doDb:
    # remove the old data
    cursor=conn.cursor()
    cursor.execute('SELECT id FROM TbGraph WHERE name=\'openbook_progress\'')
    row=cursor.fetchone()
    # only remove data if we already have data
    if row!=None:
        id=int(row[0])
        if debug:
            print('id is',id)
        cursor.execute('DELETE from TbGraphData WHERE graphId=%s',(id,))
        cursor.execute('DELETE from TbGraph WHERE id=%s',(id,))
    # insert a new row into the graph meta data
    cursor.execute('INSERT INTO TbGraph (name) VALUES(\'openbook_progress\')')
    id=cursor.lastrowid
    if debug:
        print('id is',id)
# this gets all commits in the right order
commits=subprocess.check_output(['git','log','--format=%H','--reverse']).decode().split('\n')
pbar = progressbar.ProgressBar()
# removes the extra element that I don't need which is the current commit
commits.pop()
for commit in pbar(commits):
    d1=subprocess.check_output(['git','show','-s','--format=%ci',commit]).decode().strip()
    d2=dateutil.parser.parse(d1)
    dt=d2.astimezone(dateutil.tz.tzutc())
    count_mako=0
    count_temp=0
    count_gpp=0
    count_ly=0
    lines=subprocess.check_output(['git','ls-tree','-r',commit]).decode().split('\n');
    for line in lines:
        if line.endswith('.mako'):
            count_mako+=1
        if line.endswith('.temp'):
            count_temp+=1
        if line.endswith('.gpp'):
            count_gpp+=1
        if line.endswith('.ly'):
            count_ly+=1
    count=max(count_mako, count_temp, count_gpp, count_ly)
    if debug:
        print('commit is', commit)
        print('dt is', str(dt))
        print('count is', str(count))
    if doDb:
        cursor.execute('INSERT INTO TbGraphData (tag,dt,value,graphId) VALUES(%s,%s,%s,%s)',(commit,dt,count,id))

# commit everything...
if doDb:
    cursor.close()
    conn.commit()
    conn.close()
