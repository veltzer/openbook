<%def name="defs()">
%% end verbatim - this comment is a hack to prevent texinfo.tex
%% from choking on non-European UTF-8 subsets

%% this version tag will keep me compiling only on this version of lilypond.
%%=====================================================================
<%
	import datetime # for datetime.now().strftime()
	import os # for getuid
	import pwd # for getpwuid
	import socket # for gethostname
	import subprocess # for subprocess.check_output

	gattr['date']=datetime.datetime.now().strftime('%T %d-%m-%Y')
	gattr['year']=datetime.datetime.now().strftime('%Y')
	gattr['username']=pwd.getpwuid(os.getuid())[0]
	gattr['gittag']=subprocess.check_output(['git','describe','--abbrev=0']).decode().strip()
	gattr['gitdesc']=subprocess.check_output(['git','describe','--tags']).decode().strip()
	gattr['gitcommits']=subprocess.check_output(['git','log','--pretty=format:\'\'']).decode().split('\n').__len__()
	gattr['hostname']=socket.gethostname()
	gattr['kernel']=os.uname()[0]+' '+os.uname()[2]
	gattr['copyrightvalstudy']='-- no copyright notice for study materials --'
	gattr['lyricsInMidi']=False
%>
\version "${gattr['lilypond_version']}"

%% lets define a variable to hold the formatted build date (man 3 strftime):
%%date=#(strftime "%T %d-%m-%Y" (localtime (current-time)))
%%lilypond_version=#(lilypond-version)

%% setting instruments for midi generation (bah - this doesn't work...)
%%=====================================================================
%%\set ChordNames.midiInstrument = #"acoustic grand"
%%\set Staff.midiInstrument = #"flute"
%%\set PianoStaff.instrumentName = #"acoustic grand"
%% do not show chords unless they change...
%%\set chordChanges = ##t

%% number of staffs per page (this does not work because of my breaks)
%%\paper {
%%	system-count = #7
%%}

\paper {
	%% reduce spaces between systems and the bottom (taken from the lilypond
	%% documentation and found the relevant variable)
	%% the result of this is that I can fit 8 single staffs in one page
	%% which is ideal for Jazz (think 32 bar divided into 8 lines of 4 bars each...).
	%% I should really only apply this thing for Jazz tunes but that is a TODO item.
	%% default is 4\mm - 3 already causes 8 staffs to take 2 pages
	between-system-padding = 2\mm
	%% default is 20\mm
	%% between-system-space = 16\mm
	%% ragged-last-bottom = ##f
	%% ragged-bottom = ##f

	%% make lilypond increase the distance of the footer from the bottom of the page
	%% it seems that if you don't do something like this you're going to have
	%% a real problem seeing the footer in postscript printing....
	%%bottom-margin = 2.5\cm

	%% from /usr/share/lilypond/2.12.3/ly/titling-init.ly
	%% to stop lilypond from printing footers...
	oddFooterMarkup = \markup {}

	%% prevent lilypond from printing the headers...

	scoreTitleMarkup = \markup {}
	bookTitleMarkup = \markup {}
}
\layout {
	%% don't have the fist line indented
	indent = 0.0 \cm
	%% don't know what this is (taken from Laurent Martelli...)
	%%textheight = 1.5\cm

	\context {
		\Score
		%% change the size of the text fonts
		%%\override LyricText #'font-family = #'typewriter
		\override LyricText #'font-size = #'-2

		%% set the style of the chords to Jazz - I don't see this making any effect
		\override ChordName #'style = #'jazz
		%%\override ChordName #'word-space = #2

		%% set the chord size and font
		%%\override ChordName #'font-series = #'bold
		%%\override ChordName #'font-family = #'roman
		%%\override ChordName #'font-size = #-1

		%% don't show bar numbers (for jazz it makes it too cluttery)
		\remove "Bar_number_engraver"
	}
}
%% reduce the font size (taken from the lilypond info documentation, default is 20)
#(set-global-staff-size 17.82)

%% There is no need to set the paper size to a4 since it is the default.
%% make lilypond use paper of size a4 (Is this the default ?!?)
%%#(set-default-paper-size "a4")
%%)

%% Don't have textedit:// links for every note in the pdf file.
%% This reduces the size of the pdf by a lot
\pointAndClickOff

%% chord related matters
myChordDefinitions={
	<c ees ges bes des' fes' aes'>-\markup \super {7alt}
	<c e g bes f'>-\markup \super {7sus}
	<c e g bes d f'>-\markup \super {9sus}
	<c e g f'>-\markup \super {sus}
	<c ees ges bes>-\markup { "m" \super { "7 " \flat "5" } }
	<c ees ges beses>-\markup { "dim" \super { "7" } }
	<c ees ges>-\markup { "dim" }
	%%<c e g b>-\markup { "maj7" }
	<c e gis bes d'>-\markup { \super { "9 " \sharp "5" } }
	<c e g bes d' a'>-\markup \super {13}
	<c e g bes d' fis'>-\markup { \super { "9 " \sharp "11" } }
}
myChordExceptions=#(append
	(sequential-music-to-chord-exceptions myChordDefinitions #t)
	ignatzekExceptions
)

%% some macros to be reused all over
%% =====================================================================
myBreak=\break
%% do line breaks really matter?
myEndLine=\break
%%myEndLine={}
myEndLineVoltaNotLast={}
myEndLineVoltaLast=\break
myEndLineVolta=\break
partBar=\bar "||"
endBar=\bar "|."
startBar=\bar ".|"
startRepeat=\bar "|:"
endRepeat=\bar ":|"
startTune={}
endTune=\bar "|."
myFakeEndLine={}
mySegno=\mark \markup { \musicglyph #"scripts.segno" }
myCoda=\mark \markup { \musicglyph #"scripts.coda" }

%% some functions to be reused all over
%% =====================================================================
%% A wrapper for section markers that allows us to control their formatting

%% You can have a circle instead of a box using:
%% \mark \markup { \circle #mark }
myMark =
#(define-music-function
	(parser location mark)
	(markup?)
	#{
	\mark \markup { \box #mark }
	#})
myWordMark =
#(define-music-function
	(parser location mark)
	(markup?)
	#{
	\mark \markup { \box #mark }
	#})
%% grace that does appoggiatura
%%\grace $notes
myGrace = #(define-music-function (parser location notes) (ly:music?) #{ \appoggiatura $notes #})
%% grace that does nothing
%%myGrace = #(define-music-function (parser location notes) (ly:music?) #{ #})

%% this is a macro that * really * breaks lines. You don't really need this since a regular \break will work
%% AS LONG AS you have the '\remove Bar_engraver' enabled...
hardBreak={ \bar "" \break }
%% a macro to make vertical space
verticalSpace=\markup { \null }

%% macros to help in parenthesizing chords
%% see the playground area for openbook and http://lilypond.1069038.n5.nabble.com/Parenthesizing-chord-names-td44370.html
#(define (left-parenthesis-ignatzek-chord-names in-pitches bass inversion context) (markup #:line ("(" (ignatzek-chord-names in-pitches bass inversion context))))
#(define (right-parenthesis-ignatzek-chord-names in-pitches bass inversion context) (markup #:line ((ignatzek-chord-names in-pitches bass inversion context) ")")))
#(define (parenthesis-ignatzek-chord-names in-pitches bass inversion context) (markup #:line ("(" (ignatzek-chord-names in-pitches bass inversion context) ")")))
LPC = { \once \set chordNameFunction = #left-parenthesis-ignatzek-chord-names }
RPC = { \once \set chordNameFunction = #right-parenthesis-ignatzek-chord-names }
OPC = { \once \set chordNameFunction = #parenthesis-ignatzek-chord-names }

%% some macros for marking parts of jazz tunes
%% =====================================================================
startSong={}
%% If we want endings of parts to be denoted by anything we need
%% to find a smarter function that this since this will tend
%% to make other things disapper (repeat markings etc)
%%endSong=\bar "|."
endSong={}
startPart={}
%% If we want endings of parts to be denoted by anything we need
%% to find a smarter function that this since this will tend
%% to make other things disapper (repeat markings etc)
%% endPart=\bar "||"
endPart={}
startChords={
	%% this causes chords that do not change to disappear...
	\set chordChanges = ##t
	%% use my own chord exceptions
	\set chordNameExceptions = #myChordExceptions
}
endChords={}
</%def>

<%def name="clearVars()">
<%
	attributes.reset()
%>

</%def>

%% lets emit the definitions
${self.defs()}

%% lets always include guitar definitions
\include "predefined-guitar-fretboards.ly"

% if gattr['book']:
%% book header
%%\book {
	%% this is the title page
	\bookpart {
		\markup {
			\column {
				\null
				\null
				\null
				\null
				\null
				\null
				\null
				\null
				\null
				\null
				\fill-line { \fontsize #11 \bold "OpenBook" }
				\null
				\null
				\fill-line { \larger \larger \bold "An open source Jazz real book" }
				\null
				\null
				\null
				\fill-line {
					\huge \bold \concat {
						"Website: "
						\with-url #"https://veltzer.net/openbook" https://veltzer.net/openbook
					}
				}
				\null
				\fill-line {
					\huge \bold \concat {
						"Development: "
						\with-url #"https://github.com/veltzer/openbook" https://github.com/veltzer/openbook
					}
				}
				\null
				\fill-line {
					\huge \bold \concat {
						"Lead developer: Mark Veltzer "
						"<" \with-url #"mailto:mark.veltzer@gmail.com" mark.veltzer@gmail.com ">"
					}
				}
				\null
				\fill-line {
					\huge \bold \concat {
						"Typesetting copyright: © 2011-"
						${gattr['year']}
						" Mark Veltzer "
						"<" \with-url #"mailto:mark.veltzer@gmail.com" mark.veltzer@gmail.com ">"
					}
				}
				\null
				\fill-line { \huge \bold "Tune copyright: © belong to their respective holders" }
				\null
				\null
				\null
				\fill-line { \small "Git tag: ${gattr['gittag']}" }
				\fill-line { \small "Git describe: ${gattr['gitdesc']}" }
				\fill-line { \small "Git commits: ${gattr['gitcommits']}" }
				\fill-line { \small "Build date: ${gattr['date']}" }
				\fill-line { \small "Build user: ${gattr['username']}" }
				\fill-line { \small "Build host: ${gattr['hostname']}" }
				\fill-line { \small "Build kernel: ${gattr['kernel']}" }
				\fill-line { \small "Lilypond version: ${gattr['lilypond_version']}" }
				\fill-line { \small "Number of tunes: ${len(gattr['files'])}" }
				\null
				\null
				\null
			}
		}
		\score {
			<<
				\new Staff="Melody" {
					\new Voice="Voice"
					\relative c' {
						\time 4/4
						\key f \major
						\set fontSize = #-3
						f8 e f c r4 a'8 aes | a c, r e~ e g f e | g f a bes a f g ees
					}
				}
			>>
			\layout {
				#(layout-set-staff-size 35)
				indent = 2.6\cm
			}
		}
	}
% endif

% if gattr['toc']:
\markuplist \table-of-contents
% if gattr['break_after_toc']:
\pageBreak
% endif
% endif

%% from here everything needs to go into a loop
% for file in gattr['files']:

%% include anything the user wants before the bookpart starts
<%include file="/${file}" args="part='Defs'"/>

% if gattr['parts']:
\bookpart {
% endif

%% this causes the variables to be defined...
${self.clearVars()}
<%include file="/${file}" args="part='Vars'"/>

%% now play with the variables that depend on language
<%
	if 'composer' not in attributes:
		if 'poet' not in attributes:
			add=''
		else:
			add=' / '+attributes['poet']
	else:
		if 'poet' not in attributes:
			add=' / '+attributes['composer']
		else:
			if attributes['composer']==attributes['poet']:
				add=' / '+attributes['composer']
			else:
				add=' / '+attributes['composer']+', '+attributes['poet']
	scratch['tocname']=attributes['title']+add
%>
% if 'copyright' not in attributes:
% if 'heb' in attributes and attributes['heb']:
<%
	scratch['copyright']=u'-- עיזרו לי למלא את שורת זכויות היוצרים הזו --'
%>
% else:
<%
	scratch['copyright']='-- help me fill it out this copyright notice --'
%>
% endif
% else:
% if 'heb' in attributes and attributes['heb']:
<%
	scratch['copyright']=u'זכויות יוצרים © '+attributes['copyright']
%>
% else:
<%
	scratch['copyright']=u'Copyright © '+attributes['copyright']
%>
% endif
% endif

%% calculate the tag line
% if heb in attributes and attributes['heb']:
<%
	scratch['tagline']=u'תווי על ידי '+attributes['typesetter']+u', נבנה בתאריך'+gattr['date']+u', תימון על ידי lilypond '+gattr['lilypond_version']
%>
% else:
<%
	scratch['tagline']='Typeset by '+attributes['typesetter']+', Built at '+gattr['date']+', Engraved by lilypond '+gattr['lilypond_version']
%>
% endif

%% calculate the typesetby
% if heb in attributes and attributes['heb']:
<%
	scratch['typesetby']=u'תווי על ידי '+attributes['typesetter']
%>
% else:
<%
	scratch['typesetby']='Typeset by '+attributes['typesetter']
%>
% endif

<%doc>
% if attributes.getWorkingVersion()['doGuitar']:
%%\include "predefined-guitar-fretboards.ly"
% endif
</%doc>

% if gattr['toc']:
\tocItem \markup "${scratch['tocname']}"
% endif

<%doc>
%% emitting the header...
\header {
	dedication="${attributes['dedication']}"
	title="${attributes['title']}"
	subtitle="${attributes['subtitle']}"
	subsubtitle="${attributes['subsubtitle']}"
	composer="${attributes['composer']}"
	style="${attributes['style']}"
	piece="${attributes['piece']}"
	opus="${attributes['opus']}"
	poet="${attributes['poet']}"
	copyright="${scratch['copyright']}"
	copyrightextra="${scratch['copyrightextra']}"

	completion="${attributes['completion']}"
	uuid="${attributes['uuid']}"

	structure="${attributes['structure']}"
	idyoutuberemark1="${attributes['idyoutuberemark1']}"
	idyoutube1="${attributes['idyoutube1']}"
	idyoutuberemark2="${attributes['idyoutuberemark2']}"
	idyoutube2="${attributes['idyoutube2']}"
	lyricsurl="${attributes['lyricsurl']}"
}
</%doc>

<%
	# this block handles poet and composer. The idea is that the author of the tune
	# just fills in the raw poet/composer data and this takes care of the nice printing...
	if 'poet' in attributes and 'composer' in attributes and attributes['poet']==attributes['composer']:
		if 'heb' in attributes and attributes['heb']:
			scratch['fullcomposer']=u'מילים ולחן: '+attributes['poet']
		else:
			scratch['fullcomposer']='Lyrics and Music by '+attributes['poet']
		scratch['fullpoet']=''
	else:
		if 'poet' not in attributes:
			scratch['fullpoet']=''
		else:
			if 'heb' in attributes and attributes['heb']:
				scratch['fullpoet']=u'מלים: '+attributes['poet']
			else:
				scratch['fullpoet']='Lyrics by '+attributes['poet']
		if 'composer' not in attributes:
			scratch['fullcomposer']=''
		else:
			if 'heb' in attributes and attributes['heb']:
				scratch['fullcomposer']=u'לחן: '+attributes['composer']
			else:
				scratch['fullcomposer']='Music by '+attributes['composer']
%>

%% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
% if 'dedication' in attributes:
		\fill-line { "${attributes['dedication']}" }
% endif
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "${attributes['title']}" }
% if 'subtitle' in attributes:
			\fill-line { \large \smaller \bold \larger "${attributes['subtitle']}" }
% endif
% if 'subsubtitle' in attributes:
			\fill-line { \smaller \bold "${attributes['subsubtitle']}" }
% endif
			\fill-line {
				"${scratch['fullpoet']}"
				"${scratch['fullcomposer']}"
			}
			\fill-line {
% if 'piece' in attributes:
				"${attributes['piece']}"
% endif
% if 'opus' in attributes:
				"${attributes['opus']}"
% else:
				""
% endif
			}
		}
	}
}
\noPageBreak

% if attributes.getWorkingVersion()['doOwn']==False:

%% include the preparatory stuff, if there is any
% if attributes.getWorkingVersion()['doPrep']:
<%include file="/${file}" args="part='Prep'"/>
% endif

%% calculate the vars
<%
	Chords='Chords'+attributes.getDefaultVersionName()
	Voice='Voice'+attributes.getDefaultVersionName()
	Lyrics='Lyrics'+attributes.getDefaultVersionName()
	Lyricsmore='Lyricsmore'+attributes.getDefaultVersionName()
	Lyricsmoremore='Lyricsmoremore'+attributes.getDefaultVersionName()
%>

% if gattr['inline']==False:
%% lets emit the blocks
% if attributes.getWorkingVersion()['doChords']:
Chords=<%include file="/${file}" args="part=Chords"/>
% endif
% if attributes.getWorkingVersion()['doVoice']:
Voice=\relative c' <%include file="/${file}" args="part=Voice"/>
% endif
% if attributes.getWorkingVersion()['doLyrics']:
Lyrics=<%include file="/${file}" args="part=Lyrics"/>
% endif
% if attributes.getWorkingVersion()['doLyricsmore']:
Lyricsmore=<%include file="/${file}" args="part=Lyricsmore"/>
% endif
% if attributes.getWorkingVersion()['doLyricsmoremore']:
Lyricsmoremore=<%include file="/${file}" args="part=Lyricsmoremore"/>
% endif
% endif

%% score for printing
\score {
	<<
% if attributes.getWorkingVersion()['doChords']:
\new ChordNames="Chords"
% if attributes.getWorkingVersion()['doChordBars']:
	%% this adds a bar engraver which does not always come with chords
	%% I didn'f find a way to put this with the chords themselves...
	\with {
		%% for lilypond 2.12
		%%\override BarLine #'bar-size = #4
		\override BarLine #'bar-extent = #'(-2 . 2)
		\consists "Bar_engraver"
	}
% else:
	\with {
		\remove "Bar_engraver"
	}
% endif
% if gattr['inline']:
	<%include file="/${file}" args="part=Chords"/>
% endif
% if gattr['inline']==False:
	\Chords
% endif
% endif
%% this thing will only engrave voltas. This is required to put the volta under the chords.
%% No great harm will happen if you don't put it, only the voltas will be above the chords.
%%\new Staff \with {
%%	\consists "Volta_engraver"
%%}
% if attributes.getWorkingVersion()['doVoice']:
\new Staff="Melody" {
\new Voice="Voice"
% if gattr['inline']:
	\relative c' <%include file="/${file}" args="part=Voice"/>
% endif
% if gattr['inline']==False:
	\Voice
% endif
}
% endif
% if attributes.getWorkingVersion()['doLyrics']:
\new Lyrics="Lyrics" \lyricsto "Voice"
% if gattr['inline']:
	<%include file="/${file}" args="part=Lyrics"/>
% endif
% if gattr['inline']==False:
	\Lyrics
% endif
% endif
% if attributes.getWorkingVersion()['doLyricsmore']:
\new Lyrics="Lyrics" \lyricsto "Voice"
% if gattr['inline']:
	<%include file="/${file}" args="part=Lyricsmore"/>
% endif
% if gattr['inline']==False:
	\Lyricsmore
% endif
% endif
% if attributes.getWorkingVersion()['doLyricsmoremore']:
\new Lyrics="Lyrics" \lyricsto "Voice"
% if gattr['inline']:
	<%include file="/${file}" args="part=Lyricsmoremore"/>
% endif
% if gattr['inline']==False:
	\Lyricsmoremore
% endif
% endif
	>>
	\layout {
	}
}
% if gattr['midi']:
%% score for midi
\score {
	\unfoldRepeats
	<<
% if attributes.getWorkingVersion()['doChords']:
\new ChordNames="Chords"
% if gattr['inline']:
	<%include file="/${file}" args="part=Chords"/>
% endif
% if gattr['inline']==False:
	\Chords
% endif
% endif
% if attributes.getWorkingVersion()['doVoice']:
\new Staff="Melody" {
\new Voice="Voice"
% if gattr['inline']:
	\relative c' <%include file="/${file}" args="part=Voice"/>
% endif
% if gattr['inline']==False:
	\Voice
% endif
}
% endif
% if gattr['lyricsInMidi']:
% if attributes.getWorkingVersion()['doLyrics']:
\new Lyrics="Lyrics" \lyricsto "Voice"
% if gattr['inline']:
	<%include file="/${file}" args="part=Lyrics"/>
% endif
% if gattr['inline']==False:
	\Lyrics
% endif
% endif
% if attributes.getWorkingVersion()['doLyricsmore']:
\new Lyrics="Lyrics" \lyricsto "Voice"
% if gattr['inline']:
	<%include file="/${file}" args="part=Lyricsmore"/>
% endif
% if gattr['inline']==False:
	\Lyricsmore
% endif
% endif
% if attributes.getWorkingVersion()['doLyricsmoremore']:
\new Lyrics="Lyrics" \lyricsto "Voice"
% if gattr['inline']:
	<%include file="/${file}" args="part=Lyricsmoremore"/>
% endif
% if gattr['inline']==False:
	\Lyricsmoremore
% endif
% endif
% endif
	>>
	\midi {
	}
}
% endif
% endif

% if attributes.getWorkingVersion()['doOwn']:
<%include file="/${file}" args="part='Own'"/>
% endif
% if attributes.getWorkingVersion()['doExtra']:
<%include file="/${file}" args="part='Extra'"/>
% endif

\noPageBreak
\markup \column {
	%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "${scratch['copyright']}" }
	}
% if gattr['book']:
	\fill-line {
		\smaller \smaller { "${scratch['typesetby']}" }
	}
% endif
% if gattr['book']==False:
	\fill-line {
		\smaller \smaller { "${scratch['tagline']}" }
	}
	\fill-line {
		\smaller \smaller { \with-url #"https://veltzer.net/openbook" https://veltzer.net/openbook }
	}
% endif
}

% if gattr['space_after_tune']:
%% this is just a small space, maybe we should replace this with a page break?
%% TODO: at the very end of the book this should not appear.
\markup \column {
	\null
	\null
}
%endif

% if gattr['break_after_tune']:
\pageBreak
% endif

% if gattr['parts']:
}
% endif

% endfor

% if gattr['book']:
%% book footer
%%}
% endif
