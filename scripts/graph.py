#!/usr/bin/env python

"""
this script gets the graph data for the openbook progress report
the idea is to be able to see in a graph the progress being made in
this project.

TODO:
    - modify this script to produce counts for both jazz and non-jazz tunes.
        (very easy). This way the data that is outputted will be related to the openbook pdf.
        And do this also for completion level 5.
"""

import subprocess
import os.path
import configparser
import getpass
import dateutil.parser

import pymysql
import tqdm
from dateutil import tz


DEBUG = False
DO_DB = True


def get_config():
    """
    get the configuration, including user and password from the ~/.my.cnf
    file of the user

    if no such file exists then use sensible defaults
    """
    configs = {}
    inifile = os.path.expanduser("~/.my.cnf")
    if os.path.isfile(inifile):
        config = configparser.ConfigParser()
        config.read(inifile)
        if config.has_option("mysql", "user"):
            configs["user"] = config.get("mysql", "user")
        else:
            configs["user"] = getpass.getuser()
        if config.has_option("mysql", "database"):
            configs["database"] = config.get("mysql", "database")
        else:
            configs["database"] = "mysql"
        if config.has_option("mysql", "password"):
            configs["password"] = config.get("mysql", "password")
        return configs
    configs["user"] = getpass.getuser()
    configs["database"] = "mysql"
    return configs


# pylint: disable=too-many-branches
def main():
    """ main entry point """
    connection = pymysql.connect(**get_config())
    cursor = None
    row_id = None

    if DO_DB:
        # remove the old data
        cursor = connection.cursor()
        cursor.execute("SELECT id FROM TbGraph WHERE name=\"openbook_progress\"")
        row = cursor.fetchone()
        # only remove data if we already have data
        if row is not None:
            row_id = int(row[0])
            if DEBUG:
                print("id is", row_id)
            cursor.execute("DELETE from TbGraphData WHERE graphId=%s", (row_id,))
            cursor.execute("DELETE from TbGraph WHERE id=%s", (row_id,))
        # insert a new row into the graph meta data
        cursor.execute("INSERT INTO TbGraph (name) VALUES(\"openbook_progress\")")
        row_id = cursor.lastrowid
        if DEBUG:
            print("id is", row_id)
    # this gets all commits in the right order
    commits = subprocess.check_output([
        "git",
        "log",
        "--format=%H",
        "--reverse",
        ]).decode().split("\n")
    # removes the extra element that I dont need which is the current commit
    commits.pop()
    for commit in tqdm.tqdm(commits):
        date = subprocess.check_output(["git", "show", "-s", "--format=%ci", commit])
        date = date.decode().strip()
        date = dateutil.parser.parse(date)
        date = date.astimezone(tz.tzutc())
        count_mako = 0
        count_temp = 0
        count_gpp = 0
        count_ly = 0
        lines = subprocess.check_output(["git", "ls-tree", "-r", commit]).decode().split("\n")
        for line in lines:
            if line.endswith(".mako"):
                count_mako += 1
            if line.endswith(".temp"):
                count_temp += 1
            if line.endswith(".gpp"):
                count_gpp += 1
            if line.endswith(".ly"):
                count_ly += 1
        count = max(count_mako, count_temp, count_gpp, count_ly)
        if DEBUG:
            print("commit is", commit)
            print("date is", str(date))
            print("count is", str(count))
        if DO_DB:
            cursor.execute("INSERT INTO TbGraphData (tag,date,value,graphId) VALUES(%s,%s,%s,%s)",
                           (commit, date, count, row_id))

    # commit everything...
    if DO_DB:
        cursor.close()
        connection.commit()
        connection.close()


if __name__ == "__main__":
    main()
