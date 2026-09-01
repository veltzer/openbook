#!/bin/bash
# update must be done first or it doesn't know anything about any package
apt-get update
# because tzdata is interactive
export DEBIAN_FRONTEND=noninteractive
apt-get -y install tzdata
# this is the real installation
apt-get install -y lilypond qpdf python3 git curl
# get the rsconstruct build tool
curl -L -o /usr/local/bin/rsconstruct \
	https://github.com/veltzer/rsconstruct/releases/latest/download/rsconstruct-linux-x86_64
chmod +x /usr/local/bin/rsconstruct
# install uv and create the python environment from pyproject.toml + uv.lock
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"
uv sync
# enter the virtual env
source .venv/bin/activate
# build the books (renders the songs and engraves the five books)
rsconstruct build
# build every tune individually as well (the song generators scan the
# rendered songs, so this must come after the plain build above)
rsconstruct build \
	--iset generator.songs_pdf.enabled=true \
	--iset generator.songs_ps.enabled=true \
	--iset generator.songs_midi.enabled=true
