Hello and welcome to OpenBook
=============================

What is OpenBook?
------------------
OpenBook is a Jazz real book constructed with free software. A real book simply means a big book with lots of Jazz tunes or standards as they are more widely known.

Where is the projects website?
-------------------------------
http://veltzer.net/openbook/

Why did you start this?
------------------------
Because of many reasons:
* I wanted to learn Jazz and a good way to do that is to write down the tunes (amongst many many other things).
* I wanted beautiful sheet music that I could fiddle with.
* I did not want to pay for the overly expensive real or fake books out there.
* I believe in free software and wanted free (in the sense of freedom) sheet music.
* Jazz is a prime example of a free type of art so it's conjunction with free software seems a match made in heaven.
* Jazz musicians may need beautiful electronic Real books because electronic books are starting to be
used by Jazz musicians both for practice and for performance.

What tools are used?
---------------------
lilypond, make, perl, python, mako, lame, timidity and possibly more.

What is produced?
------------------
Beautiful and lightweight postscript and PDF real books with Jazz tunes.
The idea is that the end user can control the final output and decide if he/she
wants lyrics, size of paper, transposition for trumpet, selection of tunes and more.
In addition you can produce midi, mp3 and ogg outputs.
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
Windows is not currently supported although well formed patches will be accepted.

What do I need to know to participate?
---------------------------------------
* Some rudimentary Linux system administration (in order to install the software needed for this project to build).
* Some basic git software content tracking (in order to fetch the project, modify and submit patches). 
* The lilypond language (in order to edit or add tunes).
* Some music knowledge would also help...:)

Who currently contributes?
---------------------------
Just me (Mark Veltzer <mark.veltzer@gmail.com>).

Where can I see some results?
------------------------------
Check out the PDFs and other outputs in http://veltzer.net/openbook/.

Why is there so little documentation?
--------------------------------------
I just started this project. Feel free to add stuff and request a pull. If you contribute a lot I will make you an admin...

How do you write the standards?
--------------------------------
Using lilypond. Check it out at: http://www.lilypond.org/

Will you co-operate with the lilypond, mutopia and wikifonia communities?
--------------------------------------------------------------------------
YES! Any bugs or feature suggestion are submitted to the lilypond community. Any requests for pieces from the mutopia community will be respected.
Wikifonia uses musicXML for typesetting while I use an essentially lilypond format as input format - so there could not be much co-operation there.

Do you only allow Jazz tunes?
------------------------------
No. Rock and Pop will be welcome and so would classical. If you are really into classical lilypond production you may alternativly wish to contribute to the mutopia project at http://www.mutopiaproject.org/.

How do I get started?
----------------------
* create an account on git hub.
* git checkout -b [your branch name] git://github.com/veltzer/openbook.git
* make (install pieces of software that it needs if it complains).
* hack on the files (git add the files that you hack on).
* commit to your own hard drive repository (git commit).
* push to git hub (git push).
* request me to pull your changes (button in the github ui).

Can I just add a single tune?
------------------------------
Yes. To add a tune named "yourtune" just a single file named

			src/jazz/yourtune.mako
Yes, the extension should be .mako since I use mako for templating.
In that file there are sections. Just copy them from some other tune. One section for
chords, another for lyrics, another for the melody etc.
After working on the tune build just a single tune by issueing:

			make out/src/jazz/yourtune.pdf
or

			make out/src/jazz/yourtune.midi
or

			make out/src/jazz/yourtune.stamp
to get both pdf and midi.

Can I send corrections to the tunes without learning lilypond and all the rest of the stuff?
--------------------------------------------------------------------------------------------
Yes. Just send them as regular text via my email : mark.veltzer@gmail.com

Where can I get more documentation about this project?
------------------------------------------------------
Look in the "doc" subfolder of the source code...

			Mark Veltzer, 2011-2013
			mark.veltzer@gmail.com
