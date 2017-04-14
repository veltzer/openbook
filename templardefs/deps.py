'''
dependencies for this project
'''

def populate(d):
    d.packs=[
        # must have (critical)
        'python3', # for the python scripts
        'python3-mako', # mako for python 3 (we are not really using it)
        'lilypond', # this is the main tool we use
        'ghostscript', # for ps2pdf(1), pdf2ps(1) (used in pdf size reduction)
        'qpdf', # for qpdf(1) (used in pdf size reduction)
        'templar', # for templar makefile and more (used for templating)

        # for producing extra stuff (not critical)
        'timidity', # play output midi and convert midi to wav
        'lame', # convert audio (encode ogg)

        # for web pages creation (not critical)
        'tidy', # for tidy(1) (used in checking HTML)

        # release helpers (not critical)
        #'grive', # for grive(1)
        'python-tweepy', # this is for tweeting new releases
        'python-tweepy-doc', # this is for tweeting new releases
        'python-facebook', # this is for facebooking releases
        'python-simplejson', # this makes facebook work better

        # for development (not critical)
        'okular', # kde pdf reader
        'python-mako-doc', # documentation for the template preprocessor
        'texi2html', # needed to install lilypond from source
        'guile-2.0-dev', # needed to install lilypond from source
        'lilypond-doc', # documentation for lilypond
        'lilypond-doc-html', # documentation for lilypond
        'lilypond-doc-pdf', # documentation for lilypond

        # was once used but no more (not critical)
        'texlive-extra-utils', # for pdfjoin(1)

        # npm is used for htmlhint
        'npm', # for htmlhint
    ]
    d.python_version_needed=(3,5)

def get_deps():
    return [
        __file__, # myself
    ]
