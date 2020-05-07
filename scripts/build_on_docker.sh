#!/bin/bash
# update must be done first or it doesn't know anything about any package
apt-get update
# because tzdata is interactive
export DEBIAN_FRONTEND=noninteractive
apt-get -y install tzdata
# this is the real installation
apt-get install -y lilypond qpdf python3 python3-pip virtualenv git
# create the virtual env
virtualenv -p /usr/bin/python3 .venv
# enter the virtual env
source .venv/bin/activate
# upgrate pip
python -m pip install --upgrade pip
# install requirements
pip install -r requirements.txt
# build
# make
# make all_tunes
ls -la
