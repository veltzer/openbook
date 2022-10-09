#!/usr/bin/env python3


"""
Find the latest version and download it
"""


import os
import sys
import shutil
import zipfile
import json
import tempfile
import urllib
import requests

import git


def main():
    """ main entry point """
    owner = 'mozilla'
    repo = 'pdf.js'
    debug = False

    response = requests.get(f"https://api.github.com/repos/{owner}/{repo}/releases/latest")
    response.raise_for_status()
    obj = response.json()
    latest_release = obj["name"]
    print(f"latest_release is {latest_release}")
    url = obj["assets"][0]["browser_download_url"]
    print(f"url is {url}")
    if debug:
        json.dump(obj, sys.stdout, indent=4, sort_keys=True)

    with tempfile.NamedTemporaryFile() as file_handle:
        filename=file_handle.name
        with urllib.request.urlopen(url) as fsrc:
            shutil.copyfileobj(fsrc, file_handle)
        repo = git.Repo(".")
        try:
            repo.index.remove(['docs/build', 'docs/web'], True, r=True)
        except git.GitCommandError:
            pass
        with zipfile.ZipFile(filename, 'r') as zip_ref:
            zip_ref.extractall(path="docs")
        os.remove("docs/LICENSE")

        # subprocess.check_call([
        # "unzip",
        # temp_file,
        # "-d",
        # "docs",
        # "-x",
        # "LICENSE",
        # ])
        # os.unlink(temp_file)

        repo.index.add(['docs/build', 'docs/web'], True)
        repo.index.commit("got new version of pdf viewer")
