% end verbatim - this comment is a hack to prevent texinfo.tex
% from choking on non-European UTF-8 subsets

%% this version tag will keep me compiling only on this version of lilypond.
%%=====================================================================
\version "2.12.3"

%% lets define a variable to hold the formatted build date (man 3 strftime):
date=#(strftime "%T %d-%m-%Y" (localtime (current-time)))
lilyver=#(lilypond-version)

%% default values for headers
%%=======================================================================


%%




















% this is a macro that * really * breaks lines. You don't really need this since a regular \break will work
% AS LONG AS you have the '\remove Bar_engraver' enabled...










% this is a macro that * really * breaks lines. You don't really need this since a regular \break will work
% AS LONG AS you have the '\remove Bar_engraver' enabled...


%% some macros to be reused all over
%% =====================================================================
myBreak=\break
myEndLine=\break
myEndLineVoltaNotLast={}
myEndLineVoltaLast=\break
partBar=\bar "||"
endBar=\bar "|."
startRepeat=\bar "|:"
endRepeat=\bar ":|"
startTune={}
endTune=\bar "|."
%% some macros for marking parts of jazz tunes
%% =====================================================================
startSong={}
endSong=\bar "|."
startPart={}
endPart=\bar "||"
startIntro=\mark "Intro"
endIntro={}
%% this causes chords that do not change to disappear...
startChords=\set chordChanges = ##t
endChords={}
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
	%bottom-margin = 2.5\cm

}
\layout {
	%% don't have the fist line indented
	indent = 0.0 \cm
	%% don't know what this is (taken from Laurent Martelli...)
	%textheight = 1.5\cm

	\context {
		\Score
		\override LyricText #'font-family = #'typewriter
		\override LyricText #'font-size = #'-2
		% set the style of the chords to Jazz - I don't see this making any effect
		%\override ChordName #'style = #'jazz
		%\override ChordName #'word-space = #2
		\override ChordName #'font-series = #'bold
		\override ChordName #'font-family = #'roman
		\override ChordName #'font-size = #-1
		%% don't show bar numbers (for jazz it makes it too cluttery)
		\remove "Bar_number_engraver"
	}
}
%% reduce the font size (taken from the lilypond info documentation)
%%#(set-global-staff-size 17.82)

%% There is no need to set the paper size to a4 since it is the default.
%% make lilypond use paper of size a4 (Is this the default ?!?)
%%#(set-default-paper-size "a4")
%%

%{
	DONE:
	- added the chords.
	- added the notes.
	- added youtube performances.
	- added the tunes structure.
	- checked the speed of the tune.
	- added epdfs for real book and new real book.
	- filled in the copyright
	TODO:
	- do the rythm markings on the second bar of the real book version.
	- enter the new real book version.
%}

%% this version of the chords is from the real book...
myChords=\chordmode {
	\startChords

	\startSong

	\mark "A"
	\startPart
	\repeat volta 2 {
		f1:maj7 | ees2:maj7 d:maj | des1:maj7 | c:7.9+ | f:m7 | \myEndLine
	}
	%% this is remarked ON PURPOSE to keep the repetition sign in the chart...
	%%\endPart

	\mark "B"
	\startPart
	e1:m7 | f:maj1 | a:m7.5- | e:m7.5- | g:m7.5- |
	d:m7.5- | g:7.9+ | c:7.9+ | ees1*2:7.9+ | \myEndLine
	\endPart

	\mark "A"
	\startPart
	f1:maj7 | ees2:maj7 d:maj | des1:maj7 | c:7.9+ | f:m7 | \myEndLine
	\endPart

	\endSong

	\endChords
}

%% this version of the tune is from the real book...
myVoice=\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 160
	\time 4/4
	\key c \major

	% part "A"
	\repeat volta 2 {
		r8 g4 c8 \times 2/3 { b c a } \times 2/3 { r a e } | g1 | r8 f g f~ f ees c ees~ | ees2 r8 c bes c~ | c1 |
	}
	% part "B"
	g'4 a8 b~ b2 | r8 a4. b4 c8 d~ | d2 r8 c g bes~ | bes2. a4 | c2 r8 bes f aes~ |
	aes2. g4 | bes2 r8 aes16 bes aes8 des, | ees'2 r8 des16 ees des8 aes | ges'1~ | ges |
	% part "A"
	r8 g,4 c8 \times 2/3 { b c a } \times 2/3 { r a e } | g1 | r8 f g f~ f ees c ees~ | ees2 r8 c bes c~ | c1 |
}

%% score for printing
\book {
\markuplines \table-of-contents
\pageBreak
\tocItem \markup "First Score"
\score {
	<<
		\new ChordNames="Chords" \myChords
		\new Staff="Melody" {
			\new Voice="myvoice" \myVoice
		}
	>>
\header {
	enteredby="Mark Veltzer"
	maintainerEmail="mark.veltzer@gmail.com"
	footer="this is the footer"
	copyright="-- help me fill it out copyright --"
	completion="0"
	tagline=\markup {\small {Typeset by Mark Veltzer <mark.veltzer@gmail.com>, Built at \date, Engraved by lilypond \lilyver}}
	style="not filled"
	poet="unkown"


	title="Gloria's Step"
	composer="Scott LaFaro"
	style="Jazz"
	piece="Glorias Step 1"
	copyright="1962, Orpheum Music."

	completion="5"
	uuid="892e5552-f2ad-11e0-8c10-0019d11e5a41"

	structure="AABA"
	%% Bill Evans, not the orignal Sunday at the Village version...
	idyoutube="C84KmJwtPeI"
	%% the original Sunday at the Village version (take 2)...
	idyoutube="Aib_RL_x7PA"
}
}
\markup {
  \null
}
\tocItem \markup "Second Score"
%% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
\column {
  \fill-line { "this is the dedication" }
  \override #'(baseline-skip . 3.5)
  \column {
    \huge \larger \bold
    \fill-line {
    \larger "This is the title" 
    }
    \fill-line {
    \large \smaller \bold
    \larger "This is the subtitle" 
    }
    \fill-line {
    \smaller \bold
    "Sub sub title"
    }
    \fill-line {
    "Poet"
    { \large \bold "Instrument" }
    "Composer"
    }
  }
}
}
\score {
	<<
		\new ChordNames="Chords" \myChords
		\new Staff="Melody" {
			\new Voice="myvoice" \myVoice
		}
	>>
}
}
