#!/usr/bin/bash
# update must be done first or it doesn't know anything about any package
apt-get update
# because tzdata is interactive
export DEBIAN_FRONTEND=noninteractive
apt-get -y install tzdata
# this is the real installation
apt-get install -y lilypond qpdf python3 python3-pip python3-virtualenv git
# create the virtual env
python3 -m virtualenv .venv
# enter the virtual env
source .venv/bin/activate
# upgrate pip
python -m pip install --upgrade pip
# install requirements
pip install -r requirements.txt
# build
make
make all_tunes
