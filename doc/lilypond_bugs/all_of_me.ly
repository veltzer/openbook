



% lets emit the definitions

% end verbatim - this comment is a hack to prevent texinfo.tex
% from choking on non-European UTF-8 subsets

% this version tag will keep me compiling only on this version of lilypond.
%=====================================================================

\version "2.12.3"

% lets define a variable to hold the formatted build date (man 3 strftime):
%date=#(strftime "%T %d-%m-%Y" (localtime (current-time)))
%lilyver=#(lilypond-version)

% setting instruments for midi generation (bah - this doesn't work...)
%=====================================================================
%\set ChordNames.midiInstrument = #"acoustic grand"
%\set Staff.midiInstrument = #"flute"
%\set PianoStaff.instrumentName = #"acoustic grand"
% do not show chords unless they change...
%\set chordChanges = ##t

% number of staffs per page (this does not work because of my breaks)
%\paper {
%	system-count = #7
%}

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
		\override LyricText #'font-family = #'typewriter
		\override LyricText #'font-size = #'-2
	%% set the style of the chords to Jazz - I don't see this making any effect
	%%\override ChordName #'style = #'jazz
	%%\override ChordName #'word-space = #2
		\override ChordName #'font-series = #'bold
		\override ChordName #'font-family = #'roman
		\override ChordName #'font-size = #-1
	%% don't show bar numbers (for jazz it makes it too cluttery)
		\remove "Bar_number_engraver"
	}
}
% reduce the font size (taken from the lilypond info documentation, default is 20)
#(set-global-staff-size 17.82)

% There is no need to set the paper size to a4 since it is the default.
% make lilypond use paper of size a4 (Is this the default ?!?)
%#(set-default-paper-size "a4")
%)

% some macros to be reused all over
% =====================================================================
myBreak=\break
myEndLine=\break
myEndLineVoltaNotLast={}
myEndLineVoltaLast=\break
partBar=\bar "||"
endBar=\bar "|."
startBar=\bar ".|"
startRepeat=\bar "|:"
endRepeat=\bar ":|"
startTune={}
endTune=\bar "|."
myFakeEndLine={}

% this is a macro that * really * breaks lines. You don't really need this since a regular \break will work
% AS LONG AS you have the '\remove Bar_engraver' enabled...
hardBreak={ \bar "" \break }
% a macro to make vertical space
verticalSpace=\markup { \null }

% some macros for marking parts of jazz tunes
% =====================================================================
startSong={}
endSong=\bar "|."
startPart={}
endPart=\bar "||"
startIntro=\mark "Intro"
endIntro={}
% this causes chords that do not change to disappear...
startChords=\set chordChanges = ##t
endChords={}


% lets always include guitar definitions
\include "predefined-guitar-fretboards.ly"

% book header


% from here everything needs to go into a loop


% this causes the variables to be defined...











% now play with the variables that depend on language














% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\fill-line { "" }
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "All Of Me" }
			\fill-line { \large \smaller \bold \larger "" }
			\fill-line { \smaller \bold "" }
			\fill-line {
				""
				""
			}
			\fill-line {
				"Mod. Swing"
				""
			}
		}
	}
}
\noPageBreak


% include the preparatory stuff, if there is any

% calculate the vars



% score for printing
\score {
	<<
\new ChordNames="Chords"
	


\chordmode {
	\startChords
	\startSong

	\mark "A"
	\startPart
	c1*2:maj7 | e:7 | \myEndLine
	a:7 | d:m | \myEndLine
	e:7 | a:m | \myEndLine
	d:7 | d1:m7 | g:7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	c1*2:maj7 | e:7 | \myEndLine
	a:7 | d:m | \myEndLine
	f1 | f:m | c2:maj7 e:m7 | a1:7 | \myEndLine
	d:m7 | g:7 | c2:6 ees:dim | d:m7 g:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}



\new Staff="Melody" {
\new Voice="Voice"
	



\relative c'' {
%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

%% part "A"
	c4 g8 e~ e2~ | e \times 2/3 { c'4 d c } | b gis8 e~ e2~ | e1 |
	a4. g8 e2~ | e4 dis \times 2/3 { e bes a } | g2 f~ | f1 |
	e4. ees8 d2~ | d \times 2/3 { e4 gis b } | d2 c~ | c1 |
	b4. bes8 a2~ | a \times 2/3 { a4 d b } | a1 | b |

%% part "B"
	c4 g8 e~ e2~ | e \times 2/3 { c'4 d c } | b gis8 e~ e2~ | e1 |
	a4. g8 e2~ | e4 dis \times 2/3 { e bes a } | g2 f~ | f1 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this version of the lyrics is from the internet but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
%% A part
	All of me - why not take (come on get) all of me
	Can't you see - I'm no good (just a mess) without you

	Take my lips - I want to lose them
	Take (get a piece of) my (these) arms - I'll never use them

%% B part
	Your good-bye - left me with eyes that cry
	How can I - get along (ever make it) without you

	(you know) you took (got) the part - that once was (used to be) my heart
	So why not - why not take all of me
}

	>>
	\layout {
	}
}
% score for midi
\score {
	\unfoldRepeats
	<<
\new ChordNames="Chords"
	


\chordmode {
	\startChords
	\startSong

	\mark "A"
	\startPart
	c1*2:maj7 | e:7 | \myEndLine
	a:7 | d:m | \myEndLine
	e:7 | a:m | \myEndLine
	d:7 | d1:m7 | g:7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	c1*2:maj7 | e:7 | \myEndLine
	a:7 | d:m | \myEndLine
	f1 | f:m | c2:maj7 e:m7 | a1:7 | \myEndLine
	d:m7 | g:7 | c2:6 ees:dim | d:m7 g:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}



\new Staff="Melody" {
\new Voice="Voice"
	



\relative c'' {
%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

%% part "A"
	c4 g8 e~ e2~ | e \times 2/3 { c'4 d c } | b gis8 e~ e2~ | e1 |
	a4. g8 e2~ | e4 dis \times 2/3 { e bes a } | g2 f~ | f1 |
	e4. ees8 d2~ | d \times 2/3 { e4 gis b } | d2 c~ | c1 |
	b4. bes8 a2~ | a \times 2/3 { a4 d b } | a1 | b |

%% part "B"
	c4 g8 e~ e2~ | e \times 2/3 { c'4 d c } | b gis8 e~ e2~ | e1 |
	a4. g8 e2~ | e4 dis \times 2/3 { e bes a } | g2 f~ | f1 |
}


}
	>>
	\midi {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out copyright --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark.veltzer@gmail.com>, Built at 14:16:13 31-10-2011, Engraved by lilypond 2.12.3" }
	}
}




% book footer
