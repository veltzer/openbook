OpenBook
========

build
-----
![build](https://github.com/veltzer/openbook/workflows/build/badge.svg)
* test_os: ['ubuntu-20.04']
* test_python: ['3.9']

build_cont
----------
![build](https://github.com/veltzer/openbook/workflows/build_cont/badge.svg)
* test_container: ['ubuntu:20.04']

version: 172

What is OpenBook?
------------------
OpenBook is a Jazz real book constructed with free software. A real book simply means a big book with lots ofJazz tunes or standards as they are more widely known.

Where is the project's website?
-------------------------------
https://veltzer.github.io/openbook

Why did you start this?
------------------------
Because of many reasons:
* I wanted to learn Jazz, and a good way to do that is to write down the tunes (amongst many other things).
* I wanted beautiful sheet music that I could fiddle with.
* I did not want to pay for the overly expensive real or fake books out there.
* I believe in free software and wanted free (in the sense of freedom) sheet music.
* Jazz is a prime example of a free type of art, so it's conjunction with free software seems a match made in heaven.
* Jazz musicians may need beautiful electronic Real books because electronic books are starting to be
used by Jazz musicians both for practice and for performance.

What tools are used?
---------------------
* python3: for the python scripts
* virtualenv: for using virtualenv for python
* lilypond: this is the main tool we use
* qpdf: for qpdf(1) (used in pdf size reduction)
* ghostscript: for ps2pdf(1), pdf2ps(1), gv (used in pdf size reduction and cutting pdfs)
* timidity: play output midi and convert midi to wav
* lame: convert audio (encode ogg)
* tidy: for tidy(1) (used in checking HTML)
* okular: kde pdf reader
* python-mako-doc: documentation for the template preprocessor
* texi2html: needed to install lilypond from source
* guile-2.2-dev: needed to install lilypond from source
* lilypond-doc: documentation for lilypond
* lilypond-doc-html: documentation for lilypond
* lilypond-doc-pdf: documentation for lilypond
* npm: for htmlhint

What python modules are used?
-----------------------------
* pydmt: python dependency management tool
* pytconf: pytconf handles configuration and command line parsing
* python-dateutil: Extensions to the standard Python datetime module
* tqdm: Fast, Extensible Progress Meter
* PyMySQL: Pure Python MySQL Driver
* Mako: A super-fast templating language that borrows the best ideas from the existing templating languages.
* pymakehelper: pymakehelper eases writing recipes when using the make system
* requests: Python HTTP for Humans.
* gitpython: could not import [gitpython]

What is produced?
------------------
Beautiful and lightweight postscript and PDF real books with Jazz tunes.
The idea is that the end user can control the final output and decide if he/she
wants lyrics, size of paper, transposition for a trumpet, selection of tunes and more.
In addition, you can produce midi, mp3 and ogg outputs.
Possibly other output formats will be supported in the future (epub?).

What is the copyright?
-----------------------
All the stuff in this project is GPL version 3. The tunes themselves have their own copyright holders.

Who can contribute?
--------------------
Anyone.

What system do I need to participate?
--------------------------------------
A Linux system that you can install software on.
Mac OSX is reported to work too if you know how to install the right stuff on it.
Windows is not currently supported although well-formed patches will be accepted.
(disclaimer: the author hates Windows with a vengence so patches have to be spotless
to be accepted)

What do I need to know to participate?
---------------------------------------
* Some rudimentary Linux system administration (in order to install the software needed for this project to build).
* Some basic git software content tracking (in order to fetch the project, modify and submit patches).
* The lilypond language (in order to edit or add tunes).
* Some music knowledge would also help...:)

Who currently contributes?
---------------------------
Look at the CREDITS file

Your name could be here if you contribute...

Where can I see some results?
------------------------------
Check out the PDFs and other outputs in https://veltzer.github.io/openbook.

Why is there so little documentation?
--------------------------------------
I just started this project (4 years all in all). Feel free to add stuff and request a pull.
Contributing may make you an admin...

How do you write the standards?
--------------------------------
Using lilypond. Check it out at http://www.lilypond.org/.

Will you co-operate with the lilypond, mutopia and wikifonia communities?
--------------------------------------------------------------------------
YES! Any bugs or feature suggestion are submitted to the lilypond community.
Any requests for pieces from the mutopia community will be respected.
Wikifonia uses musicXML for typesetting while I use an essentially lilypond
format as input format - so there could not be much co-operation there.

Do you only allow Jazz tunes?
------------------------------
No. Rock and Pop will be welcome and so would classical.
If you are really into classical lilypond production, you may alternativly
wish to contribute to the mutopia project at http://www.mutopiaproject.org/.


How do I build the pdfs?
------------------------
* you need tools installed. on Ubuntu ```$ sudo apt install lilypond qpdf```
* clone the repository ```$ git clone git://github.com/veltzer/openbook.git```
* cd into the newly created folder ```$ cd openbook```
* install python tools to create a python virtual envrionment. on Ubuntu ```$ sudo apt install python3 virtualenv```
* create a python virtual environment ```$ virtualenv --python=/usr/bin/python3 .venv```
* activate the virutal env ```$ source .venv/bin/activate```
* update pip ```$ python -m pip install --upgrade pip```
* install the python prerequisites ```$ pip install -r requirements.txt```
* run the build process ```$ make```
* the pdfs should now be built, and you will find them in the 'docs' folder.
* if you want to build all the tunes individually then run ```$ make all_tunes```


MacOS user notes:
-----------------
* [Python3](https://realpython.com/installing-python)
* [pip](https://pip.pypa.io/en/stable/installing)
* [qpdf](https://github.com/qpdf/qpdf)
* make (on Mac/OS X this is part of X-Code or [command line tools](https://stackoverflow.com/a/9329325/2223106))


How do I contribute?
--------------------
* create an account on git hub.
* hack on the .ly.mako files (git add the files that you hack on).
* commit to your own hard drive repository (git commit).
* push to git hub (git push).
* send me a pull request (button in the github ui).

Can I just add a single tune?
-----------------------------
Yes. To add a tune named [tunename] just add single file named
```
src/openbook/[tunename].ly.mako
```
Yes, the extension should be .mako since I use "mako" for templating.
In that file there are sections. Just copy them from some other tune. One section for
chords, another for lyrics, another for the melody etc.
After working on the tune build just a single tune by issueing:
```sh
make out/src/openbook/[tunename].pdf
```
or
```sh
make out/src/openbook/[tunename].midi
```
or
```sh
make out/src/openbook/[tunename].stamp
```
to get both pdf and midi.

Can I just build a single tune?
-------------------------------
Sure. Just use:
```sh
make out/src/openbook/[tunename].pdf
```
to build the pdf
```sh
make out/src/openbook/[tunename].midi
```
to build the midi
```sh
make out/src/openbook/[tunename].stamp
```
to get both pdf and midi.

What about MusicXML?
--------------------
Sorry, this project is lilypond based. Patches for MusicXML will be welcome, but I don't
see how they will fit into this project.

Can I send corrections to the tunes without learning lilypond and all the rest of the stuff?
--------------------------------------------------------------------------------------------
Yes. Just send them as regular text via my email below.

Where can I get more documentation about this project?
------------------------------------------------------
Look in the "doc" subfolder of the source code...

How can I get a version of this book in a key other than C?
-----------------------------------------------------------
Just edit `include/common.ly.mako` and change TONALITY="c" to "bes" or "ees" before compiling.


	Mark Veltzer <mark.veltzer@gmail.com>, 2009 - 2022
