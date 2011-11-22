#!/bin/sh

# this scrip will install all the required packages that you need on
# ubuntu to compile and work with this package.

# packages and their reasons:
# perl: old scripts
# python: for scripts
# python-mako: the templating system we use
# python-mako-doc: documentation for the templating system
# lilypond-doc: documentation for lilypond
# lilypond: the main system we use.
# timidity: convert midi to wav.
# lame: encode ogg
# pdfjam: pdfjoin for creaing pdfs.
# python3-mako: mako for python3 (we are not really using it).

sudo apt-get install perl python python-mako python-mako-doc lilypond-doc lilypond timidity lame pdfjam python3-mako
