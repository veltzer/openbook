



% lets emit the definitions

% end verbatim - this comment is a hack to prevent texinfo.tex
% from choking on non-European UTF-8 subsets

% this version tag will keep me compiling only on this version of lilypond.
%=====================================================================

\version "2.18.2"

% lets define a variable to hold the formatted build date (man 3 strftime):
%date=#(strftime "%T %d-%m-%Y" (localtime (current-time)))
%lilypond_version=#(lilypond-version)

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
% reduce the font size (taken from the lilypond info documentation, default is 20)
#(set-global-staff-size 17.82)

% There is no need to set the paper size to a4 since it is the default.
% make lilypond use paper of size a4 (Is this the default ?!?)
%#(set-default-paper-size "a4")
%)

% Don't have textedit:// links for every note in the pdf file.
% This reduces the size of the pdf by a lot
\pointAndClickOff

% chord related matters
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

% some macros to be reused all over
% =====================================================================
myBreak=\break
% do line breaks really matter?
myEndLine=\break
%myEndLine={}
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

% some functions to be reused all over
% =====================================================================
% A wrapper for section markers that allows us to control their formatting

% You can have a circle instead of a box using:
% \mark \markup { \circle #mark }
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
% grace that does appoggiatura
%\grace $notes
myGrace = #(define-music-function (parser location notes) (ly:music?) #{ \appoggiatura $notes #})
% grace that does nothing
%myGrace = #(define-music-function (parser location notes) (ly:music?) #{ #})

% this is a macro that * really * breaks lines. You don't really need this since a regular \break will work
% AS LONG AS you have the '\remove Bar_engraver' enabled...
hardBreak={ \bar "" \break }
% a macro to make vertical space
verticalSpace=\markup { \null }

% macros to help in parenthesizing chords
% see the playground area for openbook and http://lilypond.1069038.n5.nabble.com/Parenthesizing-chord-names-td44370.html
#(define (left-parenthesis-ignatzek-chord-names in-pitches bass inversion context) (markup #:line ("(" (ignatzek-chord-names in-pitches bass inversion context))))
#(define (right-parenthesis-ignatzek-chord-names in-pitches bass inversion context) (markup #:line ((ignatzek-chord-names in-pitches bass inversion context) ")")))
#(define (parenthesis-ignatzek-chord-names in-pitches bass inversion context) (markup #:line ("(" (ignatzek-chord-names in-pitches bass inversion context) ")")))
LPC = { \once \set chordNameFunction = #left-parenthesis-ignatzek-chord-names }
RPC = { \once \set chordNameFunction = #right-parenthesis-ignatzek-chord-names }
OPC = { \once \set chordNameFunction = #parenthesis-ignatzek-chord-names }

% some macros for marking parts of jazz tunes
% =====================================================================
startSong={}
% If we want endings of parts to be denoted by anything we need
% to find a smarter function that this since this will tend
% to make other things disapper (repeat markings etc)
%endSong=\bar "|."
endSong={}
startPart={}
% If we want endings of parts to be denoted by anything we need
% to find a smarter function that this since this will tend
% to make other things disapper (repeat markings etc)
% endPart=\bar "||"
endPart={}
startChords={
%% this causes chords that do not change to disappear...
	\set chordChanges = ##t
%% use my own chord exceptions
	\set chordNameExceptions = #myChordExceptions
}
endChords={}


% lets always include guitar definitions
\include "predefined-guitar-fretboards.ly"

% book header
%\book {
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
						2017
						" Mark Veltzer "
						"<" \with-url #"mailto:mark.veltzer@gmail.com" mark.veltzer@gmail.com ">"
					}
				}
				\null
				\fill-line { \huge \bold "Tune copyright: © belong to their respective holders" }
				\null
				\null
				\null
				\fill-line { \small "Git tag: 171" }
				\fill-line { \small "Git describe: 171-14-g676c436" }
				\fill-line { \small "Git commits: 1505" }
				\fill-line { \small "Build date: 22:28:08 01-08-2017" }
				\fill-line { \small "Build user: mark" }
				\fill-line { \small "Build host: fermat" }
				\fill-line { \small "Build kernel: Linux 4.10.0-28-generic" }
				\fill-line { \small "Lilypond version: 2.18.2" }
				\fill-line { \small "Number of tunes: 149" }
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

\markuplist \table-of-contents
\pageBreak

% from here everything needs to go into a loop

% include anything the user wants before the bookpart starts









\bookpart {

% this causes the variables to be defined...














% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "500 Miles High / Chick Corea"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "500 Miles High" }
			\fill-line {
				""
				"Music by Chick Corea"
			}
			\fill-line {
				"Samba"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

%%\myMark "A"
	\mySegno
	\startPart
	\repeat volta 2 {
		e1*2:m | g:m | \myEndLine
		bes:maj7 | b1:m7.5- | e:7.9+ | \myEndLine
		a1*2:m11 | fis:m7.5- | \myEndLine
		f:m7 | c:m11 | \myCoda b:7.3-.5-.9-.11-.13- \mark \markup {D.S. al Coda} | \myEndLine
	}
	\endPart

%%\myMark "Coda"
%%\myCoda
	\startPart
	\repeat volta 2 {
		b1:7.3-.5-.9-.11-.13- | c1*2:m11 | b1:7.3-.5-.9-.11-.13- | \myEndLine
	}
	\endPart

	\endSong
	\endChords
}





% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 168
	\time 4/4
	\key c \major

	\partial 4 d''4 |

%% part "A"
	\repeat volta 2 {
		b1~ | \tuplet 3/2 { b4 b, d a' fis d } | e1~ | e4 c \tuplet 3/2 { a f d } |
		g1 | f2. f4 | f8 e4 g8~ g2~ | g2~ \tuplet 3/2 { g4 f e } |
		d'1~ | d2. c4 | c b8 d~ d2~ | d2~ \tuplet 3/2 { d4 c b } |
		bes aes8 c~ c2~ | c4 r8 g d' ees aes, d | c1~ | c | r | r2. <\parenthesize d'>4 |
	}

%% part "Coda"
	\repeat volta 2 {
		r4 r8 g,, d' ees aes, d | c1~ | c | r |
	}
}




}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

%% part "A"
	Some day you'll look in to her eyes __
	Then there'll be no good -- byes
	And yes -- ter -- day __ will have gone __
	And you'll find yourself __ in a -- no -- ther space __
	"500" _ _ mi -- les high __

%% part "Coda"
	_ "500" _ _ mi -- les high __
}



\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	You'll see just one look and you'll know __
	She's so ten -- der and warm
	You'll re -- cog -- nise __ this is love __
	And you'll find yourself __ on a -- no -- ther plane __
	"500" _ _ mi -- les high __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	






\lyricmode {

%% part "A"
	Be sure that you love stays so free __
	Then it nev -- er can die
	Just re -- a -- lise __ this is truth __
	And above the skies __ you will al -- ways stay __
	"500" _ _ mi -- les high __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "A Cup Of Coffee, A Sandwich And You / Joseph Meyer, Billy Rose, Al Dubin"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "A Cup Of Coffee, A Sandwich And You" }
			\fill-line {
				"Lyrics by Billy Rose, Al Dubin"
				"Music by Joseph Meyer"
			}
			\fill-line {
				"Moderato"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\partial 2. s4 f2:5+ |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		bes1 | ees:m | bes | bes2 b:dim7 | \myEndLine
		c4:m7 f2.:7 | f1:5+ | bes2 b:dim7 | f:7 f:5+ | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		bes1 | ees:m | bes | bes2 b:dim7 | \myEndLine
		c4:m7 f2.:7 | f1:5+ | bes | bes2 f4:7 f:m6 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		ees1*2:7 | a1:m | d4:7 g2.:7 | \myEndLine
		c1:7 | c:7 | c:m7 | f2:7 f:5+ | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		bes1 | ees:m6 | bes | bes2 b:dim7 | \myEndLine
		c4:m7 f2.:7 | c4:m7 f2.:7 |
	} \alternative {
		{
			bes2 a:7 | f:7 f:5+ | \myEndLineVoltaNotLast
		}
		{
			bes2 ees:6 | bes1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 88
	\time 2/2
	\key bes \major

	\partial 2. f4 g f |

	\repeat volta 2 {

	%% part "A"
		d' bes r d | c bes r d | d ( bes2.~ | bes4 ) d, ees d |
		g f r a | g f r a | a ( f2.~ | f4 ) f g f |
		d' bes r d | c bes r d | d ( bes2.~ | bes4 ) d, ees d |
		g f r a | g f r g | bes1~ | bes4 bes a aes |
		g bes2. | ees4 bes2 c4 | d1~ | d4 g, fis f |
		e g2. | d'4 bes2 d4 | c1~ | c4 f, g f |
		d'4 bes r d | c bes r d | d ( bes2.~ |
		bes4 ) d, ees d | g f r a | g f r d' |
	} \alternative {
		{
			d ( bes2. ) | r4 f g f |
		}
		{
			d' ( bes2.~ | bes4 ) r4 r2 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	A Cup of Cof -- fee a sand -- wich and you, __ A co -- zy
	cor -- ner, a ta -- ble for two, __ A chance to
	whis -- per and cud -- dle and coo __ With lots of
	hug -- gin' and kiss -- in' in view __ I don't need
	mus -- ic lob -- ster or wine. __ When -- ev -- er
	your eyes look in -- to mine __ The things I
	long for are sim -- ple and few; __
	A cup of cof -- fee, a sand __ wich and you! A cup of

	you! __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "A Day In The Life Of A Fool / Luiz Bonfa, Carl Sigman"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "A Day In The Life Of A Fool" }
			\fill-line { \large \smaller \bold \larger "Manha De Carnaval / Black Orpheus" }
			\fill-line {
				"Lyrics by Carl Sigman"
				"Music by Luiz Bonfa"
			}
			\fill-line {
				"Slow Bossa Nova"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	a1:m | b2:m7.5- e:7.9- | a1:m | b2:m7.5- e:7.9- | \myEndLine
	a1:m | d2:m7 g:7 | c1:maj7 | e2:m7.5- a:7.9- | \myEndLine
	d1:m7 | g:7 | c:maj7 | f:maj7 | \myEndLine
	b:m7.5- | e:7.9- | a:m | b2:m7.5- e:7.9- | \myEndLine
	\endPart

	\myMark "A'"
	\startPart
	a1:m | b2:m7.5- e:7.9- | a1:m | b2:m7.5- e:7.9- | \myEndLine
	e1:m7.5- | a:7.9- | d1*2:m | \myEndLine
	d2:m d:m/c | b:m7.5- e:7.9- | a:m a:m/g | f1:maj7 | \myEndLine
	b:m7.5- | e:7 | a2:m d:m7 | a1:m | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	d2:m7 a:m7 | d:m7 a:m7 | d:m7 e:m7 | a1*2:m6 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Moderato" 4 = 120
	\time 4/4
	\key c \major

	\partial 4 e4 |

%% part "A"
	c'2~ \tuplet 3/2 { c4 b a } | a2~ \tuplet 3/2 { a4 gis b } | e,1~ | e2 r4 e4 |
	c'2~ \tuplet 3/2 { c4 b a } | a2~ \tuplet 3/2 { a4 g b } | e,1~ | e2 r8 e f g |
	a4. d,8 d2~ | d r8 d e f | g4. c,8 c2~ | c r8 c d e |
	f4. b,8 b2~ | b \tuplet 3/2 { b4 c d } | e1~ | e2 r4 e |

%% part "A'"
	c'2~ \tuplet 3/2 { c4 b a } | a2~ \tuplet 3/2 { a4 gis b } | e,1~ | e2 r4 e4 |
	bes'2~ \tuplet 3/2 { bes4 a g } | g2~ \tuplet 3/2 { g4 f e } | a1~ | a |
	r4 d, \tuplet 3/2 { d e f } | b1 | r4 c, \tuplet 3/2 { c d e } | a2. g4 |
	e1~ | e2 \tuplet 3/2 { e4 gis b } | a1~ | a2 \tuplet 3/2 { r4 a b } |

%% part "B"
	\tuplet 3/2 { c d c } \tuplet 3/2 { b a b } | \tuplet 3/2 { c d c } \tuplet 3/2 { b a b } |
	\tuplet 3/2 { c d c } \tuplet 3/2 { b a g } | a1~ | a2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	A Day __ In The Life __ Of A Fool, __
	a sad __ and a long, __ lone -- ly day, __
	I walk the av -- e -- nue __ and hope I'll run in -- to __
	the wel -- come sight of you __ com -- ing my way. __

%% part "A'"
	I stop __ just a -- cross __ from your door __
	but you're __ nev -- er home __ an -- y -- more. __
	So back to my room and there in the gloom
	I cry __ tears of good -- bye. __

%% part "B"
	'Til you come back to me,
	that's the way it will be
	ev -- 'ry day in the life of a fool. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1959 by Nouvelles Editions Meridian" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts












\bookpart {

% this causes the variables to be defined...

















% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "A Fine Romance / Jerome Kern, Dorothy Fields"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "A Fine Romance" }
			\fill-line {
				"Lyrics by Dorothy Fields"
				"Music by Jerome Kern"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		c1:6 | cis:dim7 | g:7/d | dis:dim7 | \myEndLine
		e:m7 | a:m7 | d:m7 | g:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		c:maj7 | c2:7 a4:13 aes:13 | g2:13 d:m7 | g:dim7 g:7 | \myEndLine
		c1:6 | a2:7 fis4:13 f:13 | e2:7 a:7 | d:7 g:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		c1:6 | cis:dim7 | g:7/d | dis:dim7 | \myEndLine
		e:m7 | a:m7 | d:m7 | g:7 | \myEndLine
		\endPart

		\myMark "C"
		\startPart
		c:6 | c2:7 a:7 | d:m7 a:7 | d:m7 dis:dim7 | \myEndLine
		e:m7 a:7 | d:m7 g:7.9- |

	} \alternative {
		{
			c:6 a:m7 | d:m7 g:7 | \myEndLineVoltaNotLast
		}
		{
			c:6 f:7 | c1:6.9 | \myEndLineVoltaLast
		}
	}
	\endPart
}








% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Presto" 4 = 196
	\time 4/4
	\key c \major

	\partial 4 e4 |

	\repeat volta 2 {

	%% part "A"
		c1 | a'4 g2 a4 | b,1 | b'4 a2 b4 |
		e,1 | d'4 c2 e,4 | g1 | e'4 d2 g,4 |

	%% part "B"
		c4 b c d | \tuplet 3/2 { c b! bes } a aes | g2 g~ | g2. g4 |
		a gis a b | \tuplet 3/2 { a aes g! } fis f | e2 e~ | e2. e4 |

	%% part "A"
		c1 | a'4 g2 a4 | b,1 | b'4 a2 b4 |
		e,1 | d'4 c2 e,4 | g1 | e'4 d2 g,4 |

	%% part "C"
		c4 b c d | \tuplet 3/2 { e d c } b! bes | a1 | \tuplet 3/2 { c4 b bes } a! aes |
		g1 | \tuplet 3/2 { b4 a aes } g! d' |
	} \alternative {
		{
			c1 | r2 r4 e,4 |
		}
		{
			c'1~ | c2. r4 |
		}
	}
}







}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	A Fine Ro -- mance with no kis -- es!
	A Fine Ro -- mance, my friend, this is!

%% part "B"
	We should be like a cou -- ple of hot to -- ma -- toes, __
	but you're as cold as yes -- ter -- day's mashed po -- ta -- toes. __

%% part "A"
	A Fine Ro -- mance you won't nest -- le.
	A Fine Ro -- mance, you won't wrest -- le!

%% part "C"
	I might as well play bridge with my old maid aunts!
	I have -- n't got a chance. This is A Fine Ro -- mance. A
}






\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	_ Fine Ro -- mance my good fel -- low!
	You take ro -- mance, I'll take jel -- lo!

%% part "B"
	You're calm -- er than the seal in the Arc -- tic O -- cean, __
	at least they flap their fins to ex -- press e -- mo -- tion. __

%% part "A"
	A Fine Ro -- mance with no quar -- rels,
	With no in -- sults, and all mor -- als!

%% part "C"
	I've nev -- er mussed the crease in your blue serge pants!
	I nev -- er get the chance. This is A Fine Ro -- _ _ mance. __
}





	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1936 T.B. Harms Company. Copyright Renewed." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts










\bookpart {

% this causes the variables to be defined...















% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "A Foggy Day / George Gershwin, Ira Gershwin"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "A Foggy Day" }
			\fill-line { \large \smaller \bold \larger "From 'A Damsel In Distress'" }
			\fill-line {
				"Lyrics by Ira Gershwin"
				"Music by George Gershwin"
			}
			\fill-line {
				"Medium Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	





\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		f1:maj7 | a2:m7.5- d:7.9- | g1:m7 | c:7 | \myEndLine
		f2. d4:m7.5- | d1:m7.5- | g:7 | g2:m7 c:7 | \myEndLine
		f1:maj7 | c2:m7 f:7 | bes1:maj7 | bes:m6 | \myEndLine
		f:maj7 | a2:m7 d:7 | g1:7.9 | g2:m7 c:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		f1:maj7 | a2:m7.5- d:7.9- | g1:m7 | c:7 | \myEndLine
		f2. d4:m7.5- | d1:m7.5- | g:7 | g2:m7 c:7 | \myEndLine
		c1:m7 | f:7 | bes:maj7 | ees:7 | \myEndLine
		f2 g:m7 | a:m7 bes:m6 | a:m7 d:m7 | g:m7 c:7 | \myEndLine
	} \alternative {
		{
			f1 | g2:m7 c:7 | \myEndLineVoltaNotLast
		}
		{
			f1 | bes2:7 bes:m6 | f1:maj7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 






{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

	\partial 4 c4 |

	\repeat volta 2 {

%% part "A"
	c c2 ees4~ | ees2. ees4 | d d2 a'4~ | a1 |
	f2 f4 aes~ | aes2. aes4 | g2 g4 d'~ | d1 |
	r4 e e e | c c2. | a2 a4 f~ | f2. f4 |
	a a a c~ | c c2 c4 | a2 a4 d,~ | d2. c4 |

%% part "B"
	c2 c4 ees~ | ees ees2 ees4 | d2 d4 a'~ | a2 a4 a |
	f2 f4 aes~ | aes bes aes2 | g g4 d'~ | d2. d4 |
	f2 f4 d~ | d2. d4 | c2 c4 a~ | a2 a4 bes |
	c f, g bes | a f g bes | a2 f' | f, g |

	} \alternative {
		{
			f1 | r2 r4 c |
		}
		{
			f1~ | f~ | f |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	







\lyricmode {

%% part "A"
	A Fog -- gy Day __ in Lon -- don town __ had me low __ and had me down. __
	I viewed the morn -- ing with a -- larm, __ the Brit -- ish Mu -- se -- um had lost its charm. __

%% part "B"
	How long I won -- dered could this thing last? __ But the age of mir -- a -- cles had -- n't passed, __
	for sud -- den -- ly, __ I saw you there __ and through fog -- gy Lon -- don town the sun was shin -- ing ev -- 'ry where.

%% part "Volta"
	A where. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1937, Gershwin Publishing Corporation" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "A Night In Tunisia / John 'Dizzy' Gillespie, Frank Paparelli"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "A Night In Tunisia" }
			\fill-line {
				""
				"Music by John 'Dizzy' Gillespie, Frank Paparelli"
			}
			\fill-line {
				"Bright Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		ees1:7 | d:m6 | ees:7 | d:m6 | \myEndLine
		ees:7 | d:m6 | ees2:m7.5- a4.:7.5-.9- d8:m6 |
	} \alternative {
		{
			d1:m6 | \myEndLineVoltaNotLast
		}
		{
			d1:m6 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	a:m7.5- | d:7.9- | g2:m6 d:7.9- | g1:m6 | \myEndLine
	g1:m7.5- | c:7.9- | f:maj | e2:m7.5- a:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees1:7 | d:m6 | ees:7 | d:m6 | \myEndLine
	ees:7 | d:m6 | e2:m7.5- a:7.5- | d1:m7+ | \myEndLine
	\endPart

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

%% part "A"
	\partial 8 a8 |

	\repeat volta 2 {
		\tuplet 3/2 { bes des f } c'2 bes8 f | gis a4. r4 r8 a, | \tuplet 3/2 { bes des f } c' c~ c4 bes8 f | a2. r8 a, | \tuplet 3/2 { bes des f } c'2 bes8 f | gis a4. r2 |
		a8 bes \tuplet 3/2 { a16 bes a } g8 ees4 cis8 d~ |
	} \alternative {
		{
			d4 r r r8 a |
		}
		{
			d4\repeatTie r r r8 a' |
		}
	}

%% part "B"
	c4. a8~ a4. g8 | ges4 ees'8 cis d c4 a8 |
	bes g4 fis8~ fis4 a8 fis | g a e4 r r8 \grace a8 bes8~ | bes \grace a8 bes4 r8 r4 \tuplet 3/2 { g16 aes g } f8 | e4 \tuplet 3/2 { des'16 ees des } b8 c bes4 gis8 | a4. f8 \tuplet 3/2 { g?16 aes g } f8 \tuplet 3/2 { g16 aes g } f8 |
	e2. r8 a, |

%% part "A"
	\tuplet 3/2 { bes des f } c'2 bes8 f | gis a4. r4 r8 a, | \tuplet 3/2 { bes des f } c' c~ c4 bes8 f | a2. r8 a, | \tuplet 3/2 { bes des f } c'2 bes8 f | gis a4. r2 | a8 bes \tuplet 3/2 { a16 bes a } g8 ees4 cis8 d~ | d4 r r2 |
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1944 by MCA Music Publishing, A division of MCA Inc, New York, NY" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "A Nightingale Sang in Berkeley Square / Manning Sherwin, Eric Maschwitz"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "A Nightingale Sang in Berkeley Square" }
			\fill-line {
				"Lyrics by Eric Maschwitz"
				"Music by Manning Sherwin"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		ees2:maj7 c:m7 | g:m7 ees:7 | aes g:7 | c:m7 aes:m6 | \myEndLine
		ees:maj7 bes:7 | ees:7 aes4:m7 des:7 | ees2:maj7 c:m7 | f:m7 bes:7 | ees:6 c:m7 | \myEndLine
		f:m7 bes:7 |
		\endPart

		\myMark "A"
		\startPart
		ees:maj7 c:m7 | g:m7 ees:7 | aes:maj7 g:7 | c:m7 aes:m6 | \myEndLine
		ees:maj7 bes:7 | ees:7 aes4:m7 des:7 | ees2:maj7 c:m7 | f:m7 bes:7 | ees:6 c4:m7 c:m7/bes | a2:m7.5- d:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		g e:m7 | a:m7 d4:7 d:7/c | b2:m7 bes:dim7 | a:m7 d:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		g e:m7 | a:m7 d4:7 d:7/c | b2:m7 bes:dim7 | f:m7 bes:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		ees2:maj7 c:m7 | g:m7 ees:7 | aes g:7 | c:m7 aes:m6 | \myEndLine
		ees bes:7 | ees:7 aes4:m7 des:7 | ees,2 c:m7 | f:m7 bes:7 |
	} \alternative {
		{
			ees c:m7 | f:m7 bes:7 | \myEndLineVoltaNotLast
		}
		{
			ees c:m7 | f:m7 bes4:7 bes:7/aes | g2:m7.5- c:7 | f:m7.5- aes4/bes bes:7 | ees2 c4:m c:m7/bes | aes2:m6 ees:6 | \myEndLineVoltaLast
		}
	}
	\myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key ees \major

	\partial 8 bes8 |

	\repeat volta 2 {
		g'4 g ees4. ees8 | bes'4 bes g ees8 ees | \tuplet 3/2 { c'4 c c d d d } | ees2. ees8 ees |
		d4 bes c4. aes8 | bes4 ees, bes' aes8 aes | g aes bes4 ees, ees | ees2 f | ees1 |
		r2 r4 r8 bes | g'4 g ees4. ees8 | bes'4 bes g ees8 ees | \tuplet 3/2 { c'4 c c d d d } | ees2. ees4 |
		d4 bes c4. aes8 | bes4 ees, bes'4. aes8 | g aes bes4 ees, ees | ees2 f | ees1 | r |
		r8. d16 e8. fis16 g8. a16 b8. c16 | d8 d4 b8~ b4. b8 | a4 a fis4. fis8 | e4 e d2 |
		r8. d16 e8. fis16 g8. a16 b8. c16 | d8 d4 b8~ b4. b8 | a4 a g4. g8 | c4 c bes4. bes,8 |
		g'4 g ees4. ees8 | bes'4 bes g ees8 ees | \tuplet 3/2 { c'4 c c d d d } | ees2. ees4 | d bes c4. aes8 |
		bes4 ees, bes'4. aes8 | g8 aes bes4 ees, ees | ees2 f |
	} \alternative {
		{
			ees1~ | ees4 r r r8 bes8 |
		}
		{
			ees1 | r8 c' bes aes g4 f | g1 | r8 aes g f ees4 d | ees1~ ees2. r4 |
		}
	}
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	That cer -- tain night, the night we met there was ma -- gic a -- broad in the air, there were
	an -- gels din -- in at the Ritz, and A Nigh -- in -- gale Sang In Ber -- k'ley Square.
	I may be right, I may be wrong, but I'm per -- fect -- ly will -- ing to swear that
	when you turn'd and smiled at me A Night -- in gale Sang In Ber -- k'ley Square.
	The moon that lin -- gered o -- ver Lon -- don town, __ poor Puz -- zled moon, he wore a frown.
	How could he know we two were so in love. __ The whole darn world seemed up -- side down, the
	streets of town were paved with stars. It was such a ro -- man -- tic af -- fair, and as we kiss'd and
	said "\"good" -- "night\"" A Night -- in gale Sang In Ber -- k'ley Square. __ How Square.
	I know, 'cause I was there that night in Ber -- k'ly Square. __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {
	_
	strange it ws, how sweet and strange. There was nev -- er a dream to com -- pare with that
	ha -- zy, cra -- zy night we met, when A Night -- in -- gale Sang In Ber -- k'ley Square.
	This heart of mine beat loud and fast like a mer -- ry -- go -- round in a fair. For
	we were dan -- cing cheek to cheek "and A" Night -- in -- gale Sang In Ber -- k'ley Square.
	When dawn came steal -- ing up all gold and blue __ to in -- ter -- rupt our ren -- dez -- vous,
	I still re -- mem -- ber how you smiled and said __ "\"was" that a dream of was it "true?\"" our
	home -- ward step was just as light as the tap -- dan -- cing feet of As -- taire and like an e -- cho
	far a -- way A Night -- in -- gale Sang In Ber -- k'ley Square. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1951, Bourne Co. Copyright Renewed." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Afternoon in Paris / John Lewis"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Afternoon in Paris" }
			\fill-line {
				""
				"Music by John Lewis"
			}
			\fill-line {
				"Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	c1:6 | c2:m7 f:7 | bes1:6 | bes2:m7 ees:7 | \myEndLine
	aes1:maj7 | d2:m7.5- g:7 | c:maj7 a:m7 | d:m7 g:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c1:6 | c2:m7 f:7 | bes1:6 | bes2:m7 ees:7 | \myEndLine
	aes1:maj7 | d2:m7.5- g:7 | c1 | a:m7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	d1:m7 | g:7.9- | c:6 | a:m7 | \myEndLine
	d:m7 | g:7.9- | cis2:m7.5- fis:7 | d:m7 g:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c1:6 | c2:m7 f:7 | bes1:6 | bes2:m7 ees:7 | \myEndLine
	aes1 | d2:m7.5- g:7 | c1*2 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

	\partial 4 e'4 |

%% part "A"
	g8 d r c b c d e | ees g, bes d c4 d | f8 c r bes a bes c d | des f, aes c bes4 c |
	ees8 c aes ees g bes aes4 | f2 \tuplet 3/2 { g4 f g } | e8 g b d a b c e | f a, c e d4 e |

%% part "A"
	g8 d r c b c d e | ees g, bes d c4 d | f8 c r bes a bes c d | des f, aes c bes4 c |
	ees8 c aes ees g bes aes4 | aes2 \tuplet 3/2 { g4 f g } | e1~ | e2 a4 b |

%% part "B"
	c2. d4 | e2. d4 | c2. e4 | a,2. b4 |
	c2. d4 | e2. d4 | e1 | f2. e4 |

%% part "A"
	g8 d r c b c d e | ees g, bes d c4 d | f8 c r bes a bes c d | des f, aes c bes4 c |
	ees8 c aes ees g bes aes4 | f2 \tuplet 3/2 { g4 f g } | e1~ | e2. r4 |
}



}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1955 and Renewal of Copyright 1983 by MJQ Music, Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Alice In Wonderland / Sammy Fain, Bob Hilliard"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Alice In Wonderland" }
			\fill-line {
				"Lyrics by Bob Hilliard"
				"Music by Sammy Fain"
			}
			\fill-line {
				"Med."
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		d2.:m7 | g:7 | c:maj7 | f:maj7 | \myEndLine
		b:m7.5- | e:7 | a:m7 | ees:7 | \myEndLine
		d:m7 | g:7 | e:m7 | a:m7 | \myEndLine
		d:m7 | g:7 |
	} \alternative {
		{
		%% the chords a:m7 d:7 are a mistake in the real book
			e4.:m7 a:7 | d:m7 g:7 | \myEndLineVoltaNotLast
		}
		{
			c2.:maj7 | a:m7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	d2.:7 | g:7 | e:m7 | a:m7 | \myEndLine
	d:m7 | g:7 | c:maj7 | f:maj7 | \myEndLine
	fis:m7.5- | b:7.9- | e:m7 | a:7 | \myEndLine
	d2:m7 a4:7 | d2:m7 a4:7 | d2:m7 aes4:7 | g2.:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	d2.:m7 | g:7 | c:maj7 | f:maj7 | \myEndLine
	b:m7.5- | e:7 | a:m7 | ees:7 | \myEndLine
	d:m7 | g:7 | e:m7 | a:m7 | \myEndLine
	d:m7 | g:7 | c2.*2:maj7 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 3/4
	\key c \major

%% part "A"
	\repeat volta 2 {
		g'2. | g'2 f4 | e2 c4 | g2. |
		d'4 e f | e2 d4 | e2 c4 | g2. |
		d'4 e f | e2 d4 | e2 g4 | c2 a4 |
		g2 f4 | e2 d4 |
	} \alternative {
		{ g2.~ | g | }
		{ c,2.~ | c2 cis4 | }
	}

%% part "B"
	d2. | a' | g | c, |
	d4 e f | g2 a4 | b2 g4 | e2. |
	fis | c' | b2 g4 | e2. |
	a2 g4 | f2 e4 | d2 c4 | b2. |

%% part "A"
	g2. | g'2 f4 | e2 c4 | g2. |
	d'4 e f | e2 d4 | e2 c4 | g2. |
	d'4 e f | e2 d4 | e2 g4 | c2 a4 |
	g2 f4 | e2 d4 | c2.~ | c |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% This is taken from the inetnet and adjusted for this tune
\lyricmode {

%% part "A"
	A -- lice In Won -- der -- land
	How do you get to won -- der -- land
	O -- ver the hill or un -- der -- land
	or just be -- hind the tree __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	When clouds go rol -- ling by
	They roll a -- way and leave the sky
	Where is the land be -- yond the eye
	That peo -- ple can -- not _ see __

%% part "B"
	And where do stars go
	Where is the sil -- ver cre -- scent moon
	They must be some -- where
	in the sun -- ny af -- ter -- noon

%% part "A"
	A -- lice In Won -- der -- land
	Where is the path to won -- der -- land
	O -- ver the hill or here or there
	I real -- ly won -- der where __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "All Of Me / Seymour Simons, Gerald Marks"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "All Of Me" }
			\fill-line {
				""
				"Lyrics and Music by Seymour Simons, Gerald Marks"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	c1*2:maj7 | e:7 | \myEndLine
	a:7 | d:m | \myEndLine
	e:7 | a:m | \myEndLine
	d:7 | d1:m7 | g:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	c1*2:maj7 | e:7 | \myEndLine
	a:7 | d:m | \myEndLine
	f1 | f:m | c2:maj7 e:m7 | a1:7 | \myEndLine
	d:m7 | g:7 | c2:6 \LPC ees:dim | d:m7 \RPC g:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 168
	\time 4/4
	\key c \major

%% part "A"
	c'4 g8 e~ e2~ | e \tuplet 3/2 { c'4 d c } | b gis8 e~ e2~ | e1 |
	a4. g8 e2~ | e4 dis \tuplet 3/2 { e bes' a } | g2 f~ | f1 |
	e4. ees8 d2~ | d \tuplet 3/2 { e4 gis b } | d2 c~ | c1 |
	b4. bes8 a2~ | a \tuplet 3/2 { a4 d b } | a1 | b |

%% part "B"
	c4 g8 e~ e2~ | e \tuplet 3/2 { c'4 d c } | b gis8 e~ e2~ | e1 |
	a4. g8 e2~ | e4 dis \tuplet 3/2 { e bes' a } | g2 f~ | f1 |
	d'2 c4 b | d2. c4 | b2 e,4 g | b2. a4 |
	c2 a4 c | e2 e | c1~ | c |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this version of the lyrics is from the internet but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

%% part "A"
	All of me __
	why not take all of me __
	Can't you see __
	I'm no good with -- out you __

	Take my lips __
	I want to lose them __
	Take my arms __
	I'll ne -- ver use them __

%% part "B"
	Your good -- bye __
	left me with eyes that cry __
	How can I __
	get a -- long with -- out you __

	You took the part
	that once was my heart
	So why not
	take all of me __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1931 Bourne Co. Copyright Renewed" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "All Or Nothing At All / Arthur Altman, Jack Lawrence"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "All Or Nothing At All" }
			\fill-line {
				"Lyrics by Jack Lawrence"
				"Music by Arthur Altman"
			}
			\fill-line {
				"Moderately Slow"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	a1*2:m | a1:m7 | a:m6 | \myEndLine
	a2:m a:m6 | a1:m | bes2:9 bes:6 | bes:aug bes:7 | \myEndLine
	g1:m | e2:m7.5- a:7.9- | d1*2:m | \myEndLine
	g1:7 | g2.:7 g4:7.5+ | c1:maj7 | b2:m7.5- e:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	a1*2:m | a1:m7 | a2:m6 a:m | \myEndLine
	a:m a:m6 | a1:m | bes2:9 bes:6 | bes:aug bes:7 | \myEndLine
	g1:m | e2:m7.5- a:7.9- | d1*2:m | \myEndLine
	g1:7 | g2.:7 g4:7.5+ | c1:maj7 | bes2:m7 ees:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	aes aes:aug | aes:6 aes:aug | aes aes:aug | aes:6 aes4:aug ees:7 | \myEndLine
	aes2 aes:aug | des aes | ees1:9 | ees2:aug ees:7 | \myEndLine
	bes:m7 ees:7 | bes:m7 ees:7 | bes:m7 ees:7 | g:m7.5- c:7 | \myEndLine
	f1:m | des:7 | c:7 | e:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	a1*2:m | a1:m7 | a:m6 | \myEndLine
	a1*2:m | bes2:9 bes:6 | bes:aug bes:7 | \myEndLine
	g1:m | e2:m7.5- a:7.9- | d1:m | b2:m7.5- e:7 | \myEndLine
	a1:m | d2:m7.5- g:7.11 | c1 | c:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 168
	\time 4/4
	\key c \major

%% part "A"
	e1~ | e4 e \tuplet 3/2 { e f c } | e1~ | e2. r4 |
	e2 e | e \tuplet 3/2 { e4 g c, } | d4. d8 d2~ | d2. r4 |
	d2 d | d \tuplet 3/2 { e4 cis d } | a'4. a8 a2~ | a b4 a |
	g g2 g4 | g g2 g4 | g1 | r |

%% part "A"
	e~ | e4 e \tuplet 3/2 { e f c } | e1~ | e2. r4 |
	e2 e | e \tuplet 3/2 { e4 g c, } | d4. d8 d2~ | d2. r4 |
	d4. d8 d4. d8 | d4. d8 \tuplet 3/2 { e4 cis d } | a'4. a8 a2~ | a b4 a |
	g g2 g4 | g g2 g4 | g1~ | g4 r r ees |

%% part "B"
	c' c c c | c4. c8 \tuplet 3/2 { c4 des aes } | c1~ | c2. ees,4 |
	c'4. c8 c4. c8 | des2 \tuplet 3/2 { c4 bes aes } | g1~ | g2. ees4 |
	\tuplet 3/2 { bes' bes bes } bes4. bes8 | \tuplet 3/2 { bes4 bes bes } \tuplet 3/2 { bes c g } | bes1~ | bes2 c4 bes |
	aes2 aes4 aes | aes aes2 aes4 | g1 | r4 d c b |

%% part "A"
	e1 | \tuplet 3/2 { e4 f c } \tuplet 3/2 { e f c } | e1~ | e2. r4 |
	e2 e | e \tuplet 3/2 { e4 g c, } | d4. d8 d2~ | d2. r4 |
	d2 d | d4. d8 \tuplet 3/2 { e4 cis d } | a'1 | b |
	c1~ | c4 c \tuplet 3/2 { c c c } | c1~ | c2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	All, __ Or Noth -- ing At All. __
	Half a love nev -- er ap -- pealed to me. __
	If your heart nev -- er could yield to me, __
	then I'd rath -- er have noth -- ing at all!

%% part "A"
	All __ Or Noth -- ing At All! __
	If it's love, there is no in -- be -- tween. __
	Why be -- gin, then cry for some -- thing that might have been. __
	No, I'd rath -- er have noth -- ing at all. __

%% part "B"
	But, please, don't bring your lips so close to my cheek. __
	Don't smile or I'll be lost be -- yond re -- call. __
	The kiss in your eyes, the touch of your hand makes me weak, __
	And my heart may grow diz -- zy and fall.

%% part "A"
	And if I fell un -- der the spell of your call. __
	I would be caught in the un -- der -- tow. __
	So, you see, I've got to say: No! No!
	All __ Or Noth -- ing At All! __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1930, 1940 by MCA MUSIC PUBLISHING, A Division of MCA Inc. Copyright Renewed" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts










\bookpart {

% this causes the variables to be defined...















% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "All The Things You Are / Jerome Kern, Oscar Hammerstein II"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "All The Things You Are" }
			\fill-line { \large \smaller \bold \larger "From 'Very Warm For May'" }
			\fill-line {
				"Lyrics by Oscar Hammerstein II"
				"Music by Jerome Kern"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	





\chordmode {
	\startChords

	\startSong

	\myMark "A"
	\startPart
	f1:m7 | bes:m7 | ees:7 | aes:maj7 | \myEndLine
	des:maj7 | g:7 | c1*2:maj7 | \myEndLine
	c1:m7 | f:m7 | bes:7 | ees:maj7 | \myEndLine
	aes:maj7 | a2:m7.5- d:7.9- | g1:maj7 | g2:maj7 e:7.9+ | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	a1:m7 | d:7 | g:maj7 | c:maj7 | \myEndLine
	fis:m7.5- | b:7 | e:maj7 | c:7.5+ | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	f:m7 | bes:m7 | ees:7 | aes:maj7 | \myEndLine
	des:maj7 | des2:m7 ges:7.9 | aes1:maj7 | b:dim7 | \myEndLine
	bes:m7 | ees:7.9 | aes1*2:maj7 | \myEndLine
	\endPart

	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 






{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key aes \major

%% part "A"
	aes'1 | des2. aes4 | g g g g | g c2 g4 |
	f f f f | f b2 f4 | e1~ | e |
	ees | aes2. ees4 | d d d d | d g2 d4 |
	c c c c | c d8 ees d4 c | b1~ | b4 d g d' |

%% part "B"
	d4. c8 c2~ | c4 dis, e c' | b1~ | b4 d, g b |
	b4. a8 a2~ | a4 bes,? b a' | gis1 | r |

%% part "C"
	aes | des2. aes4 | g g g g | g c2 g4 |
	f1 | ees'2. des4 | ees, ees \tuplet 3/2 { ees ees ees } | g2. f4 |
	des des f aes | f'2 g, | aes1~ | aes2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	







\lyricmode {

%% part "A"
	You are the prom -- ised kiss of spring -- time
	That makes the lone -- ly win -- ter seem long. __
	You are the breath -- less hush of eve -- ning
	That trem -- bles on the brink of a love -- ly song. __

%% part "B"
	You are the an -- gel glow __ that lights a star. __
	The dear -- est things I know __ are what you are.

%% part "C"
	Some day my hap -- py arms will hold you,
	And some day I'll know that mo -- ment di -- vine,
	When All The Things You Are, are mine. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1939 T.B. Harms Company. Copyright Renewed." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Alone Together / Arthur Schwartz, Howard Dietz"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Alone Together" }
			\fill-line {
				"Lyrics by Howard Dietz"
				"Music by Arthur Schwartz"
			}
			\fill-line {
				"Ballad"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		d1:m | e2:m7.5- a:7.9- | d1:m | e2:m7.5- a:7.9- | \myEndLine
		d1:m | a2:m7.5- d:7.9- | g1:m | g:m7 | \myEndLine
		b2:m7 e:7 | g:m7 c:7 | f f:7 | e:m7.5- a:7 | \myEndLine
	} \alternative {
		{
			d1:maj7 | e2:m7.5- a:7 | \myEndLineVoltaNotLast
		}
		{
			d1*2:maj7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	a1:m7.5- | d:7.9- | g1*2:m | \myEndLine
	g1:m7.5- | c:7.9- | f2 f:7 | e:m7.5- a:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	d1:m | e2:m7.5- a:7.9- | d1:m | e2:m7.5- a:7.9- | \myEndLine
	d1:m | bes2:7 a:7 | d1:m | \LPC e2:m7.5- \RPC a:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key d \minor

	\partial 8 d8 |

%% part "A"
	\repeat volta 2 {
		f2.. d8 | e e4.~ e2~ | e4 r8 d e4. f8 | a1~ |
		a4 r8 d, e4. f8 | a1~ | a4 r8 g a4. bes8 | d2.. d8 |
		e2.. d8 | c c4.~ c bes8 | a4. g8 a4. g8 | a2.. g8 |
	} \alternative {
		{ fis fis4.~ fis2~ | fis2. r8 d | }
		{ fis fis4.~ fis2~ | fis2. d4 | }
	}

%% part "B"
	c'1~ | \tuplet 3/2 { c4 a bes } \tuplet 3/2 { c ees d } | bes1~ | bes2. d,4 |
	bes'1~ | \tuplet 3/2 { bes4 g a } \tuplet 3/2 { bes des c } | a2.. f8 | g2.. d8 |

%% part "A"
	f2.. d8 | e e4.~ e2~ | e4 r8 d e4. f8 | a1~ |
	a4 r8 a b4. d8 | f2.. cis8 | d d4.~ d2~ | d2 r4 r8 <\parenthesize d,>8 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

%% part "A"
	A -- lone To -- geth -- er; __
	be -- yond the crowd. __
	a -- bove the world, __
	we're not too proud
	to cling to -- geth -- er. __
	Were strong
	As long as we're to -- geth -- er __

	A
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	A -- lone To -- geth -- er; __
	the blind -- ing rain __
	The star -- less night, __
	we're not in vain;
	For we're to -- geth -- er, and what is there
	to fear to -- _ _ _ geth -- er. __

%% part "B"
	Our love __ is as deep as the sea, __
	Our love __ is as great as a love can be,

%% part "A"
	And we can wea -- ther __
	the great un -- known, __
	If we're A -- lone To -- geth -- er. __

	A
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1932 (Renewed) Warner Bros. Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Always / Irving Berlin"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Always" }
			\fill-line {
				""
				"Lyrics and Music by Irving Berlin"
			}
			\fill-line {
				"Waltz"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\repeat volta 2 {

		\myMark "A"
		\startPart
		f2.*4 | \myEndLine
		c2.*2:7 | f | \myEndLine
		f2. | f2 f4:7 | a2.*2 | \myEndLine
		e:7 | a2. | c2.:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		f2.*2 | f2.:7 | f4:7/f f:7/e f:7/ees | \myEndLine
		d2.*2:7 | c4:m g2:m | g2.:m | \myEndLine
		g:m | bes:m | f | g:9 | \myEndLine
		c2.*2:7 |
	} \alternative {
		{
			f2. | c:7 | \myEndLineVoltaNotLast
		}
		{
			f2.*2 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 88
	\time 3/4
	\key f \major

	\repeat volta 2 {

	%% part "A"
		c4. d8 f g | a2. | c4 a2~ | a2. |
		c,4. d8 e f | g2. | a4 f2~ | f2. |
		c4. d8 f g | a2. | e4. fis8 a b | cis2. |
		e,4. fis8 gis b | d2. | cis4 a2 | a4 g2 |

	%% part "B"
		c,4. d8 f g | a2. | c4 a2~ | a2. |
		d,4. e8 fis a | d2. | es4 d2~ | d2. |
		bes4. a8 g a | bes2. | a4. g8 f g | a2. |
		g4. f8 e f | g2 c,4 |
	} \alternative {
		{
			a'4 f2~ | f4 r r |
		}
		{
			a4 f2~ | f2 r4 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	I'll be lov -- ing you, Al -- ways __
	With a love that's true, Al -- ways __
	When the things you've planned
	Need a help -- ing hand,
	I will un -- der -- stand, Al -- ways, Al -- ways.

%% part "B"
	Days may not be fair, Al -- ways __
	That's when I'll be there, Al -- ways. __
	Not for just and hour, Not for just a day,
	Not for just a year, But Al -- ways. __

%% part "Volta"
	Al -- ways. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Among My Souvenirs / Horatio Nicholls, Edgar Leslie"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Among My Souvenirs" }
			\fill-line {
				"Lyrics by Edgar Leslie"
				"Music by Horatio Nicholls"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\repeat volta 2 {

		\myMark "A"
		\startPart
		ees2 c:9- | f1:m7 | bes2.:7 bes4:5+9 | ees1~ | \myEndLine
		ees2 ees4/g ges:dim7 | f1:m7 | bes:7 | ees~ | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		ees2 c:9- | f1:m7 | bes2.:7 bes4:5+9 | ees1~ | \myEndLine
		ees2 ees4/g ges:dim7 | f1:m7 | bes:9 | ees | \myEndLine
		\endPart

		\myMark "B"
		ees:7 | aes:6 | f2:m7 bes4:7 bes:5+9 | ees1~ | \myEndLine
		ees | bes:7~ | bes2:7 d:dim7 | g:7 c:m7 | f:9 bes:5+7 | \myEndLine
		\startPart
		\endPart
	%% Dm7b5

		\myMark "A"
		\startPart
		ees c:9- | f1:m7 | bes2.:7 bes4:5+9 | ees1~ | \myEndLine
		ees2 ees4/g ges:dim7 | f1:m7 | bes:9 |
	} \alternative {
		{
			ees2 c:m7 | f:m bes:7 | \myEndLineVoltaNotLast
		}
		{
			ees2 aes:m6 | ees1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 88
	\time 2/2
	\key ees \major

	\repeat volta 2 {

	%% part "A"
		r4 g' g bes | bes aes aes2~ | aes4 aes aes c | c bes bes2~ |
		bes4 bes bes ees | ees d d c | c bes bes aes | g1~ |

	%% part "A"
		g4 g g bes | bes aes aes2~ | aes4 aes aes c | c bes bes2~ |
		bes4 bes bes ees | ees d d c | c bes bes aes | g1~ |

	%% part "B"
		g4 g aes bes | c f f2~ | f4 ees d c | ees g, bes2~ |
		bes4 ees, f g | aes d d2~ | d4 c bes aes | g2 ees | g fis |

	%% part "A"
		r4 g g bes | bes aes aes2~ | aes4 aes aes c | c bes bes2~ |
		bes4 bes bes ees | ees d d c | c d c bes |
	} \alternative {
		{
			ees1~ | ees4 r r2 |
		}
		{
			ees1~ | ees4 r r2 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	There's no -- thing left for me; __ of days that used to be __ I live in
	mem -- o -- ry A -- mong My Sou -- ve -- nirs. __ Some let -- ters tied to blue, __
	a pho -- to -- graph or two, __ I see a rose from you A -- mong My Sou -- ve --
	nirs. __ A few more to -- kens rest __ with -- in my trea -- sure chest, __ and tho' they
	do their best __ to give me con -- so -- la -- tion. I count them all a -- part, __
	And as the tear drops start, __ I find a bro -- ken heart A -- mong My Sou -- ve -- nirs.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Angel Eyes / Matt Dennis, Earl Brent"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Angel Eyes" }
			\fill-line {
				"Lyrics by Earl Brent"
				"Music by Matt Dennis"
			}
			\fill-line {
				"Slow Blues"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		c2:m7 aes:7/c | c:m6 aes:9/c | c:m9 a:m7.5- | ees4:13 aes:maj7 g:7.5- d:m11 | \myEndLine
		c2:m9 aes:7/c | c:m6 aes:9/c | d:7.9- aes4:9 g:7.9- |
	} \alternative {
		{
			c2:m7 aes4:9 g:7.9- | \myEndLineVoltaNotLast
		}
		{
			c1:m | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	bes2:m9 ees:7.9- | aes:maj7.9 f:7.9- | bes:m9 ees:7.9- | aes2.:maj7.9 des4:maj7.9 | \myEndLine
	a2:m9 d:7.9- | g2.:maj7 c4:maj7.9 | cis2:m7 fis:7.5+ | d:m7 g:7.5+ | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c2:m9 aes:7/c | c:m6 aes:9/c | c:m9 a:m7.5- | d:m7 g4:7.5- g:7 | \myEndLine
	c2:m9 aes:7/c | c:m6 aes:9/c | d:7.9- aes4:9 g:7.5+ | c2:m c:m/bes | aes:9 g:7.5+ | c1:m7+ | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 88
	\time 4/4
	\key c \minor

%% part "A"
	\repeat volta 2 {
		r8. c16 g'8 ges8~ ges4. f8 | ees4 \tuplet 3/2 { ees8 c ees~ } ees2 |
		r8. c16 ees8 g d'8. d16 c8 g~ | g1 |
		r8. c,16 g'8 ges8~ ges4. f8 | ees8. ees16 c8 ees8~ ees4. c8 |
		ees8. c16 ees8. c16 ees4 ees8 c~ |
	} \alternative {
		{
			c2 r |
		}
		{
			c2. c'4 |
		}
	}

%% part "B"
	c8 c4.~ c8 c bes ees,~ | ees ees4.~ ees2 | c'8 c4 c16 bes c4 bes8 ees,~ | ees2. c'4 |
	b2~ b8 a4 b16 a | d,8 d4.~ d4 r8 e | fis8. fis16 fis8 fis~ fis4 fis8 g~ | g1 |

%% part "A"
	r8. c,16 g'8 ges8~ ges4. f8 | ees4 \tuplet 3/2 { ees8 c ees~ } ees2 |
	r8. c16 ees8 g d'8. d16 c8 g~ | g1 |
	r8. c,16 g'8 ges8~ ges4. f8 | ees8. ees16 c8 ees8~ ees4. c8 |
	ees8. c16 ees8. c16 ees4 ees8 c~ | c1 |
	ees8. c16 ees8. c16 bes'8. g16 f8 g~ | g1 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Try to think __
	that love's not a -- round __
	still it's un -- com -- fort -- 'bly near. __
	My old heart __
	ain't gain -- in' no ground __
	be -- cause my An -- gel Eyes ain't here. __
	_

%% part "B"
	So drink up __ all you peo -- ple, __
	or -- der an -- y -- thing you see. __
	Have fun, __ you hap -- py peo -- ple __
	the drink and the laugh's __ on me. __

%% part "A"
	Par -- don me, __
	but I got -- ta run, __
	the fact's un -- com -- mon -- ly clear. __
	Got -- ta find __ who's now "\"Num" -- ber "One\""__
	and why my An -- gel Eyes ain't here. __
	'Scuse me while I di -- s -- ap -- pear. __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	An -- gel Eyes __
	that old dev -- il sent, __
	they glow un -- bear -- a -- bly bright. __
	Need I say __ that my love's mis -- spent, __
	mis -- spent with An -- gel Eyes to -- night. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1946 (Renewed 1973) Dorsey Brothers Music" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "As Time Goes By / Herman Hupfeld"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "As Time Goes By" }
			\fill-line {
				""
				"Lyrics and Music by Herman Hupfeld"
			}
			\fill-line {
				"Ballad"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f2:m7 bes:7 | bes:m6 bes:7 | ees:6 f:m7 | fis:dim7 g:m7 | \myEndLine
		f1:7 | f2:m7 bes:7 |
	} \alternative {
		{
			ees1:maj7 | f2:m7 bes:7 | \myEndLineVoltaNotLast
		}
		{
			ees1:6 | bes2:m7 ees:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	aes1:maj7 | c:7 | f:m | a:dim | \myEndLine
	c2:m aes:7 | f1:7 | bes2:7 bes:dim | bes1:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f2:m7 bes:7 | bes:m6 bes:7 | ees:6 f:m7 | fis:dim7 g:m7 | \myEndLine
	f1:7 | g2:m7 c:7 | f:m7 bes:7 | ees4:6 des:7 ees:6 \OPC bes:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 76
	\time 4/4
	\key ees \major

	\partial 8 g'8 |

%% part "A"
	\repeat volta 2 {
		aes g f ees f4. g8 | bes aes g f aes4. bes8 | ees d c bes c2 | r2 r4 d |
		f8 ees d c d4 ees | bes bes ees, f |
	} \alternative {
		{
			g1~ | g2 r4 r8 g |
		}
		{
			ees1~ | ees2 r |
		}
	}

%% part "B"
	ees8 f ees c'~ c4 c | c8 des c b c2 | f,8 g f c'~ c4 c | c8 des c b c2 |
	g8 aes g ees'~ ees4 ees | ees8 d ees d f4 d | c c g g | bes2. r8 g |

%% part "A"
	aes g f ees f f4 g8 | bes aes g f aes aes4 bes8 | ees d c bes c2 | r r4 d |
	f8 ees d c d4 ees | bes bes2 g4 | bes2 bes | ees2. r8 g, |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% This is taken from the inetnet and adjusted for this tune
\lyricmode {

%% part "A"
	You must re -- mem -- ber this
	A kiss is still a kiss
	A sigh is still a sigh
	The fun -- da -- men -- tal things app -- ly
	As Time Goes By __

%% part "A"
	And _

%% part "B"
	Moon -- light and love __ songs- nev -- er out of date
	Hearts full of pas -- __ sion- jea -- lou -- sy and hate
	Wo -- men needs man- __ and man must have his mate
	That no one can de -- ny

%% part "A"
	It's still the same old sto -- ry
	A fight for love and glo -- ry
	A case of do or die
	The world will al -- ways wel -- come lov -- ers
	As Time Goes By
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	And when two lov -- ers woo
	They still say: "\"I" love "you\""
	On that you can re -- ly
	No mat -- ter what the fu -- ture brings
	As Time Goes _ _ By __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Au Privave / Charlie Parker"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Au Privave" }
			\fill-line {
				""
				"Music by Charlie Parker"
			}
			\fill-line {
				"Upbeat Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f1:7 | g2:m aes:dim | f1:7 | c2:m f:7 | \myEndLine
		bes1*2:7 | f1:7 | a2:m d:7 | \myEndLine
		g1:m | c:7 | f2:7 d:7 |
	} \alternative {
		{
			g2:m c:7 | \myEndLineVoltaNotLast
		}
		{
			g2:7 c:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "A"
	\startPart
	f1*2:7 | c1:m | c2:m b:7 | \myEndLine
	bes1*2:7 | f1 | f2 d:7 | \myEndLine
	g1:m | c:7 | f:7 | g2:m c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1:7 | bes:7 | f:7 | f2:7 f:7.5+ | \myEndLine
	bes1*2:7 | f1:7 | a2:m d:7 | \myEndLine
	g1:m | c:7 | f:7 | g2:m c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1:7 | bes:7 | f:7 | c2:m f:7 | \myEndLine
	bes1*2:7 | f1:7 | a2:m d:7 | \myEndLine
	g1:m | c:7 | f:7 | g2:m c:7 | \myEndLine
	\endPart

%% one bar for the ending...
	f1:7 | \myEndLine

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Prestissimo" 4 = 220
	\time 4/4
	\key f \major

%% part "A"
	\repeat volta 2 {
		f8 e f c r4 a'8 aes | a c, r e~ e g f e | g f a bes a f g ees | r d' r4 r8 des~ des bes |
		b4. f'8 r b, bes4~ | bes2 aes8 f g f | c'4 r8 a bes4 r8 g | c4 c~ c8 a bes c |
		a g f e f4 r8 c' | bes4 r8 f'~ f c e f | r4 r8 c~ c4. a8 |
	} \alternative {
		{
			bes a f d a' a~ a4
		}
		{
			bes8 a f d a' g~ g4
		}
	}

%% part "A"
	f4 r r8 des16 c b8 c | e g f g a bes c a | bes c16 bes a8 f g ees~ ees4 | r2 r4 f16 g bes d |
	f8 r d g, r4 f16 g bes d | f4 des8 g, r2 | r8 e \tuplet 3/2 { f8 a c } e ees d des | c bes \tuplet 3/2 { a16 bes a } g8 ges ees c cis |
	f a, \tuplet 3/2 { bes d f } a f d bes | g'4 c8 aes~ aes4 c8 a~ | a4 c,8 d~ d4 r | r2 r4 f'8 e |

%% part "A"
	f r c bes c4 a8 f | bes c d c r b, c bes' | aes a c a bes c16 bes a8 g | f e ees g d c f e |
	d f, aes b e4 b8 g'~ | g4 r8 f~ f4 e8 c | d a~ a2 r4 | r2 r4 g'16 a bes d |
	f16 d ees e c cis d c bes a g f e g bes d | c a \tuplet 3/2 { bes c bes } a f d bes g' aes e c cis d b g | %% cont on next line
	c4 r r8 bes a16 c e g | f4 r8 c e4~ e16 g bes d |

%% part "A"
	c4 r8 bes a f4 b8~ | b bes \tuplet 3/2 { aes16 bes aes } f8 g f4 ees8~ | ees c~ c4 r2 | r4 r8 g''8~ g4 f8 ees |
	d c bes c16 bes aes8 f d4 | r r8 \mark \markup { \italic { Lay Back } } g~ g f des b | c4 r r r8 e'16 ees | d8 des c bes \tuplet 3/2 { a16 bes a } g8 ges g |
	a g r4 r8 a bes c | \tuplet 3/2 { des ees des } c b bes g c bes | a f des b c4 r4 | r4 r8 a'~ a4~ a8 c16 a |

%% part "End"
	g8 f g2. |
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1956, Atlantic Music Corp." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Autumn In New York / Vernon Duke"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Autumn In New York" }
			\fill-line {
				""
				"Lyrics and Music by Vernon Duke"
			}
			\fill-line {
				"Brightly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	g2:m7 a:m7 | bes:6 c:7 | f:maj7 g:m7 | a:m7 d:7.9- | \myEndLine
	g:m7 a:m7 | bes:6 c:7 | a1:m7.5- | d:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	g:m7 | bes2:m7 ees:7 | aes1.:maj7 d2:m7.5- | \myEndLine
	c1:m7 | d2:m7 g:7.9- | c1:maj7 | c2.:7 c4:7.5+ | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2:m7 a:m7 | bes:6 c:7 | f:maj7 g:m7 | a:m7 d4:7.9- des:7 | \myEndLine
	c2:m7 d:m7 | ees:m6 f:7 | bes:m6 aes:m7 | ges1:7 | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	f2:m7 c:7 | f:m aes:7 | des:maj7 aes:7 | des2.:maj7 aes4:7 | \myEndLine
	g2:m7 a:m7 | bes:m6 c:7.9- | f1*2:m | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 76
	\time 4/4
	\key f \major

%% part "A"
	a'8 g f d c2 | r8 d f bes d d4 c8 | d2 a | r1 |
	a8 g f d c2 | r8 d f bes d d4 c8 | d2 a | r1 |

%% part "B"
	c8 c4 a8 a4. f8 | aes8 aes4 f8 ees4. des8 | ees b4 c8 ees2~ | ees f |
	g8 d4 ees8 g2~ | g b | g1~ | g2. gis4 |

%% part "A"
	a8 g! f d c2 | r8 d f bes d d4 c8 | d2 a | r1 |
	d8 c bes g f2~ | f8 ges bes c des ees4 c8 | des1~ | des2. r4 |

%% part "C"
	c8 aes4 c8 e4 e | c2. bes4 | aes8 f4 aes8 c4 c | aes2. aes4 |
	a!8 g f d c2~ | c8 bes des f aes bes4 g8 | f1 | r1 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% lyrics are taken from the fake book and adjusted for the real one
\lyricmode {

%% part "A"
	Au -- tumn In New York,
	why does it seem so in -- vit -- ing?
	Au -- tumn In New York,
	it spells the thrill of first night -- ing.

%% part "B"
	Glit -- ter -- ing crowds and shim -- mer -- ing clouds
	in can -- yons of steel, __
	they're mak -- ing me feel __
	I'm home. __

%% part "A"
	It's Au -- tumn In New York,
	that brings the pro -- mise of new love;
	Au -- tumn In New York __
	is of -- ten min -- gled with pain. __

%% part "C"
	Dream -- ers with emp -- ty hands
	may sigh for ex -- ot -- ic lands;
	It's Au -- tumn In New York, __
	it's good to live it a -- gain.
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	Au -- tumn In New York,
	the gleam -- ing roof -- tops at sun -- down.
	Au -- tumn In New York,
	it lifts you up when you're run -- down.

%% part "B"
	Jad -- ed rou -- es and gay di -- vor -- cees
	who lunch at the Ritz __
	will tell you that "\"it's" __
	di -- "vine!\"" __

%% part "A"
	This Au -- tumn In New York,
	trans -- forms the slums in -- to May -- fair;
	Au -- tumn In New York, __
	you'll need no cas -- tles in Spain. __

%% part "C"
	Lov -- ers that bless the dark
	on bench -- es in Cen -- tral Park
	greet Au -- tumn In New York, __
	it's good to live it a -- gain.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1934 by Kay Duke Music." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts











\bookpart {

% this causes the variables to be defined...
















% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Autumn Leaves / Joseph Kosma, Jacques Prevert, Johnny Mercer"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Autumn Leaves" }
			\fill-line { \large \smaller \bold \larger "Les Feuilles Mortes" }
			\fill-line {
				"Lyrics by Jacques Prevert, Johnny Mercer"
				"Music by Joseph Kosma"
			}
			\fill-line {
				"Med. Jazz"
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
	\with {
		\remove "Bar_engraver"
	}
	






\chordmode {
	\startChords
	\startSong

	\partial 2. s2. |

	\myMark "A"
	\startPart
	a1:m7 | d:7 | g:maj7 | c:maj7 | \myEndLine
	fis:m7.5- | b:7 | e1*2:m | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	a1:m7 | d:7 | g:maj7 | c:maj7 | \myEndLine
	fis:m7.5- | b:7 | e2:m a:m | e1:m | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	fis:m7.5- | b:7 | e1*2:m | \myEndLine
	a1:m7 | d:7 | g:maj7 | e:7.9- | \myEndLine
	fis:m7.5- | b:7.9- | e2:m e:m/d | cis:m7.5- c:maj7 | \myEndLine
	fis1:m7.5- | b:7.9- | e2:m a:m | e1:m | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 







{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key e \minor

	\partial 2. e4 fis g |

%% part "A"
	c1~ | c4 d, e fis | b2 b~ | b4 c, d e |
	a1~ | a4 b, cis dis | g1 | r4 e fis g |
	c1~ | c4 d, e fis | b2 b~ | b4 c, d e |
	a1~ | a4 fis a g | e1~ | e4 r dis e |

%% part "B"
	fis b, fis'2~ | fis4 fis e fis | g1~ | g4 g fis g |
	a1~ | a4 d, d'4. c8 | b1~ | b4 r ais b |
	c c a a | fis2. c'4 | b2 b~ | b e, |
	a2. g4 | fis2 g4 b, | e1~ | e4 r r2 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	








\lyricmode {

%% part "A"
	The fall -- ing leaves __ drift by the win -- dow, __
	The Au -- tumn Leaves, __ of red and gold.

%% part "A"
	I see your lips, __ the sum -- mer kiss -- es,
	The sun -- burned hands __ I used to hold.

%% part "B"
	Since you went a -- way __ the days grow long, __
	And soon I'll hear __ old win -- ter's song. __
	But I miss you most of all my dar -- ling, __
	When Au -- tumn Leaves start to fall. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1947, 1950, 1987 Enoch Et Cie. Renewed 1975, 1978 Enoch Et Cie" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Bessies's Blues / John Coltrane"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Bessies's Blues" }
			\fill-line {
				""
				"Music by John Coltrane"
			}
			\fill-line {
				"Blues"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	ees1:7 | aes:7 | ees1*2:7 | \myEndLine
	aes:7 | ees:7 | \myEndLine
	bes1:7 | aes:7 | ees:7 | bes:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Presto" 4 = 200
	\time 4/4
	\key c \major

%% part "A"
	g'4 ees8 des~ des2 | c'4 aes8 ges~ ges4. ees8 | g ees g4 g8 ees!4 g8~ | g ees d des~ des2 |
	r8 c'4 bes8 c aes r4 | c4. aes8 r ges4 ees8 | g ees g4 g8 g4 g8~ | g ees d des r g4 ges8 |
	f4 d bes d8 f | ees c aes4 c8 ees!4. | r8 f ees c r2 | r f8 g aes bes |
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Bewitched / Richard Rodgers, Lorenz Hart"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Bewitched" }
			\fill-line {
				"Lyrics by Lorenz Hart"
				"Music by Richard Rodgers"
			}
			\fill-line {
				"Moderately Slow"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4

	\repeat volta 2 {

		\myMark "A"
		\startPart
		c2 cis:dim7 | d:m7 dis:dim7 | c e:7 | f:maj7 fis:dim7 | \myEndLine
		c d:7 | g:7 a:7 | d1:m7 | g:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		c2 cis:dim7 | d:m dis:dim7 | c e:7 | f:maj7 fis:dim7 | \myEndLine
		c d:7 | g:7 c:7 | f1:maj7 | a:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		d1*2:m | a:m | \myEndLine
		d1:m | g:7 | e2:m7 a:7.9+ | d:m7 g:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		c2 cis:dim7 | d:m dis:dim7 | c e:7 | f:maj7 fis:dim7 | \myEndLine
		c d:7 | d:m g:7 |
	} \alternative {
		{
			c a:m | d:m7 g:7 | \myEndLineVoltaNotLast
		}
		{
			c f | c1 | \myEndLineVoltaLast \endPart
		}
	}
	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Moderato" 4 = 100
	\time 2/2
	\key c \major

	\partial 4 g'4 |

	\repeat volta 2 {

	%% part "A"
		e8 b' c2 e,4 | f8 b c2 f,4 | g8 b c4 gis8 b c4 | a8 b c2 b4 |
		c r b8 a g fis | g4 d2 e4 | f1~ | f2 r |

	%% part "A"
		e8 b' c2 e,4 | f8 b c2 f,4 | g8 b c4 gis8 b c4 | a8 b c2 b4 |
		c r b8 a g fis | g4 d2 e4 | a1~ | a2. r4 |

	%% part "B"
		b8 a f2 b8 a | f4 f2. | b8 a e2 b'8 a | e1 |
		c'8 b g2 c8 b | g4 g~ g8 a b c | d2 c f,2. g4 |

	%% part "A"
		e8 b' c2 e,4 | f8 b c2 f,4 | g8 b c4 gis8 b c4 | a8 b c2 b4 |
		c r b8 a g fis | g4 d'2 g,4 |
	} \alternative {
		{
			c1 | r2 r4 g4 |
		}
		{
			c1~ | c4 r4 r2 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	I'm wild a -- gain, be -- guiled a -- gain,
	a sim -- per -- ing, whim -- per -- ing child a -- gain,
	Be -- witched, both -- ered and be -- wild -- ered am I. __

%% part "A"
	Could -- n't sleep, and would -- n't sleep,
	when love came and told me I should -- n't sleep,
	Be -- witched, both -- ered and be -- wild -- ered am I. __

%% part "B"
	Lost my heart, but what of it?
	He is cold I a -- gree,
	he can laugh, but I love it, __
	al -- though the laugh's on me.

%% part "A"
	I'll sing to him, each spring to him,
	and long for the day when I'll cling to him,
	Be -- witched, both -- ered and be -- wild -- ered am I.

%% part "Volta"
	I'm I. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1941, by Chappell & Co., Inc. Copyright Renewed" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts









\bookpart {

% this causes the variables to be defined...














% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Blue Bossa / Kenny Dorham, Joan Cartwright"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Blue Bossa" }
			\fill-line {
				"Lyrics by Joan Cartwright"
				"Music by Kenny Dorham"
			}
			\fill-line {
				"Bossa Nova"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\repeat volta 3 {

		\myMark "A"
		\startPart
		c1*2:m7 | f:m7 | \myEndLine
		d1:m7.5- | g:7 | c1*2:m7 | \myEndLine
		ees1:m7 | aes:7 | des1*2:maj | \myEndLine
		d1:m7.5- | g:7 |
	} \alternative {
		{
			c1:m7 | d2:m7.5- g:7 | \myEndLineVoltaNotLast
		}
		{
			c1:m7 | c:m7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}





% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 150
	\time 4/4
	\key c \minor

	\partial 4 g'4 |

%% part "A"
	\repeat volta 3 {
		g'4. f8 ees d4 c8~ | c2. bes4 | aes2 g'4. f8~ | f1 |
		f4. ees8 d c4 bes8~ | bes2. aes4 | g2 f'4. ees8~ | ees1 |
		ees4. des8 c bes4 aes8~ | aes2. ges4 | ges f8 bes~ bes f aes4~ | aes1 |
		aes4 g8 bes~ bes2 | aes4 g8 bes~ bes4. aes8 |
	} \alternative
	{
		{
			g1~ | g2. g4 |
		}
		{
			g1~ | g2. r4 |
		}
	}
}




}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this version of the lyrics is from the internet adjusted for the real book.
\lyricmode {

%% part "A"
	A place in -- side my heart __
	Is where you live __
	Mem -- ories of our start __
	The love you give __

	Days when we're a -- lone __
	And you are in my arms __
	The_blue -- ness of the_true -- ness of our love __
}



\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	_ Nights of moon -- lit skies __
	A gen -- tle kiss __
	Some -- thing in your eyes __
	Fills me with bliss __

	Hold me in your arms __
	And then I will re -- call __
	The_blue -- ness of the_true -- ness of our love __

	The
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	






\lyricmode {

%% part "A"
	The thought of how we met __
	Still lin -- gers on __
	How can I for -- get __
	That mag -- ic dawn __

	All the warm de -- sire __
	The fi -- re in your touch __
	The_blue -- ness of the_true -- ness of our love __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Blue In Green / Miles Davis, Bill Evans"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Blue In Green" }
			\fill-line {
				""
				"Music by Miles Davis, Bill Evans"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	bes1:maj7.11+ | a:7.9+ | d2.:m9 des4:7 | c2:m9 f:7.9- |
	bes1:maj7 | a:7.5+.9+ | \myEndLine
	d:m6.9 | e:7.5+.9+ | a:m9 | d:m9 |
	bes:maj7.11+ | a2.:7.9+ a4:7.9- | d1:m6.9 | \myEndLine
	\endPart

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

%% part "A"
	e'2. d4 | c2. bes4 | a2. g4 | f d'2. |
	e,4. d8 cis d f a | c2. a4 |
	g2. f4 | c'2. gis4 | b2. a4 | f'2. cis4 |
	e2. d4 | c2. bes4 | a1\fermata |
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1959 JAZZ HORN MUSIC CORP. & WARNER-TAMERLANE PUBLISHING CORP." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Blue Monk / Thelonius Monk"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Blue Monk" }
			\fill-line {
				""
				"Music by Thelonius Monk"
			}
			\fill-line {
				"Blues"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	bes1 | ees:7 | bes2 f:7 | bes bes:7 | \myEndLine
	ees1 | e:dim7 | bes2 f:7 | bes1 | \myEndLine
	f1*2:7 | bes1. \OPC f2:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key bes \major

%% part "A"
	d8 ees e f~ f2 | g8 gis a bes~ bes2 | f8 g! f e! ees f, cis' d~ | d des4 c8~ c2 |
	g'8 gis a bes~ bes2 | bes8 b c des~ des2 | f,8 g f e! ees f, cis' d~ | d2. \tuplet 3/2 { f8 f f } |
	f f,4.~ f2 | f'8 g f e ees f, cis' d~ | d4 f8 g f e ees f, | cis' d4.~ d2 |
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Blue Room / Richard Rodgers, Lorenz Hart"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Blue Room" }
			\fill-line {
				"Lyrics by Lorenz Hart"
				"Music by Richard Rodgers"
			}
			\fill-line {
				"Jazz"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f2:6 d:m7 | g:m7 c:7 | f:maj7 d:m7 | g:m7 c:7 | \myEndLine
		f2.:maj7 f4:7 | bes2:maj7 g:m7 |
	} \alternative {
		{
			f:6 g:7 | g:m7 c:7 | \myEndLineVoltaNotLast
		}
		{
			f g4:m7 c:7 | f1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	c1*2:7 | f:maj7 | \myEndLine
	c1:7 | g2:m7 c:7 | d:m7 g:7 | g:m7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1:6 | c:7 | f2:maj7 d:m7 | g:m7 c:7 | \myEndLine
	f2.:maj7 f4:7 | bes2:maj7 g:m7 | f g4:m7 c:7 | f1 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

%% part "A"
	\repeat volta 2 {
		c4 f2 d4 | c g'2 d4 | c a'2 d,4 | c bes'2 d,4 |
		c c' c c | c8 d bes2 g4 |
	} \alternative {
		{
			f f f8 g a4 | c,2. r4 |
		}
		{
			f f f8 g a g | f2. r4 |
		}
	}

%% part "B"
	e f g a | bes c d e | r f f8 e d4 | c2 d |
	r4 e e8 d c4 | bes2 c | r4 a a8 g f4 | c2. r4 |

%% part "A"
	c f2 d4 | c g'2 d4 | c a'2 d,4 | c bes'2 d,4 |
	c c' c c | c8 f bes,2 a8 g | f4 f f8 g a g | f1 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this version of the lyrics is from the internet adjusted for the real book.
\lyricmode {

%% part "A"
	We'll have a blue room,
	A new room,
	For two room,
	Where ev' -- ry day's a ho -- li -- day
	Be -- cause you're mar -- ried to me.

	_ _ _ _ _ _ _

%% part "B"
	We will thrive on,
	Keep a -- live on,
	Just not -- hing but kis -- ses,
	With Mis -- ter and Mis -- sus
	On lit -- tle blue chairs.

%% part "A"
	You sew your trous -- seau,
	And Ro -- bin -- son Cru -- soe
	Is not so far from world -- ly cares
	As our blue room far a -- way up -- stairs.
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	Not like a ball -- room,
	A small room,
	A hall room,
	Where I can smoke my pipe a -- way
	With _ _ _ _ _ _ your wee head u -- pon my knee.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Blue Skies / Irving Berlin"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Blue Skies" }
			\fill-line {
				""
				"Lyrics and Music by Irving Berlin"
			}
			\fill-line {
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\myMark "A"
	\startPart
	a1:m | e1:5+/gis | c1/g | d2.:9/fis f4:m | \myEndLine
	c1/g | f2:9 g:5+ | c1 | c1 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	a1:m | e1:5+/gis | c1/g | d2.:9/fis f4:m | \myEndLine
	c1/g | f2:9 g:5+ | c1 | c1 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	c1 | f2:m c | f2:m c | f2:m c | \myEndLine
	c1 | f2:m c | f2:m c | g:7 c4 e:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	a1:m | e1:5+/gis | c1/g | d2.:9/fis f4:m | \myEndLine
	c1/g | f2:9 g:5+ | c1 | c1 | \myEndLine
	\endPart

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 88
	\time 4/4
	\key a \minor

%% part "A"
	a2 e' | r d8 c d4 | e1 | r2 d8 c d4 |
	e2 g, | r g8 a4. | c1~ | c |

%% part "A"
	a2 e' | r d8 c d4 | e1 | r2 d8 c d4 |
	e2 g, | r g8 a4. | c1~ | c |

%% part "B"
	c8 d e f g2 | aes8 g f4 g2 | f8 e d4 e2 | d8 c b4 c2 |
	c8 d e f g2 | aes8 g f4 g2 | f8 e d4 e2 | \tuplet 3/2 { d4 c b } c4 b |

%% part "A"
	a2 e' | r d8 c d4 | e1 | r2 d8 c d4 |
	e2 g, | r g4 a4 | c1~ | c |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Blue Skies smil -- ing at me, noth -- ing but blue skies do I see.

%% part "A"
	Blue -- birds sing -- ing a song, noth -- ing but blue -- birds all day long.

%% part "B"
	Nev -- er saw the sun shin -- ing so bright, nev -- er saw things go -- ing so right.
	Not -- ic -- ing the days hur -- ry -- ing by, when you're in love, my how they fly by.

%% part "A"
	Blue days all of them gone, noth -- ing but blue skies from now on.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Blue Trane / John Coltrane"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Blue Trane" }
			\fill-line {
				""
				"Music by John Coltrane"
			}
			\fill-line {
				"Fiercly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 8*5 s8 bes2:7 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		c1:m | f2:m7 bes:7 | c1:m | bes2:m7 ees:7 | \myEndLine
		f1:m | f2:m7 bes:7 | c1:m | a2:m7 d:7 | \myEndLine
		g1:m | f2:m7 bes:7 |
	} \alternative {
		{
			c1:m | f2:m7 bes:7 | \myEndLineVoltaNotLast
		}
		{
			c1:m7.5- | c1:m | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \minor

	\partial 8*5 g'8 bes d bes c~ |

%% part "A"
	\repeat volta 2 {
		c1~ | c4-^ r8 g bes d bes c~ | c1~ | c4-^ r8 c ees g ees f~ |
		f1~ | f4-^ r8 g, bes d bes c~ | c1~ | c4-^ r8 g c d c bes~ |
		bes1~ | bes4-^ r8 g bes d bes c~ |
	} \alternative {
		{
			c1~ | c4-^ r8 g bes d bes c~ |
		}
		{
			c1~ | c4-^_\markup { \italic { Fine } } r4 r2 |
		}
	}
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Blues For Alice / Charlie Parker"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Blues For Alice" }
			\fill-line {
				""
				"Music by Charlie Parker"
			}
			\fill-line {
				"Jazz"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f1:maj7 | e2:m7.5- a:7.9- | d:m7 g:7 | c:m7 f:7 | \myEndLine
	bes1:7 | bes2:m7 ees:7 | a:m7 d:7 | aes:m7 des:7 | \myEndLine
	g1:m7 | c:7 | f2 d:m7 | g:m7 c:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

%% part "A"
	f'4 c8 a e'4 c8 a | d e b c cis bes g gis | a4 f8 d g a f e | \tuplet 3/2 { ees g bes } d des r f, \tuplet 3/2 { f g f } |
	c'4 bes8 f aes bes, r g' | ees' des aes f c' f, g a~ | a4 e8 c d4 r8 des'~ | des4 ces8 ges bes4 r8 aes |
	\tuplet 3/2 { g4 f' f } f8 d bes g | a g c bes ees4 r8 c~ | c4 a8 f g4 r8 d'~ | d4 bes8 f a4 r |
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Bluesette / Jean 'Toots' Thielemans, Norman Gimbel"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Bluesette" }
			\fill-line {
				"Lyrics by Norman Gimbel"
				"Music by Jean 'Toots' Thielemans"
			}
			\fill-line {
				"Moderate Waltz"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		g2.*2 | fis2.:m7.5- | b:7.9- | e:m7 | a:7.9- | d:m7 | g:7 | \myEndLine
		c:maj7 | c:6 | c:m7 | f:9 | bes2.*2:maj7 | bes2.:m7 | ees:9 | \myEndLine
		aes:maj7 | aes | a:m7.5- | d:7.9- | b:m7 | bes:7 | a:m7 | d:7 | \myEndLine
	}
	\endPart

	\myMark "A"
	\startPart
	g2.*2 | fis2.:m7.5- | b:7 | e:m7 | a:7 | d:m7 | g:7 | \myEndLine
	c:maj7 | c:6 | c:m7 | f:7 | bes:maj7 | bes:6 | bes:m7 | ees:9 | \myEndLine
	aes2.*2:maj7 | a2.:m7.5- | d:7.9- | b:m7 | bes:7 | a:m7 | d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2.*2 | fis2.:m7.5- | b:7 | e:m7 | a:7 | d:m7 | g:7 | \myEndLine
	c:maj7 | c:6 | c:m7 | f:7 | bes:maj7 | bes:6 | bes:7 | ees:7 | \myEndLine
	aes2.*2:maj7 | a2.:m7.5- | d:7 | b:m7 | bes:7 | a:m7 | d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2.*2 | fis2.:m7.5- | b:7.9- | e:m7 | a:7.9- | d:m7 | g:7 | \myEndLine
	c:maj7 | c:6 | c:m7 | f:9 | bes2.*2:maj7 | bes2.:m7 | ees:9 | \myEndLine
	aes2.*2:maj7 | a2.:m7.5- | d:9 | b2.*2:m7 | e2.:7 | e2:7.5+ e4:7 | \myEndLine
	a2.*2:m7 | d:7 | g2. | d2:7.9+ d4:9 | b4:m7 a:m7 aes:maj7 | g2.:maj7 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 168
	\time 3/4
	\key g \major

%% part "A"
	\repeat volta 2 {
		d4 e fis | g a b | c2 e,4 | dis2. | b'2 d,!4 | cis2. | a'2 c,!4 | b2. |
		g'2 b,4 | c4. d8 ees f | g2 ees'4 | d2 c4 | f,2 d'4 | c2 bes4 | f2 des'4 | c2 bes4 |
		ees, f g | aes bes c | d2 c4 | b2 a4 | d,2.~ | d~ | d~ | d4 r r |
	}

%% part "A"
	g a b | d r r | c b a | g2 fis4 | e fis g | b2. | a4 g f | e2 d4 |
	g2 b,4 | c4. b8 c d | ees4. f8 g bes | a4 bes c | f,2 a,4 | bes4. c8 des ees | f2 des'4 | c2 bes4 |
	ees,8 ees f f g g | aes aes bes bes c c | d2 \tuplet 3/2 { c8 d c } | b2 a4 | d,2.~ | d~ | d | r2. |

%% part "A"
	r4 d'8 d d d | c4 b2 | r4 c8 c c c | b4 a2 | r4 b8 b b b | a4 g2 | r4 a8 a a a | g4 f2 |
	e4 f fis | g a b | c cis d | ees d c | f, g a | bes b c | cis d dis | e ees des |
	c r8 bes4. | aes4 r8 bes4 c8 | d4 r8 c4 b8 | aes4 r fis8 e | d4 d d | f d4. c8 | d2.~ | d2 r4 |

%% part "A"
	d e fis | g a b | c2 e,4 | dis2. | b'2 d,!4 | cis2. | a'2 c,!4 | b2. |
	g'2 b,4 | c4. d8 ees f! | g2 ees'4 | d2 c4 | f,!2 d'4 | c2 bes4 | f2 des'4 | c2 bes4 |
	ees, f g | aes bes c | d2 c4 | b2 a4 | e'2.~ | e~ | e2 d4 | c2 b4 |
	d2.~ | d~ | d2 c4 | b g4. e8 | g2.~ | g~ | g~ | g4 r r |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Poor lit -- tle, sad lit -- tle blue Blues -- ette,
	don't you cry, don't you fret.
	You can bet one luck -- y day you'll wak -- en and your blues will be for -- sak -- en.
	One luck -- y day love -- ly love will come your way. __

%% part "A"
	Get set, Blues -- ette, true love is com -- ing.
	Your trou -- bled heart soon will be hum -- ming.
	\markup \italic Hum __ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
	Doo -- ya, doo -- ya, doo -- ya, doo -- ya, doo -- ya, doo -- ya,
	Doo -- oo -- _ _ oo Blues -- ette. __

%% part "A"
	Pret -- ty lit -- tle Blues -- ette must -- n't be a mourn -- er.
	Have you heard the news yet?
	Love is 'round the cor -- ner.
	Love wrapped in rain -- bows and tied with pink rib -- bon
	to make your next spring -- time your gold wed -- ding ring time.
	So, dry your eyes. Don't -- cha pout, don't -- cha fret,
	good -- y good times are com -- ing, Blues -- ette. __

%% part "A"
	Long as there's love in your heart to share, dear Blues -- ette, don't des -- pair.
	Some blue boy is long -- ing, just like you,
	to find a some -- one to be true to.
	One luck -- y day love -- ly love will come your way. __
	That mag -- ic day __
	may just be to -- day. __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	Long as there's love in your heart to share, dear Blues -- ette, don't des -- pair
	Some blue boy is long -- ing, just like you to find a some -- one to be true to.
	Two lov -- ing arms he can nest -- le in and stay. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1963, 1964 by MUSIC CORPORATION OF AMERICA, INC., New York, NY" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts













\bookpart {

% this causes the variables to be defined...


















% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Body And Soul / John Green, Edward Heyman, Robert Sour, Frank Eyton"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Body And Soul" }
			\fill-line {
				"Lyrics by Edward Heyman, Robert Sour, Frank Eyton"
				"Music by John Green"
			}
			\fill-line {
				"Slowly, with expression"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		ees2:m7 bes:9 | ees:m7 aes:7 | des:maj7 ges:7 | f:m7 e:dim7 | \myEndLine
		ees:m7 ees:m7/des | c:m7.5- f:7 | bes:m7 ees4:m7 aes:7.5+ |
	} \alternative {
		{
			des2:6 f4:m7 bes:7.9- | \myEndLineVoltaNotLast
		}
		{
			des2:6 e4:m7 a:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	d2 e:m7 | d/fis g4:m7 c:7 | fis:m7 b:m7 e:m7 a:7 | d1 | \myEndLine
	d2:m7 g:9 | c:maj7 ees:dim7 | d:m7 g4:7 g:7.5+ | c:9 b:9 bes:9 e:9.11+ | \myEndLine
	\endPart

%%\myMark ""
	\startPart
	\mark \markup { \musicglyph #"scripts.coda" } des1 | \myEndLine
	\endPart

	\endSong
	\endChords
}









% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 80
	\time 4/4
	\key des \major

%% part "A"
	\repeat volta 2 {
		r8. ees16 f8. ees16 f4 ees | bes' bes2. | r8. aes16 bes8. aes16 bes4 aes | ees'4 des c bes |
		r4 des bes8 ges4 bes,8 | f'2 ees | r8. des16 ees8. f16 aes4 \tuplet 3/2 { aes8 bes fes^\markup {To Coda \musicglyph #"scripts.coda"} } |
	} \alternative {
		{
			des1 |
		}
		{
			des2. r4 |
		}
	}

%% part "B"
	\key d \major
	r8. d16 e8. fis16 a8 a4 a8 | d d4 fis,8 a a4 g8 | fis fis4 d8 e4 cis8 a~ | a2~ a8 r r4 |
	\key c \major
	r8. d16 e8. f16 a8 a4 g8 | e' e4 b8 d d4 a8 | c c4 a8 b b4 g8 | e4 ees d bes'^\markup {D.C. al Coda} |

%% part "Coda"
	\key des \major
	des,1 |
}








}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	My heart is sad and lone -- ly,
	for you I sigh, for you, dear, on -- ly.
	Why have -- n't you seen it?
	I'm all for you, Bod -- y And Soul! _

%% part "B"
	I can't be -- lieve it,
	it's hard to con -- ceive it
	that you'd turn a -- way ro -- mance. __
	Are you pre -- tend -- ing,
	it looks like the end -- ing
	un -- less I could have one more chance to prove, dear,
}







\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	I spend my days in long -- ing
	and won -- d'ring why it's me you're wrong -- ing,
	I tell you I mean it,
	I'm all for you, Bod -- y And _ Soul!
}






\new Lyrics="Lyrics" \lyricsto "Voice"
	






\lyricmode {

%% part "A"
	my life a wreck you're mak -- ing,
	you know I'm yours for just the tak -- ing;
	I'd glad -- ly sur -- ren -- der
	my -- self to you, Bod -- y And

%% part "B"
	_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
	_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

%% part "Coda"
	Soul!
}





	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1930 Warner Bros. Inc & Chappell & Co. Ltd." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "But Not For Me / George Gershwin, Ira Gershwin"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "But Not For Me" }
			\fill-line {
				"Lyrics by Ira Gershwin"
				"Music by George Gershwin"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 2. s2. |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		g1:7 | g2:m7 c:7 | f1:maj7 | d:m7 | \myEndLine
		g:7 | g2:m7 c:7 | f1:maj7 | c2:m7 f:7 | \myEndLine
		\endPart
	} \alternative {
		{

			\myMark "B"
			\startPart
			bes1:maj7 | bes2:m7 ees:7 | f1*2:maj7 | \myEndLine
			d1:m7 | g:7 | g:m7 | c:7 | \myEndLineVolta
			\endPart
		}
		{

			\myMark "C"
			\startPart
			bes1:maj7 | bes2:m7 ees:7 | f1:maj7 | d:m7 | \myEndLine
			g:m7 | c:7 | f1*2:maj7 | \myEndLineVolta
			\endPart
		}
	}

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Moderato" 4 = 116
	\time 4/4
	\key f \major

	\partial 2. g'4 a g |

	\repeat volta 2 {

	%% part "A"
		a2 g4 f~ | f g a g | a1 | r4 g a g |
		a2 g4 f~ | f g a g | a1 | r4 a bes c |
	} \alternative {
		{

		%% part "B"
			cis2 d4 f | r g, a bes | b!2 c4 f | r f, g a |
			a2 bes4 f' | r f d bes | g1 | r4 g a g |
		}
		{

		%% part "C"
			cis2 d4 f | r g, a bes | b!2 c4 g' | r f d bes |
			a1 | g | f~ | f2. r4 |
		}
	}
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	They're wri -- ting songs of love, __
	But not for me
	A luc -- ky stars a -- bove, __
	But not for me!

%% part "B"
	With love to lead the way,
	I've found more clouds of gray
	Than a -- ny Rus -- sian play
	Could gua -- ran -- tee

	I was a

%% part "C"
	can't dis -- miss
	the me -- mory of his kiss,
	I guess he's not for me __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	_ _ _ fool to fall, __
	And get that way
	Hi- -- Ho a -- las
	and al -- __ so lack a day

	Al -- though I
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Bye Bye Blackbird / Ray Henderson, Mort Dixon"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Bye Bye Blackbird" }
			\fill-line {
				"Lyrics by Mort Dixon"
				"Music by Ray Henderson"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		f1. d2:7 | g:m7 c:7.9 | f1 | \myEndLine
		f/a | aes:dim7 | g2:m7 c1.:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		g2:m ees/g | g:m6 ees/g | g1:m7 | c:7 | \myEndLine
		g:m7 | c:7 | f2:maj7 f1.:6 | \myEndLine
		\endPart

		\myMark "C"
		\startPart
		f1*2:7 | a1:m7.5- | d:7 | \myEndLine
		g1*2:m | g1:m7.5- | c:7 | \myEndLine
		\endPart

		\myMark "D"
		\startPart
		f1*2 | ees1:7 | d:7 | \myEndLine
		g1.:m7 c2:7 |
	} \alternative {
		{
			f d:m7 | g:m7 c:7 | \myEndLineVoltaNotLast
		}
		{
			f bes | bes:m6 f:6 | \myEndLineVoltaLast \endPart
		}
	}

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Moderato" 4 = 116
	\time 4/4
	\key f \major

	\repeat volta 2 {

	%% part "A"
		a'4 a a a | bes a a2 | a4 g g2 | g4 f f2 |
		f1 | g | f2 e2~ | e1 |

	%% part "B"
		bes'4 bes bes bes | c bes bes2 | bes4 a a2 | a4 g g2 |
		g1 | a | g2 f~ | f1 |

	%% part "C"
		f4 c' c c | c bes a g | g1 | fis |
		d4 bes' bes bes | bes a g f | f1 | e |

	%% part "D"
		a4 a a a | bes a a2 | a4 g g2 | g4 fis fis2 |
		g2 bes~ | bes e, |
	} \alternative {
		{
			f2 r | r1 |
		}
		{
			f1~ | f |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Pack up all my care and woe,
	here I go, Sing -- ing low,
	Bye Bye Black -- bird, __

%% part "B"
	Where some -- bod -- y waits for me,
	sug -- ar's sweet, so is she,
	Bye Bye Black -- bird. __

%% part "C"
	No one here can love or un -- der -- stand me,
	oh, what hard luck sto -- ries they all hand me.

%% part "D"
	Make my bed and light the light,
	I'll ar -- rive late to -- night,
	black -- bird __ bye bye.
	bye. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1926 (Renewed) Warner Bros. Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Can't Help Lovin' Dat Man / Jerome Kern, Oscar Hammerstein III"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Can't Help Lovin' Dat Man" }
			\fill-line {
				"Lyrics by Oscar Hammerstein III"
				"Music by Jerome Kern"
			}
			\fill-line {
				"Moderately and rather freely"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\myMark "A"
	\startPart
	c2:maj7 a:m7 | d:m7 g:7 | c:maj7 g4:m7 c:7.9- | f2:6 bes:9 | \myEndLine
	e:m7 a:m7 | aes2:7 d4:7.9- g:7.9- | c2:maj7 ees:dim7 | d:m7 g:7.5+ | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c:maj7 a:m7 | d:m7 g:7 | c:maj7 g4:m7 c:7.9- | f2:6 bes:9 | \myEndLine
	e:m7 a:m7 | aes:7 d4:7.9- g:7.9- | c2:maj7 d:m7 | g:m7 c:7.9- | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	f1:6 | fis:dim7 | c:maj7 | d:7 | \myEndLine
	e2:m7 ees:maj7 | d:m7 d:9 | d1:m7/g | g:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c2:maj7 a:m7 | d:m7 g:7 | c:maj7 g4:m7 c:7.9- | f2:6 bes:9 | \myEndLine
	e:m7 a:m7 | aes:7 d4:7.9- g:7.9- | c2:maj7 ees:9 aes:maj7 des:maj7 | c1:maj7 | \myEndLine
	\endPart

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante Moderato" 4 = 88
	\time 4/4
	\key c \major

%% part "A"
	g'8 g g c~ c4 c | c8 g g g~ g2 | e8 e e a~ a4 a | a8 d, d d~ d2 | g c, |
	aes8 c c ees~ ees4 d | c1 | R1 |

%% part "A"
	g'8 g g c~ c4 c | c8 g g g~ g2 | e8 e e a~ a4 a | a8 d, d d~ d2 | g c, |
	aes8 c c ees~ ees4 d | c1 | R1 |

%% part "B"
	d4 d d d8 ees~ | ees1 | e?4 e e e8 fis~ | fis1 | g4 g g g | a a a a | d2~ d8 c b a | g1 |

%% part "A"
	g8 g g c~ c4 c | c8 g g g~ g2 | e8 e e a~ a4 a | a8 d, d d~ d2 | g c |
	ees8 c d ees~ ees4 d | c1~ | c2. r4 | R1 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	Fish got to swim __ and birds got to fly __ I got to love __ one man 'til I die, __ Can't Help
	Lov -- in' Dat Man of mine. Tell me he's la -- zy tell me he's slow, __
	tell me I'm cra -- zy may -- be I know, __ Can't Help Lov -- in' Dat Man of mine.

	When he goes a -- way __ dat's a rain -- y day, __ and when he comes back dat day is fine, __ the sun will shine.
	He can come home as late as can be, __ home with -- out him __ ain't no home to me, __ Can't Help Lov -- in' Dat Man of mine. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1927 T.B. Hama Company, Copyright Renewed" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts










\bookpart {

% this causes the variables to be defined...















% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Caravan / Duke Ellington, Juan Tizol, Irving Mills"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Caravan" }
			\fill-line {
				"Lyrics by Irving Mills"
				"Music by Duke Ellington, Juan Tizol"
			}
			\fill-line {
				"Bright Latin and Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
%%\mark "Bright Latin"
	\startPart
	\repeat volta 2 {
		c1*4:7 | \myEndLine
		c1*4:7 | \myEndLine
		c1*4:7 | \myEndLine
		f1*4:m6 | \myEndLine
	}
%% so I would see the repeat marks
%%\endPart

	\myMark "B"
%%\mark "Swing"
	\startPart
	f1*4:9 | \myEndLine
	bes1*4:9 | \myEndLine
	ees1*4:7 | \myEndLine
	aes1*2:6 | c1*2:7 | \myEndLine
	\endPart

	\myMark "A"
%%\mark "Bright Latin"
	\startPart
	c1*4:7 | \myEndLine
	c1*4:7 | \myEndLine
	c1*4:7 | \myEndLine
	f1*4:m6 | \myEndLine
	\endPart

	\endSong
	\endChords
}






% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Prestissimo" 4 = 220
	\time 2/2
	\key f \minor

%% part "A"
	\repeat volta 2 {
		c'1~ | c~ | c4 des c g | bes c e g, |
		bes1~ | bes~ | bes4 c des c | des c b g |
		bes!1~ | bes~ | bes4 c b bes | a aes g ges |
		f1~ | f~ | f | r |
	}

%% part "B"
	f'1 | d2 c4. g8~ | g1~ | g4. f8 e4-. f-. |
	c'1 | g2 f4. c8~ | c1 | r2 bes'8 c des d |
	ees1 | c2 bes4. f8~ | f1~ | f2 g4-. ees-. |
	c'4. aes8~ aes2~ | aes bes4-. aes-. | g2 g4. g8~ | g2 r |

%% part "A"
	c1~ | c~ | c4 des c g | bes c e g, |
	bes1~ | bes~ | bes4 c des c | des c b g |
	bes!1~ | bes~ | bes4 c b bes | a aes g ges |
	f1~ | f~ | f | r |
}





}
\new Lyrics="Lyrics" \lyricsto "Voice"
	






% these lyrics are from the Ella Firtgerald performance and adjusted for this tune...
\lyricmode {

%% part "A"
	Night __ and stars that shine ab -- ove so bright __
	The ma -- gic of their fa -- ding light __
	That shines u -- pon our Ca -- ra -- van __

%% part "B"
	You are so exciting, __ _ _ _
	This is so inviting __ _ _ _ _
	Res -- ting in my_arms __
	As I thrill to the magic charms __ _ _

%% part "A"
	Of_you be -- side me here, be -- neath the blue __
	My dream of love is com -- ing true __
	With -- in our de -- sert Ca -- ra -- van __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	







\lyricmode {

%% part "A"
	Sleep __ u -- pon my shou -- lder as we creep __
	Ac -- ross the sand so I may keep __
	This mem -- 'ry of our Ca -- ra -- van __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1937 (renewed 1965) Mills Music c/o EMI Music Publishing" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Chega De Saudade / Antonio Carlos Jobim, Vinicius DeMoraes, John Hendricks, Jessie Cavanaugh"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Chega De Saudade" }
			\fill-line { \large \smaller \bold \larger "No More Blues" }
			\fill-line {
				"Lyrics by Vinicius DeMoraes, John Hendricks, Jessie Cavanaugh"
				"Music by Antonio Carlos Jobim"
			}
			\fill-line {
				"Bossa Nova"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	d1:m7 | d2.:m7 d4:m7/c | b1:m7.5- | e:7.9- | \myEndLine
	e:m7.5- | a:7.9- | d:m | e2:m7.5- a:7.9- | \myEndLine
	d2:m d:m/c | b:m7.5- e:7 | a1*2:m | \myEndLine
	bes:maj7 | e1:m7.5- | a:7.9- | \myEndLine
	\endPart

	\myMark "A'"
	\startPart
	d1:m7 | d2.:m7 d4:m7/c | b1:m7.5- | e:7.9- | \myEndLine
	e:m7.5- | a:7.9- | d:m | d:7 | \myEndLine
	g2:m g:m/f | a:7/e a:7 | d1:m | d:m/c | \myEndLine
	b2:m7.5- e:7.9- | a1:7.9- | d:m | e2:m7 a:7.5+ | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	d1:maj7 | dis:dim7 | e1*2:m7 | \myEndLine
	a:7 | d1:dim7 | d:maj7 | \myEndLine
	fis:m7 | f:dim7 | e1*2:m7 | \myEndLine
	e:7 | e1:m7.5- | a:7.9- | \myEndLine
	\endPart

	\myMark "A''"
	\startPart
	d2:maj7 d:m7/cis | b1:m7 | e1*2:7 | \myEndLine
	fis1 | fis:7 | b2:m7 bes:m7 | a2:m7 d:7.9- | \myEndLine
	g1:maj7 | c:9 | fis:m7 | b2:7 b:7.5+ | \myEndLine
	e1:7 | e2..:m7/a a8:7/g | fis1:m7 | b:7.9- | \myEndLine
	e:7 | e2:m7/a e8:m7/a a4.:7 | d1*2 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Presto" 4 = 200
	\time 2/2
	\key f \major

%% part "A"
	f'2 a, | d2. f4 | e2 b! | d2. e4 |
	f2 bes, | cis f4 e~ | e8 d4 f8~ f e d4 | a1 |
	f'2 a, | b!2. d4 | c2 e~ | e4 e d c |
	c2 bes~ | bes4 f' e d | d cis e8 cis4 bes8~ | bes2. r4 |

%% part "A'"
	f'2 a, | d2. f4 | e2 b! | d2. e4 |
	f2 bes, | cis f4 e~ | e8 d4 cis8~ cis d ees4~ | ees d fis a |
	g2 bes | cis,~ cis8 a'4 g8~ | g f4 a8~ a g f4 | e4. d8 cis4 d |
	f8 d4 b!8~ b d4 f8~ | f cis4 bes8~ bes f'4 d8~ | d1 | r |

	\key d \major

%% part "B"
	fis2. a4 | g2. dis4 | fis e dis8 e4 b'8~ | b4 g e b |
	d4. cis8~ cis2~ | cis4 e cis8 a4 b8~ | b1 | a2. cis4 |
	e d cis8 d4 f8~ | f4 gis cis8 b4 a8~ | a g4 b,8~ b2~ | b4 b cis8 d4 fis8~ |
	fis4 e d8 b4 gis8~ | gis4 b cis8 e4 d8~ | d2~ d4. cis8~ | cis1 |

%% part "A''"
	fis2 a, | b2. fis'4 | e2 b | d2. e4 |
	fis2 ais, | cis2. fis4 | e8 d4 cis8~ cis d4 e8~ | e d4 fis8~ fis4 b |
	a8 fis4 d8~ d4. b8 | a' f!4 d8~ d4 bes | a'8 e4 cis8~ cis4 a | gis'4 b g! b |
	fis8 d4 b8 d4 fis~ | fis d b8 d4 fis8~ | fis2~ fis8 fis g a | b4 a g fis |
	d8 b4 d8 fis4 d~ | d b d8 fis4 d8~ | d1~ | d2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	No More Blues,
	I'm goin' back home.
	No, No More Blues,
	I prom -- ise no __ more to roam.
	Home is where the heart is, __
	the fun -- ny part is __
	my heart's been right there all a -- long. __

%% part "A'"
	No more tears and no more sighs,
	and no more fears, I'll say __ no more __ good -- byes. __
	If tra -- vel beck -- ons me __
	I swear __ I'm gon -- __ na re -- fuse,
	I'm gon -- na set -- tle down __
	and there'll __ be No __ More Blues. __

%% part "B"
	Ev -- 'ry day while I am far a -- way __
	my thoughts turn home -- ward, __
	for -- ev -- er home -- __ ward.
	I trav -- elled 'round the world __
	in search of hap -- pi -- ness, __
	but all my hap -- pi -- ness I found __
	was in my home -- __ town. __

%% part "A''"
	No More Blues, I'm goin' back home.
	No, no more dues, I'm through with all __
	my wan -- __ drin', now __ I'll set -- tle down __ and live my life __
	and build a home __ and find a wife,
	when we set -- tle down there'll __ be No More Blues __
	noth -- in' but hap -- pi -- ness.
	When we set -- tle down there'll __ be No More Blues. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1962 and 1967 Editora Musical Arapua, Sao Paulo, Brazil" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Cocktails For Two / Arthur Johnston and Sam Coslow"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Cocktails For Two" }
			\fill-line {
				""
				"Lyrics and Music by Arthur Johnston and Sam Coslow"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 2.. s2..

	\myMark "A"
	\startPart
	\repeat volta 2 {
		c2 g:5+7 | c1 | g2:7 g:dim7 | g1:7 | \myEndLine
		d2:m7 g:7 | d:m7 g:5+7 |
	} \alternative {
		{
			c cis:dim7 | g1:7 | \myEndLineVoltaNotLast
		}
		{
			g:m7 | \myEndLineVoltaLast
		}
	}
	\myEndLine
	\endPart

	\myMark "B"
	\startPart
	c2:7 c:5+7 | f:maj7 f:6 | bes1:9 | a:m7 | \myEndLine
	a:dim7 | d2:m7 g:7 | d:m7 g:7 | c cis:dim | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g1:7 | c2 g:5+7 | c1 | g2:7 g:dim7 | \myEndLine
	g1:7 | d2:m7 g:7 | d:m7 g:7 | c4:6 f:m c2 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key c \major

	\partial 2.. c8 e g gis b a8. e16 |

%% part "A"
	\repeat volta 2 {
		a1~ | a8 c, e g gis b a8. e16 | g1~
		g8 d f a c e d8. c16 | a4. c8 b4. f8 | a4. c8 b4. g8 |
	} \alternative {
		{
			b g g g~ g2 | r8 c, e g gis b a8. e16 |
		}
		{
			d'8 g, g g~ g2 |
		}
	}

%% part "B"
	r4 e'4 \tuplet 3/2 { e4 e e } |
	e2 d | r4 d8 cis e d c b | d4. c8 c2 |
	r4 c8 b d c b a | c b~ b2 b8 a | a4. g8 g4. fis8 | a4. g8 g2 |
	r8 c, e g gis b a8. e16 | a1~ | a8 c, e g gis b a8. e16 | g1~ |
	g8 d f a c e d8. c16 | a4. c8 b4. f8 | a4. c8 b4. g8 | e' c c c~ c2 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	In some se -- clud -- ed ren -- dez -- vous __ that o -- ver looks the av -- e --neu __
	with some one shar -- ing a de -- light -- ful chat, of this and that and
%% Volta
	Cock -- tails For Two. __
	As we en -- joy a cig -- a --

%% part "B"
	Cock -- tails For Two. __
	My head may go reel -- ing, but my heart will be o -- be -- di --ent
	with in -- tox -- i -- cat -- ing kiss -- es for the prin -- ci -- pal in -- gre -- di --ent.

%% part "A"
	Most an -- y af -- ter -- nnon at five __ we'll be so gald we're both a -- live, __
	then may -- be for -- tune will com -- plete her plan that all be -- gan with Cock -- tails For Two. __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	_ _ _ _ _ _ _
	rette, __ to some ex -- qui -- site chan -- son -- ette __
	two hand are sure to sly -- ly meet be -- neath a ser -- vi -- nette, with
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1934 (Renewed 1961) Famous Music Corporation" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Come Rain Or Come Shine / Harold Arlen, Johnny Mercer"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Come Rain Or Come Shine" }
			\fill-line {
				"Lyrics by Johnny Mercer"
				"Music by Harold Arlen"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	



\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f2:maj7 b:m7.5- | e:m7.5- a:7.9- | d1:m7 | g:7.9 | \myEndLine
	g1:7.9 | g2:m7 c:7 | f1:7 | c2:m7 f:7 | \myEndLine
	bes1:m7 | f:m | bes2:m g:m7.5- | c:7.5- c4:7.5 c:7.5+ | \myEndLine
	d2:m7.5- g:7.9- | c1:m | c4:m7 f:7 bes:m7 ees:m7 | a2:m7 g4:m7 c:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	f2:maj7 b:m7.5- | e:m7.5- a:7.9- | d1:m7 | g:7.9 | \myEndLine
	cis:m7.5- | fis2:m7 b:7 | a1:7 | bes2:7 a:7 | \myEndLine
	d2:7 ees:maj7 | d1:7 | g2:7 aes:7.9 | g2.:7.9 a4:7 | \myEndLine
	d2:m7 g4:7 g:7/f | e2:m7.5- a:7.9- | d1:m7 | g2:m7 c:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 




{
	\tempo "Moderato" 4 = 100
	\time 4/4
	\key f \major

%% part "A"
	a'4 a8 a a a4 a8 | a4 a8 a a a4 a8 | a f f f~ f2~ | f1 |
	a4 a8 a a a4 a8 | c4 a8 a a a4 a8 | a f f f~ f2~ | f1 |
	bes2 bes4 aes8 bes | c4 f,2 f8 f | bes2 bes4 aes8 bes | c1 |
	d2 d4 c8 d | ees4 c2 c8 d | ees c d4 c bes8 g | a4 g2. |

%% part "B"
	a4 a8 a a a4 a8 | a4 a8 a a a4 a8 | a f f f~ f2~ | f1 |
	b4 b8 b b b4 b8 | b4 b8 b b b4 b8 | cis a a a~ a2~ | a1 |
	d4 d8 d d d4 d8 | d4 d,2 d4 | d' d8 d d d4 d8 | d4 d,2 e4 |
	a a8 bes b d4. | e4 e8 d e d e4 | d1~ | d2 r |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	I'm gon -- na love you like no -- bod -- y's loved you,
	Come Rain Or Come Shine.
	High as a moun -- tain and deep as a riv -- er,
	Come Rain Or Come Shine.

	I guess when you met me
	It was just one of those things.
	But don't ev -- er bet me,
	'Cause I'm gon -- na be true if you let me.

%% part "B"
	You're gon -- na love me like no -- bod -- y's loved me,
	Come Rain Or Come Shine.
	Hap -- py to -- geth -- er, un -- hap -- py to -- geth -- er
	And won't it be fine.

	Days may be cloud -- y or sun -- ny,
	We're in or we're out of the mon -- ey.
	But I'm with you al -- ways,
	I'm with you rain _ or shine!
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1946, by A-M Music Corp. Copyright Renewed, all rights controlled by Chappell & Co., Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Could It Be You / Cole Porter"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Could It Be You" }
			\fill-line {
				""
				"Music by Cole Porter"
			}
			\fill-line {
				"Ballad"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		bes1:maj7 | c2:m7 f:7 | bes1:maj7 | g4:m7 ges:m7 f:m7 bes:7 | \myEndLine
		ees1:maj7 | f2:m7 bes:7 | ees1:maj7 | g2:m7 c:7 | \myEndLine
		\endPart
	} \alternative {
		{

			\myMark "B"
			\startPart
			f1:maj7 | a:7.9- | d2:m7 g:7 | a:m7.5- d:7.9- | \myEndLine
			g:m g:m7 | c1:7 | f:7 | c2:9 c4:m7 f:7 | \myEndLineVoltaLast
			\endPart
		}
		{

			\myMark "C"
			\startPart
			bes1:maj7 | d:7 | ees2:maj7 c4:7 g:7 | ees2:m7 aes:7 | \myEndLine
			bes1:maj7 | c2:9 c4:m7 f:7 | bes1:6 | \LPC c2:m7 \RPC f:7 | \myEndLineVoltaLast
			\endPart
		}
	}

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 168
	\time 4/4
	\key bes \major

	\repeat volta 2 {

	%% part "A"
		r4 d f d | g1 | r4 d f d | g4 ges8 f~ f2 |
		r4 g! bes g | c1 | r4 g bes g | c4 ces8 bes~ bes2 |
	} \alternative {
		{

		%% part "B"
			r4 a c!4. a8 | g fis g bes~ bes4. g8 | f! e! f a~ a f e4 | ees!2. r4 |
			r d8 d~ d cis d4 | a'2 g | r4 f8 f~ f e! f4 | d'2 c |
		}
		{

		%% part "C"
			r4 bes d4. bes8 | a gis a c~ c4. a8 | g! fis g bes~ bes f! g4 | ees1 |
			r4 f g d' | d2 c8 bes c4 | bes1_\markup { \italic { Fine } } | r |
		}
	}
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Cry Me A River / Arthur Hamilton"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Cry Me A River" }
			\fill-line {
				""
				"Lyrics and Music by Arthur Hamilton"
			}
			\fill-line {
				"Slowly and Rhythmically"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\repeat volta 2 {

		\myMark "A"
		\startPart
		c2:m c:m5+ | c:m6 c:m7 | f:m7 bes4:7 bes:7.5+ | ees2:maj7 d4:m7 g:7 | \myEndLine
		g2:m7 c:7.5+ | f1:9 | f2:m7 f:m7/bes | ees:6 d4:7.9- g:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		c2:m c:m5+ | c:m6 c:m7 | f:m7 bes4:7 bes:7.5+ | ees2:maj7 d4:m7 g:7 | \myEndLine
		g2:m7 c:7.5+ | f1:9 | f2:m7 f:m7/bes | ees:6 a4:m7.5- d:7.9- | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		g1:m | c2:m6 d:7 | g:m e:m7.5- | c:m6/ees d:7 | \myEndLine
		g1:m | c2:m6/ees d4:sus4.7 d:7 | g1 | d2:m7 g:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		c:m c:m5+ | c:m6 c:m7 | f:m7 bes4:7 bes:7.5+ | ees2:maj7 d4:m7 g:7 | \myEndLine
		g2:m7 c:7.5+ | f1:9 | f2:m7 f:m7/bes |
	} \alternative {
		{
			ees:6 g:7.5+.9- | \myEndLineVoltaNotLast
		}
		{
			ees1:6 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andrante Moderato" 4 = 88
	\time 4/4
	\key ees \major

	\repeat volta 2 {

	%% part "A"
		d'2~ d8 c g ees | d c4.~ c2 | r8 c ees c' bes4 bes | g2~ g8. g16 fis8. g16 | c4~ \tuplet 3/2 { c8 des c } des c4. |

	%% part "A"
		r8 g~ \tuplet 3/2 { g f ees } f g4. | r8 ges f ees f ees c ees | ees2~ ees4. r8 | d'2~ d8 c g ees | d c4.~ c2 |
		r8 c ees c' bes4 bes | g2~ g8. g16 fis8. g16 | c4~ \tuplet 3/2 { c8 des c } des c4. | r8 g~ \tuplet 3/2 { g f ees } f g4. |
		r8 ges f ees f ees c ees | ees1 |

	%% part "B"
		r8. g16 a bes8.~ \tuplet 3/2 { bes8 d, e } fis g | a8. g16 bes8 a~ a4. g8 |
		bes4~ \tuplet 3/2 { bes8 g d' } c4 bes8 c~ | c1 | r8. g16 a bes8.~ \tuplet 3/2 { bes8 d, e } fis g | a8. g16 bes8 a~ a2 |
		r8 a16 g a8. g16 a8. g16 b g8. | r8 a16 g a8. g16 a8. g16 b g8. |

	%% part "A"
		d'2~ d8 c g ees | d c4.~ c2 |
		r8 c ees c' bes4 bes | g2~ g8. g16 fis8. g16 | c4~ \tuplet 3/2 { c8 des c } des c4. | r8 g~ \tuplet 3/2 { g8 f ees } f g4. |
		r8 c ges ees f ees c ees |
	} \alternative {
		{
			ees2~ ees8 r r4 |
		}
		{
			ees1 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Now __ you say you're lone -- ly, __ you cry the long night thru; __ well, you can Cry __ Me A Riv --er,
	Cry __ Me A Riv -- er, I cried a riv -- er o -- ver you. __

%% part "A"
	Now __ you say you're sor -- ry __ for be -- in' so un -- true; __ well, you can Cry __ Me A Riv -- er,
	Cry __ My A Riv -- er, I cried a riv -- er o -- ver you.

%% part "B"
	You drove me, __ near -- ly drove me, out of my head, __
	while you __ nev -- er shed a tear. __ Re -- mem -- ber? __ I re -- mem -- ber, all that you said; __
	told me love was too ple -- be -- ian, told me you were thru with me, an'

%% part "A"
	Now __ you say you love me, __ well, just to prove you do, __ Come on, an' Cry Me A Riv -- er,
	Cry Me A Riv -- er, I cried a riv -- er o -- ver you. __ you. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1953, 1955 by Saunders Publications, Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Dancing on the Ceiling / Richard Rodgers, Lorenz Hart"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Dancing on the Ceiling" }
			\fill-line {
				"Lyrics by Lorenz Hart"
				"Music by Richard Rodgers"
			}
			\fill-line {
				"Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f1:maj7 | f:7.5+ | bes2:maj7 b:dim | a:m7 aes:dim | \myEndLine
		g:m7 c:7 | a:m7.5- d:7.9- | g:m7 c:7 | f1:6 | \myEndLine
	}
	\endPart

	\myMark "B"
	\startPart
	g:m7 | c:7 | f:maj7 | a2:m7.5- d:7 | \myEndLine
	g1:m7 | c:7 | a2:m7.5- d:7 | g:m7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1:maj7 | f:7.5+ | bes2:maj7 b:dim | a:m7 aes:dim | \myEndLine
	g1:m7 | c:7 | f | \mark \markup { \italic { Fine } } \LPC g2:m7 \RPC c:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

%% part "A"
	\repeat volta 2 {
		r4 c d e | f g a2 | g4. f8 e4 d | c' c b!2 |
		bes!2. c4 | a1 | g2. a4 | f1 |
	}

%% part "B"
	r4 g g g | g8 g g a f4 g | a r c c~ | c1 |
	r4 g g g | g8 g a a f4 g | a r c c~ | c1 |

%% part "A"
	r4 c, d e | f g a2 | g4. f8 e4 d | c' c b!2 |
	bes!2 d~ | d e, | f1~ | f4 r r2 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

%% part "A"
	He dan -- ces o -- ver -- head
	on the ceil -- ing near my bed
	in my sight
	through the night

%% part "B"
	I whis -- per "\"go" a -- way my lo -- ver it's not "fair\"" __
	but I'm so grate -- ful to dis -- co -- ver he's till there __

%% part "A"
	lo -- ve my ceil -- ing more
	since it is a dan -- cing floor
	just for __ my love __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	I tried to hide in vain
	un -- der -- neath my coun -- ter -- pane
	there's my love up a -- bove
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Darn That Dream / Jimmy Van Heusen, Eddie DeLange"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Darn That Dream" }
			\fill-line {
				"Lyrics by Eddie DeLange"
				"Music by Jimmy Van Heusen"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	g2 bes4:m7 ees:7 | a2:m7 b:7.5- | e4:m7 e:m/d cis:m7 c:maj7 | b2:m7.5- e:7.9- | \myEndLine
	a:m7 f:7 | b:m7 bes:dim7 | a:m7 d:7 | b4:m7 e:7 a:m7 d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2 bes4:m7 ees:7 | a2:m7 b:7.5- | e4:m7 e:m/d cis:m7 c:maj7 | b2:m7.5- e:7.9- | \myEndLine
	a:m7 f:7 | b:m7 bes:dim7 | a:m7 d:7.9- | g2 bes:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	ees2:6 c:m7 | f:m7 bes:7 | ees:maj7 c:7.9- | f:m7 bes4:7.9 bes:7.9- | \myEndLine
	ees2:6 c:m7 | g4:m7 g:m7/f e2:m7.5- | a:m7 d:7 | ees:7.9 d:7.9 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2 bes4:m7 ees:7 | a2:m7 b:7.5- | e4:m7 e:m/d cis:m7 c:maj7 | b2:m7.5- e:7.9- | \myEndLine
	a:m7 f:7 | b:m7 bes:dim7 | a:m7 d:7.9- | g1 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Adagio" 4 = 72
	\time 4/4
	\key g \major

%% part "A"
	d4 g ees4. ees8 | e4 a f4. fis8 | g4 b gis8 a b c | d4 e b2 |
	b4 d c8 b a g | fis4 a e ees | d2 fis | d r |

%% part "A"
	d4 g ees4. ees8 | e4 a f4. fis8 | g4 b gis8 a b c | d4 e b2 |
	b4 d c8 b a g | fis4 a e ees | d2 b' | g2. r4 |

%% part "B"
	r8 g4 g8 f4 ees | c' c8 bes~ bes4. c8 | d ees d des~ des4 ces | bes aes8 f~ f2 |
	r8 g4 g8 f4 ees | g a8 bes~ bes4. c8 | d d d d~ d4 d, | bes'2 b |

%% part "A"
	d,4 g ees4. ees8 | e4 a f4. fis8 | g4 b gis8 a b c | d4 e b2 |
	b4 d c8 b a g | fis4 a e ees | d2 b' | g2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Darn That Dream I dream each night,
	You say you love me and you hold me tight,
	but when I a -- wake you're out of sight.
	Oh, Darn That Dream.

%% part "A"
	Darn your lips and darn your eyes,
	they lift me high a -- bove the moon -- lit skies,
	then I tum -- ble out of Par -- a -- dise.
	Oh, Darn That Dream.

%% part "B"
	Darn that one- -- track mind of mine, __
	it can't un -- der -- stand __ that you don't care. __
	Just to change the mood I'm in, __
	I'd wel -- come a nice __ old night -- mare.

%% part "A"
	Darn That Dream and bless it too,
	with -- out that dream I nev -- er would have you.
	But it haunts me and it won't come true,
	Oh, Darn That Dream.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1939 Bregman, Vocco and Conn, Inc. New York" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Desafinado / Antonio Carlos Jobim, Newton Mendonca, Jon Hendricks, Jessie Cavanaugh"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Desafinado" }
			\fill-line { \large \smaller \bold \larger "Slightly Out Of Tune" }
			\fill-line {
				"Lyrics by Newton Mendonca, Jon Hendricks, Jessie Cavanaugh"
				"Music by Antonio Carlos Jobim"
			}
			\fill-line {
				"Medium Bossa Nova"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
%	list of instruments can be found at
%	http://lilypond.org/doc/v2.11/Documentation/user/lilypond/MIDI-instruments#MIDI-instruments
%	\set ChordNames.midiInstrument = #"acoustic grand"

	\startChords
	\startSong

	\myMark "A"
	\startPart
	f1*2:maj7 | g:7.5- | \myEndLine
	g1:m7 | c2.:7 c4:7/bes | a1:m7.5- | d:7.9- | \myEndLine
	g:m7 | a:7.9- | d:7 | d:7.9- | \myEndLine
	g1*2:7.9- | ges:maj7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1*2:maj7 | g:7.5- | \myEndLine
	g1:m7 | c2.:7 c4:7/bes | a1:m7.5- | d:7.9- | \myEndLine
	g:m7 | bes2:m7 ees:7 | f1:maj7 | b2:m7.5- e:9- | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	a1:maj7 | bes:dim7 | b:m7 | e:7 | \myEndLine
	a | bes:dim7 | b:m7 | e:7 | \myEndLine
	a | fis:m7 | b:m7 | e:7 | \myEndLine
	c:maj7 | cis:dim7 | d:m7 | g:7 | \myEndLine
	g:m7 | fis:dim | g:7 | c2:7 c:7.5- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1*2:maj7 | g:7.5- | \myEndLine
	g1:m7 | c2.:7 c4:7/bes | a1:m7.5- | d:7.9- | \myEndLine
	g:m7 | bes2:m ees:7 | f1:maj7 | d:m7 | \myEndLine
	g1*2:7 | bes1:m7 | ees:7.9 | \myEndLine
	g:7 | g2:m7 c:7 | f1*2:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

%	list of instruments can be found at
%	http://lilypond.org/doc/v2.11/Documentation/user/lilypond/MIDI-instruments#MIDI-instruments
%	\set Staff.midiInstrument = #"flute"

%% part "A"
	r8 c4 d8 e4 f | e4. d8 cis4 d | f4. des8 des2~ | des1 |
	r8 d!4 e8 f4 g | f4. e8 dis4 e | c'4. ees,8 ees2~ | ees1 |
	r8 d c' bes a g4 bes8~ | bes4. a8 dis,4 e | fis8 a fis2 d4 | ees1 |
	r8 aes4 g8 f4 d | aes'4. g8 f4 d | f4. des8 des2~ | des r |

%% part "A"
	r8 c4 d8 e4 f | e4. d8 cis4 d | f4. des8 des2~ | des1 |
	r8 d!4 e8 f4 g | f4. e8 dis4 e | c'4. ees,8 ees2~ | ees1 |
	r8 c'4 bes8 a g4 bes8~ | bes4. a8 g4 f | g8 f g2.~ | g2 r |

%% part "B"
	e4 fis e8 fis4 e8~ | e4. d8 cis4 d | e1~ | e2 r4 cis |
	e fis e8 fis4 e8~ | e4. d8 cis4 d | e4. b8 e2~ | e1 |
	r8 e4 fis8 gis4 a | b4. a8 cis,4 d | e8 fis e fis e2~ | e r4 e |
	g a g a | g f e f | g d8 g~ g d g4~ | g r r8 d g a |
	bes4 a bes a | c bes a bes | g1~ | g4 r r2 |

%% part "A"
	r8 c,4 d8 e4 f | e4. d8 cis4 d | f4. des8 des2~ | des1 |
	r8 d!4 e8 f4 g | f4. e8 dis4 e | d' des c b | bes! d r a |
	c4. b8 bes4 a | bes a g f | a2. e4 | g2. d8 e |
	f f f f f4 f | r8 d4 e8 f4 f | f8 f f f c'4 bes~ | bes2. d,8 e |
	f f f f f4 e8 f~ | f4 r8 e dis4 e | g4. f8 f2~ | f1 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	Love is like a nev -- er end -- ing mel -- o -- dy; __
	po -- ets have com -- pared it to a sym -- pho -- ny, __
	a sym -- pho -- ny con -- duc -- ted by the light -- ing of the moon,
	but our song of love is Slight -- ly Out Of Tune. __

	Once your kiss -- es raised me to a fev -- er pitch, __
	now the orch -- es -- tra -- tion does -- n't seem so rich. __
	Seems to me you've changed __ the tune we used to sing; __

	like the Bos -- sa No -- va, love should swing. __
	We used to har -- mo -- nize __ two souls in per -- fect time. __
	Now the song is dif -- f'rent and the words don't e -- ven rhyme, __
	'cause you for -- got the mel -- o -- dy our hearts would al -- ways croon, __
	and so what good's a heart that's Slight -- ly Out Of Tune. __

	Tune your heart to mine the way it uysed to be; __
	join with me in har -- mo -- ny and sing a song of lov -- ing.
	We're bound to get in tune a -- gain be -- fore too long.
	There'll be no De -- sa -- fi -- na -- do when your heart be -- longs to me com -- plete -- ly. __
	Then you won't be Slight -- ly Out Of Tune, __ you'll sing a -- long with me. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1959 and 1962, Editora Musical Arapua, Sao Paulo, Brazil" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Donna Lee / Charlie Parker"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Donna Lee" }
			\fill-line {
				""
				"Music by Charlie Parker"
			}
			\fill-line {
				"Up Tempo"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	aes1 | f:7 | bes1*2:7 | \myEndLine
	bes1:m7 | ees:7 | aes | ees2:m7 d:7 | \myEndLine
	des1 | des:m7 | aes | f:7 | \myEndLine
	bes1*2:7 | bes1:m7 | ees:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	aes1 | f:7 | bes1*2:7 | \myEndLine
	c:7 | f1:m | c:7.9+ | \myEndLine
	f:m | c:7 | f:m | aes:dim | \myEndLine
	aes2 f:7 | bes:m7 ees:7 | aes1 | bes2:m7 ees:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key aes \major

%% part "A"
	r2 \tuplet 3/2 { g''8 aes g } f e | ees! des c bes-4 a-3 c,-1 ees f |
	\tuplet 3/2 { ges aes ges } f-1 ees d f aes c | g! f r4 r e!8 d! |
	ees! a, bes des! f aes c ees | des e, f c' b g-1 ees-3 des-2 |
	c-1 ees g bes! aes4 ees8-2 f-1 | ges-2 bes-3 des-4 f-5 e-4 c-1 r4 |
	ees2~ ees8 des c bes | ees des r4 ges8 fes ees des |
	c c des d ees des c bes | a c ees f \tuplet 3/2 { ges aes ges } f ees |
	d c b a bes aes r d,16 f | \tuplet 3/2 { g8 ges f } e4 r2 |
	ees'!8 des f, aes c bes aes f | g bes des ees \tuplet 3/2 { e fis e } ees des |

%% part "B"
	c4 r \tuplet 3/2 { g'8 aes g } f e | ees! des c bes-4 a-3 c,-1 ees f |
	\tuplet 3/2 { ges aes ges } f-1 ees d f aes c | g! f r4 r g8 f |
	e f g aes bes aes g f | \tuplet 3/2 { des' ees des } c bes \tuplet 3/2 { aes bes aes } g e |
	f4 r r2 | r r4 r8 b |
	c b c des d cis d ees | e dis e dis d des c bes |
	\tuplet 3/2 { aes bes aes } g aes bes aes g f | b, d f aes b g' f e |
	ees! des c bes a ges f ees | des f aes c bes aes g ees |
	aes4 r r2 | r1 |
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Don't Blame Me / Jimmy McHugh, Dorothy Fields"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Don't Blame Me" }
			\fill-line {
				"Lyrics by Dorothy Fields"
				"Music by Jimmy McHugh"
			}
			\fill-line {
				"Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		c2:6 f4:m7 bes:7 | e2:m7 a:7 | d:m7 g:7 | c:maj7 a:m7 | \myEndLine
		d:m7 g:7 | e:m7.5- a:7 |
	} \alternative {
		{
			d:m7 g:7 | c:6 d4:m7 g:7 | \myEndLineVoltaNotLast
		}
		{
			d2:m7 g:7 | c:6 g4:m7 c:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	f1 | e:7 | a1*2:m7 | \myEndLine
	d:7 | d2:m7 aes:7 | g1:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c2 e:m7.5- | a1:7 | d2:m7 g:7 | c:maj7 a:m7 | \myEndLine
	d:m7 g:7 | e:m7.5- a:7 | d:m7 g:7 | c1:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

%% part "A"
	\repeat volta 2 {
		g'2 bes | a2. g4 | \tuplet 3/2 { f4 f f } e e | d2. c4 |
		\tuplet 3/2 { f f f } e d | \tuplet 3/2 { g g g } f e |
	} \alternative {
		{
			a2 b | g1 |
		}
		{
			a2 a | c1 |
		}
	}

%% part "B"
	gis4 a gis a | ais b ais b | d2 c4 c~ | c1 |
	d2 c4 c~ | c2 \tuplet 3/2 { d,4 fis b } | a2 aes | g1 |

%% part "A"
	g2 bes | a2. g4 | \tuplet 3/2 { f4 f f } e e | d2. c4 |
	\tuplet 3/2 { f f f } e d | \tuplet 3/2 { g g g } f e | a2 a | c2. r4 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% these are lyrics from the internet adjusted for the real book
\lyricmode {

%% part "A"
	Don't Blame Me
	For fal -- ling in love with you.
	I'm un -- der your spell
	But how can I help it?
	Don't Blame Me.
	_ _ _

%% part "B"
	I can't help it
	If that dog -- gone moon a -- bove __
	Makes me want __
	Some -- one like you to love.

%% part "A"
	Blame your kiss
	As sweet as a kiss can be,
	And blame all your charms
	That melt in my arms,
	But Don't Blame Me.
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	Can't you see
	When you do the things you do
	If I can't con -- ceal
	The thrill that I'm fee -- ling,
	_ _ _ Don't Blame Me.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Don't Explain / Billie Holiday, Arthur Herzog, Jr."





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Don't Explain" }
			\fill-line {
				"Lyrics by Arthur Herzog, Jr."
				"Music by Billie Holiday"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	d2:m d:m/c | g:m6/bes a:7 | d:m d:m/c | e:7/b bes4:7.5- a4:9 | \myEndLine
	ees2:9 d4:9.5+ d:7.5+.9- | des2:9 c:9 | f:maj7 bes4:maj7 a:m7 | bes:m6/des c:7.9- bes:7 a:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	d2:m d:m/c | g:m6/bes a:7 | d:m d:m/c | e:7/b bes4:7.5- a4:9 | \myEndLine
	ees2:9 d4:9.5+ d:7.5+.9- | des2:9 c:9 | f b:m7.5- | e:7.9- a:7.9- | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	d:m7 g:m7 | c:7 f:maj7 | bes:maj7 e:m7.5- | bes:7 a:7 | \myEndLine
	d:m7 g:m7 | c:7 f:maj7 | bes:maj7 e:m7.5- | bes:7 a:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	d2:m d:m/c | g:m6/bes a:7 | d:m d:m/c | e:7/b bes4:7.5- a4:9 | \myEndLine
	ees2:9 d:9.5+ | des:9 c:9 | f bes:6 | f1 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Adagio" 4 = 72
	\time 4/4
	\key f \major

%% part "A"
	d4 f2 a8 d, | e1 | d4 f2 e8 f | e1 |
	c'4 bes2. | bes4 a2 a8 d, | e1~ | e4 r r2 |

%% part "A"
	d4 f2 a8 d, | e1 | d4 f2 e8 f | e1 |
	c'4 bes2. | bes4 a2 a8 d, | f1~ | f |

%% part "B"
	a8 a c a bes bes4. | g8 g bes g a2 | f8 f a f g g4. | e8 f g g g f e4 |
	a8 a c a bes bes4. | g8 g bes g a2 | f8 f a f g g4. | e8 f g f e2 |

%% part "A"
	d4 f2 a8 d, | e1 | d4 f2 e8 f | e1 |
	c'4 bes2. | bes4 a2 a8 d, | f1~ | f |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Hush now, Don't Ex -- plain!
	Just say youl'll re -- main,
	I'm glad you're back,
	Don't Ex -- plain! __

%% part "A"
	Qui -- et, Don't Ex -- plain!
	What is there to gain?
	Skip that lip -- stick,
	Don't Ex -- plain! __

%% part "B"
	You know that I love you
	and what love en -- dures.
	All my thoughts are of you
	for I'm so com -- plete -- ly yours.
	Cry to hear folks chat -- ter,
	and I know you cheat.
	Right or wrong don't mat -- ter
	when you're with me, sweet.

%% part "A"
	Hush now, Don't Ex -- plain!
	You're my joy and pain.
	My life's yours love,
	Don't Ex -- plain! __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1946 by Northern Music Company" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Don't Get Around Much Anymore / Duke Ellington, Bob Russell"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Don't Get Around Much Anymore" }
			\fill-line {
				"Lyrics by Bob Russell"
				"Music by Duke Ellington"
			}
			\fill-line {
				"Medium Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		s1 | s4 c d:m7 dis8:dim7 c/e | c1/e | c4/e a b:m7 c8:dim7 a:7/cis | \myEndLine
		a1:7/cis | d:7 | g:7 | c4 c/e ees:dim7 d8:m7 c | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		c1 | c4 c d:m7 dis8:dim7 c/e | c1/e | c4/e a b:m7 c8:dim7 a:7/cis | \myEndLine
		a1:7/cis | d:7 | g:7 | c4 c/e ees:dim7 d8:m7 c | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		g2:m7 c:7 | f2..:6 bes8:9 | bes1:9 | c:maj7 | \myEndLine
		c2.:7 c4:7.5+ | d1:7 | fis2:7.5- b:7 | e4:m7 ees:dim7 d4.:7 g8:7 |
		g1:7 | g4:7 c d:m7 dis8:dim7 c/e |
		\endPart

		\myMark "A"
		\startPart
		c1 | c4/e a b:m7 c8:dim7 a:7/cis | a1:7/cis | d:7 | \myEndLine
		g:7 |
	} \alternative {
		{
			c | c | \myEndLineVoltaNotLast
		}
		{
			s4 c/e ees:dim7 d8:m7 c | c1 | c | c:7.9+ | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key c \major

%% part "A"
	\repeat volta 2 {
		r8 e'4 d8 c g f4 | e1 | r8 e'4 d8 c g f4 | e1 |
		r8 g4 f8 e d c c'~ | c4. a8~ a2 | r8 e f fis g c, dis e | c1 |
		r8 e'4 d8 c g f4 | e1 | r8 e'4 d8 c g f4 | e1 |
		r8 g4 f8 e d c c'~ | c4. a8~ a2 | r8 e8 f fis g c, dis e | c1 | R1 |
		d'2 c4 a8 c~ | c2. c8 d~ | d2 c4 g8 e~ | e2. c'4 | d2 c8 a4 c8~ | c1 |
		r8. b16 b8. b16 b8 a4 g8~ | g e'4 d8 c g f4 | e1 | r8 e'4 d8 c g f4 |
		e1 | r8 g4 f8 e d c c'~ | c4. a8~ a2 | r8 e f fis g c, dis e |
	} \alternative {
		{
			c1 | r8 e'4 d8 c g f4 |
		}
		{
			c1 | R1*3 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Missed the Sat -- ur -- day dance, heard they crowd -- ed the floor;
	cound -- n't bear it with -- out you, __ Don't Get A -- round Much An -- y -- more.
	Thougt I'd vis -- it the club, got as far as the door;
	they'd have ask'd me a -- bout __ you, __ Don't Get A -- round Much An -- y more.
	Dar -- ling, I guess __ my mind's __ more at ease, __ but nev -- er -- the -- less __
	why stir up mem -- o -- ris? __ Been in -- vi -- ed on dates, might have gone but what
	four? Aw -- f'lly dif -- f'rent with -- out __ you, __ Don't Get A -- round Much An -- y --
	more. Missed the Sat -- ur -- day
	more.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1973 Herrison Music Corp. and Robbins Music" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <jordaneldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Doxy / Sonny Rollins"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Doxy" }
			\fill-line {
				""
				"Music by Sonny Rollins"
			}
			\fill-line {
				"Medium Groove"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		bes2:7 aes:7 | aes:7 g:7 |
	} \alternative {
		{
			c:7 f:7 | bes1:7 | \myEndLineVoltaNotLast
		}
		{
			c:7 | f:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	bes1*2:7 | ees1:7 | e:dim7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	bes2 aes:7 | aes:7 g:7 | c:7 f:7 | bes1 | \myEndLine
	\endPart

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key bes \major

	\partial 8 f8 |

%% part "A"
	\repeat volta 2 {
		bes8 d bes f bes4 r8 f | bes8 f bes des r g,4 f8 |
	} \alternative {
		{
			e8 g bes des \tuplet 3/2 { c8 des c } g8 bes | r2 r4 r8 f |
		}
		{
			e8 g bes des \tuplet 3/2 { c8 des c } g8 a | r1 |
		}
	}

%% part "B"
	g'4 r8 f~ f r des4~ | des4. g,8 r c4 g8 | des'4 des8 des g,4 c | r2 r4 r8 f, |

%% part "A"
	bes d bes f bes4 r8 f | bes f bes des r g,4 f8 | e g bes des \tuplet 3/2 { c8 des c } g8 bes | r1 |
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1963 Prestige Music Co, Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Easy Living / Ralph Rainger, Leo Robin"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Easy Living" }
			\fill-line {
				""
				"Lyrics and Music by Ralph Rainger, Leo Robin"
			}
			\fill-line {
				"Med"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f2:maj7 fis:dim7 | g:m7 gis:dim7 | f:maj7/a c4:m7 f:7 | bes2:maj7 ees:7 | \myEndLine
		f:maj7 d:m7 |
	} \alternative {
		{
			g:m7 c:7 | a:7.5+ d:9 | g:7.5+ c:9 | \myEndLineVolta
		}
		{
			g:m7 c:7.9- | f bes:7 | ees:m7 aes:7 | \myEndLineVolta
		}
	}
	\endPart

	\myMark "B"
	\startPart
	des:maj7 bes:m7 | ees:m7 aes4:7 aes:7/ges | f2:m7 bes:7 | ees:m7 aes:7 | \myEndLine
	des:maj7 des/c | bes:m7 bes:m7/aes | g1:m7.5- | c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f2:maj7 fis:dim7 | g:m7 gis:dim7 | f:maj7/a c4:m7 f:7 | bes2:maj7 ees:7 | \myEndLine
	f:maj7 d:m7 | g:m7 c:7.9- | f \LPC aes:7 | des:maj7 \RPC c:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Moderato" 4 = 108
	\time 4/4
	\key f \major

%% part "A"
	\repeat volta 2 {
		\tuplet 3/2 { a'4 d c } ees,2 | r8 d g bes d f4 e8 | \tuplet 3/2 { b4 d c } f,2 | r8 d f a c4. bes8 |
		\tuplet 3/2 { a4 g' f } a,4. e'8 |
	} \alternative {
		{
			d4 bes8 d, a'4 g | a1~ | a |
		}
		{
			d4 bes8 d, a'4 a8 f~ | f1~ | f2. f4 |
		}
	}

%% part "B"
	aes1 | \tuplet 3/2 { ees'4 f fes } \tuplet 3/2 { ees c bes } | aes1 | e'!8 f e f ees4 c8 bes |
	aes2 \tuplet 3/2 { aes4 f aes } | bes2 \tuplet 3/2 { bes4 g bes } | c2 d | g8 e d c gis2 |

%% part "A"
	\tuplet 3/2 { a4 d c } ees,2 | r8 d g bes d f4 e8 | \tuplet 3/2 { b4 d c } f,2 | r8 d f a c4. bes8 |
	\tuplet 3/2 { a4 g' f } a,4. e'8 | d4 bes8 d, a'4 a8 f~ | f1~ | f |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Li -- ving for you is ea -- sy li -- ving
	It's ea -- sy to live when you're in love
	And I'm so in love
	There is nothing in life but you __
	_ _ _ _ _ _

%% part "B"
	For you may -- be I'm_a fool
	But it's fun
	Peo -- ple say you rule me with one wave of your hand
	Dar -- ling, it's grand
	They just don't un -- der -- stand

%% part "A"
	Li -- ving for you is ea -- sy li -- ving
	It's ea -- sy to live when you're in love
	And I'm so in love
	There is nothing in life but you __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	I ne -- ver_reg -- ret the years that I'm giving
	They're ea -- sy to give when you're in love
	I'm hap -- py to do
	what -- _ _ _ _ _ _ ev -- er I do for you __
}


	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Easy To Love / Cole Porter"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Easy To Love" }
			\fill-line { \large \smaller \bold \larger "From 'Born To Dance'" }
			\fill-line {
				""
				"Lyrics and Music by Cole Porter"
			}
			\fill-line {
				"Ballad"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		d1:m7 | g:m7 | d:m7 | g:7 | \myEndLine
		c:maj7 | f:maj7 | e:m7 |
	} \alternative {
		{
			f:7 | \myEndLine
			\endPart

			\myMark "B"
			\startPart
			d:m7 | g:7 | c:maj7 | a:m7 | \myEndLine
			d:m7 | g:7 | e:m7 | a:7 | \myEndLineVolta
			\endPart
		}
		{
			a:7 | \myEndLine
			\endPart

			\myMark "C"
			\startPart
			d:m7 | f:m6 | c:maj7 | e2:7 ees:dim | \myEndLine
			d1:m7 | g:7 | c1*2:6 | \myEndLineVolta
			\endPart
		}
	}

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Moderato" 4 = 108
	\time 4/4
	\key c \major

%% part "A"
	\repeat volta 2 {
		a'1 | d,2. e4 | f2 e4. f8 | b2. a4 |
		g2 fis4 g | d' des c b | a2 gis4. a8 |
	} \alternative {
		{
			g'!1 |

		%% part "B"
			g | a,2. b4 | e e e2~ | e4 r r2 |
			r4 g g,4. g8 | aes aes4 aes8 a4 a8 b~ | b4 b b2~ | b4 r r2 |
		}
		{
			a'2. e4 |

		%% part "C"
			g2. d4 | f2. c4 | e2 b4 c | d des c b |
			a2 e' | e ees4 d | c1~ \mark \markup { \italic { Fine } } | c4 r r2 |
		}
	}
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	You'd be so Eas -- y To Love,
	So eas -- y to i -- dol -- ize,
	All oth -- ers a -- bove

%% part "B"
	So worth the yearn -- ing for, __
	So swell to keep ev -- 'ry home -- fire burn -- ing for __

	shame

%% part "C"
	that you can't see
	your fu -- ture with me,
	'cause you'd be oh, so Eas -- y To Love! __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	We'd be so grand at the game
	So care -- free to -- get -- her,
	that it does seem a
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1936 by Chappell & Co., Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Epistrophy / Thelonius Monk"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Epistrophy" }
			\fill-line {
				""
				"Music by Thelonius Monk"
			}
			\fill-line {
				"Bop"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	cis2:7 d:7 | cis:7 d:7 | cis:7 d:7 | cis:7 d:7 | \myEndLine
	dis:7 e:7 | dis:7 e:7 | dis:7 e:7 | dis:7 e:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	dis:7 e:7 | dis:7 e:7 | dis:7 e:7 | dis:7 e:7 | \myEndLine
	cis:7 d:7 | cis:7 d:7 | cis:7 d:7 | cis:7 d:7 | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	fis1*4:m | \myEndLine
	b1*2:7 | des1:7 | d:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	dis2:7 e:7 | dis:7 e:7 | dis:7 e:7 | dis:7 e:7 | \myEndLine
	cis:7 d:7 | cis:7 d:7 | cis:7 d:7 | \mark \markup { \musicglyph #"scripts.coda" } cis:7 d:7 | \myEndLine
	\endPart

%%\myMark "Coda"
	\mark \markup { \musicglyph #"scripts.coda" }
	\startPart
	cis:7 d:7 | ges1:7.11+ | \myEndLine
	\endPart

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

%% part "A"
	r4 cis8 d ais' b4. | cis,8 d ais' b~ b4 r | r cis,8 d bes' e,4. | cis8 d bes' e,~ e4 r |
	r4 dis8 e c' cis4. | dis,8 e c'! cis~ cis4 r | r dis,8 e c'! fis,!4. | dis8 e c' fis,~ fis4 r |

%% part "B"
	r4 dis8 e c' cis4. | dis,8 e c'! cis~ cis4 r | r dis,8 e c'! fis,!4. | dis8 e c' fis,~ fis4 r |
	r4 cis8 d ais' b4. | cis,8 d ais' b~ b4 r | r cis,8 d bes' e,4. | cis8 d bes' e,~ e4 r |

%% part "C"
	fis,4-> fis-> cis'8 dis fis gis | a4 gis8 a fis4 dis | fis,-> fis-> cis'8 dis fis a | r a4 gis8 fis4 dis |
	b-> b-> cis8 dis fis gis | b4 a8 b a4 fis | f!8 aes ces ees~ ees ces4. | fis,8 a c! e~ e c4. |

%% part "B"
	r4 dis,8 e c' cis4. | dis,8 e c'! cis~ cis4 r | r dis,8 e c'! fis,!4. | dis8 e c' fis,~ fis4 r |
	r4 cis8 d ais' b4. | cis,8 d ais' b~ b4 r | r cis,8 d bes' e,4. | cis8 d bes' e,~ e4 r |

%% part "Coda"
	cis8 d ais' b~ b4 a!8 c~ | c1\fermata |
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Flamingo / Ted Grouya, Ed Anderson"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Flamingo" }
			\fill-line {
				"Lyrics by Ed Anderson"
				"Music by Ted Grouya"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f2:maj7 d:m7 | g:m7 c:7.5+ | f1:m7 | bes2:7 c:7.5+ | \myEndLine
		des1:7.9 | g2:m7 c4:7 c:7/bes | \myEndLine
	} \alternative {
		{
			a2:m7 d:7 | g:m7 c:7 | \myEndLineVoltaNotLast
		}
		{
			f bes:7.9 | f c4:m7 f:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	bes2:m bes:m7.7+ | bes:m7 ees:7.9 | aes1:6 | c2:m7.5- f:7 | \myEndLine
	bes:m7 ees:7 | bes:m7 bes:m7/aes | g1:m7 | c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f2:maj7 d:m7 | g:m7 c:7.5+ | f1:m7 | bes2:7 c:7.5+ | \myEndLine
	des1:7.9 | g2:m7 g:m7/c | f:maj7 bes:maj7 | f1:maj7 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

	\partial 4 c4 |

%% part "A"
	\repeat volta 2 {
		c'4. a8~ a2 | r4 bes8 c e4 d8 c | aes1 | r4 g8 aes c4 bes8 aes |
		f4 f2. | r4 f8 f g4 f8 g |
	} \alternative {
		{
			a1~ | a2 r4 c,4 |
		}
		{
			f1~ | f4 r r f |
		}
	}

%% part "B"
	f'1 | r4 f8 f f4 ees8 des | ees4. ees8 aes2 | r4 ees8 ees~ ees4 des8 c |
	des4. des8 g2 | r4 des4 des c8 bes | c1~ | c2 r4 c,4 |

%% part "A"
	c'4. a8~ a2 | r4 bes8 c e4 d8 c | aes1 | r4 g8 aes c4 bes8 aes |
	f4 f2. | r4 g \tuplet 3/2 { bes d f } | a1~ | a2. r4 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Fla -- min -- go, __
	like a flame in the sky,
	fly -- ing o -- ver the is -- land
	to my lov -- er near by. __
%% Volta
	Fla
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	Fla -- min -- go, __
	in your trop -- i -- cal hue,
	speak of pas -- sion un -- dy -- ing
	and a love that is _ _ true. __

%% part "B"
	The wind sings a song to you as you go,
	a song __ that I hear be -- low the mur -- mur -- ing palms. __

%% part "A"
	Fla -- min -- go, __
	when the sun meets the sea,
	say fare -- well to my lov -- er
	and has -- ten to me. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1941 Tempo Music, Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Fly Me To The Moon / Bart Howard"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Fly Me To The Moon" }
			\fill-line { \large \smaller \bold \larger "In Other Words" }
			\fill-line {
				""
				"Lyrics and Music by Bart Howard"
			}
			\fill-line {
				"Moderately, with a beat"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		a1:m7 | d:m7 | g:7 | c:maj7 | \myEndLine
		f:maj7 | b:m7.5- | e:7.9- | a2.:m7 a4:7.9- | \myEndLine
		d1:m7 | g2.:7.9 g4:7.9- | c1:maj7.9 | a2.:m7 a4:m7.9 | \myEndLine
		d1:m7 | g:7 | f2:dim7/c c:maj7 | b:m7 e:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		a1:m7 | d:m7 | g:7 | c:maj7 | \myEndLine
		f:maj7 | b:m7.5- | e:7.9- | a2.:m7 a4:7.9- | \myEndLine
		d1:m7 | g2.:7.9 g4:7/f |
		\endPart
	} \alternative {
		{
			e1:m7.5- | a:7.9- | \myEndLine
			d:m7 | d2.:m7/g g4:7.9- | c1:6 | b2:m7 e:7 | \myEndLineVolta
		}
		{
			e2:m7.5- bes:7.9 | a1:7.9- | \myEndLine
			d:m7 | g2.:7 g4:7.9- | c2:6 bes4:6 b:6 | c1:6.9 | \myEndLineVoltaLast
		}
	}

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

	\repeat volta 2 {

	%% part "A"
		c'4 b a8 g4. | f g8 a4 c | b a g8 f4. | e1 |
		a4 g f8 e4. | d4. e8 f4 a | gis f e8 d4. | c2. cis4 |
		d8 a'4 a8~ a2~ | a4 c2 b4 | g1~ | g2. b,4 |
		c8 f4 f8~ f2~ | f4 a2 g4 | f2 e2~ | e1 |

	%% part "B"
		c'4 b a8 g4. | f g8 a4 c | b a g8 f4. | e1 |
		a4 g f8 e4. | d4 e4 f a | gis f e8 d4. | c2. cis4 |
		d8 a'4 a8~ a2~ | a4 c2 b4 |
	} \alternative {
		{
			g1~ | g2. gis4 |
			a8 c,4 c8~ c2~ | c4 c2 d4 | c1 | r |
		}
		{
			e'1~ | e2. c4 |
			d8 a4 a8~ a2~ | a4 b2 d4 | c1~ | c2. r4 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Fly Me To The Moon, and let me play a -- mong the stars;
	let me see what spring is like on Ju -- pi -- ter and Mars.
	In oth -- er words, __ hold my hand! __
	In oth -- er words, __ dar -- ling kiss me! __

%% part "B"
	Fill my heart with song, and let me sing for -- ev -- er -- more;
	you are all I long for all I wor -- ship and a -- dore.
	In oth -- er words, __ please be true! __
	In oth -- er words, __ I love you!

%% part "Volta"
	true! __ In oth -- er words, __ I love you! __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1954 and renewed 1982 Hampshire House Publishing Corp., New York NY." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Gentle Rain / Louis Bonfa, Matt Dubey"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Gentle Rain" }
			\fill-line {
				"Lyrics by Matt Dubey"
				"Music by Louis Bonfa"
			}
			\fill-line {
				"Bossa"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		a1*2:m6 | b1:m7.5- | e:7 | \myEndLine
		a2:m7 d:7 | g:m7 c:7 | f1*2:6 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		fis1:m7.5- | b:7.9- | e:m7.5- | a:7.9- | \myEndLine
		d:m7.5- | b2:m7.5- e:7 |
	} \alternative {
		{
			a1:m6 | bes:7 | \myEndLineVoltaNotLast
		}
		{
			a2:m7 d:7 | g:m7 c:7 | f1:6 | c:7 | \myEndLine
			f:6 | e:m7 | a:m | \OPC e:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key a \minor

	\repeat volta 2 {

	%% part "A"
		e2. d8 c | c2. d8 e | e2. d8 c | b2. c8 d |
		e1~ | e2 e8 g e c | d1~ | d2. r4 |

	%% part "B"
		c'2. b8 a | a2. g8 fis | bes2. a8 g | g2. f8 e |
		aes2. g8 f | f2. e8 d |
	} \alternative {
		{
			e1~ | e2. r4 |
		}
		{
			e1~ | e2 e8 g e c | d1~ | d2 e8 g e c |
			d1~ | d2 b'8 d b g | a1~ | a1 |
		}
	}
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this version of the lyrics is from the internet but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
	We both are lost and a -- lone in the world,
	Walk with me __ in the Gen -- tle Rain. __
	Don't be af -- raid; I've a hand for your hand,
	And I will be your love for a while. __

	sad, __

	like the Gen -- tle Rain, __
	like the Gen -- tle Rain, __
	like the Gen -- tle Rain, __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {
	I feel your tears as they fall on my cheek,
	They are warm __ in the Gen -- tle Rain. __
	Don't be af -- raid; I've a hand for your hand,
	And our love will be sweet, will be
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1931 (renewed 1959) EMI Robbins Catalog, Inc" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Giant Steps / John Coltrane"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Giant Steps" }
			\fill-line {
				""
				"Music by John Coltrane"
			}
			\fill-line {
				"Fast"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	b2 d:7 | g bes:7 | ees1 | a2:m7 d:7 | \myEndLine
	g bes:7 | ees fis:7 | b1 | f2:m7 bes:7.9 | \myEndLine
	ees1 | a2:m7 d:7 | g1 | cis2:m7 fis:7 | \myEndLine
	b1 | f2:m7 bes:7 | ees1 | cis2:m7 fis:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Prestissimo" 4 = 240
	\time 4/4
	\key c \major

%% part "A"
	fis'2 d | b g4. bes8~ | bes1 | b4. a8~ a2 |
	d bes | g dis4. fis8~ | fis1 | g2 f4. bes8~ |
	bes1 | b2 a4. d8~ | d1 | dis2 cis4. fis8~ |
	fis2 fis | g f4. bes8~ | bes1 | fis4. fis8~ fis2 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Life when we were kids __
	Was like __ play -- ing gi -- ant steps __
	We were told __ to ad -- vance __
	We o -- beyed, __ _ took the chance __
	You're it __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	Think of life as chess __
	Cap -- ture __ one piece at a time __
	For -- ward east, __ cas -- tle next __
	Not the pace __ _ but the steps __
	Check -- mate __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1974 Jowcol Music." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Gloria's Step / Scott LaFaro"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Gloria's Step" }
			\fill-line {
				""
				"Music by Scott LaFaro"
			}
			\fill-line {
				"Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f1:maj7 | ees2:maj7 d:maj | des1:maj7 | c:7.9+ | f:m7 | \myEndLine
	}
%% this is remarked ON PURPOSE to keep the repetition sign in the chart...
%%\endPart

	\myMark "B"
	\startPart
	e1:m7 | f:maj1 | a:m7.5- | e:m7.5- | g:m7.5- |
	d:m7.5- | g:7.9+ | c:7.9+ | ees1*2:7.9+ | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1:maj7 | ees2:maj7 d:maj | des1:maj7 | c:7.9+ | f:m7 | \myEndLine
	\endPart

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 160
	\time 4/4
	\key c \major

%% part "A"
	\repeat volta 2 {
		r8 g'4 c8 \tuplet 3/2 { b c a } \tuplet 3/2 { r a e } | g1 | r8 f g f~ f ees c ees~ | ees2 r8 c bes c~ | c1 |
	}

%% part "B"
	g'4 a8 b~ b2 | r8 a4. b4 c8 d~ | d2 r8 c g bes~ | bes2. a4 | c2 r8 bes f aes~ |
	aes2. g4 | bes2 r8 aes16 bes aes8 des, | ees'2 r8 des16 ees des8 aes | ges'1~ | ges |

%% part "A"
	r8 g,4 c8 \tuplet 3/2 { b c a } \tuplet 3/2 { r a e } | g1 | r8 f g f~ f ees c ees~ | ees2 r8 c bes c~ | c1 |
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1962, Orpheum Music." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Green Dolphin Street / Bronislau Kaper, Ned Washington"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Green Dolphin Street" }
			\fill-line {
				"Lyrics by Ned Washington"
				"Music by Bronislau Kaper"
			}
			\fill-line {
				"Latin/Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		c1*2:maj7 | c:m7 | \myEndLine
		d1:7/c | d2:7/c des/c | c1*2:maj7 | \myEndLine
		\endPart
	} \alternative {
		{

			\myMark "B"
			\startPart
			d1:m7 | g:7 | c1*2:maj7 | \myEndLine
			f1:m7 | bes:7 | ees1.:maj7 \OPC g2:7 | \myEndLineVolta
			\endPart
		}
		{

			\myMark "C"
			\startPart
			d2:m7 d:m/c | b:m7.5- e:7.9- | a:m7 a:m/g | fis:m7.5- b:7 | \myEndLine
			e:m7 a:7 | d:m7 g:7 | c1:maj7 | \LPC d2:m7 \RPC g:7 | \myEndLineVolta
			\endPart
		}
	}

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 160
	\time 4/4
	\key c \major

%% part "A"
	\repeat volta 2 {
		c'2 c~ | c \tuplet 3/2 { b4 g e } | bes'1~ | bes |
		a2 a~ | a \tuplet 3/2 { aes4 f des } | g1~ | g |
	} \alternative {
		{

		%% part "B"
			r8 g4. d4 e | f g aes bes | g1~ | g |
			r8 bes4. f4 g | aes bes ces des | bes1~ | bes2 b |
		}
		{

		%% part "C"
			r8 g4. d4 e | f g gis e' | d4. c8~ c2 | c,4 d dis b' |
			a4. g8~ g2 | r8 g4. g4 g | g1~ | g |
		}
	}
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	Lo -- ver, __ one love -- ly day __
	A_love came __ plan -- ning to stay __
	Green Dol -- phin Street sup -- plied the setting __
	The_set -- ting for nights be -- yond for -- getting __ And

	When I re -- call the love I found on
	I'm_gonna kiss_the ground I found on Green Dol -- phin Street __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {
	through these __ mo -- ments a -- part __
	Love come __ here in my heart __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1947 (Renewed 1975) MGM/EMI Feist Catalog, Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Greensleeves / Traditional"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Greensleeves" }
			\fill-line {
				""
				"Music by Traditional"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\myMark "A"
	\startPart
	\repeat volta 2 {

		e2.:m | d4. d8. dis8.:dim |
	} \alternative {
		{

			e4.:m fis:7 | b2. | \myEndLineVoltaLast
		}
		{
			e4.:m b:7 | e4:m a8:m e4.:m | \myEndLineVoltaNotLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	\repeat volta 2 {

		g2. | d4. d8. dis8.:dim | \myEndLine
	} \alternative {
		{
			e4.:m fis:7 | b2. | \myEndLineVoltaNotLast
		}
		{
			e4.:m b:7 | e4:m a8:m e4.:m | \myEndLineVoltaLast
		}
	}

	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 76
	\time 6/8
	\key e \minor

	e8 |

%% part "A"
	\repeat volta 2 {
		g4 a8 b8. c16 b8 | a4 fis8 d8. e16 fis8 |
	} \alternative {
		{
			g4 e8 e8. dis16 e8 | fis4 dis8 b4 e8 |
		}
		{
			g fis e dis8. cis16 dis8 | e4 e8 e4 r8 |
		}
	}

%% part "B"
	\repeat volta 2 {
		d'4. d8. c16 b8 | a4 fis 8 d8. e16 fis8 |
	} \alternative {
		{
			g4 e8 e8. dis16 e8 | fis4 dis8 b4 r8 |
		}
		{
			g' fis e dis8. cis16 dis8 | e4. e |
		}
	}
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	A -- las, my love, __ _ you do me wrong __ _ to cast me off __ _ dis -- cour -- teous -- ly.
	And
	_ _ _ _ _ _ _ _ _
	Green -- sleeves __ _ was all my joy. __ _ _
	Green -- _ sleeves _ was my de -- light.
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {
	_
	I have loved __ _ you oh, so, long __ _ de
	_ _ _ _ _ _ _ _ _
	light -- _ ing in __ _ your com -- pa -- ny.
	Green -- sleeves was my heart of gold, __ _ and
	_ _ _ _ _ _ _ _
	who but my la -- _ dy Green -- sleeves.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1988 by HAL LEONARD PUBLISHING CORPORATION" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Guilty / Gus Kahn, Harry Akst, Richard A. Whiting"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Guilty" }
			\fill-line {
				""
				"Lyrics and Music by Gus Kahn, Harry Akst, Richard A. Whiting"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		bes4 f:m/aes g:7.5+ g:7 | c:m c:m/bes a:7.5+ a:7 | bes2:maj7 bes:7.5+ | ees:maj7 ees:m | \myEndLine
		bes/d des:dim7 | c:m7 f:7 |
	} \alternative {
		{
			c:m7 f:7.5+ | bes f:7 | \myEndLineVoltaNotLast
		}
		{
			c:m7 f:7 | bes a:7 | \myEndLineVoltaLast
		}
	}
	\myEndLine
	\endPart

	\myMark "B"
	\startPart
	d:m d4:m7+ d:m7 | e2:m7.5- a4:7.5+ a:7 | d2:m d:m7 | e:m7 a4:7.5+ a:7 | \myEndLine
	f1:6/c | g2:m7/c f4:6 fis:dim7 | g2:m7 c:9 | f:sus4.9 f:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	bes4 f:m/aes g:7.5+ g:7 | c:m c:m/bes a:7.5+ a:7 | bes2:maj7 bes:7.5+ | ees:maj7 ees:m | \myEndLine
	bes/d des:dim7 | c:m7 f:7 | c4:m f2:sus4.9 f4:7.9- | bes aes:6 bes:6 r | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Moderato" 4 = 100
	\time 4/4
	\key bes \major

%% part "A"
	\repeat volta 2 {
		f8 g f g~ g2 | g8 a g a~ a2 | a8 bes a bes~ bes a bes4 | d2 c |
		c8 bes a g~ g a bes4 | f4 f2. |
	} \alternative {
		{
			\tuplet 3/2 { f4 c f } cis a'8 g~ | g2. r4 |
		}
		{
			g8 ees g4 a8 bes c bes~ | bes2. r4 |
		}
	}

%% part "B"
	a8 f g a~ a2 | a8 c bes a~ a2 | d8 c bes a~ a f g4 | a1 |
	c8 a bes c~ c2 | bes8 c d c~ c4. a8 | c g a bes~ bes c d4 | c2. r4 |

%% part "A"
	f,8 g f g~ g2 | g8 a g a~ a2 | a8 bes a bes~ bes a bes4 | d2 c |
	c8 bes a g~ g a bes4 | f4 f2. | ees'8 d ees c~ c4 d | bes2. r4\fermata |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Is it a sin, __ is it a crime, __ lov -- ing you dar, __ like i do? __ _ If it's a crime __ then I'm
	Guilt -- y, Guilt -- y of lov -- ing you. __ Guit -- y of dream -- ing of you. __
	What can I do, __ what can I say, __ af -- ter I've tak -- en the blame? You say you're thu, __
	you'll go your way __ but I'll al -- ways feel __ just the same. May -- be I'm right, __ may -- by I'm wrong.
	lov -- ing you dear, __ like I do. __ _ If it's a crime __ then I'm Gilt -- y, Guilt -- y of love -- ing you.
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {
	May -- be I'm wrong __ dream -- ing of you, __ dream -- ing the lone -- ly night thru, __ _
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1931 (Renewed 1958) Whiting Publishing and EMI Feist Catalog Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Hallelujah I Love Him (Her) So / Ray Charles"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Hallelujah I Love Him (Her) So" }
			\fill-line {
				""
				"Lyrics and Music by Ray Charles"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	f2 f/a | bes b4:dim7 c:7 | f2 f/a | bes b4:dim7 c:7 | \myEndLine
	f1 | f2.:7 f4:7.5+ | bes1 | b:dim7 | \myEndLine
	f2 a:7 | d:m bes:7 | g:7 c:7.11 | f1 | \myEndLine

	\myMark "B"
	bes1:6 | b:dim7 | f | f:7 | \myEndLine
	bes:7.9 | aes:9 | g:7 | c:7 | \myEndLine

	\myMark "A"
	f2 f/a | bes b4:dim7 c:7 | f2 f/a | bes b4:dim7 c:7 | \myEndLine
	f1 | f2.:7 f4:7.5+ | bes1 | b:dim7 | \myEndLine
	f2 a:7 | d:m bes:7 | g:7 c:7.11 | f bes:7 | f1 | \myEndLine

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

%% part "A"
	r8. c'16[ d8. c16] aes8.[ g16 f8. d16] | f4 f8 aes~ aes r r4 |
	r8. c16[ d8. c16] aes8.[ g16 f8. d16] | f4 f8 d~ d8. c16 r4 |
	r4 d'8. c16 aes8.[ g16 f8. d16] | f4 f8 f~ f r r4 |
	r8. d16[ f8. d16] f8.[ d16 f8. d16] | f4 f8 f~ f8.[ c16 d8. f16] |
	a8 c4. r4 a8. a16 | g8 f4. r4 aes8. g16 |
	aes8.[ g16 f8. d16] f4 f8 f~ | f r r4 r2 |

%% part "B"
	r8. d16[ f8. d16] f8.[ d16 f8. d16] | f8. f16 f4 r2 |
	r4 a d8.[ c16 a8. f16] | a4 f8 g~ g4 r |
	r f8. d16 f8.[ d16 f8. d16] | f4 f8 f~ f r r4 |
	r8. d16[ g8. d16] r2 | g8 a4 d8~ d4 c |

%% part "A"
	r4 d8. c16 aes8.[ g16 f8. d16] | f4 f8 aes~ aes r r4 |
	r4 d8. c16 aes8.[ g16 f8. d16] | f4 f8 d~ d8. c16 r4 |
	r8. c'16[ d8. c16] aes8.[ g16 f8. d16] | f4 f8 f~ f r r4 |
	r8. d16[ f8. d16] f8.[ d16 f8. d16] | f4 f8 f~ f8.[ c16 d8. f16] |
	a8 c4. r4 a8. a16 | g8 f4. r4 aes8. g16 |
	aes8.[ g16 f8. d16] f4 f8 f~ | f1~ | f2 r |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	_ Let me tell you 'bout a boy I know. __
	He is my ba -- by and he lives next door __ _
	Ev -- 'ry morn -- ing 'fore the sun comes up __
	he brings my cof -- fee in my fav -- 'rite cup __
	That's why I know, __ _ yes, I know, __ _ Hal -- le -- lu -- jah, I just love him so. __

%% part "B"
	Now if I call him on the tel -- e -- phone,
	and tell him that I'm all a -- lone, __
	by the time I count from one to four, __
	I hear him on my door. __ _

%% part "A"
	In the eve -- ning when the sun goes down, __
	when there is no -- bod -- y else a -- round __ _
	he kiss -- es me __ _ and he holds me tight. __
	He tells me "\"Ba" -- by ev -- 'ry -- thing's all "right.\""
	That's why I know, __ _ yes, I know. __ _ Hal -- le -- lu -- jah, I just love him so. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1956 & 1959 by Hill & Range Snogs, Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Have you met Miss Jones? / Richard Rodgers, Lorenz Hart"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Have you met Miss Jones?" }
			\fill-line {
				"Lyrics by Lorenz Hart"
				"Music by Richard Rodgers"
			}
			\fill-line {
				"Medum Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f1:maj7 | fis:dim7 | g:m7 | c:7 | \myEndLine
	a:m7 | d:m7 | g:m7 | c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f:maj7 | fis:dim7 | g:m7 | c:7 | \myEndLine
	a:m7 | d:m7 | c:m7 | f:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	bes:maj7 | aes2:m7 des:7 | ges1:maj7 | e2:m7 a:7 | \myEndLine
	d1:maj7 | aes2:m7 des:7 | ges1:maj7 | g2:m7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f1:maj7 | fis:dim7 | g:m7 | c2:7 bes:7 | \myEndLine
		a:m7 d:7.9- | g:m7 c:7 |
	} \alternative {
		{
			f d:m7 | g:m7 c:7 | \myEndLineVoltaNotLast
		}
		{
			f1*2 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 160
	\time 4/4
	\key f \major

%% part "A"
	\repeat unfold 2 {
		a'4 d, c d | c2. r4 | d e f g | a bes c2 |
		d4 g, f g | f2. a4 |
	} \alternative {
		{ bes1~ | bes2. r4 |}
		{ c1~ | c4 d d d | }
	}

%% part "B"
	c4 bes f g | aes aes aes aes | aes ges des ees | e! e e e |
	e d fis a | des2 des | bes1~ | bes2. r4 |

%% part "A"
	\repeat volta 2 {
		a4 d, c d | c2. r4 | d e f g | a bes c d |
		e1~ | e4 d a g |
	} \alternative {
		{
			f1 | r |
		}
		{
			f1~ | f2. r4 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	"\"Have" You Met Miss "Jones?\"" Some one said as we shook hands.
	She was just Miss Jones to me. __

%% part "A"
	Then I said "\"Miss" Jones, You're a girl who un -- der -- stands,
	I'm a man who must be "free.\"" __

%% part "B"
	And all at once I lost my breath,
	and all at once was scared to death,
	and all at once I owned the earth and sky! __

%% part "A"
	Now I've met Miss Jones, and we'll keep on meet -- ing till we die, __
	Miss Jones and I.

	I. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1937, by Chappell & Co., Inc. Copyright Renewed" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Heart And Soul / Frank Losser, Hoagy Carmichael"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Heart And Soul" }
			\fill-line {
				""
				"Lyrics and Music by Frank Losser, Hoagy Carmichael"
			}
			\fill-line {
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\myMark "A"
	\startPart
	f2 d:m7 | g:m7 c:7 | f d:m7 | g:m7 c:7 | \myEndLine
	f d:m7 | g:m7 c:7 | f1 | g2:m7 c:9 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f d:m7 | g:m7 c:7 | f d:m7 | g:m7 c:7 | \myEndLine
	f d:m7 | g:m7 c:7 | f1 | f2. f4:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	bes2 a:7 | d:7 g:7 | c:7 f:7 | e:7 a:7 | \myEndLine
	bes a:7 | d:7 g:7 | c:9 f:7 | e:7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f d:m7 | g:m7 c:7 | f d:m7 | g:m7 c:7 | \myEndLine
	f d:m7 | g:m7 c:7 | a:7 d:7 | g:m7 g4:7 c:7 | f1~ | f | \myEndLine
	\endPart

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante Moderato" 4 = 88
	\time 2/2
	\key f \major

%% part "A"
	f4 f f2~ | f8 f e d e f g4 | a a a2~ | a8 a g f g a bes4 |
	c2 f, | r8 d' c bes a4 g | f2~ f8 g a bes | c4 bes8 a g2 |

%% part "A"
	f4 f f2~ | f8 f e d e f g4 | a a a2~ | a8 a g f g a bes4 |
	c2 f, | r8 d' c bes a4 g | f2~ f8 g a bes | c4 f,2. |

%% part "B"
	r8 d' c bes a4. g8 | fis2 g | e f | d e |
	r8 d' c bes a4. g8 | fis2 g | e f | d e4. c8 |

%% part "A"
	f4 f f2~ | f8 f e d e f g4 | a a a2~ | a8 a g f g a bes4 |
	c2 f, | r8 d' c bes a4 g | a1 | r8 bes a g f4 e | f1~ | f2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Heart and soul, __ I fell in love with you Heart and Soul, __ the way a fool would do,
	Mad -- ly, be -- case you held me tight __ and stole a kiss in the night.

%% part "A"
	Heart and soul, __ I begged to be a -- dored; Lost con -- trol, __ and tum -- bled o -- ver -- board
	Glad -- ly, that mag -- ic night we kissed. __ there in the moon -- mist.

%% part "B"
	Oh! but your lips were thrill -- ing, much too thirll -- ing. Nev -- er be -- fore were
	mine so strange -- ly will -- ing. But

%% part "A"
	now I see __ what one em -- brace can do. Look at me, __ it's got me love -- ing you, Mad -- ly
	that lit -- tle kiss your stole Heald all my heart and soul. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts











\bookpart {

% this causes the variables to be defined...
















% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Here's That Rainy Day / James Van Heusen, Johnny Burke"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Here's That Rainy Day" }
			\fill-line {
				"Lyrics by Johnny Burke"
				"Music by James Van Heusen"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		g2.:maj9 g4:maj9/fis | bes2:7/f e:7.5- | ees1:maj7 | ees:6 | \myEndLine
		a:m7 | d2.:7 d4:7.5-.9- | g1:maj7 | d2:m7 g:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		c1:m7 | f:9 | bes2.:maj7 e4:9 | ees1:maj7 | \myEndLine
		a:m7 | d2.:9 d4:7.9- | g1:maj7 | a2:m7 d:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		g2.:maj9 g4:maj9/fis | bes2:7/f e:7.5- | ees1:maj7 | ees:6 | \myEndLine
		a:m7 | d2.:7 d4:7.5-.9- | g1:maj9 | d2:m7 g:9.5+ | \myEndLine
		\endPart

		\myMark "C"
		\startPart
		c1:maj7 | a2:m7 d4:7 d:7/c | b2:m7 e:m7 | a:7.5- a:7 | \myEndLine
		a1:m7 | d2:7 a4:m7 d:7.9- |
	} \alternative {
		{
			g2 e:m7 | a:m7 d:9 | \myEndLineVoltaNotLast
		}
		{
			g1 | bes:6 | ees2:maj7 aes:maj7 | g1:6 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}







% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key g \major

	\repeat volta 2 {

	%% part "A"
		d4 d2 d4 | d f bes d | d2 c4. b!8 | c1 |
		d,4 d2 d4 | d fis a c | b1~ | b2. r4 |

	%% part "B"
		ees2 ees | ees4 g, aes a | d2 f,4 fis | g2 f4 g |
		c c8 c c4 c8 c | c4 e, eis fis | b1~ | b2. r4 |

	%% part "A"
		d,4 d2 d4 | d f bes d | d2 c4. b!8 | c1 |
		d,4 d2 d4 | d fis a c | b1~ | b2. r4 |

	%% part "C"
		e4 e2 e4 | e a, b c | d2 fis,4 g | a1 |
		d,4 d2 d4 | d fis a b |
	} \alternative {
		{
			g1~ | g4 r r2 |
		}
		{
			g1~ | g~ | g~ | g2. r4 |
		}
	}
}






}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	May -- be I should have saved those left -- ov -- er dreams;
	fun -- ny, but Here's That Rain -- y Day. __

%% part "B"
	Here's That Rain -- y Day they told me a -- bout,
	and I laughed at the thought that it might turn out this way. __

%% part "A"
	Where is that worn out wish that I threw a -- side,
	Af -- ter it brought my lov -- er near? __

%% part "C"
	Fun -- ny how love be -- comes a cold rain -- y day.
	Fun -- ny that rain -- y day is here. __
%% volta
	here. __
}





	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1953 by BOURCE CO. and DORSEY BROS. MUSIC, INC. Copyright Renewed." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Honeysuckle Rose / Thomas 'Fats' Waller, Andy Razaf"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Honeysuckle Rose" }
			\fill-line {
				"Lyrics by Andy Razaf"
				"Music by Thomas 'Fats' Waller"
			}
			\fill-line {
				"Medium, with a lift"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		g2:m7 c:7 | g:m7 c:7 | g:m7 c:7 | g:m7 c:7 | \myEndLine
		f d:m7 | g2:m7 c:7 | f1 | a2:m7.5- d:7.9- | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		g:m7 c:7 | g:m7 c:7 | g:m7 c:7 | g:m9 c:7 | \myEndLine
		f aes:dim7 | g:m7 c:7 | f des:7 | g:m7 f | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		f:7 c:m7 | f:dim f:7 | bes f:9 | ges4:9 f:9 bes2 | \myEndLine
		g:7 d:m7 | g:dim g:7 | c:7 g:m7 | aes4:9 g:9 c2:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		g:m7 c:7 | g:m7 c:7 | g:m7 c:7 | g:m9 c:7 | \myEndLine
		f gis:dim7 | g:m7 c:7 |
	} \alternative {
		{
			f1 | a2:m7.5- d:7.9- | \myEndLineVoltaNotLast
		}
		{
			f2 des:7 | g4:m7 ges:7 f2:6 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key f \major

	\repeat volta 2 {

	%% part "A"
		c'8 bes d, f a2 | c8 bes d, f a2 | c8 bes d, f a4 a | a2 a8 g f d |
		f4 f f2~ | f a8 g f d | f1~ | f4 r r2 |

	%% part "A"
		c'8 bes d, f a2 | c8 bes d, f a2 | c8 bes d, f a4 a | a2 a8 g f d |
		f4 f f2~ | f a8 g f d | f1~ | f4 r r2 |

	%% part "B"
		f2 g | gis a | r4 bes8 c~ c bes c4 | des c8 bes~ bes2 |
		g a | ais b | r4 c8 d~ d c d4 | ees d8 c~ c2 |

	%% part "A"
		c8 bes d, f a2 | c8 bes d, f a2 | c8 bes d, f a4 a | a2 a8 g f d |
		f4 f f2~ | f a8 g f d |
	} \alternative {
		{
			f1~ | f4 r4 r2 |
		}
		{
			f1~ | f2~ f8 r8 r4 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Ev -- 're hon -- ey bee fills with jeal -- ous -- y when they see you out with me, I don't blame them, good -- ness knows, __
	Hon -- ey -- sucke -- le Rose. __ When you're pass -in' by, flow -- ers droop and sigh, and I know the rea -- son
	why; You're much sweet -- er good -- ness knows, __ Hon -- ey -- suck -- le Rose. __ Don't buy sug -- ar,
	you just have to touch my cup. __ You're my sug -- ar, it's sweet when you stir it up. __
	When I'm tak -- in' sips from your tas -- ty lips, seems the hon -- ey fair -- ly drips. You're con -- fec -- tion, good -- ness knows, __
	Hon -- ey -- suck -- le rose. __
	Rose. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1929 Santly Bros., Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "How Deep Is the Ocean / Irving Berlin"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "How Deep Is the Ocean" }
			\fill-line { \large \smaller \bold \larger "How High Is the Sky" }
			\fill-line {
				""
				"Lyrics and Music by Irving Berlin"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\myMark "A"
	\startPart
	c1:m7 | d2:m7.5- g:7 | c1:m7 | a2:m7.5- d:7 | \myEndLine
	g1:m7 | a2:m7.5- d:7 | g:m7 c:7 | f:m7 bes:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	ees1:maj7 | bes2:m7 ees:7 | aes1:7 | aes:7 | \myEndLine
	c:m7.5- | f:7 | bes:7 | d2:m7.5- g:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c1:m7 | d2:m7.5- g:7 | c1:m7 | a2:m7.5- d:7 | \myEndLine
	g1:m7 | a2:m7.5- d:7 | g:m7 c:7 | f:m7 bes:7 | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	ees1:7 | g2:m7.5- c:7 | f1:m7 | aes2:m7 des:7 | \myEndLine
	ees1:maj7 | f:7 | f2:m7 bes:7 | ees1:maj7 | \myEndLine
	\endPart

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 88
	\time 4/4
	\key ees \major

%% part "A"
	r4 ees \tuplet 3/2 { ees d ees } | g4 g2. | r4 ees \tuplet 3/2 { ees d ees } | g2. r4 |
	r4 bes \tuplet 3/2 { bes a bes } | c4 c2. | r4 bes \tuplet 3/2 { bes a bes } | c1 |

%% part "B"
	r4 ees ees ees | ees8 bes4 bes8~ bes4 bes4 | bes ges ges ges~ | ges1 |
	ges4 ees ees ees~ | ees d2 ees4 | ges f f f~ | f2 r |

%% part "A"
	r4 ees \tuplet 3/2 { ees d ees } | g4 g2. | r4 ees \tuplet 3/2 { ees d ees } | g2. r4 |
	r4 bes \tuplet 3/2 { bes a bes } | c4 c2. | r4 bes \tuplet 3/2 { bes a bes } | c1 |

%% part "C"
	r4 ees ees des | des c c bes | r aes \tuplet 3/2 { aes g f } | aes1 |
	r4 g \tuplet 3/2 { g f ees } | g4 g2. | r4 f \tuplet 3/2 { f ees d } | ees2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	How much do I love you? I'll tell you no lie.
	How Deep Is The O -- cean, how high is the sky?

%% part "B"
	How man -- y times a day __ do I think of you? __
	How man -- y ros -- es are sprink -- led with dew? __

%% part "A"
	How far would I trav -- el to be whre you are?
	How far is the jour -- ney for here to a star?

%% part "C"
	And if I ev -- er lost you, how much would I cry?
	How Deep Is The O -- cean, how high is the sky?
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1932 Irving Berling (Renewed)" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts










\bookpart {

% this causes the variables to be defined...















% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "How High The Moon / Morgan Lewis, Nancy Hamilton"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "How High The Moon" }
			\fill-line {
				"Lyrics by Nancy Hamilton"
				"Music by Morgan Lewis"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 2. s2. |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		g1*2:maj7 | g1:m7 | c:7 | \myEndLine
		f1*2:maj7 | f1:m7 | bes:7 | \myEndLine
		ees:maj7 | a2:m7.5- d:7 | g1:m7 | a2:m7.5- d:7 | \myEndLine
		g1:maj7.9 | a2:m d:7 | b:m7 bes:7 | a:m7 a4:m7/d d:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		g1*2:maj7 | g1:m7 | c:7 | \myEndLine
		f1*2:maj7 | f1:m7 | bes:7 | \myEndLine
		ees:maj7 | a2:m7.5- d:7 | g1:maj7 | a2:m7 d:7.9- | \myEndLine
		b:m7 bes:7 | a:m7 a4:m7/d d:7.9- |
	} \alternative {
		{
			g1:6 | d2:7 a4:m7/d d:7 | \myEndLineVoltaNotLast
		}
		{
			g1*2 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}






% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key g \major

	\partial 2. d4 g a |

	\repeat volta 2 {

	%% part "A"
		a2 b~ | b4 d, g a | bes1~ | bes4 c, f g |
		g2 a~ | a4 c, f g | aes1~ | aes4 d, ees f |
		g g g g | g g8 a~ a g a4 | bes1~ | bes4. a8~ a g a4 |
		b!1~ | b4 a b c | d d d d | d d, g a |

	%% part "B"
		a2 b~ | b4 d, g a | bes1~ | bes4 c, f g |
		g2 a~ | a4 c, f g | aes1~ | aes4 d, ees f |
		g g g g | g g8 a~ a g a4 | b1~ | b4 a b c |
		d d d d | d d, g a |
	} \alternative {
		{
			g1 | r4 d g a |
		}
		{
			g1~ | g2. r4 |
		}
	}
}





}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Some -- where there's mu -- sic, __
	how faint the tune! __
	Some -- where there's heav -- en, __
	How High The Moon! __
	There is no moon a -- bove when love is far __ a -- way too, __
	'till __ it comes true __
	that you love me as I love you.

%% part "B"
	Some -- where there's mu -- sic, __
	it's where you are. __
	Some -- where there's heav -- en, __
	how near, how far! __
	The dark -- est night would shine if you would come __ to me soon. __
	Un -- til you will, how still my heart,
	How High The Moon!
%% Volta
	Some -- where there's
	Moon! __
}




	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1940 by Chappell & Co., Inc. Copyright Renewed." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts












\bookpart {

% this causes the variables to be defined...

















% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "How Insensitive / Antonio Carlos Jobim, Vincius De Moraes, Norman Gimbel"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "How Insensitive" }
			\fill-line { \large \smaller \bold \larger "Insensatez" }
			\fill-line {
				"Lyrics by Vincius De Moraes, Norman Gimbel"
				"Music by Antonio Carlos Jobim"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	






\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		d1*2:m7 | des:dim7 | \myEndLine
		c:m6 | g:7 | \myEndLine
		bes:maj7 | ees:maj7 | \myEndLine
		e1:m7.5- | a:7.9- | d:m7 | des:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		c1*2:m7 | b:dim7 | \myEndLine
		bes1:maj7 | e2:m7.5- a:7.9- | d1.:m7 des2:7 | \myEndLine
		c1:m7 | f:7 | b:m7 | e:7.9- | \myEndLine
		g:m6 |
	} \alternative {
		{
			a:7 | d:m7 | e2:m7.5- a:7.9- | \myEndLineVolta
		}
		{
			a1:7 | d2:m d:m6 | d1:m6 | \myEndLineVolta
		}
	}
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 







{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key d \minor

	\repeat volta 2 {

	%% part "A"
		a'1~ | a4 bes8 a~ a bes4 a8~ | a1~ | a4 bes8 a~ a bes4 a8~ |
		a2~ a8 gis4 a8 | c b4 bes8~ bes a4 a8~ | a4. g8~ g2~ | g2~ g4. g8~ |
		g1~ | g4 a8 g~ g a4 g8~ | g1~ | g4 a8 g~ g a4 g8~ |
		g2 r8 fis4 g8 | bes a4 gis8~ gis g4 g8~ | g4. f8~ f2~ | f~ f4. f8~ |

	%% part "B"
		f1~ | f4 g8 f~ f g4 f8~ | f1~ | f4 g8 f~ f g4 a8~ |
		a2. f4 | d e8 d~ d e4 f8~ | f2 f~ | f~ f4. f8~ |
		f1~ | f4 g8 f~ f g4 e8~ | e1~ | e4 f8 e~ e f4 e8~ |
		e2 r8 dis e g~ |
	} \alternative {
		{
			g fis4 f8~ f e4 e8~ | e4. d8~ d2~ | d4 r r2 |
		}
		{
			g8\repeatTie fis4 f8~ f e4 e8~ | e4. d8~ d2~ | d2.\fermata r4 |
		}
	}
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	








% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

%% part "A"
	How __ In -- sen -- __ si -- tive __ I must __ have seemed __ when she told me that __ she loved __ me. __
	How __ un -- moved __ and cold __ I must __ have seemed __ when she told me so __ sin -- cere -- __ ly. __
	Why, __ she must __ have asked, __ did I __ just turn __ and stare in i -- __ cy si -- lence? __
	What __ was I __ to say? __ What can __ you say __ when a love __ af -- fair __ is o -- __ ver? __

%% part "Volta"
	_ af -- fair __ is o -- __ ver? __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	









\lyricmode {

%% part "B"
	Now, __ she's gone __ a -- way __ and I'm __ a -- lone __ with the mem -- 'ry of __ her last __ look. __
	Vague __ _ drawn __ and sad, __ I see __ it still, __ all her heart- break in __ that last __ look. __
	How, __ she must __ have asked, __ could I __ just turn __ and stare in i -- __ cy si -- lence? __
	What __ was I __ to do? __ What can __ one do __ when a love __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1963, 1964 by Antonio Carlos Jobim and Vincius De Moraes, Brazil" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "I Can't Give You Anything But Love / Jimmy McHugh, Dorothy Fields"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "I Can't Give You Anything But Love" }
			\fill-line {
				"Lyrics by Dorothy Fields"
				"Music by Jimmy McHugh"
			}
			\fill-line {
				"Dreamily"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\myMark "A"
	\startPart
	g1 | g2/b bes:dim7 | a1:m7 | d:7 | \myEndLine
	g | g2 e:m7 | a1:m7 | d:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	g:7 | g:7 | c:maj7 | c4:maj7 c:7 b:7 bes:7 | \myEndLine
	a1:7 | a:7 | d:7 | d:7 | \myEndLine
	\endPart

	\myMark "A'"
	\startPart
	g | g2/b bes:dim7 | a1:m7 | d:7 | \myEndLine
	d:m7 | g:7 | c:maj7 | c:maj7 | \myEndLine
	c:maj7 | cis:dim7 | g:maj9/d | e:7 | \myEndLine
	a:m7 | a2:7 d:7 | g4 g/b c c:m | g/d d:7 g2:6 | \myEndLine
	\endPart

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante Moderato" 4 = 88
	\time 4/4
	\key g \major

%% part "A"
	g'4 fis e g | fis e g e | a1 | a8 ais b2. |
	g4 fis e g | fis e g b | d1 | b8 bes a2. |

%% part "B"
	g8 gis a2. | a8 ais b2. | d4 c b a~ | a1 |
	a8 ais b2. | b8 c cis2. | e4 d c b | d c e, fis |

%% part "A"
	g fis e g | fis e g e | a1 | a8 ais b2. |
	d4 c b d | c b d c | b1 | a4 g2. |
	e4 fis g fis | a g fis g | d'1 | fis,4 e2. |
	dis4 e d' c | e e b b | g1~ | g2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	I can't give you an -- y thing but love Ba -- _ by; that's the on -- ly thing I've plen -- ty of,
	Ba -- _ by. Dream a -- while, scheme a -- while we're sure to find __ hap -- pi -- ness and, I guess,
	all those things you've al -- ways pined for. Gee, I'd love to see you look -- ing swell, Ba -- _ by;
	Dia -- mond brace -- lets Wool -- worth does -- n't sell, Ba -- by. 'till that luck -- y day, you know damed
	well, Ba -- by I can't give you an -- y -- thing but love. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "I Concentrate On You / Cole Porter"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "I Concentrate On You" }
			\fill-line {
				""
				"Lyrics and Music by Cole Porter"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		ees1:6 | ees:maj7 | bes1*2:7 | ees1:m7 | des2:m7 ges:9 | ces1:6 | aes2:m7 aes:m7/ges | \myEndLine
		f1:m7.5- | bes:7 | ees:m6 | c:m7.5- | f:7 | bes:7 | ees:6 | f2:m7 bes:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		ees1:6 | ees:maj7 | bes1*2:7 | ees1:m7 | des2:m7 ges:9 | ces1:6 | ces2:6 ces/bes | \myEndLine
		aes1:m7 | des:7 | ges:maj7 | b:maj7 | f:7 | bes:7 | ees2:6 aes:6 | ees ees:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		aes1:maj7 | aes:m7 | ees | g2:m7 c:7 | f1:m7 | bes:7 | ees:maj7 | ees:7 | \myEndLine
		aes:maj7 | des:7 | ges2:maj7 ges/f | ees:m7 ees:m/des | c1:m7.5- | f:7 | bes2 bes:maj7 | bes1:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		ees | ees:maj7 | a:m7.5- | d:7 | bes:m7 | ees2:7 aes:maj7 | d1:m7.5- | g:7 | \myEndLine
		g:m7.5- | c:7.5+ | f:m | fis:dim7 | f:7.5-/ces | bes:7 |
	} \alternative {
		{
			ees | f2:m7 bes:7 | \myEndLineVoltaNotLast
		}
		{
			ees2:6 aes:6 | ees1:6 | f1*2:m7 | bes1:7.9- | bes2:7.9- e:9 | ees1*4:6.9 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key ees \major

	\repeat volta 2 {

	%% part "A"
		r4 bes c ees | d2. c4 | d4. d8 d2~ | d2. r4 | r ees \tuplet 3/2 { ges aes bes } | aes2. ges4 | aes1~ | aes2. r4 |
		r aes \tuplet 3/2 { aes bes ces } | bes a aes2 | r4 aes ges f | ges1 | r4 f aes g | ges f2 ees4~ | ees1~ | ees2. r4 |

	%% part "A"
		r bes c ees | d2. c4 | d4. d8 d2~ | d2. r4 | r ees \tuplet 3/2 { ges aes bes } | aes2. ges4 | aes1~ | aes2. r4 |
		r aes \tuplet 3/2 { ces des ees } | des c! ces2 | r4 b bes a | bes1 | r4 f aes g | ges f2 ees4~ | ees1~ | ees4 r ees ees |

	%% part "B"
		c'2. c4 | b2. b4 | b2 bes2~ | bes bes,4. bes8 | aes'2. aes4 | aes2 g4. fis8 | g1~ | g2 ees4. ees8 |
		c'2 c4 c | ces2 \tuplet 3/2 { ces4 des ces } | ces2 bes~ | bes4 bes bes bes | bes2. bes4 | c2. bes8 c | d1~ | d2. r4 |

	%% part "A"
		r ees ees ees | d2. bes4 | c4. c8 c2~ | c2. r4 | r c b c | bes!2 \tuplet 3/2 { bes,4 c ees } | g1~ | g2. r4 |
		r g bes a | aes!2. g4 | g f e4. f8 | c'1 | r4 f, aes g | ges f2 ees4~ |
	} \alternative {
		{
			ees1~ | ees2. r4 |
		}
		{
			ees1~ | ees2 ees | f4. f8 f2~ | f f | g4. g8 g2~ | g bes | bes1~ | bes~ | bes4 r r2 | r1 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	When -- ev -- er skies look grey to me __
	and trou -- ble be -- gins to brew, __
	when -- ev -- er the win -- ter winds be -- come too strong,
	I Con -- cen -- trate On You. __

%% part "A"
	When for -- tune cries "\"nay," "nay!\"" to me __
	and peo -- ple de -- clare "\"You're" "through,\"" __
	when -- ev -- er the blues be -- come my on -- ly song,
	I Con -- cen -- trate On You. __

%% part "B"
	On your smile so sweet, so ten -- der, __
	when at first my kiss you de -- cline. __
	On the light in your eyes,
	when you sur -- ren -- der __ and once a -- gain our arms in -- ter -- twine. __

%% part "A"
	And so when wise -- men say to me __
	that love's young dream nev -- er comes true. __
	To prove that e -- ven wise -- men can be wrong,
	I Con -- cen -- trate On You. __
	_ I con -- cen -- trate, __ and con -- cen -- trate __ on you. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1939 by Chappell & Co., Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "I Could Have Danced All Night / Frederick Loewe, Alan Jay Lerner"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "I Could Have Danced All Night" }
			\fill-line { \large \smaller \bold \larger "From 'My Fair Lady'" }
			\fill-line {
				"Lyrics by Alan Jay Lerner"
				"Music by Frederick Loewe"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 2. s2. |

	\myMark "A"
	\startPart
	c1*2 | c:maj7 |
	c:maj7 | c:6 | \myEndLine
	c1*4:maj7 |
	d1*2:m7 | g:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	d:m | d1:m7+ | d:m7 |
	d1*2:m7 | g:7 | \myEndLine
	d:m7/g | d1:m7 | g:7 |
	c1*2:maj7 | c:6 | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	e | fis1:m7 | b:7 |
	e1*2:maj7 | e:6 | \myEndLine
	g:maj7 | a1:m7 | d:7.9- |
	g1*2:9 | g2:9 f | c/e d:m7 | \myEndLine
	\endPart

	\myMark "D"
	\startPart
	c1*2 | c:maj7 |
	f1*4:6 | \myEndLine
	d1*2:m7 | d:m7/g |
	d1:m7/g | g:7 | c1*2 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Prestissimo" 4 = 240
	\time 2/2
	\key c \major

	\partial 2. c4 e g |

%% part "A"
	c1~ | c2 b | b1~ | b4 b, e g |
	b1~ | b2 a | a1~ | a2 g |
	e1~ | e2 f | g1~ | g2 a |
	d,1~ | d~ | d | r4 d f a |

%% part "B"
	d1~ | d2 cis | cis1~ | cis4 c, f a |
	c1~ | c2 b | b1~ | b2 a |
	f1~ | f2 g | a1~ | a2 a |
	e1~ | e~ | e | r4 e fis gis |

%% part "C"
	b1~ | b4 e, fis gis | a1~ | a2 b |
	gis1 | gis~ | gis~ | gis4 g a b |
	d1~ | d2 g, | a1 | c |
	b1~ | b~ | b4 r c2 | c c |

%% part "D"
	c1~ | c2 b | b1~ | b4 e, g b |
	d1~ | d2 c | c1~ | c4 f, a c |
	e1 | d | f~ | f4 r r2 |
	r1 | b, | c~ | c4 r r2 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	I Could Have Danced __ All Night __
	I Could Have Danced __ All Night! __
	and still __ have begged __ for more. __

%% part "B"
	I could have spread __ my wings __
	and done a thou -- sand things __
	I've nev -- er done __ be -- fore. __

%% part "C"
	I'll nev -- er know __ what made it so __
	ex -- cit -- ing, __
	why all at once __ my heart took flight. __

%% part "D"
	I on -- ly know __ when he __
	be -- gan to dance __ with me. __
	I could have danced, danced, danced, __
	all night. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1956 by Alan Jay Lerner & Frederick Loewe. Copyright Renewed" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "I Could Write A Book / Richard Rodgers, Lorenz Hart"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "I Could Write A Book" }
			\fill-line { \large \smaller \bold \larger "From 'Pal Joey'" }
			\fill-line {
				"Lyrics by Lorenz Hart"
				"Music by Richard Rodgers"
			}
			\fill-line {
				"Ballad"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 2 s2 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		c2:maj7 a:m7 | d:m7 g:7 | c1:maj7 | c2:maj7 g:7 | \myEndLine
		c:maj7 g:7 | c:maj7 cis:dim7 | d1:m7 | g:7 | \myEndLine
		\endPart
	} \alternative {
		{

			\myMark "B"
			\startPart
			c2/e aes:7/ees | d:m7 g:7 | a:m7 d:7.9- | g2.:maj7 b4:7 | \myEndLine
			e1:m | a2:m7 d:7 | d1:m7 | g:7 | \myEndLineVolta
			\endPart
		}
		{

			\myMark "C"
			\startPart
			a2:m a:m7+ | a:m7 a:m6 | g2:m7 c:7 | f:maj7 f4:m7 bes:7 | \myEndLine
			c2:maj7 a:7 | d:m7 g:7 | c1:6 | \LPC d2:m7 \RPC g:7 | \myEndLineVolta
			\endPart
		}
	}

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

	\partial 2 e4 f |

%% part "A"
	\repeat volta 2 {
		g2 b | a4 g e d | e1~ | e4 g e d |
		e g e d | e c'2 e,4 | g1~ | g2 a4 b |
	} \alternative {
		{

		%% part "B"
			c2 c | c4 d2 b4 | a2 a | g e4 fis |
			g2 g | g4 a2 fis4 | g1~ | g4 r e f |
		}
		{

		%% part "C"
			c'2 c | c4 d2 b4 | bes2 bes | a g4 f |
			e2 e | d4 c'2 b4 | c1 | r2 e,4 f |
		}
	}
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% these are lyrics from the fake book adjusted for the real book
\lyricmode {

%% part "A"
	If they asked me I Could Write A Book, __
	a -- bout the way you walk and whis -- per and look, __
	I could

%% part "B"
	write a pre -- face on how we met,
	so the world would nev -- er for -- get, __

	and the
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	_ _ sim -- ple se -- cret of the plot __
	is just to tell them that I love you a -- lot, __
	then the

%% part "B"
	_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

%% part "C"
	world dis -- cov -- ers as my book ends,
	how to make two lov -- ers of friends.

%% part "Reprise"
	If they
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1940, Chappell & Co., Inc. Copyright Renewed." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "I Don't Want To Set The World On Fire / Eddie Seiler, Sol Marcus, Bennie Benjamin"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "I Don't Want To Set The World On Fire" }
			\fill-line {
				""
				"Lyrics and Music by Eddie Seiler, Sol Marcus, Bennie Benjamin"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		f1 | f2:/a aes:dim7 | g1:m | g2:m bes:m | \myEndLine
		c1:7 | g2:m9 c:7 | a:7 d:7 | g:7 c:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		f1 | f2:/a aes:dim7 | g1:m | g2:m bes:m | \myEndLine
		c1:7 | g2:m9 c:7 | f2 ees4:6 e:6 | f1:6 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		c2:m7 f:7 | c:m7 f:7 | bes1*2:maj7 | \myEndLine
		d2:m g:7 | d:m g:7 | d:m g:7 | c:7 c:7.5+ | \myEndLine
		\endPart

		\myMark "A"
		f1 | f2:/a aes:dim7 | g1:m | g2:m bes:m | \myEndLine
		c1:7 | g2:m9 c:7 |
		\startPart
	} \alternative {
		{
			f aes:dim7 | g:m c:7 | \myEndLineVoltaNotLast
		}
		{
			f1*2 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key f \major

	\repeat volta 2 {

	%% part "A"
		a'4 c c,8. d16 f8. a16 | c2 ces | bes4 d2.~ | d2 bes |
		a8. c16 a8 c~ c2 | r4 a c8. cis16 d8 a~ | a1~ | a1 |

	%% part "A"
		a4 c c,8. d16 f8. a16 | c2 ces | bes4 d2.~ | d2 bes |
		a8. c16 a8 c~ c2 | r4 a c8. cis16 d8 f,~ | f1~ | f2. f4 |

	%% part "B"
		g8. g16 g8 d'~ d d4 f,8 | g8. g16 g8 d'~ d2 | c8. c16 bes8. bes16 a8. a16 d8. d16 | a2. g4 |
		a8. a16 a8 e'~ e e4 g,8 | a8. a16 a8 e'~ e2 | d8. cis16 d8. cis16 d8. cis16 \tuplet 3/2 { d8 dis e~ } | e4 d8 a~ a aes4. |

	%% part "A"
		a4 c c,8. d16 f8. a16 | c2 ces | bes4 d2.~ | d2 bes |
		a8. c16 a8 c~ c2 | r4 a c8. cis16 d8 f,~ |
	} \alternative {
		{
			f1 | r |
		}
		{
			f~ | f2. r4 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	I Don't Want To Set The World On Fire __ _
	I just want to start __
	a flame in your heart __

%% part "A"
	In my heart I have but one de -- sire __ _
	and that one is you __
	no oth -- er will do. __

%% part "B"
	I've lost all am -- bi -- tion for world -- ly ac -- claim
	I just want to be the one you love
	and with your ad -- mis -- sion that you feel the same. __
	I'll have reached the goal I'm dream -- ing of __
	be -- lieve __ me!

%% part "A"
	I Don't Want To Set The World On Fire __ _
	I just want to start __
	a flame in your heart __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1940 by Bergman, Vocco, & Conn, Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "I Got Plenty O' Nuttin' / George Gershwin, Ira Gershwin, DuBose Heyward"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "I Got Plenty O' Nuttin'" }
			\fill-line { \large \smaller \bold \larger "From 'Porgy and Bess'" }
			\fill-line {
				"Lyrics by Ira Gershwin, DuBose Heyward"
				"Music by George Gershwin"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		g2 a:m7 | b:m a:m7 | g a:m7 | g b:7 | e a | \myEndLine
		e a | e a4 e | cis1 | cis2 d | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		g2 a:m7 | b:m a:m7 | g a:m7 | g b:7 | e a | \myEndLine
		e a | e a4 e | cis1 | cis2 d | g2 a:m7 | b:m g | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		b:m e:m/b | b:m6 e:m/b | b:m e:m/b | b:m6 e:m/b | \myEndLine
		b:m e:m/b | b:m6 e:m/b | b:m a:m7 | d a:m7 | d1:7 | d:7 | \myEndLine
		\endPart

		\myMark "A'"
		\startPart
		g2 a:m7 | b:m a:m7 | g a:m7 | g b:7 | \myEndLine
		e a | e a | e a4 e | cis1 | cis | \myEndLine
		cis2 d | g a:m7 | g d:m7 | g a:m7 | \myEndLine
		g c |
	} \alternative {
		{
			g1 | g | b2:m a:m7 | \myEndLineVoltaNotLast
		}
		{
			g4 c2:7 d4:7 | g1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key g \major

	\partial 4 d4 |

	\repeat volta 2 {

	%% part "A"
		g4 g a g8 a | b8 d4.~ d4 r8 d, | b'4 b8 a~ a b a4 | g2 fis | e4 e cis4. r8 |
		e4 e cis4. cis8 | e4 e cis e | eis1~ | eis2 fis |

	%% part "A"
		g4 g a g8 a | b8 d4.~ d4 r | b4 b8 a~ a b a4 | g2 fis | e4 e cis8 cis4 cis8 |
		e8 e4 e8 cis cis cis cis | e4 e cis e | eis1~ | eis2 fis | g1~ | g2 r |

	%% part "B"
		fis4 d8 b d4 b8 d | fis2 e8 fis e b | d1~ | d4 r e8 fis e b |
		d4 b8 d fis2~ | fis e8 fis e b | d4 b8 d e4 c8 e | fis4 d8 fis g4 e8 g | a4 fis8 a c2~ | c r4 d, |

	%% part "A"
		g g a g8 a | b8 d4.~ d4 r8 d, | b'4 b8 a~ a b a4 | g2 fis |
		e4 e cis4. r8 | e4 e cis4. cis8 | e e4 e8 cis4 e | eis1 | \xNote { \tuplet 3/2 { b'4 b b } g e } |
		r2 fis4 fis | g1~ | g4 r f f | g1~ |
		g4 r e4 e |
	} \alternative {
		{
			g1~ | g2 r | r1 |
		}
		{
			g1~ | g4 r r2 |
		}
	}
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Oh, I Got Plen -- ty O' Nut -- tin', __ an' nut -- tin's plen -- ty fo' me. I got no car,
	got no mule, I got no mis -- er -- y. __ De

%% part "A"
	folks wid plen -- ty o' plen -- ty __ got a lock __ on de door, _
	faid some -- bod -- y's a go -- in' to rob 'em while dey's out a mak -- in' more. __
	What for? __

%% part "B"
	I got no lock on de door, (dat's no way to be.) __ Day kin steal de rug from de floor, __ dat's o -- keh wid
	me, 'cause de things dat I prize, like de stars in de skies, all are free. __

%% part "A"
	Oh, I Got Plen -- ty O' Nut -- tin; __
	an' nut -- tin's plen -- ty fo' me.
	I got a gal, got my song, got heb ben the whole day long.
	No use com -- plain -- in'! Got my gal, __ got my Lawd, __
	go my song. __
	song. __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
	got the sun, got the moon, _ got the deep blue sea. __ De folks wid plen -- ty o' plen -- ty __
	got to pray __ all de day, _ __ Seems wid plen -- ty you sure got to wor -- ry how to
	keep the debbel a -- way, __ a -- way. __ I ain't a -- fret -- tin' 'bout
	hell 'til de time ar -- rive. __ Nev -- er wor -- ry long as I'm well, __ nev -- er one to strive to be good, to be bad, what the hell?
	I is glad I's a live. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1935 by Gershwin Publishing Corporation" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "I Left My Heart In San Francisco / Geroge Cory, Douglass Cross"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "I Left My Heart In San Francisco" }
			\fill-line {
				"Lyrics by Douglass Cross"
				"Music by Geroge Cory"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\partial 2. s2. |

	\myMark "A"
	\startPart
	bes1 | d2:m7 cis:dim7 | c1:m7 | c:m7 |
	c:m7 | c2:m7/f f:7.5+ | bes1 |
	\endPart

	\myMark "B"
	\startPart
	bes2 c4:m7 cis:dim7 | bes1 | d2:m7 cis:dim7 | d1:m7 | d2:m7 d:7.9- |
	g1:m7 | c2:9 c:7.9- | f:9 b:dim7 | c:m7 f:7 |
	\endPart

	\myMark "A'"
	\startPart
	bes1 | d2:m7 cis:dim7 | c1:m7 |
	c:m7 | f:9 | f2:9 ees:9 | d1:7 |
	\endPart

	\myMark "C"
	\startPart
	d:7 | g2.:7.5+ g4:9 | g1:9 |
	c2. g4:m7 | c1:9 | c:m7 | c2:m7/f f:7.9- | bes2:6 aes4:6.9 a:6.9 | bes1:6.9 |
	\endPart

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante Moderato" 4 = 88
	\time 4/4
	\key bes \major

	d4 ees g | f1 | r4 g a4. bes8 | g c,4.~ c4 r | r c b c | g'1 | r4 bes a4. f8 |
	d2 r | r4 d ees e | f8 ees4 d16 ees f2~ | f4 r r g | a8 g4 f16 g a2~ | a4 a gis4. a8 |
	bes1~ | bes4 c a4. c,8 | f2 r4 g8 f | ees4 r8 d ees4 g | f1 | r4 g a bes | g8 c,4.~ c4 r |
	r c b c | a'1~ | a4 a bes c | d1 | r4 d cis4. d8 | ees2. d4 | b2 c4 d |
	c g2. | r4 g fis g | ees'2. g,4 | d'2 d | bes1~ | bes4 r r2 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	I Left My Heart In San Fran -- cis -- co, __ high on a hill, it calls to
	me. To be where lit -- tle ca -- ble cars __ climb half -- way to the stars! __ to morn -- ing
	fog __ may chill the air I don't care! My love waits there in San Fran -- cis -- co, __
	a -- bove the blue __ and wind -- y sea. When I come home to you San Fran -- cis-- co your gold -- en sun will sine for me. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1954 General Music Publishing Co., Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "I Love You / Cole Porter"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "I Love You" }
			\fill-line {
				""
				"Lyrics and Music by Cole Porter"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	g1:m7.5- | c:7.9- | f1*2:maj7 | \myEndLine
	g1:m7 | c:7 | f1*2:maj7 | \myEndLine
	g1:m7.5- | c:7.9- | f:maj7 | b2:m7 e:7 | \myEndLine
	a1:maj7 | b2:m7 e:7 | a1*2:maj7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	g1:m7 | c:7 | f1*2:maj7 | \myEndLine
	a1:m7.5- | d:7.9- | g:7 | c:7 | \myEndLine
	g1:m7.5- | c:7.9- | f:maj7 | a2:m7.5- d:7 | \myEndLine
	g1:7 | g2:m7 c:7 | f1*2:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 160
	\time 4/4
	\key f \major

	\partial 4 c'4 |

%% part "A"
	c2 des,~ | des bes'4. a8 | gis4. a8 a2~ | a r4 a |
	a2 bes,~ | bes \tuplet 3/2 { g'4 f e } | d1~ | d2 r4 c' |
	c2 des,~ | des4. bes'8 bes4. a8 | gis4. a8 a2~ | a a4 a |
	b4. cis8 cis2 | d2. e4 | e1~ | e2 r4 e |

%% part "B"
	f4. f8 f2~ | f4 e \tuplet 3/2 { e d c } | e4. e8 e2~ | e4 r c d |
	ees4. ees8 ees2~ | ees4. d8 c4 bes8 a | g1~ | g2 r4 c |
	c2 des,~ | des bes'4. a8 | gis4. a8 a2~ | a bes4 c |
	cis4. d8 d4 d, | a'2 a | f1 | r |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% these are lyrics from the internet adjusted for the real book
\lyricmode {

%% part "A"
	I love you __
	Hums the Ap -- ril breeze. __
	I love you __
	E -- cho the hills. __
	I love you __
	The gol -- den dawn ag -- rees __
	As once more she sees
	Daf -- fo -- dils. __

%% part "B"
	It's spring a -- gain __
	And birds on the wing a -- gain __
	Start to sing a -- gain __
	The old me -- lo -- dy. __
	I love you, __
	That's the song of songs __
	And it all be -- longs
	To you and me.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "If You Could See Me Now / Tadd Dameron, Carl Sigman"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "If You Could See Me Now" }
			\fill-line {
				"Lyrics by Carl Sigman"
				"Music by Tadd Dameron"
			}
			\fill-line {
				"Ballad"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		ees1:maj7 | aes:7 | ees:maj7 | aes:7 | \myEndLine
		g2:m7 fis4:m7 b:7 | f2:m7 bes:7 |
	} \alternative {
		{
			g:7.5+ c:7 | f:m7 bes:7 | \myEndLineVoltaNotLast
		}
		{
			a:m7.5- aes:m7 | g:m7 c4:m7 bes:m7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	a2:m7 d:7 | b:m7 e:7 | a:m7 d:7 | b:m7 e:7 | \myEndLine
	a:m7 c4:m7 f:7 | bes2:maj7 g:m7 | c:m7 f:7 | f:m7 bes:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees1:maj7 | aes:7 | ees:maj7 | aes:7 | \myEndLine
	g2:m7 fis4:m7 b:7 | f2:m7 bes:7 | ees \LPC ges:maj7 | b:maj7 e4:maj7 \RPC ees:maj7 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Adagio" 4 = 76
	\time 4/4
	\key ees \major

	\repeat volta 2 {

	%% part "A"
		d8 ees g bes d c bes g | bes a aes bes f2 | d8 ees g bes d c bes g | bes a aes bes f4. g8 |
		bes4 g8 bes b e, ees4 | c' aes8 f d'4. bes8 |
	} \alternative {
		{
			g1~ | g2. r4 |
		}
		{
			ees'1~ | ees |
		}
	}

%% part "B"
	d4 d8 d d4 e8 bes | \tuplet 3/2 { b4 b b } b c8 d | a4 a8 a a4 b8 c | d2. e,4 |
	b'8 a g a bes c d ees | f2 r8 d c bes | ees2 r8 c bes a | bes1 |

%% part "A"
	d,8 ees g bes d c bes g | bes a aes bes f2 | d8 ees g bes d c bes g | bes a aes bes f4. g8 |
	bes4 g8 bes b e, ees4 | c' aes8 f d'4. bes8 | ees1~ | ees2. r4 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	_ If you could see me now you'd know how blue I've been.
	_ One look is all you'd need to see the mood I'm in.
	Per -- haps then you'd re -- al -- ize
	I'm still in love with you. __

%% part "Volta"
	_

%% part "B"
	You'll happen my way on some mem -- 'ra -- ble day
	and the month will be May for a while.
	I'll try to smile but can I play the part with -- out my heart
	be -- hind the smile?

%% part "B"
	_ The way I feel for you I nev -- er could dis -- guise.
	_ The look of love is writ -- ten plain -- ly in my eyes.
	I think you'd be mine a -- gain
	if you could see me now. __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	_ If you could see me now you'd find me be -- ing brave,
	_ and try -- in aw -- f'lly hard to make my tears be -- have.
	But that's quite im -- pos -- si -- ble.
	I'm still in love with _ you. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "I'll Be Seeing You / Irving Kahal, Sammy Fain"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "I'll Be Seeing You" }
			\fill-line {
				""
				"Lyrics and Music by Irving Kahal, Sammy Fain"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		ees1 | g:7 | f2:m c:7 | f1:m | \myEndLine
		f2:m c:7 | f:m bes:7 | ees f:m7 | fis:dim7 ees/g | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		c1*2:m7 | f:m7 | \myEndLine
		bes1:7 | bes:7.5+ | ees:6 | bes:9.5+ | \myEndLine
		\endPart

		\myMark "A'"
		\startPart
		ees | g:7 | f2:m c:7 | f1:m | \myEndLine
		f2:m c:7 | f:m bes4:7 bes:7/aes | g1:m7.5- | c:7 | \myEndLine
		\endPart

		\myMark "C"
		\startPart
		f2:m d:m7.5- | g1:7 | c:m7 | f:9 | \myEndLine
		f:m7 | aes:m6 |
	} \alternative {
		{
			ees | f2:m7 bes4:7 bes:7.5+ | \myEndLineVoltaNotLast
		}
		{
			ees2 f4:m7 e:m7 | ees1:6 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 160
	\time 2/2
	\key ees \major

	\repeat volta 2 {

	%% part "A"
		g'2. f4 | f8 ees4 d8~ d4 ees | aes4. g8 g4. f8 | f4. e8 e4 f |
		as4. g8 g4. f8 | f4. e8 e4 f | fis8 g4 c8~ c2~ | c2. r4 |

	%% part "B"
		ees2. d4 | d8 c4 b8~ b4 c | ees2. d4 | d8 c4 b8~ b4 c |
		c2. bes4 | bes8 fis4 fis8~ fis4 d' | c8 g4 g8~ g4 c | fis,8 c4 c8~ c2 |

	%% part "A'"
		g'2. f4 | f8 ees4 d8~ d4 ees | aes4. g8 g4. f8 | f4. e8 e4 f |
		aes4. g8 g4. f8 | f4. e8 e4 f | bes4. aes8 aes4. g8 | g4. fis8 fis4 g |

	%% part "C"
	%% on the third bar we can do <g \parenthesize \tweak font-size #-1 g'>2.
		c4. c8 bes4 aes | d4. d8 c4 b | ees ees d c | g2. f8 g |
		aes aes aes aes aes2~ | aes8 aes bes ces bes4 aes |
	} \alternative {
		{
			ees'2. r4 | r1 |
		}
		{
			ees1~ | es2. r4 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	I'll Be See -- ing You __ in all the old fa -- mil -- iar plac -- es that this heart of mine em -- brac -- es all day thru. __

%% part "B"
	In that samll ca -- fe; __ the park a -- cross the way, __ the chil -- dren's ca -- rou -- sel, __ the
	chet -- nut -- trees, __ the wish -- ing well. __

%% part "A'"
	I'll Be See -- ing You __ in ev -- 'ry love -- ly sum -- mer's day, in ev -- 'ry -- thing that's
	light and gay, I'll al -- ways think of you that way.

%% part "C"
	I'll find you in the morn -- ing sun and when the night is new. I'll be
	look -- ing at the moon, __ but I'll Be See -- ing You!

%% part "Volta"
	You! __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1938 Williamson Music Co. Copyright Renewed." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts










\bookpart {

% this causes the variables to be defined...















% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "I'll Close My Eyes / Billy Reid, Buddy Kaye"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "I'll Close My Eyes" }
			\fill-line {
				"Lyrics by Buddy Kaye"
				"Music by Billy Reid"
			}
			\fill-line {
				"Medium Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	





\chordmode {
	\startChords
	\startSong

	\partial 8*5 s8 s2 |

	\myMark "A"
	\startPart
	f1*2:maj7 | e1:m7.5- | a:7.9- | \myEndLine
	d:m7 | g:7 | c:m7 | f:7 | \myEndLine
	bes:maj7 | ees:7 | f1*2:maj7 | \myEndLine
	b1:m7.5- | e:7 | a2:m7 aes:dim7 | g:m7 ges:7/c | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	f1*2:maj7 | e1:m7.5- | a:7.9- | \myEndLine
	d:m7 | g:7 | c:m7 | f:7 | \myEndLine
	bes:maj7 | ees:7 | a1:m7.5- | d:7.9- | \myEndLine
	g:m7 | c:7 | f2:maj7 d:7 | g:m7 c:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 






{
	\tempo "Allegro" 4 = 150
	\time 4/4
	\key f \major

	\partial 8*5 c8 bes'4 c8 a~ |

%% part "A"
	a1 | r4 r8 c, bes'4 a | a4 g8 e8~ e2 | r4 a, g'4 a8 f~ |
	f1 | r4 r8 f a4 f8 ees8~ | ees1 | r2 r4 ees |
	des d c'2 | r4 r8 bes f4 g | a1 | r2 r4 a |
	gis1 | r4 r8 e g4 f | e1 | r4 r8 c bes'4 c8 a~ |

%% part "B"
	a1 | r4 r8 c, bes'4 a | a4 g8 e8~ e2 | r4 a, g'4 a8 f~ |
	f1 | r4 r8 f a4 f8 ees8~ | ees1 | r2 r4 ees |
	des d c'2 | r4 r8 bes f4 g | a1 | r4 r8 a c4 b |
	bes4. d,8 e4 f | g2 a | f1~ | f2 r2 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	







\lyricmode {

%% part "A"
	I'll Close My Eyes __
	To eve -- ry -- one but you __
	And when I do __
	I'll_see_you stand -- ing there __

	I'll lock my heart
	To any_other ca -- ress
	I'll_never_say yes
	To_a_new love af -- fair

%% part "B"
	Then_I'll Close My Eyes __
	To eve -- ry -- thing that's gay __
	If you_are not there __
	Oh,_to_share_each love -- ly day __

	And through the years
	In_those moments When_we're_far apart
%%Do -- n't you know
	I'll Close My Eyes
	And I'll see you_with my heart __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "I'll Never Smile Again / Ruth Lowe"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "I'll Never Smile Again" }
			\fill-line {
				""
				"Lyrics and Music by Ruth Lowe"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 2. s2. |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		f1:m7 | bes:7 | ees2:maj7 f:m7 | g:m7 ges:dim7 | \myEndLine
		f1:m7 | bes:7 | ees | ees | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		b2:7.5+ bes:7 | ees1 | f2:m7.5- bes:7.5+ | ees2.:maj7 d4:9 | \myEndLine
		g2 d:7 | g ges:dim7 | f1:m7 | bes4:7 ees:maj7 g:m7 ges:dim | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		f1:m7 | bes:7 | ees2:maj7 f:m7 | g:m7 ges:dim7 | \myEndLine
		f1:m7 | bes:7 | ees:7 | ees:7 | \myEndLine
		\endPart

		\myMark "C"
		\startPart
		aes2.:maj7 aes4:6 | des1:9 | ees | g2:m7 c:7 | \myEndLine
		f1:m7 | f2:m7 b4:7.5+ bes:7 |
	} \alternative {
		{
			ees2 ges:dim7 | bes4:7/f ees:maj7 g:m7 ges:dim7 | \myEndLineVoltaNotLast
		}
		{
			ees1 | ees | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key ees \major

	\partial 2. bes'4 d c |

%% part "A"
	\repeat volta 2 {
		ees4. f,8 f2 | r8 f f g f4 ees | g1~ | g4 bes d c | ees4. f,8 f2~ | f4 g \tuplet 3/2 { f ees d } |
		c1~ | c2. c4 | g' g g g | ees2. g4 | bes bes bes bes | g2. b4 | d d d2~ | d d |
		bes1~ | bes4 bes d c | ees4. f,8 f2 | r8 f f g f4 ees | g1~ | g4 bes d c | ees4. f,8 f2~ |
		f4 g \tuplet 3/2 { f ees d } | g1~ | g2 r4 ees4 | g2. f4 | aes2. g4 | \tuplet 3/2 { d4 ees g } bes4 c | d2. c4 |
		ees4. f,8 f2 | r8 c d ees g4 g |
	} \alternative {
		{
			ees1 | r4 bes' d c |
		}
		{
			ees1~ | ees2. r4
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	I'll Nev -- er Smile A -- gain, un -- til I smile at you. __ I'll nev -- er laugh a -- gain, __ what good would it
	do? __ For tears would fill my eyes my heart would re -- a -- lize that our ro -- mance __ is
	trough, __ I'll nev -- er love a -- gain, I'm so in love with you. __ I'll nev -- er thrill a -- gain __
	to some -- bod -- y new. __ With -- in my heart I know I will nev -- er start to
	smile a -- gain un -- til I smil at you I'll ne -- ver

	you
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1939 MCA Music Publsihing, A Division of MCA inc,." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "I'll Remember April / Don Raye, Gene De Paul, Pat Johnson"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "I'll Remember April" }
			\fill-line {
				""
				"Lyrics and Music by Don Raye, Gene De Paul, Pat Johnson"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	g1 | g:6 | c1*2:9 | \myEndLine
	f:maj7 | e1:m7 | a:7 | \myEndLine
	a:m7.5- | d2:7 d:7/c | b1:m7 | e:9 | \myEndLine
	a:m7 | d:7.9- | g:maj7 | g:6 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	c:m7 | f:7 | bes:maj7 | g:m7 | \myEndLine
	c:m7 | f:7 | bes:maj7 | bes:6 | \myEndLine
	a:m11 | d:7 | g:maj7 | g:6 | \myEndLine
	fis:m11 | b:9 | e2:maj7 e:6 | a:m7 d:7 | \myEndLine
	\endPart

%%\myMark "Coda"
	\mark \markup { \musicglyph #"scripts.coda" }
	\startPart
	a1:m7.5- | d2:7 d:7/c | b1:m7 | e:9 | \myEndLine
	a:m7 | d:7.9- | g2 a:m7 | aes:maj7 g:6.9 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key g \major

%% part "A"
	r4 b' c d | c b a g | a2. g4 | fis e2. |
	r4 a bes c | bes a g f! | g8 a g2.~ | g2 r4 g^\markup {To Coda \musicglyph #"scripts.coda"} |
	a2. a4 | a a b4. c8 | d4 d2.~ | d4 r e4. d8 |
	b4 c d c~ | c2 b4 ais | b1~ | b2 r4 b |

%% part "B"
	g g g2~ | g4 a bes c | d2. c4 | bes4 g2 f!4 |
	g g g2~ | g4 a bes c | d d d2~ | d4 d \tuplet 3/2 { d d d } |
	d2. d4 | e c d4. b8 | a4 b2.~ | b4 b d c |
	b b2.~ | b4 r \tuplet 3/2 { b a gis } | b1~ | b^\markup {D.C. al Coda} |

%% part "Coda"
	a4. a8 a2~ | a4 a \tuplet 3/2 { a b c } | d d2.~ | d4 r e4. d8 |
	b4 c d c~ | c2 b4 b | g1~ | g2 r |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	This love -- ly day will leng -- then in -- to ev -- 'ning,
	we'll sign good -- bye to all we've ev -- er had. __
	A -- lone, where we have walked to -- geth -- er, __
	I'll Re -- mem -- ber A -- pril __ and be glad. __

%% part "B"
	I'll be con -- tent __ you loved me once in A -- pril.
	your lips were warm __ and love and Spring were new. __
	But I'm not a -- fraid of Au -- tumn and her sor -- row, __
	for I'll Re -- mem -- ber __ A -- pril and you. __

%% part "Coda"
	won't for -- get, __ but I won't be lone -- ly, __
	I'll Re -- mem -- ber A -- pril, __ and I'll smile. __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	The fire will dwin -- dle in -- to glow -- ing ash -- es,
	for flames and love live such a lit -- tle while. __
	I
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1941, 1942 by MCA Music Publishing, A Division of MCA, Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "I'm Beginning To See The Light / Harry James, Duke Ellington, Johnny Hodges, Don George"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "I'm Beginning To See The Light" }
			\fill-line {
				""
				"Lyrics and Music by Harry James, Duke Ellington, Johnny Hodges, Don George"
			}
			\fill-line {
				"Medium Bounce"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		g2:6 c:9 | g1:6 | g2:6 c4:m7 f:7 | bes2:m7 ees:7 | \myEndLine
		g:6 c:9 | b:m7 e:7 | a:9 a4:m7 d:7 | g2 a4:m7 d:7 | \myEndLine

		g2:6 c:9 | g1:6 | g2:6 c4:m7 f:7 | bes2:m7 ees:7 | \myEndLine
		g:6 c:9 | b:m7 e:7 | a:9 a4:m7 d:7 | g1 | \myEndLine

		b1:9 | b:9 | bes:9 | bes:9 | \myEndLine
		a:9 | a:9 | bes2:m7 ees:7 | a:m7 d:7 | \myEndLine
		g:6 c:9 | b:m7 e:m7 | cis:m7.5- c4:m7 f:7 | bes:m7 ees:7 a:m7.5- d:7.9- | \myEndLine
		cis2:m7.5- c:9 | b:m7 e:7.5-.9- | a:9 a4:m7 d:7 |
	} \alternative {
		{
			g2 a4:m7 d:7 | \myEndLineVoltaNotLast
		}
		{
			g2 aes4:maj9 g:6.9 | \myEndLineVoltaLast
		}
	}
	\endPart
	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key g \major

	\partial 8 dis8 |

%% part "A"
	\repeat volta 2 {
		e g e4 g a | b8 e,4 e8~ e4. dis8 | e g e4 g a | bes8 ees,4 ees8~ ees4. ees8 |
		e8 g e4 g a | b8 d4 d8~ d4 d8 c | b g e4 g8 a4 g8~ | g2 r4 r8 dis |

		e g e4 g a | b8 e,4 e8~ e4. dis8 | e g e4 g a | bes8 ees,4 ees8~ ees4. ees8 |
		e8 g e4 g a | b8 d4 d8~ d4 d8 c | b g e4 g8 a4 g8~ | g2. r4 |

		r8 b4 fis8 b4 fis | dis8 fis4 b8~ b2 | r8 bes4 f8 bes4 f | d8 f4 bes8~ bes2 | r8 a4 e8 a4 e |
		cis8 e4 a8~ a4 a8 a | bes bes bes4 bes8 g4 a8~ | a2. r8 dis,8 | e g e4 g a |
		b8 e,4 e8~ e4. dis8 |

		e g e4 g a | bes8 ees,4 ees8~ ees4. ees8 | e g e4 g a |
		b8 d4 d8~ d4 d8 c | b8 g e4 g8 a4 g8~ |


	} \alternative {
		{
			g2 r4 r8 dis8 |
		}
		{
			g2.\repeatTie r4 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	I nev -- er cared much for moon -- lit skies, __ I nev -- er wink back at fi -- re -- flies; __ but
	now that the stars are in your eyes, __ I'm Be -- gin -- ning To See The Light. __ I
	nev -- er went in for af -- ter -- glow, __ or can -- dle -- light on the mis -- tle -- toe; __ but
	now when you turn the lamp down low __ I'm Be -- gin -- ning To See The Light. __
	Used to ram -- ble thu the park, __ shad -- ow -- box -- ing in the dark. __ Then you came and
	caused a spark, __ that's a four -- a -- larm fi -- re now. __ I nev -- er made love by
	lan -- tern shine, __ I nev -- er saw rain -- bows in my wine; __ but now that your lips are
	burn -- ing mine, __ I'm Be -- gin -- ning To See The Light. __ I
	_
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1944 Alamo Music, Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "I'm Sitting On Top Of The World / Ray Handerson, Sam M. Lewis and Joel Young"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "I'm Sitting On Top Of The World" }
			\fill-line {
				"Lyrics by Sam M. Lewis and Joel Young"
				"Music by Ray Handerson"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		f2 f4:maj7 f:7 | bes1 | f | f | \myEndLine
		g:7 | c:7 | f2 g4:m f/a | g2:m7 c:7.5+ | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		f f4:maj7 f:7 | bes1 | f | f | \myEndLine
		g:7 | c:7 | f | f:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		bes | e:7 | f | f | \myEndLine
		d2:m d:m7+ | d:m7 d:m6 | g1:7 | c2.:7 c4:7.5+ | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		f2 f4:maj7 f:7 | bes1 | f2 c:9.5+ | f1 | \myEndLine
		g2:7 g:7.5-/des | c1:7 |
	} \alternative {
		{
			f2 des:7 | g:7 c:7.5+ | \myEndLineVoltaNotLast
		}
		{
			f bes | f1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key f \major

	\partial 4 c'4 |

%% part "A"
	\repeat volta 2 {
		c a r c | d bes r d | c1~ | c4 c,8 c~ c d f4 | g1~ | g4 g8 g~ g a g4 | f1~ |
		f2. c'4 |

		c a r c | d bes r d | c1~ | c4 c,8 c~ c d f4 | g1~ | g4 g8 g~ g a g4 | f1~ |
		f4 f8 g a bes c cis | d4 bes d4. bes8 | d4 e2 d4 | c c8 c~ c b c4 | a1 | a4 f a f | a d2. |
		r4 a8 a~ a d a4 | g2. c4 |

		c a r c | d bes r d | c1~ | c4 c,8 c~ c d f4 | g1~ | g4 c8 c~ c g a4 |
	} \alternative {
		{
			f1~ | f2. c'4 |
		}
		{
			f,1~ | f2. r4 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	I'm Sit -- ting On Top Of The World, __ just roll -- ing a -- long, __ just roll -- ing a -- long. __

	I'm quit -- ing the blues of the world, __ just sing -- ing a song, __ just sing -- ing a song. __

	"\"Glor" -- y Hal -- el -- lu -- "jah,\"" I just phoned the Par -- son, "\"Hey," Par get read -- y to "call.\"" Just like Hump -- ty Dump -- ty,
	I'm go -- ing to fall, I'm Sit -- ting On Top Of The World, __ just roll -- ing a long, __
	just roll -- ing a long. __ I'm
	long. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1925 Leo Feist, INC." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Isn't It Romantic / Richard Rodgers, Lorenz Hart"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Isn't It Romantic" }
			\fill-line { \large \smaller \bold \larger "From the Paramount Picture 'Love Me Tonight'" }
			\fill-line {
				"Lyrics by Lorenz Hart"
				"Music by Richard Rodgers"
			}
			\fill-line {
				"Easy Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong
	\partial 2 \OPC bes2:7 |
	\repeat volta 2 {

		\myMark "A"
		\startPart
		ees:6 c:m7 | f:m7 bes:7 | ees:maj7 e:dim7 | f:m7 bes:7 | \myEndLine
		ees:6/g c:7 | f:m7 bes:7 | ees1:maj7 | bes2:m7 ees:7 | \myEndLine
		\endPart
	} \alternative {
		{

			\myMark "B"
			\startPart
			aes1:maj7 | bes2:7 g:7 | c:m g:7/b | bes:m7 ees:7 | \myEndLine
			aes:maj7 c:7/g | f:m d4:m7.5- g:7 | c2:m f:7.9 | bes:7.3-.5-.9-.11-.13- bes:7 | \myEndLineVolta
			\endPart
		}
		{

			\myMark "C"
			\startPart
			f2:m f:m/ees | d:m7.5- g:7 | c:m c:m/bes | c:m/a aes:6 | \myEndLine
			g:m7 ges:7 | f:m7 bes:7 | ees aes:6 | ees \OPC bes:7 | \myEndLineVolta
			\endPart
		}
	}
	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 108
	\time 4/4
	\key ees \major

	\partial 2 d8 ees c d |

	\repeat volta 2 {

	%% part "A"
		ees4 ees2. | d8 ees c d ees4 f | g4. g8 bes4. bes8 | g2 d8 ees c d |
		ees4 ees2. | d8 ees c d ees4 f | g4. g8 bes4. bes8 | des1 |
	} \alternative {
		{

		%% part "B"
			c | d8 c bes aes g4 f | ees4. ees8 g4. g8 | ees1 |
			c' | d8 c bes aes g4 f | ees4. ees8 c'4. c8 | des,2 d8 ees c d |
		}
		{

		%% part "C"
			c'1 | d8 c bes aes g4 f | ees4. ees8 g4. g8 | c4. c8 ees4. ees8 |
			f4 ees bes2~ | bes d8 ees c d | ees1~ | ees2 \mark \markup { \italic { Fine } } <\parenthesize d,>8 <\parenthesize ees> <\parenthesize c> <\parenthesize d> |
		}
	}
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this version of the lyrics is from the Hal Leonard book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

%% part "A"
	Is -- n't It Ro -- man -- tic? Mu -- sic in the night, a dream that can be heard.
	Is -- n't It Ro -- man -- tic? Mov -- ing shad -- ows write the old -- est mag -- ic word.

%% part "B"
	I hear the breez -- es play -- ing in the trees a -- bove.
	While all the world is say -- ing you were meant for love.

%% part "Forward"
	Is -- n't It Ro --

%% part "C"
	Sweet sym -- bols in the moon -- light
	Do you mean that I will fall in love per -- chance? __ Is -- n't it ro -- mance? __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	Is -- n't It Ro -- man -- tic? Mere -- ly to be young on such a night as this?
	Is -- n't It Ro -- man -- tic? Ev -- 'ry note that's sung is like a lov -- er's kiss.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1932 (Renewed 1959) by Famous Music Corporation" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "It Might As Well Be Spring / Richard Rodgers, Oscar Hammerstein II"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "It Might As Well Be Spring" }
			\fill-line { \large \smaller \bold \larger "From 'State Fair'" }
			\fill-line {
				"Lyrics by Oscar Hammerstein II"
				"Music by Richard Rodgers"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	g2:6 c:9 | b4:m7 e:7 a:m7 d:7 | g1 | d2:m7 g:7 | \myEndLine
	c cis4:m7 fis:7 | b2:m7 e:7 | a:m7 d4:7 d:7/c | b:m7 e:7 a:m7 d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2:6 c:9 | b4:m7 e:7 a:m7 d:7 | g1 | d2:m7 g:7 | \myEndLine
	c cis4:m7 fis:7 | b2:m7 e:7 | a:m7 d:7 | g d4:m7 g:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	c1 | d:m7 | d2:m7 g:7 | c1 | \myEndLine
	a2:m7 a:m7/g | fis:7.5- b:7 | e:m7 a:7 | a:m7/d d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2:6 c:9 | b4:m7 e:7 a:m7 d:7 | g1 | d2:m7 g:7 | \myEndLine
	c cis4:m7 fis:7 | g2:6.9/b e:m7 | a:m7 d4:9 d:7/c | b2:7 e:7 | \myEndLine
	a1:7 | c2:m7 f:7 | b:m7 e4:m7 e:m7/d | a2:7/cis c4:m7 f:9 | \myEndLine
	b2:m7 e:m7 | a:m7 d:7 | g c:6 | g1 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 88
	\time 2/2
	\key g \major

	\partial 4 d8 d |

%% part "A"
	e d d d e d d g | e4 d2 d8 d | d8. b'16 d8. g,16 b8. d,16 g8. d16 | f2. f4 |
	e4 dis8 e fis!4. g8 | g4 d2 d8 d | c'4 c c fis, | b2. d,8 d |

%% part "A"
	e d d d e d d g | e4 d2 d8 d | d8. b'16 d8. g,16 b8. d,16 g8. d16 | f2. f4 |
	e4 dis8 e fis!4. g8 | g4 d2 d8 d | d'4 d d fis, | g1 |

%% part "B"
	c4 c c8 d c b | a4 f f2 | a8 f f f f4 e | g1 |
	c4 c c8 d c b | a4 fis! fis g8 a | b4 b cis cis | d2. d,8 d |

%% part "A"
	e d d d e d d g | e4 d2 d8 d | d8. b'16 d8. g,16 b8. d,16 g8. d16 | f2. f4 |
	e8 e dis e fis! fis eis fis | g4 g2 fis8 g | a4 a a fis | b2. b8 bis |
	cis4 a a a8 b | c a a a a4 a8 ais | b4 g g b | a2. g4 |
	d~ d8. b'16 g2 | d4~ d8. c'16 a2 | g1~ | g4 r r2 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

	I'm as

%% part "A"
	rest -- less as a wil -- low in a wind -- storm,
	I'm as jump -- y as a pup -- pet on a string.
	I'd say that I had spring fev -- er,
	but I know it is -- n't spring. I am

%% part "A"
	star -- ry eyed and vague -- ly dis -- con -- tent -- ed,
	like a night -- in -- gale with -- out a song to sing.
	Oh, why should I have spring fev -- er
	when it is -- n't e -- ven spring?

%% part "B"
	I keep wish -- ing I were some -- where else
	walk -- ing down a strange new street;
	hear -- ing words that I have nev -- er heard
	from a man I've yet to meet, I'm as

%% part "A"
	bu -- sy as a spi -- der spinn -- ing day -- dreams
	I'm as gid -- dy as a ba -- by on a swing.
	I have -- n't seen a cro -- cus or a rose -- bud,
	or a rob -- in on the wing.
	But I feel so gay in a mel -- an -- cho -- ly way
	that It Might As Well Be Spring.
	It Might __ _ As Well __ _ Be Spring! __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1945 by Williamson Music Co." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "It Never Entered My Mind / Richard Rodgers, Lorenz Hart"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "It Never Entered My Mind" }
			\fill-line {
				"Lyrics by Lorenz Hart"
				"Music by Richard Rodgers"
			}
			\fill-line {
				"Moderately Slow"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		f2 a:m | f a:m | f a:m | f a:m | \myEndLine
		f a:m | f a:m | g1:m7 | g2:m ees4:7/g c:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		f2 a:m | f a:m | f a:m | f a:m | \myEndLine
		f a:m | f a:m | g1:m7 | a2:m c:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		f2 f4:6 g:m7 | g2.:m7 c4:7 | f2:maj7 f4:6 g:m7 | g2.:m7 c4:7 | \myEndLine
		f2:6 c:7 | f b:dim7 | c:7 bes4 a:m7 | bes2 a4:m c:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		f2 a:m | f a:m | f a:m | f a:m | \myEndLine
		f a:m | a:m7.5- d:7 | g:m7 c4:7.11 c:7 | f4 f2.:maj7 | \myEndLine
		g2.:m7 c4:7 |
		\endPart

	} \alternative {
		{
			f2:6 g4:7 c:7 | \myEndLineVoltaNotLast
		}
		{
			f1:6 | \myEndLineVoltaLast
		}
	}

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 76
	\time 4/4
	\key f \major

	\repeat volta 2 {

	%% part "A"
		a'4 a a a | r8. a16[ g8. f16] e4 e | r8. f16[ e8. d16] c4 c | f e8 c~ c2 |
		r8. f16[ e8. d16] c4 c | f e8 c~ c2 | r8. d16[ f8. g16] a8 f a g~ | g2. r4 |

	%% part "A"
		a4 a a a | r8. a16[ g8. f16] e4 e | r8. f16[ e8. d16] c4 c | f e8 c~ c2 |
		r8. f16[ e8. d16] c4 c | f e8 c~ c2 | r8. d16[ f8. g16] a8 f a c~ | c2. r4 |

	%% part "B"
		d2 f,4 f~ | f2. e4 | g2 f4 f~ | f2 r4 e |
		a8 a4. bes8 bes4. | c8 c4. d8 d4. | e2 c4 c~ | c2. r4 |

	%% part "A"
		a4 a a a | r8. a16[ g8. f16] e4 e | r8. f16[ e8. d16] c4 c | f e8 c~ c2 |
		r8. f16[ e8. d16] c4 c | c'4 bes8 a~ a2 | r8. bes16[ a8. g16] f4 e | a e8 e~ e2 |
		r8. d16[ f8. g16] a8 f g f~ |
	} \alternative {
		{
			f2 r |
		}
		{
			f2. r4 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Once I laughed when
	I heard you say -- ing
	that I'd be play -- ing
	sol -- i -- taire, __
	un -- eas -- y in my
	eas -- y chair, __
	It Nev -- er En -- tered My Mind. __

%% part "A"
	Once you told me
	I was mis -- tak -- en
	that I'd a -- wak -- en
	with the sun __
	and or -- der or -- ange juice for one, __
	It Nev -- er En -- tered My Mind. __

%% part "B"
	You have what __
	I lack my -- self, __
	and now I e -- ven have to scratch
	my back my -- self. __

%% part "A"
	Once you warned me
	that if you scorned me
	I'd sing the maid -- en's
	pray'r a -- gain, __
	and with that you were there a -- gain __
	to get in -- to my hair a -- gain __
	It Nev -- er En -- tered My Mind. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1940 by Chappell & Co., Inc. Copyright Renewed" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Just Friends / John Klenner, Sam M. Lewis"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Just Friends" }
			\fill-line {
				"Lyrics by Sam M. Lewis"
				"Music by John Klenner"
			}
			\fill-line {
				"Medium Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 g4:7 |

	\myMark "A"
	\startPart
	c1*2:maj7 | c1:m7 | f:7 | \myEndLine
	g1*2:maj7 | bes1:m7 | ees:7 | \myEndLine
	a:m7 | d:7 | b:m7 | e:m7 | \myEndLine
	a1*2:7 | a1:m7 | d2:7 des:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	c1*2:maj7 | c1:m7 | f:7 | \myEndLine
	g1*2:maj7 | bes1:m7 | ees:7 | \myEndLine
	a:m7 | d:7 | b:m7 | e:m7 | \myEndLine
	a:7 | a2:m7 d:7 | g1:6 | \LPC d2:m7 \RPC g:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 168
	\time 4/4
	\key g \major

	\partial 4 b'4 |

%% part "A"
	b1~ | b2 \tuplet 3/2 { a4 b a } | ees1~ | ees2 a |
	a1~ | a4 a \tuplet 3/2 { g a g } | des1~ | des2. g4 |
	g4. e8 g4. e8 | fis2. fis4 | fis4. d8 fis4. d8 | e4 fis g b |
	e2 b~ | b4 e, \tuplet 3/2 { e fis g } | b2 a~ | a b |

%% part "B"
	b1~ | b2 \tuplet 3/2 { a4 b a } | ees1~ | ees2 a |
	a1~ | a4 a \tuplet 3/2 { g a g } | des1~ | des2. g4 |
	g4. e8 g4. e8 | fis2. a4 | a4. fis8 a4. fis8 | g4 a b d |
	e2 e, | d' b | g1 | r2 b |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

%% part "A"
	Just friends, __ lov -- ers no more __
	Just friends, __ but not like be -- fore. __
	To think of what we've been and not to kiss a -- gain seems like
	pre -- tend -- ing __ it is -- n't the end -- ing. __

%% part "B"
	Two friends __ drift -- ing a -- part, __
	Two friends __ but one brok -- en heart. __
	We loved, we laughed, we cried and sud -- den -- ly love died.
	The sto -- ry ends and we're just friends.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1931 (renewed 1959) EMI Robbins Catalog, Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Let's Call The Whole Thing Off / George Gershwin, Ira Gershwin"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Let's Call The Whole Thing Off" }
			\fill-line {
				"Lyrics by Ira Gershwin"
				"Music by George Gershwin"
			}
			\fill-line {
				"Brightly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		g2 e:m9 | a:m7 d:7 | g2 e:m9 | a:m7 d:7 | \myEndLine
		g g:7/f | c/e c:m/ees | g/d e:m | a:7 d:7 | \myEndLine
		\endPart

		\myMark "A'"
		\startPart
		g2 e:m9 | a:m7 d:7 | g2 e:m9 | a:m7 d:7 | \myEndLine
		g g:7/f | c/e c:m/ees | g/d d:7 | g1 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		cis:m7.5- | fis2:7 b:m7 | e:7 a:m7 | d1:7 | \myEndLine
		cis:m7.5- | fis2:7 b:m7 | e:7 a:m7 | d1:7 | \myEndLine
		\endPart

		\myMark "A''"
		\startPart
		g2 e:m9 | a:m7 d:7 | g2 e:m9 | a:m7 d:7 | \myEndLine
		g g:7/f | c/e c:m/ees | g/d d:7 | b:7 e:7 | a:m7 d:7 |

	} \alternative {
		{
			g ees4:7 d:7 | \myEndLineVoltaNotLast
		}
		{
			g1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key g \major

	\repeat volta 2 {

	%% part "A"
		g'4 e8 fis~ fis fis4 e8 | g4 a8 b~ b b4. | g4 e8 fis~ fis fis4 e8 | g4 a8 b~ b b4. |
		d8 g, r4 d'8 g, r4 | d'8 g, r4 d'8 g, r4 | d'4 c8. b16 a4 g | a2. r4 |

	%% part "A"
		g8 g4 e8 fis fis4 e8 | g g4 a8 b b4. | g8 g4 e8 fis fis4 e8 | g g4 a8 b b4 b8 |
		d g, r g d' g, r g | d' g, r g d' g, r g | d'4 c8. b16 a4 g | g2 r4 g |

	%% part "B"
		e'1 | d8. cis16 b8. cis16 d4 d | b b c c | a2. e4 |
		e'1 | d8. cis16 b8. cis16 d4 d | b b c c | a2. d,8. d16 |

	%% part "A"
		g8 g4 e8 fis fis4 e8 | g g4 a8 b b4. | g8 g4 e8 fis fis4 e8 | g g4 a8 b b4 b8 |
		d g, r4 d'8 g, r4 | d'8. d16 g,8. g16 d'8 g,4. | d'8. d16 c8. b16 c8. b16 a4 | b2. r4 | e b8. c16 b4 a |
	} \alternative {
		{
			g2. r4 |
		}
		{
			g2. r4 |
		}
	}
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	You say ee -- __ ther and I say eye -- __ ther,
	you say nee -- __ ther and I say ny -- __ ther;
	ee -- ther, eye -- ther, nee -- ther, ny -- ther,
	Let's Call The Whole Thing Off!

%% part "A"
	You like po -- ta -- to and I like po -- tah -- to,
	you like to -- ma -- to and I like to - mah -- to;
	po -- ta -- to, po -- tah -- to, to -- ma -- to, to -- mah -- to!
	Let's Call The Whole Thing Off!
	But

%% part "B"
	oh! If we call the whole thing off,
	then we must part. And
	oh! If we ev -- er part, then that might break my heart!

%% part "A"

%% part "Volta"
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"

%% part "A"

%% part "B"

%% part "A"
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1936, 1937 by Gershwin Publishing Corporation" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Like Someone In Love / Johnny Burke, Jimmy Van Heusen"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Like Someone In Love" }
			\fill-line {
				""
				"Lyrics and Music by Johnny Burke, Jimmy Van Heusen"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		c2:maj7 c/b | c:6/a c/g | d:7/fis g:7/f | e:m7 ees:7 | \myEndLine
		d1:m7 | g2.:7 g4:9.5+ | c1:maj7 | g4:m7 c2:9 c4:9.5+ | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		f2.:6 f4:5+ | b2:m7 e:7 | a1:maj7 | a:6 | \myEndLine
		a:m7 | d:7 | d1:7 | g:7.5+ | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		c2:maj7 c/b | c:6/a c/g | d:7/fis g:7/f | e:m7 ees:7 | \myEndLine
		d1:m7 | g2.:7 g4:9.5+ | c1:maj7 | g4:m7 c2:9 c4:9.5+ | \myEndLine
		\endPart

		\myMark "B'"
		\startPart
		f2.:6 f4:5+ | b2:m7 e:7 | a1:maj7 | d2.:9 dis4:dim | \myEndLine
		e2:m7 a:7 | d:m7 g:7.9- |
	} \alternative {
		{
			c a:m7 | d:9 g:7 | \myEndLineVoltaNotLast
		}
		{
			c f:m6 | c1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key c \major

	\repeat volta 2 {

	%% part "A"
		e4 e2 e4 | e4 a g e | d d2 b'4 | g1 |
		f4 f2 c'4 | b2. a4 | g4 g2 e'4 | d1 |

	%% part "B"
		d4 d2 cis4 | e d cis b | e,2 e~ | e1 |
		c'4 c2 b4 | d c b a | d,1 | dis |

	%% part "A"
		e4 e2 e4 | e a g e | d d2 b'4 | g1 |
		f4 f2 c'4 | b2. a4 | g4 g2 e'4 | d1 |

	%% part "B"
		d4 d2 cis4 | e d cis b | e, e2 e4 | fis2. fis4 |
		g4 g2 g4 | f d'2 b4 |
	} \alternative {
		{
			c1 | R |
		}
		{
			c1~ | c |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Late -- ly I find my -- self out gaz -- ing at stars,
	hear -- ing gui -- tars Like Some -- one In Love.

%% part "B"
	Some -- times the things I do a -- stound me,
	__ most -- ly when -- ev -- er you're a -- round me.

%% part "A"
	Late -- ly I seem to walk as though I had wings,
	bump in -- to things Like Some -- one In Love.

%% part "B"
	Each time I look at you I'm linmp as a glove
	and feel -- ing Like Some -- one In Love.

%% part "Volta"
	Love. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1944 Bourne Co. and Dorsey Bros. Music, Inc. Division of Music Sales Corporation" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Lost In The Stars / Kurt Weill, Maxwell Anderson"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Lost In The Stars" }
			\fill-line { \large \smaller \bold \larger "(Form 'Lost In The Stars')" }
			\fill-line {
				"Lyrics by Maxwell Anderson"
				"Music by Kurt Weill"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\partial 8 s8 |

	\myMark "A"
	\startPart
	g2 bes:dim7 | d:7/a d:7 | g e:7.5+ | a:m7 d:7.9- | \myEndLine
	g c:maj7 | g1 | g2:/b bes:dim7 | a:m7 d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2 bes:dim7 | d:7/a d:7 | g e:7.5+ | a:m7 d:7.9- | \myEndLine
	g c:maj7 | g e:7 | a:7 d:7 | g1 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	c2:m7 f:7 | bes g:m7 | c:m7.5- f:7 | bes g:m7 | \myEndLine
	c:m7 f:7 | bes g:m7 | c:m7.5- f4:7 f:7.5+ | e:7 ees2:7 d4:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2 bes:dim7 | d:7/a d:7 | g e:7.5+ | a:m c:m6 | \myEndLine
	g1 | c:m6 | g | c:m6 | \myEndLine
	d2:7 a4:m7 d:7 | g1 | e2:m7 ees:7 | g bes:dim7 | \myEndLine
	d:7/a a4:m7 d:7 | g1 | e2:m7 ees:7 | g bes:dim7 |
	d:7/a d:7 | g ees:7 | g1:6 |
	\endPart

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante Moderato" 4 = 88
	\time 4/4
	\key g \major

	\partial 8 cis8 |

%% part "A"
	e4 d g cis,8 cis | e4 d8 d a'4 r8 cis, | e4 d8 d c'4 b8 c | b4 a8 gis a4 b8 c |
	d4 b8 g e d'4 c8 | c4 b b r8 d, | e4 e8 e e4 fis8 g | a2. cis,8 cis |

%% part "A"
	e4 d g8 g cis, cis | e4 d a' r8 cis,16 cis | e8 e d4 c' b8 c | b4 a8 gis a4 b8 c |
	d4 b8 g e d'4 c8 | c4 b8. ais16 b4 r8 d,16 d | e8 e e4 a4. g8 | g2. g8 g |

%% part "B"
	bes4 bes bes a8 g | f4. d8 bes4 c8 d | ees4 ees ees bes8 c | d4. d8 d4 r8 g |
	bes4 bes8 bes a4 g | f8. f16 f8 d bes4 c8 d | ees4 ees8 ees d4 cis | d2. r8 cis |

%% part "A"
	e4 d g8. g16 cis,8 cis | e4 d8. d16 a'4 r8 cis,16 cis | e4 d c'8 c b c | b4 a8 gis a4 r8 b16 c |
	d4 d8 d d4 c8 b | a4 a8 a a4. a8 | d4 cis8 d e d c b | a4. a8 a2 |
	r4 cis,8 d c'4 c | \tuplet 3/2 { c8 b ais } b2. | b16 a g8~ g4 bes8 g4. | b8. b16 a8 g e2 |
	r4 cis8 d c'4 c | \tuplet 3/2 { c8 b ais } b2. | b16 a g8~ g4 bes8 g4. | b8. b16 c8 d e2 |
	r4 cis,8 d a'4 a | \tuplet 3/2 { a8 g fis } g2.~ | g1 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	Be -- fore Lord God made the sea and the land, He held all the stars in the palm of His hand, and they
	ran through His fin -- gers like grains of sand, and one lit -- tle star fell a -- lone. Then the
	Lord God hunt -- ed through the wide night air for the lit -- tle dark star on the wind down _ there. And he
	stat -- ed and prom -- ised He'd take spec -- ial care so it would -- n't get lost a -- gain. Now a
	man don't mind if the stars grow dim and the clouds blow o -- ver and dark -- en him. So
	long as the Lord God's watch -- ing o -- ver them keep -- ing track how it all goes on. But
	I've been walk -- ing through the night, and the day, 'till my eyes get wear -- y and my head turn _ grey, And _
	some -- times it seems may -- be God's gone a -- way, for -- get -- ting the prom -- ise that we heard Him say,
	And we're lost out here in the stars, lit -- tle stars, big stars, blow -- ing through the night.
	And we're lost out here in the stars, lit -- tle stars, big stars, blow -- ing through the night.
	And we're lost out here in the stars. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1946 Chappell & Co., Inc" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Love For Sale / Cole Porter"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Love For Sale" }
			\fill-line {
				""
				"Lyrics and Music by Cole Porter"
			}
			\fill-line {
				"With Swinging Rhythm"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		ees1:7 | ees:7 | bes:m | bes:m | \myEndLine
		ees:7 | ees:7 | bes:m | bes:m | \myEndLine
		ees:m7 | aes:7 | des:7 | ges:7 | \myEndLine
		c:m7.5- | f:7.5+ | bes:m | bes:m | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		ees1:7 | ees:7 | bes:m | bes:m | \myEndLine
		ees:7 | ees:7 | bes:m | bes:m | \myEndLine
		ees:m7 | aes:7 | des:7 | ges:7 | \myEndLine
		c:m7.5- | f:7.5+ | bes:m | bes:m7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		ees:m7 | aes:7 | des:maj7 | f2:m7.5- bes:7 | \myEndLine
		ees1:m7 | aes:7 | des:maj7 | bes:m7 | \myEndLine
		bes:7 | bes:7 | ees:m | ees:m | \myEndLine
		g:m7.5- | c:7 | f:m7.5- | bes:7.9- | \myEndLine
		\endPart

		\myMark "A'"
		\startPart
		ees:7 | ees:7 | bes:m | bes:m | \myEndLine
		ees:7 | ees:7 | bes:m | bes:m | \myEndLine
		ees:m7 | aes:7 | des:7 | ges:7 | \myEndLine
		c:m7.5- | f:7.5+ | bes:m | bes:m7/aes | \myEndLine
		g2:m7.5- g:m7.5-/f | ees1:7 | ees2:m7 ees:m7/des | c1:m7.5- | \myEndLine
		bes:m | ees:7 |
	} \alternative {
		{
			bes | bes | \myEndLineVoltaNotLast
		}
		{
			bes | bes | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key bes \major

	\repeat volta 2 {

	%% part "A"
		bes'1~ | bes2. g4 | f1~ | f |
		r4 bes8 bes bes4 bes | bes bes2 g4 | f1~ | f2. r4 |
		r4 bes8 bes bes4 bes | bes c c2 | r4 aes8 aes aes4 aes | aes ges ges2 |
		f1~ | f2. des4 | bes1~ | bes2. r4 |

	%% part "A"
		bes'1~ | bes2. g4 | f1~ | f |
		r4 bes8 bes bes4 bes | ees c bes g | f1~ | f2. r4 |
		r4 bes8 bes bes4 bes | bes c c2 | r4 des8 des des4 des | des ges, ges2 |
		f1~ | f2. des4 | bes1~ | bes2. r4 |

	%% part "B"
		r4 bes8 c des4 ees | f4 ees ees2 | r4 c8 des ees4 f | aes1 |
		r4 bes,8 c des4 ees | f4 ees ees2 | r4 c8 des ees4 f | bes1 |
		r4 bes,8 c d4 f | ges f f2 | r4 d \tuplet 3/2 { ees4 f ges } | c4 bes bes2 |
		des c | des c | r4 b8 b b4 b | b2 bes |

	%% part "A"
		bes1~ | bes2. g4 | f1~ | f2. r4 |
		r4 bes8 bes bes4 bes | bes bes2 g4 | f1~ | f2. r4 |
		r4 bes8 bes bes4 bes | bes c c2 | r4 des8 des des4 des | des ees ees2 |
		f1~ | f2. des4 | bes1~ | bes2. r4 |
		f'1~ | f2 f8 des bes g | bes c des ees f4 f | f2. des4 |
		bes1~ | bes~ |
	} \alternative {
		{
			bes~ | bes4 r r2 |
		}
		{
			bes1~\repeatTie | bes4 r r2 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	Love __ For Sale, Ap -- pe -- tiz -- ing young Love For Sale
	Love that's fresh and still un -- spoiled, love that's on -- ly slight -- ly soiled, Love __ For Sale. __

	Who __ will buy? __ Who would like to sam -- ple my sup -- ply? __
	Who's pre -- pared to pay the price, for a trip to par -- a -- dise? Love __ For Sale. __
	Let the po -- ets pipe of love in their child -- ish way. I know ev -- ery type of love
	bet -- ter far than they. If you want the thrill of love, I've been thru the mill of love; Old love,
	new love, Ev -- 'ry love but true love. Love __ For Sale, __ Ap -- pe -- tiz -- ing young Love For
	Sale. __ If you want to buy my wares, Fol -- low me and climb the stairs, Love __ For
	Sale. __ Love __ _ _ _ _ _ _ _ _ _ _ _ For
	Sale.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1930 (Renewed) Warner Bros. Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Lullaby of birdland / George Shearing, George David Weiss"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Lullaby of birdland" }
			\fill-line {
				"Lyrics by George David Weiss"
				"Music by George Shearing"
			}
			\fill-line {
				"Relaxed Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f2:m6 d:m7.5- | g:7.9- c:7.9- | f:m7 des:maj7 | bes:m7 ees:7 | \myEndLine
	c:m7 f:m7 | bes:m7 ees:7.9- | aes:maj7 des:9 | g:m7.5- c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f2:m6 d:m7.5- | g:7.9- c:7.9- | f:m7 des:maj7 | bes:m7 ees:9 | \myEndLine
	c:m7 f:m7 | bes:m7 ees:7.9- | aes:maj7 ees:7 | aes1 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	c2:m7.5- f:7.9- | bes1:m7 | bes2:m7 ees:7.9- | aes1:maj7 | \myEndLine
	c2:m7.5- f:7.9- | bes1:m7 | ees:7.9- | aes2:maj7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f2:m6 d:m7.5- | g:7.9- c:7.9- | f:m7 des:maj7 | bes:m7 ees:9 | \myEndLine
		c:m7 f:m7 | bes:m7 ees:7.9- |
	} \alternative {
		{
			aes:maj7 des:9 | g:m7.5- c:7 | \myEndLineVoltaNotLast
		}
		{
			aes1:maj7 | bes2:m7 ees:9 | aes1:maj7 | bes2:m7 a4:maj7 aes:maj7.9 | \myEndLineVoltaLast
		}
	} \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \minor

%% part "A"
	c'8 c bes aes g f4. | d4 f8 e~ e2 | c4 g'8 f~ f2 | des4 c'8 bes~ bes2 |
	ees8 ees des c bes aes4. | f8 c' bes e,~ e c' bes ees,~ | ees2~ ees8 bes' aes des,~ | des aes' g c,~ c2 |

%% part "A"
	c'8 c bes aes g f4. | d4 f8 e~ e2 | c4 g'8 f~ f2 | des4 c'8 bes~ bes2 |
	ees8 ees des c bes aes4. | f8 c' bes e,~ e c' bes ees,~ | ees2~ ees8 ees g aes~ | aes1 |

%% part "B"
	c4 des8 d ees c ees des~ | des bes4.~ bes2 | bes4 b8 c des bes des c~ | c1 |
	c4 des8 d ees c ees des~ | des bes4.~ bes2 | bes4 b8 c des bes des c~ | c des c bes~ bes2 |

%% part "A"
	\repeat volta 2 {
		c8 c bes aes g f4. | d4 f8 e~ e2 | c4 g'8 f~ f2 | des4 c'8 bes~ bes2 |
		ees8 ees des c bes aes4. | f8 c' bes e,~ e c' bes ees,~ |
	} \alternative {
		{
			ees2~ ees8 bes' aes des,~ | des aes' g c,~ c r r4 |
		}
		{
			ees2~\repeatTie ees8 e f des'~ | des2 c4 c8 aes~ | aes1~ | aes2. r4 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Lul -- la -- by Of Bird -- land
	that's what I __
	al -- ways hear __
	when you sigh. __
	Nev -- er in my word -- land could there be ways __ to re -- veal __ __ in a phrase __ how I feel! __

%% part "A"
	Have you ev -- er heard two tur -- tle doves __
	bill and coo __
	when they love? __
	That's the kind of mag -- ic mu -- sic we make __ with our lips __ __ when we kiss! __

%% part "B"
	And tere's a weep -- y old wil -- low; __
	he real -- ly knows how to cry! __
	That's how I'd cry in my pil -- low __
	if you should tell me fare -- well __ and good -- bye! __

%% part "A"
	Lul -- la -- by Of Bird -- land whis -- per low, __
	kiss me sweet __
	and we'll go __
	fly -- in' high in Bird -- land, high in the sky __ up a -- bove __ __ all be -- cause __ we're in love! __

	_ all be -- cause __ we're in love. __ __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1952, 1953, 1954 Adam R. Levy & Father Ent., Inc., New York NY. Copyrights Renewed." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Misty / Errol Garner, Johnny Burke"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Misty" }
			\fill-line {
				"Lyrics by Johnny Burke"
				"Music by Errol Garner"
			}
			\fill-line {
				"Ballad"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		ees1:maj7 | bes2:m7 ees:7 | aes1:maj7 | aes2:m7 des:7 | \myEndLine
		ees:maj7 c:m7 | f:m7 bes:7 |
	} \alternative {
		{
			g:m7 c:7 | f:m7 bes:7 | \myEndLineVoltaNotLast
		}
		{
			ees1*2:6 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	bes1:m7 | ees:7.9- | aes1*2:maj7 | \myEndLine
	a1:m7 | d2:7 f:7 | g2:m7.5- c:7.9- | f:m7 bes:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees1:maj7 | bes2:m7 ees:7 | aes1:maj7 | aes2:m7 des:7 | \myEndLine
	ees:maj7 c:m7 | f:m7 bes:7 | ees1:6 | f2:m7 bes:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 88
	\time 4/4
	\key ees \major

	\partial 4 bes'8 g |

%% part "A"
	\repeat volta 2 {
		d2. bes8 c | des c' c c c bes g ees | c2 \tuplet 3/2 { r8 g aes c ees g } | bes bes bes aes bes4 aes8 bes |
		g4~ \tuplet 3/2 { g8 aes bes } ees,4~ \tuplet 3/2 { ees8 f g } | aes8 c,4 c8 \tuplet 3/2 { d4 ees f } |
	} \alternative {
		{ g1~ | g2. bes8 g | }
		{ ees1 | \tuplet 3/2 { r4 ees f } \tuplet 3/2 { g bes c } | }
	}

%% part "B"
	des8 des des des~ des2~ | des4 des8 ees \tuplet 3/2 { fes4 ees des } | c8 c c c~ c2 | \tuplet 3/2 { r4 ees, f aes bes c } |
	d8 d d c d2~ | d8 d d c \tuplet 3/2 { f4 d c } | bes1~ | bes2. bes8 g |

%% part "A"
	d2. bes8 c | des c' c c c bes g ees | c2 \tuplet 3/2 { r8 g aes c ees g } | bes bes bes aes bes4 aes8 bes |
	g4~ \tuplet 3/2 { g8 aes bes } ees,4~ \tuplet 3/2 { ees8 f g } | aes8 c,4 c8 \tuplet 3/2 { d4 ees f } | ees1 | r |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
	Look at me,
	I'm as help -- les as a kit -- ten up a tree
	and I feel like I'm cling -- ing to a cloud,
	I ca -- n't __ un -- der -- stand, __
	I get Mist -- y just hold -- ing your hand. __

	Walk my
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {
	Walk my way and a thou -- sand vi -- o -- lins be -- gin to play,
	or it might be the sound of your hel -- lo,
	th -- at mu -- sic I hear, __
	I get Mist -- y the mo -- ment you're _ _ _ near.

	You can say that you're lead -- ing me on, __
	but it's just what I want you to do. __
	Don't you no -- tice how hope -- less -- ly I'm lost, __
	that's why I'm fol -- low -- ing you. __

	On my own, would I wan -- der through this won -- der -- land a -- lone,
	nev -- er know -- ing my right foot from my left,
	my _ hat __ from my glove, __
	I'm too Mist -- y and too much in Love.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1955. Renewed 1983 Marke Music, Limerick Music, Reganesque" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Moonlight in Vermont / Karl Suessdorf, John Blackburn"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Moonlight in Vermont" }
			\fill-line {
				"Lyrics by John Blackburn"
				"Music by Karl Suessdorf"
			}
			\fill-line {
				"Freely"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	ees2:6 c:m7 | f:m7 e:7.9+ | ees:6 c:m7 | des1:9 | f2:m7 bes:7.11 | ees f4:m7 bes:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees2:6 c:m7 | f:m7 e:7.9+ | ees:6 c:m7 | des1:9 | f2:m7 bes:7.11 | ees1 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	a2:m11 d:7 | g:maj7 gis:dim7 | a:m11 aes:9.11+ | g:maj7 g:6 | \myEndLine
	bes:m11 ees:7 | aes:maj7 a:dim7 | bes:m11 ees:9 | aes bes:7.5+.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees2:6 c:m7 | f:m7 e:7.9+ | ees:6 c:m7 | des1:9 | f2:m7 bes:7.11 | ees1 | \myEndLine
	c2:m7 f4:9 e:9 | ees1:maj9 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key ees \major

%% part "A"
	c'4 bes g f | g1 | c4 bes g4. ees8 | f g ces,2. | g'4 f ees c! | ees1 |

%% part "A"
	c'4 bes g f | g1 | c4 bes g4. ees8 | f g ces,2. | g'4 f ees c! | ees1 |

%% part "B"
	d8 d d d~ d d4 d8 | d d4 d8 d d4 d8 | d d d d'~ d4 c8 d | b!1 |
	ees,8 ees ees ees~ ees ees4 ees8 | ees ees4 ees8 ees ees4 ees8 | ees ees ees ees'~ ees4 des8 ees | c2 ces |

%% part "A"
	c!4 bes g f | g1 | c4 bes g4. ees8 | f g ces,2. | g'4 f ees c! | ees1 |
	b!8 c ees g c d b! cis! | bes!1 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Pen -- nies in a stream, fall -- ing leaves, a sy -- ca -- more, Moon -- light In Ver -- mont.

%% part "A"
	I -- cy fin -- ger -- waves, ski trails on a moun -- tain -- side, snow -- light in Ver -- mont.

%% part "B"
	Tel -- e -- graph ca -- __ bles, they sing down the high -- way and tra -- vel each bend __ in the road,
	peo -- ple who meet __ in this ro -- man -- tic set -- ting are so hyp -- no -- tized __ by the love -- ly

%% part "A"
	ev' -- ning sum -- mer breeze, warb -- ling of a mea -- dow -- lark, Moon -- light In Ver -- mont,
	you and I and Moon -- light In Ver -- mont.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1944-1945 by MICHAEL H GOLDSEN, INC." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "My Favorite Things / Richard Rodgers, Oscar Hammerstein II"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "My Favorite Things" }
			\fill-line { \large \smaller \bold \larger "From 'The Sound Of Music'" }
			\fill-line {
				"Lyrics by Oscar Hammerstein II"
				"Music by Richard Rodgers"
			}
			\fill-line {
				"Lively, with spirit"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		e2.:m7 | fis:m7 | e:m7 | fis:m7 | \myEndLine
		c2.*4:maj7 | \myEndLine
		a2.:m7 | d:7 | g:maj7 | c:maj7 | \myEndLine
		g:maj7 | c:maj7 | fis:m7.5- | b:7 | \myEndLine
	}
%% removed in order to show the repeat sign...
%%\endPart

	\myMark "A"
	\startPart
	e2.:maj7 | fis:m7 | e:maj7 | fis:m7 | \myEndLine
	a2.*4:maj7 | \myEndLine
	a2.:m7 | d:7 | g:maj7 | c:maj7 | \myEndLine
	g:maj7 | c:maj7 | fis:m7.5- | b:7.9- | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	e2.*2:m7 | fis2.:m7.5- | b:7 | \myEndLine
	e2.*2:m7 | c:maj7 | \myEndLine
	c:maj7 | a:7 | \myEndLine
	g2.:maj7 | c2.*2:maj7 | d2.:7 | \myEndLine
	g:6 | c:maj7 | g:6 | c:maj7 | \myEndLine
	g:maj7 | c:maj7 | fis:m7.5- | b:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 3/4
	\key g \major

%% part "A"
	\repeat volta 2 {
		\repeat unfold 2 { e4 b' b | fis e e | b e e | fis e2 | }
		e4 b' a | e fis d | d a' g | c,2. |
		b4 c d | e fis g | a b a | dis,2. |
	}

%% part "A"
	\repeat unfold 2 { e4 b' b | fis e e | b e e | fis e2 | }
	e4 b' a | e fis d | d a' g | c,2. |
	b4 c d | e fis g | a ais b | c2. |

%% part "B"
	r4 b b | b2 e,4 | r a a | a2 dis,4 |
	r g g | g2 b,4 | e2.~ | e2 e4 |
	e fis e | fis e fis | g a g |
	a2 g4 | b c b | c2.~ | c | b |
	g~ | g~ | g~ | g |
	r | r | r | r |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

%% part "A"
	Rain -- drops on ros -- es and whisk -- ers on kit -- tens,
	bright cop -- per ket -- tles and warm wool -- en mit -- tens;
	brown pa -- per pack -- ag -- es tied up with string,
	these are a few of My Fa -- vor -- ite Things.

%% part "A"
	Girls in white dress -- es with blue sat -- in sash -- es,
	snow -- flakes that stay on my node and eye -- lash -- es,
	sil -- ver white win -- ters that melt in to spring.
	These are a few of My Fa -- vor -- ite Things.

%% part "B"
	When the dog bites, when the bee stings,
	when I'm feel -- ing sad, __
	I sim -- ply re -- mem -- ber My Fa -- vor -- ite things
	and then I don't feel so bad. __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	cream col -- ored po -- nies and crip ap -- ple strud -- els,
	door -- bells and sleigh -- bell and schnitz -- el with noo -- dles;
	wild geese that fly with the moon on the wings,
	these are a few of My Fa -- vor -- ite Things.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1959 by Richard Rodgers and Oscar Hammerstein II. Copyright Renewed." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "My Foolish Heart / Victor Young, Ned Washington"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "My Foolish Heart" }
			\fill-line {
				"Lyrics by Ned Washington"
				"Music by Victor Young"
			}
			\fill-line {
				"Slowly & Expressively"
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
	\with {
		\remove "Bar_engraver"
	}
	



\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		bes2:maj7 ees:maj7 | d:m7 g:7 | c1:m7 | f:7.9- | \myEndLine
		bes2:maj7 d:7.9+ | g1:m7 | c:m7 | f:7 | \myEndLine
		bes1:maj7 | bes2:7 bes:7.5- | ees1:6 | a2:m7.5- d:7.9- | \myEndLine
		g2:m7 d:7.5+ | g:m7 c:7 | f1:maj7 | f:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		bes2:maj7 ees:maj7 | d:m7 g:7 | c1:m7 | f:7.9- | \myEndLine
		bes2:maj7 d:7.9+ | g1:m7 | c:m7 | a2:m7.5- d:7.5- | \myEndLine
		g1:m7 | ges:7 | bes2:maj7 ees:maj7 | d:m7.5- g:7 | \myEndLine
		c1:m7 | c:m7/f |

	} \alternative {
		{
			bes2 g:m7 | c:m7 f:7 | \myEndLineVoltaNotLast
		}
		{
			bes1*2 | \myEndLineVoltaLast \endPart
		}
	}

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 




{
	\tempo "Moderato" 4 = 108
	\time 4/4
	\key bes \major

	\partial 4 f4 |

	\repeat volta 2 {

	%% part "A"
		f2~ f8 bes, d f | g a g2 g4 | g2~ g8 c, ees g | a2. a4 |
		a2~ a8 d, f a | bes c bes2 bes4 | bes2~ bes8 ees, g bes | c2. bes8 c |
		d4. d16 d d8 d d d | d4 d~ d8 d c bes | c4 c8 c c d c bes | c2. bes8 a |
		bes8 bes4 bes8 bes c a g | bes4 bes2 g8 gis | a4 a8 a a a g f | a2. g4 |

	%% part "B"
		f2~ f8 bes, d f | g a g2 g4 | g2~ g8 c, ees g | a2. a4 |
		a2~ a8 d, f a | bes c bes2 bes4 | bes2~ bes8 ees, g bes | d2. c4 |
		bes4 bes8 bes bes a g a | bes4 bes2 bes8 c | d4 d8 d d d c bes | d,2. g4 |
		bes2~ bes8 ees, g bes | c4 d bes c |
	} \alternative {
		{ bes1~ | bes4 r r f | }
		{ bes1~ | bes1 | }
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	The night __ is like a love -- ly tune,
	be -- ware __ My Fool -- ish Heart!
	How white __ the ev -- er con -- stant moon;
	take care __ My Fool -- ish Heart!

	There's a line be -- tween love and fas -- ci -- na -- tion __
	that's hard to see on an eve -- ning such as this,
	for they both give the ver -- y same sen -- sa -- tion
	when you're lost in the mag -- ic of a kiss.

%% part "B"
	His lips __ are much to close to mine,
	be -- ware __ My Fool -- ish Heart
	but should __ our ea -- ger lips com -- bine
	then let __ the fire _ start

	for this time it is -- n't fas -- ci -- na -- tion,
	or a dream that will fade and fall a -- part,
	it's love __ this time, it's love,
	My Fool -- ish Heart. __ The

	Heart. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1949 by Anne-Rachel Music Corp." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "My Funny Valentine / Richard Rodgers, Lorenz Hart"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "My Funny Valentine" }
			\fill-line {
				"Lyrics by Lorenz Hart"
				"Music by Richard Rodgers"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	c1:m | g:7/b | c:m7/+bes | a:m7.5- | \myEndLine
	aes:maj7 | f:m7.9 | d:m7.5- | g:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c1:m | g:7/b | c:m7/+bes | f/a | \myEndLine
	aes:maj7 | a4:m7.5- d:7.5-.9- g:m7 c:7.5-.9- | f1:m7.5- | bes:7.9- | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	ees2:maj7 f:m7 | g:m7 f:m7 | ees2 f:m7 | g:m7 f:m7 | \myEndLine
	ees:maj7 g4:7.5+ g:7 | c2:m7 bes4:m7 a:7.9- | aes1:maj7 | d2:m7.5- g:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c1:m | g:7/b | c:m7/+bes | f/a | \myEndLine
	aes:maj7 | d2:m7.5- g:7.9- | c:m7 b:7.9 | bes:m7.9 a:7.5-.9+ | \myEndLine
	aes1:maj7 | f2:m7 bes:7 | ees1*2 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \minor

%% part "A"
	c2 d4 ees | d4. ees8 d2 | c2 d4 ees | d4. ees8 d2 |
	c2 d4 ees | bes'2 aes4 g | f1~ | f |

%% part "A"
	ees2 f4 g | f4. g8 f2 | ees2 f4 g | f4. g8 f2 |
	ees2 f4 g | d'4. c8 bes4. a8 | aes1~ | aes2 g4 f |

%% part "B"
	bes4 r8 ees, ees4 d | ees2 ees4 d | c'4 r8 ees, ees4 d | ees2 ees4 d |
	bes' r8 ees, ees4 d | ees2 f4 g | c1~ | c2 d, |

%% part "A"
	c2 d4 ees | d4. ees8 d2 | ees2 f4 g | f4. g8 f2 |
	c'2 d4 ees | d4. ees8 d2 | ees1~ | ees |
	ees,2 f4 g | f4. g8 f2 | ees1~ | ees2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	My Fun -- ny Val -- en -- tine,
	sweet com -- ic val -- en -- tine,
	you make me smile with my heart. __

%% part "A"
	Your looks are laugh -- a -- ble,
	un -- pho -- to -- graph -- a -- ble,
	yet, you're my fav -- 'rite work of art. __

%% part "B"
	Is your fig -- ure less than Greek;
	is your mouth a lit -- tle weak
	when you o -- pen it to speak, are you smart? __

%% part "A"
	But don't change a hair for me,
	not if you care for me,
	stay lit -- tle val -- en -- tine, stay! __
	Each day is Val -- en -- tine's day. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1937 by Chappell & Co., Inc. Copyright Renewed" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "My One And Only Love / Guy Wood, Robert Mellin"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "My One And Only Love" }
			\fill-line {
				"Lyrics by Robert Mellin"
				"Music by Guy Wood"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		c2 a:m7 | d:m7 g4:9 gis:dim7 | a:m a:m7/g f2:maj7 | b:m7.5- e4:m7 a:7.9- | \myEndLine
		d:m7 d:m7/c b:m7.5- e:7 | a2:m7 ees:9 | d:m7 g4:7 g:7/f | e:m a:7.9- d:m7 g:9 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		c2 a:m7 | d:m7 g4:9 gis:dim7 | a:m a:m7/g f2:maj7 | b:m7.5- e4:m7 a:7.9- | \myEndLine
		d:m7 c:m7 b:m7.5- e:7 | a2:m7 ees:9 | d:m7 g4:7 g:7.9- | c2 fis4:m7.5- b:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		e2:m6 cis:m7.5- | fis:m7 b:7 | e2:m6 cis:m7.5- | fis:m7 b:7 | \myEndLine
		e:m e:m/dis | e:m/d e:m/cis | d:m7 aes:7.11+ | d:m7 g:7.9- | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		c2 a:m7 | d:m7 g4:9 gis:dim7 | a:m a:m7/g f2:maj7 | b:m7.5- e4:m7 a:7.9- | \myEndLine
		d:m7 c:m7 b:m7.5- e:7 | a2:m7 ees:9 | a:m7 g4:7.5+ des:9 |
	} \alternative {
		{
			c2 d4:m7 g:7.5+ | \myEndLineVoltaNotLast
		}
		{
			aes4:maj7 des:maj7 des:6 c:6.9 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Moderato" 4 = 100
	\time 2/2
	\key c \major

	\repeat volta 2 {

	%% part "A"
		r8 g a8. c16 d8 e b' g | a4 d b~ \tuplet 3/2 { b8 g f } |
		e4 c' a~ \tuplet 3/2 { a8 f e } | d4 b' g2 |
		r8 a g f e8. d16 g8. e16 | c8 a4.~ a2 |
		r8 f' g a g4 d | g1 |

	%% part "A"
		r8 g, a8. c16 d8 e b' g | a4 d b~ \tuplet 3/2 { b8 g f } |
		e4 c' a~ \tuplet 3/2 { a8 f e } | d4 b' g2 |
		r8 a g f e8. d16 g8. e16 | c8 a4.~ a2 |
		r8 f' g a g4 e | c2. r8 b |

	%% part "B"
		b'4~ \tuplet 3/2 { b8 a g } b4~ \tuplet 3/2 { b8 a g } | b,8 b4.~ b4 r8 b |
		b'4~ \tuplet 3/2 { b8 a g } b4~ \tuplet 3/2 { b8 a g } | b,2. r8 b |
		e4~ \tuplet 3/2 { e8 fis g } e4. b8 | e4~ \tuplet 3/2 { e8 fis g } e2 |
		\tuplet 3/2 { d4 d d } \tuplet 3/2 { f! d f } | d1 |

	%% part "A"
		r8 g, a8. c16 d8 e b' g | a4 d b~ \tuplet 3/2 { b8 g f } |
		e4 c' a~ \tuplet 3/2 { a8 f e } | d4 b' g2 |
		r8 a g f e8. d16 g8. e16 | c8 a4.~ a2 |
		r8 f' g f aes4 b |
	} \alternative {
		{
			c2. r4 |
		}
		{
			c1 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	The ver -- y thought of you makes my heart sing __
	like an A -- pril breeze __ on the wings of spring.
	And you ap -- pear in all your splen -- dor, __
	My One And On -- ly Love.

%% part "A"
	The shad -- own fall and spread their mys -- tic charms __
	in the hush of night __ while you're in my arms.
	I feel your lips so warm and ten -- der, __
	My One And On -- ly Love.

%% part "B"
	The touch __ of your hand __ is like heav -- en, __
	a heav -- __ en that I've __ nev -- er known.
	The blush __ on your cheek when -- ev -- __ er I speak
	tell me that you are my own.

%% part "A"
	You fill my ea -- ger heart with such de -- sire. __
	Ev -- r'y kiss you give __ sets my soul on fire.
	I give my -- self in sweet sur -- ren -- der, __
	My One And On -- ly Love.

	Love.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1952, 1953 SHERWIN MUSIC PUBLISHING CORP." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "My Romance / Richard Rodgers, Lorenz Hart"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "My Romance" }
			\fill-line { \large \smaller \bold \larger "From 'Jumbo'" }
			\fill-line {
				"Lyrics by Lorenz Hart"
				"Music by Richard Rodgers"
			}
			\fill-line {
				"Moderately Slow"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	c2:maj7 d:m7 | e:m7 ees:dim7 | d:m7 g:7 | c:maj7 bes:7.13 | \myEndLine
	a:m a:m7+ | a:m7 a:7 | d:m7 g:7 | c:maj7 c:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	f:maj7 fis:dim7 | c:maj7 c:7 | f:maj7 fis:dim7 | c1:maj7 | \myEndLine
	fis2:m7 f:7.5- | e:m7 ees:7 | a:m7.9 d:7 | d:m7 g:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c:maj7 d:m7 | e:m7 ees:dim7 | d:m7 g:7 | c:maj7 bes:7.13 | \myEndLine
	a:m a:m7+ | a:m7 a:7 | d:m7 g:7 | c:maj7 c:7 | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	f:maj7 f:maj7/e | d:m7 d:m7/c | b:m7 bes:9.11+ | a:m7 aes:7.9 | \myEndLine
	c:maj7/g a:m7 | d:m7 d4:m7/g g:7 | c1*2:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Moderato" 4 = 100
	\time 2/2
	\key c \major

	\partial 4 e8 f |

%% part "A"
	g2. e8 f | g4 a b c | c2. b8 a | g2. c,8 d |
	e2. c8 d | e4 f g a | a2. g8 f | e2. g4 |

%% part "B"
	c,2. c'4 | g2. g4 | c,2. c'4 | g2. c4 |
	b2. a4 | g2. c4 | b2. a4 | g2. e8 f |

%% part "A"
	g2. e8 f | g4 a b c | c2. b8 a | g2. c,8 d |
	e2. c8 d | e4 f g a | a2. g8 f | e2. f8 g |

%% part "C"
	a2. f8 g | a4 b c d | e e e e | c2. c8 d |
	e2. c8 d | e4 c4 a4 f4 | c'1~ | c2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	My Ro -- mance does -- n't have to have a moon in the sky,
	My Ro -- mance does -- n't need a blue la -- goon stand -- ing by;

%% part "B"
	no month of May, no twin -- kling stars,
	no hide a -- way, no soft gui -- tars.

%% part "A"
	My Ro -- mance does -- n't need a cas -- tle ris -- ing in Spain,
	nor a dance to a con -- stant -- ly sur -- pris -- ing re -- frain.

%% part "C"
	Wide a -- wake I can make my most fan -- tas -- tic dreams come true;
	My Ro -- mance does -- n't need a thing but you. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1935, T.B. Harms Company. Copyright Renewed, (c/o The Welk Music Group, Santa Monica, CA 90401)" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "My Ship / Kurt Weil, Ira Gershwin"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "My Ship" }
			\fill-line { \large \smaller \bold \larger "From The Musical Production 'Lady In The Dark'" }
			\fill-line {
				"Lyrics by Ira Gershwin"
				"Music by Kurt Weil"
			}
			\fill-line {
				"Moderately Slow"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong
	\partial 4 s4

	\repeat volta 2 {

		\myMark "A"
		\startPart
		f2 d:7 | g:m7 c:7 | f d:7 | g:m7 c:7 | \myEndLine
		f d:7 | g:m a:7 | d:m7 g:7 | g:m7 c:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		f2 d:7 | g:m7 c:7 | f d:7 | g:m7 c:7 | \myEndLine
		f d:7 | g:m a:7 | d:m g:m7 | f d:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		g:m7 c:7 | g:m7 c:7 | g:m7 c:7 | f e:7 | \myEndLine
		a:m d:m7 | a:m d:m7 | g:7 g:dim7 | g:7 c:9 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		f2 d:7 | g:m7 c:7 | f d:7 | g:m7 c:7 | \myEndLine
		f d:7 | g:m a:7 |
	} \alternative {
		{
			d:m g4.:m7 c8:7 | f2. c4:7 | \myEndLineVoltaNotLast
		}
		{
			d2:m c:7 | f c:7 | \myEndLine
			f d:m | bes c:7 | f d:m7 | g:m7.5- c:7 | f des:7 | f1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Moderato" 4 = 100
	\time 4/4
	\key f \major

	\partial 4 c4 |

	\repeat volta 2 {

	%% part "A"
		d f c' a8 c | a4 d, d r8 c | d4 f c' c | d,2. c8 cis |
		d4 f d' c8 d | c4 bes a e8 f | g1~ | g2. c,4 |

	%% part "A"
		d f c' a8 c | a4 d, d4. c8 | d4 f c' c | d,2. r8 c |
		d4 f d' c8 d | c4 bes a e8 f | g2 g | f2 r4 a8 c |

	%% part "B"
		bes4 a g4. c8 | bes4 a g2 | d'4 bes g f | a2. b!8 d |
		c4 b! a r8 d | c4 b! a b8 c | d4 b! g e | d2. c4 |

	%% part "A"
		d f c' a8 c | a4 d, d4. c8 | d4 f c' c | d,2. c8 cis |
		d4 f d' c8 d | c4 bes a4. g8 |
	} \alternative {
		{
			f4. f8 d'4. e,8 | f2 r4 c |
		}
		{
			f4. f8 g4. g8 | a2. c8 c | b!4 c f e8 f | e4 d c bes | c2 f | f, g | f1~ | f4 r r2 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this is from the fake book
\lyricmode {

%% part "A"
	My Ship has sails that are made of silk,
	the decks are trimmed with gold.
	And of jam and spice there's a par -- a -- dise in the hold. __

%% part "A"
	My Ship's a -- glow with a mil -- lion pearls and ru -- bies fill each bin;
	the sun sits high in a sap -- phire sky when my ship comes in.

%% part "B"
	I can wait the years 'til it ap -- pears one fine day one spring,
	but the pearls and such the won't mean much if there's miss -- ing just one thing.

%% part "A"
	I do not care if that day ar -- rives, that dream need nev -- er be,
	if the ship I sing does -- n't al -- so bring my own true love to me.

%% part "ending"
	My own true love to me,
	if the ship I sing does -- n't al -- so bring my own true love to me. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1941 and renewed 1969 Hampshire House Publishing Corp. and Chappell & Co., Inc., New York, NY" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Nature Boy / Eben Ahbez"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Nature Boy" }
			\fill-line {
				""
				"Lyrics and Music by Eben Ahbez"
			}
			\fill-line {
				"Med. Ballad"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\myMark "A"
	\startPart
	d1:m | e2:m7.5- a:7 | d1:m | e2:m7.5- a:7 | \myEndLine
	d:m d:m7+ | d:m7 d:m6 | g:m6 d:m | e1:m7.5- | \myEndLine
	a1*2:7 | d:m | \myEndLine
	e:7.9- | a:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	d1:m | e2:m7.5- a:7 | d1:m | e2:m7.5- a:7 | \myEndLine
	d:m d:m7+ | d:m7 d:m6 | g:m6 d:m | e1:m7.5- | \myEndLine
	a1*2:7 | d1:m | \OPC b:m7.5- | \myEndLine
	e:7.9- | a:7.5+ | d:m | \LPC e2:m7.5- \RPC a:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Moderato" 4 = 110
	\time 4/4
	\key d \minor

	\partial 8 a8 |

%% part "A"
	a'8 f d2. | r4 r8 a e' f g bes | a f d2. | r4 r8 a e' f g bes |
	a4. d8 cis2 | a4. c!8 b2 | g4. bes!8 a4. d,8 | e2. r8 a, |
	a'2. g4 | e2. a,4 | g'2. f4 | d2. a4 |
	f'2. e4 | b2. c4 | cis1 | r2 r4 r8 a |

%% part "B"
	a'8 f d2. | r4 r8 a e' f g bes | a f d2. | r4 r8 a e' f g bes |
	a4. d8 cis2 | a4. c!8 b2 | g4. bes!8 a4. d,8 | e2. r8 a, |
	a'2. g4 | e2. a,4 | g'2. f4 | d2. a4 |
	f'4. e8 b4. a8 | g'4 f2 a,8 e' | d1 | r |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	There was a boy,
	A ver -- y strange en -- chant -- ed boy
	They say he wan -- dered ver -- y far, ver -- y far,
	o -- ver land and sea;

	A lit -- tle shy
	and sad of eye,
	But ver -- y wise
	was he

%% part "B"
	And then one day,
	One mag -- ic day he came my way,
	And as we spoke of man -- y things, fools and kings,
	this he said to me: The

	great -- est thing
	you'll ev -- er learn
	is just to love and be loved
	in re -- turn.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1948, Eben Ahbez" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Nice Work If You Can Get It / George Gershwin, Ira Gershwin"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Nice Work If You Can Get It" }
			\fill-line { \large \smaller \bold \larger "From 'A Damsel In Distress'" }
			\fill-line {
				"Lyrics by Ira Gershwin"
				"Music by George Gershwin"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\myMark "A"
	\startPart
	b2:7 e:7 | a:7 d:7 | g:7 c:7 | a:7 a:7.9- | \myEndLine
	g1/d | a2:m g/b | c4:6 g/b bes:dim7 a:m7 | g1 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	b2:7 e:7 | a:7 d:7 | g:7 c:7 | a:7 a:7.9- | \myEndLine
	g1/d | a2:m g/b | c4:6 g/b bes:dim7 a:m7 | g1 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	e1:m | c:9 | e:m7 | a:7 | \myEndLine
	d2:m d:m/f | a:7/e a:7 | a1:m7 | d2:7.5+ d:7.5+/c | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	b2:7 e:7 | a:7 d:7 | g:7 c:7 | a:7 a:7.9- | \myEndLine
	g1/d | a2:m g/b | f:7 e:7 | a:m7 a4:m/d d:7.5+ | g2 ees4:7 d:7 | g1:6 | \myEndLine
	\endPart

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante Moderato" 4 = 88
	\time 2/2
	\key g \major

%% part "A"
	b'4 c c b | a b2. | g4 a a g | fis1 |
	d4. e8~ e8. d16 e8. g16 | a8 b4. r8. d,16 e8. g16 | a8 b4. g4 g8 g~ | g2. r4 |

%% part "A"
	b4 c c b | a b2. | g4 a \tuplet 3/2 { a4 gis g } | fis1 |
	d4. e8~ e8. d16 e8. g16 | a8 b4. r8. d,16 e8. g16 | a8 b4. g4 g8 g~ | g1 |

%% part "B"
	r8 b4 g8 b4 g | ais4. g8~ g2 | b8. b16 b,8. b16 e8 g4. | fis1 |
	r8 a4 fis8 a4 fis | a4. a8~ a4 a8. b16 | d4 d d8. e16 b4 | ais1 |

%% part "A"
	b4 c c b | a b2. | g4 a \tuplet 3/2 { a4 gis g } | fis1 |
	d4. e8~ e8. d16 e8. g16 | a8 b4. r8. d,16 e8. g16 | a8 b4.~ b2 | d4 b g e | g1~ | g2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	Hold -- ing hands at mid -- night 'neath a star -- y sky. Nice Work __ If You Can
	Get it, and you can get it if you try. __ Stroll -- ing with the one girl,
	sigh -- ing sigh aft -- er sign, Nice Work __ If You Can Get It, and you can ge tit if you try. __
	Just im -- ag -- ine some -- one __ wait -- ing at the cot -- tage door,
	where two hearts be -- come one. __ Who could ask for an -- y thing more? Lov -- ing one who
	loves you, and then tak -- ing that vow, Nice Work __ If You Can Get It, and if you
	get it, __ won't you tell me how? __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1937 Gershwin Publishing Corp." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Night And Day / Cole Porter"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Night And Day" }
			\fill-line {
				""
				"Lyrics and Music by Cole Porter"
			}
			\fill-line {
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 2 s2 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		d1:m7.5- | g:7 | c1*2:maj7 | \myEndLine
		d1:m7.5- | g:7 | c1*2:maj7 | \myEndLine
		fis1:m7.5- | f:m7 | e:m7 | ees:dim7 | \myEndLine
		d:m7 | g:7 | c:maj7 |
	} \alternative {
		{
			c:maj7 | \myEndLineVoltaNotLast
		}
		{
			bes:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	ees1*2:maj7 | c:maj7 | \myEndLine
	ees:maj7 | c:maj7 | \myEndLine
	fis1:m7.5- | f:m7 | e:m7 | ees:dim7 | \myEndLine
	d:m7 | g2:7 d:m7 | c1:6 | \LPC d2:7 \RPC g:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

	\partial 2 g'4 g8 g~ |

%% part "A"
	\repeat volta 2 {
		g1~ | g2 \tuplet 3/2 { f4 e dis } | e1~ | e2 g4 g8 g~ |
		g4 g g g | g f \tuplet 3/2 { f e dis } | e1~ | e2 e4. e8 |
		e4 e e e | ees2~ ees8 ees4 ees8 | d4 d d d | d des8 c~ c4 b |
		a4 aes8 g~ g2 | g g'4 g8 g~ | g1~ |
	} \alternative {
		{
			g2 g4 g8 g |
		}
		{
			g2 g4 g |
		}
	}

%% part "B"
	bes1~ | bes2 \tuplet 3/2 { g4 f ees } | g g8 g~ g2~ | g g4. g8 |
	bes c4 bes8 c4 bes8 c~ | c bes4 g8~ \tuplet 3/2 { g4 f ees } | g g8 g~ g2~ | g2 e!4. e8 |
	e4 e e e | ees2~ ees8 ees4 ees8 | d4 d d d | d8 des c b'~ b bes a4 |
	g4 g8 g~ g2~ | g c4 c8 c~ | c1 | r |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

%% part "A"
	Night And Day __
	You are the one __
	On -- ly you __ be -- nea -- th the moon
	And under the sun __
	Whe -- ther near to me or far __ _
	No mat -- ter, dar -- ling Where you are __ _
	I think of __ you
	Night And Day __

	Day and night __

%% part "B"
	_ Night And Day
	Un -- der the hide of me __
	There's an oh such a hun -- gry
	Year -- __ nin' bur -- __ nin' in -- side of me __
	And its tor -- ment won't be through __
	'Til you let me spend my life
	Mak -- ing love __ to you
	Day and night __
	Night And Day __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	_ _ _
	Why it is so __
	That this long -- __ ing for you
	Fol -- lows wher -- ever I go. __
	In the roa -- rin' tra -- ffic's boom __
	In the si -- lence of my lone -- ly room __ _
	I think of __ you
	Night And Day __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Now's The Time / Charlie Parker"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Now's The Time" }
			\fill-line {
				""
				"Music by Charlie Parker"
			}
			\fill-line {
				"Fast Blues"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f1*4:7 | \myEndLine
		bes1:7 | bes2:7 b:dim7 | f1*2:7 | \myEndLine
		g1:m7 | c:7 | f:7 | g2:m7 c:7 | \myEndLine
	}
	\endPart

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Presto" 4 = 190
	\time 4/4
	\key f \major

	\partial 8 c8 |

	\repeat volta 2 {
		f f g c, f4 r8 c | f f g c, f4 r8 c | f f g c, f f g c, | f f g c, f4 r8 c |
		f f g c, f bes,4. | f'8 f g c, f b,!4. | f'8 f g c, f f g c, | f f g c, f4 r8 aes~ |
		\tuplet 3/2 { aes16 bes aes } f8 d b! d4 r | r8 g4. f8 g f ees | r c r c4 r8 r4 | r1 |
	}
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1945, Atlantic Music Corp." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Ol' Man River / Jerome Kern, Oscar Hammerstein II"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Ol' Man River" }
			\fill-line {
				"Lyrics by Oscar Hammerstein II"
				"Music by Jerome Kern"
			}
			\fill-line {
				"Very Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\repeat volta 2 {

		\myMark "A"
		\startPart
		ees2 c:m7 | ees aes | ees aes | ees c:m7 | \myEndLine
		f:m7 bes:9 | f:m7 bes:9 | ees aes:6 | ees1 | \myEndLine
		\endPart

		\myMark "A'"
		\startPart
		ees2 c:m7 | ees aes | ees c:m | ees ges:dim7 | \myEndLine
		f:m7 bes:7 | f:m7 bes:9 | ees aes | ees a4:m7.5- d:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		g2:m d:7.9- | g:m d:7.9- | g:m d:7.9- | g:m d:7.9- |
		g:m c:m6 | g:m d:7.9- | g:m d:7.9- | g:m f4:m7 bes:7 |
		\endPart

		\myMark "A''"
		\startPart
		ees2 c:m7 | ees aes | ees bes:9 | c:m7 f:7 | \myEndLine
		ees4/bes b:dim c2:m7 | f:m9 bes:7 |
	} \alternative {
		{
			ees aes:m | ees f4:m7 bes:7 | \myEndLineVoltaNotLast
		}
		{
			ees2 f4:m7 bes:7 | ees1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 88
	\time 4/4
	\key ees \major

	\repeat volta 2 {

	%% part "A"
		bes4 bes c8 ees4 c8 | bes4 bes c8 ees4 f8 | g4 g f8 ees4 f8 | g4 bes c8 bes4 c8 |
		bes4 bes g8 f4 g8 | bes4 bes g8 f4 g8 | ees1~ | ees2. r8 bes8 | bes4 bes c8 ees4 c8 |
		bes4 bes c8 ees4 f8 | g4 bes c8 bes4 c8 | ees4 ees d8 c4 d8 | bes4 bes g8 f4 g8 |
		bes4 bes g8 f4 g8 | ees1~ | ees4 r4 r2 | d'4 bes c4. ees8 | d4 bes c2 |
		d8. d16 bes4 c8. c16 ees4 | d bes c2 | bes8 r g4 a2 | bes4 g a2 | bes8. bes16 g8. g16 a4 c8. c16 |
		bes4 g f2 | bes,4 bes c8 ees4 c8 | bes4 bes c8 ees4 f8 | g4 bes c8 bes4 c8 | ees4 ees f8 ees4 f8 |
		g4 g f8 ees4 f8 | g4 g f8 ees f4 |
	} \alternative {
		{
			ees4 r r2 | R1 |
		}
		{
			ees1~ | ees4 r r2 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	Ol' Man Riv -- er, dat Ol' Man Riv --er, he must know sump -- in', but don't say noth -- in' he
	jus' keeps roll -- in', he keeps on roll -- in' a -- long. __ He don't plant 'ta -- ters, he
	don't plant cot -- ton, an' dem dat plants 'em is soon for -- got -- ten; but Ol' Man Riv --er, he
	jus' keeps roll -- in' a -- long. __ You an' me, we sweat an' strain,
	bo -- dy all ach -- in' an' racked wid pain. "\"Tote" dat "barge!\"" "\"Lift" dat "bale,\"" git a lit -- tle drunk an' you
	land in jail. Ah gits wea -- ry an' sick of try -- in', Ah'm tired of liv -- in' an' skeered of dy -- in'. But
	Ol' Man Riv -- er, he jus' keeps roll -- in' a -- long.
	long. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1927 T.B. Harms Company. Copyright Renewed." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Once I Loved / Antonio Carlos Jobim, Vinicius DeMoraes, Ray Gilbert"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Once I Loved" }
			\fill-line {
				"Lyrics by Vinicius DeMoraes, Ray Gilbert"
				"Music by Antonio Carlos Jobim"
			}
			\fill-line {
				"Bossa"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		g1:m7 | c:7.5+ | f:maj7 | fis:dim7 | \myEndLine
		g:m7 | gis:dim7 | a:m7 | a:m7/g | \myEndLine
		f:m7 | bes:7.5+ | ees1*2:maj7 | \myEndLine
		e1:m7.5- | a:7.9- |
	} \alternative {
		{
			d:maj7 | d:7.9- | \myEndLineVoltaNotLast
		}
		{
			d:maj7 | g:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	c1:maj7 | f:7 | bes1*2:maj7 | \myEndLine
	b1:dim7 | bes:m6 | a:m6 | aes:7.5- | \myEndLine
	g:7 | g2:m7 a:7.9- | d1:m6 | d2:m6 \OPC d:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 144
	\time 4/4
	\key f \major

%% part "A"
	\repeat volta 2 {
		d'1~ | d2~ d8 c4 a8~ | a1~ | a2 \tuplet 3/2 { r4 bes c } |
		\tuplet 3/2 { d d d } \tuplet 3/2 { d d d } | d2 \tuplet 3/2 { f4 e d } |
		\tuplet 3/2 { e c a~ } a2~| a2. r4 |
		c1~ | c2~ c8 bes4 g8~ | g1~ | g2 \tuplet 3/2 { r4 g a } |
		\tuplet 3/2 { bes bes a } \tuplet 3/2 { c c bes } | a2 \tuplet 3/2 { g4 bes a } |
	} \alternative {
		{
			g8 fis4 fis8~ fis2~ | fis r
		}
		{
			g8 fis4 a8~ a2 | g8 f!4 a8~ a g4 e8~ |
		}
	}

%% part "B"
	e1 | g2~ g8 f4 d8~ | d1~ | d2 \tuplet 3/2 { r4 d e } |
	\tuplet 3/2 { f f e~ } \tuplet 3/2 { e g ges } | f2~ f8 f4 des8 | e4 d8 d~ d2~ |
	d2 \tuplet 3/2 { r4 d e } | \tuplet 3/2 { f f e~ } \tuplet 3/2 {e g ges } |
	f2~ f8 f4 cis8 | e4. d8 d2~ | d1 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
	Once __ __ I loved, __ __
	And I gave so much love to this love,
	You were the world to me; __ __

	Once __ __ I cried __ __
	at the thought I was fool -- ish and proud
	and let you say good -- bye. __ __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {
	Then __ __ one day, __ __
	From my in -- fi -- nite sad -- ness you came
	and brought me love a -- gain; __ __
	Now __ __ I know __ __
	that no mat -- ter what -- ev -- er be -- falls
	I'll nev -- er _ _ _ let you go, __

	I will hold __ you close, __
	Make __ you stay; __ __
	Be -- cause love is the __ sad -- dest thing __
	when it goes a -- way, __ __
	Be -- cause love is the __ sad -- dest thing __
	when it goes a -- way, __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1965, Ipanema Music. Used By Permission." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "One By One / Wayne Shorter"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "One By One" }
			\fill-line {
				""
				"Music by Wayne Shorter"
			}
			\fill-line {
				"Shuffle"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		a4:m7.5- d:7.5+.9+ aes2:7 | g:m7 f4:m7 bes:7 | ees:maj7.9 c:m11 f2:7.9 | bes1:maj7.9 | \myEndLine
		a2:m7.5- aes:7 | g:m7 bes:7/f | e:m7.5- d:7.5+.9+ | g1:m11 | \myEndLine
	}
	\endPart

	\myMark "B"
	\startPart
		e2:7.9+ a:7.5+.9+ | d:m7 b:m7.5- | e:m7.5- a:7.5+.9+ | d1:m7 | \myEndLine
		a2:m7.5- aes:7 | g:m7 bes:7/f | e:m7.5- d:7.5+.9+ | g1:m11 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	a4:m7.5- d:7.5+.9+ aes2:7 | g:m7 f4:m7 bes:7 | ees:maj7.9 c:m11 f2:7.9 | bes1:maj7.9 | \myEndLine
	a2:m7.5- aes:7 | g:m7 bes:7/f | e:m7.5- d:7.5+.9+ | g1:m11 | \myEndLine
	\endPart

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 128
	\time 4/4
	\key g \minor

%% part "A"
	\repeat volta 2 {
		d4 f r8 d4 bes8~ | bes2 d4 f | a f r8 d c d~ | d1 |
		r8 des' c g bes bes c f, | g4 bes8 g bes bes c bes | d4 c8 g bes bes c g~ | g1 |
	}

%% part "B"
	r8 aes' g d f f g d~ | d1~ | d~ | d2. f4 |
	r8 des c g bes bes c f, | g4 bes8 g bes bes c bes | d4 c8 g bes bes c g~ | g1 |

%% part "A"
	d4 f r8 d4 bes8~ | bes2 d4 f | a f r8 d c d~ | d1 |
	r8 des' c g bes bes c f, | g4 bes8 g bes bes c bes | d4 c8 g bes bes c g~ | g1 |
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1963 Miyako Music" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "One Note Samba / Antonio Carlos Jobim, Newton Mendonca"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "One Note Samba" }
			\fill-line { \large \smaller \bold \larger "Samba de uma nota so" }
			\fill-line {
				"Lyrics by Newton Mendonca"
				"Music by Antonio Carlos Jobim"
			}
			\fill-line {
				"Samba"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 2 s2 |

	\myMark "A"
	\startPart
	d1:m7 | des:7 | c:m7 | b:7.5- | \myEndLine
	d:m7 | des:7 | c:m7 | b:7.5- | \myEndLine
	f:m7 | bes:7 | ees:maj7 | aes:7 | \myEndLine
	d:m7 | des:7 | c2:m7 b:7.5- | bes1:6 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	ees:m7 | aes:7 | des1*2:maj7 | \myEndLine
	des1:m7 | ges:7 | ces:maj7 | c2:m7.5- b:7.5- | \myEndLine
	\endPart

	\myMark "A'"
	\startPart
	d1:m7 | des:7 | c:m7 | b:7.5- | \myEndLine
	d:m7 | des:7 | c:m7 | b:7.5- | \myEndLine
	f:m7 | bes:7 | ees:maj7 | aes:7 | \myEndLine
	des:6 | c:7 | b:maj7 | bes:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key bes \major

	\partial 2 r8 f4 f8 |

%% part "A"
	f4 f8 f~ f f4 f8~ | f f4. r8 f4 f8 | f4 f8 f~ f f4 f8~ | f2 r8 f4 f8 |
	f4 f8 f~ f f4 f8~ | f f4. r8 f4 f8 | f4 f8 f~ f f4 f8~ | f2 r8 bes4 bes8 |
	bes4 bes8 bes~ bes bes4 bes8~ | bes bes4. r8 bes4 bes8 | bes4 bes8 bes~ bes bes4 bes8~ | bes4. r8 r f4 f8 |
	f4 f8 f~ f f4 f8~ | f f4 f8~ f f f4 | f f8 f~ f f4 bes8-^ | r1 |

%% part "B"
	bes8 c des ees des c bes aes | ges f ees des c des ees f | c4. bes8 r c des f | c4. bes8 r2 |
	aes'8 bes ces des ces bes aes ges | fes ees des ces bes ces des ees | bes4. aes8 r bes ces ees | ges4. f8 r f4 f8 |

%% part "A"
	f4 f8 f f~ f4 f8~ | f f4. r8 f4 f8 | f4 f8 f~ f f4 f8~ | f2 r8 f4 f8 |
	f4 f8 f~ f f4 f8~ | f f4. r8 f4 f8 | f4 f8 f~ f f4 f8~ | f2 r8 bes4 bes8 |
	bes4 bes8 bes~ bes bes4 bes8~ | bes bes4. r8 bes4 bes8 | bes4 bes8 bes~ bes bes4 bes8~ | bes2 r8 bes4 bes8 |
	bes4 bes8 bes~ bes bes4 bes8~ | bes bes4 bes8 bes4 bes~ | bes bes8 bes~ bes bes4 bes8-^ | r2 r8 <\parenthesize f>4 <\parenthesize f>8 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% these are lyrics copied from the internet and adjusted for real book
\lyricmode {

%% part "A"
	This is just a lit -- __ tle sam -- __ ba
	built up -- on a sin -- __ gle note. __
	Oth -- er notes are bound __ to fol -- __ low
	but the root is still __ that note. __
	Now the new one is __ the con -- __ sequence __
	of the one we've just __ been through __
	as I'm bound to be __ the un -- __ a -- void -- __ a -- ble
	con -- se -- quence __ of you. __

%% part "B"
	There's so man -- y peo -- ple who can talk and talk and talk
	and just say no -- thing or near -- ly no -- thing
	I have used up all the scale I know and at the end I've come to no -- thing
	or near -- ly no -- thing

%% part "A"
	So I come back to my first __ note as I must come back __ to you. __
	I will pour in -- to __ that one __ note all the love I feel __ for you __
	A -- ny -- one who wants __ the whole __ show, Re, Mi, Fa, Sol, La, __ Te, Doh. __
	he will find him -- self __ with no __ show.
	Bet -- ter play __ the note __ you know.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1961, 1962 by Antonio Carlos Jobim and Mrs. Mendonca, Brazil" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Opus One / Sy Oliver"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Opus One" }
			\fill-line {
				""
				"Lyrics and Music by Sy Oliver"
			}
			\fill-line {
				"Moderate Jump Tempo"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\myMark "A"
	\startPart
	g1*2 | c:9 | \myEndLine
	a1:9 | a2:m7 d:9 | g bes:dim7 | a:m7 d4:9 d:aug | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g1*2 | c:9 | \myEndLine
	a1:9 | a2:m7 d:9 | g c:9 | g1 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	bes2 g:m7 | c:m7 f:7.9- | bes:6 g:7.5+ | c:9 f:9.5+ | \myEndLine
	des bes:m7 | ees:m7 aes:7.9- | des2..:6 des8 | des8 d2..:13 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g1*2 | c:9 | \myEndLine
	a1:9 | a2:m7 d:9 | g c:9 | g4 ees:9 g2 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 168
	\time 2/2
	\key g \major

	\partial 8 d8 |

%% part "A"
	e g fis4 e4. d8 | e g fis e~ e4. d8 | e g fis4 e4. d8 | e g fis e~ e4. d8 |
	e g fis4 e4. d8 | e g fis e~ e4. d8 | e g fis4 e8 g fis4 | e8 g fis e~ e4. d8 |

%% part "A"
	e g fis4 e4. d8 | e g fis e~ e4. d8 | e g fis4 e4. d8 | e g fis e~ e4. d8 |
	e g fis4 e4. d8 | e g fis e~ e4. d8 | e g e d e g e g~ | g4. b8~ b d b g |

%% part "B"
	f! bes4 r8 bes4. g8 | c4 c c8 d4 bes8~ | bes4. g8~ g4. g8~ | g4. g8~ g4. g8 |
	aes des4 r8 des4. bes8 | ees4 ees ees8 f4 des8~ | des2~ des4. des8~ | des8 d4.~ d4. d,8 |

%% part "A"
	e g fis4 e4. d8 | e g fis e~ e4. d8 | e g fis4 e4. d8 | e g fis e~ e4. d8 |
	e g fis4 e4. d8 | e g fis e~ e4. d8 | e g e d e g e g~ | g2~ g8 r r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	I'm wrack -- in' my brain, to think of a name, __
	to give to this tune, so Per -- ry can croon, __
	and may -- be ol' Bing will give it a fling. __
	And that -- 'll start ev -- 'ry -- one hum -- min' the thing. __

%% part "A"
	The mel -- o -- dy's dumb, re -- peat an' re -- peat. __
	But if you can swing, it's got a good beat. __
	And that's the main thing, to make with the feet. __
	'Cause ev -- 'ry -- one is swing -- in' to day. __

%% part "B"
	So, __ I'll call it O -- pus One! It's not for Sam -- my Kaye. __
	Hey! __ hey! __ hey! __ It's O -- pus One! It's got to swing,
	not sway. __ May -- be, __

%% part "A"
	if Mis -- ter Les Brown could make it re -- nown, __
	and Ray An -- tho -- ny could swing it for me. __
	There's nev -- er a doubt you'll knock your -- self out. __
	When -- ev -- er you can hear O -- pus One. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1943 (Renewed) Embassy Music Corporation, New York." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Orchids In The Moonlight / Vincent Youmans, Gus Kahn, Edward Eliscu"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Orchids In The Moonlight" }
			\fill-line {
				"Lyrics by Gus Kahn, Edward Eliscu"
				"Music by Vincent Youmans"
			}
			\fill-line {
				"With a Tango Beat"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f1:m | des2 f1.:m | c1:7 | \myEndLine
	c:7 | g2:m7.5- c1.:7 | f1:m | \myEndLine
	f:m | des2 f:m | f1:7 | bes:m | \myEndLine
	bes:m | f1:m | c:7 | f4:m c:7 f2:m | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	f2 f4:dim c:7 | f1. f2:6 | c1:7 | \myEndLine
	c1*3:7 | f2. fis4:dim | \myEndLine
	c2:7 f4:dim c:7 | f1. f2:7 | bes1 | \myEndLine
	bes | des:7 | f2 f4:dim c:7 | f4 c:7 f2 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Moderato" 4 = 108
	\time 4/4
	\key f \minor

%% part "A"
	r8 f f g aes4 g8 f | des'2 c~ | c8 c c des ees4 des8 c | e!1 |
	r8 bes bes c des4 c8 bes | f'2 e!2~ | e8 c c des ees!4 des8 c | f1 |
	r8 f, f g aes4 g8 f | des'2 c~ | c8 c c des ees4 des8 c | f1 |
	r8 des ees f~ f ees des bes | r c des ees~ ees des c aes | r bes c des~ des bes g e! | f4 r r2^\markup { \italic { Fine } } |

%% part "B"
	\key f \major
	r4 c8 a' aes4 bes,8 g' | f2 c~ | c4 f8 a c4. c8 | c1 |
	r4 bes8 a bes c4 bes8 | a4 gis8 g gis a4 gis8 | g!4 fis8 f fis g4 e8 | c2. r4 |
	r c8 a' aes4 bes,8 g' | f2 c~ | c8 f a c f4. f8 | f1 |
	r4 d8 cis d e4 d8 | des4 des8 c des ees4 des8 | c4 c,8 a' aes4 bes,8 g' | f2. r4^\markup { \italic { D.C. al Fine } } |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	When or -- chids bloom in the moon -- light __ and lov -- ers vow to be true;
	I still can dream in the moon -- light, __ of one dear night that we knew.
	When or -- chids fade in the dawn -- ing, __ they speak of tears and "\"Good" -- "bye!\""
	Tho' my dreams __ are shat -- tered, like the pet -- als scat -- tered, still my love __ can nev -- er die.

%% part "B"
	There is peace in the twi -- light, __ when the day is thru,
	but the shad -- own that fall on -- ly seem to re -- call all my long -- ing for you.
	There's a dream in the moon -- beams, __ up on the sea of blue;
	but the moon -- beams that fall, on -- ly seem to re -- call, love is all, love is you.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1933 by T.B. Harms Co." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Ornithology / Charlie Parker, Benny Harris"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Ornithology" }
			\fill-line {
				""
				"Music by Charlie Parker, Benny Harris"
			}
			\fill-line {
				"Fast Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		g1*2:maj7 | g2:m7 c:7 | g:m7 c:7 | \myEndLine
		f1*2:maj7 | f1:m7 | bes:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		ees:7 | d:7 |
	} \alternative {
		{
			g:m | c2:m7.5- d:7 | \myEndLine
			b1:m7 | e:7 | a:m7 | d:7 | \myEndLineVolta
		}
		{
			g | a2:m7 d:7 | \myEndLine
			g/b bes:7 | a:m7 aes:7 | g1*2:maj7 | \myEndLineVolta \endPart
		}
	}

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Presto" 4 = 200
	\time 4/4
	\key g \major

	\partial 8 d8 |

	\repeat volta 2 {

	%% part "A"
		g a b c d b c d | b g r4 r r8 d | g a bes c d e4 f!8~ | f g, a bes~ bes4. d8 |
		c a4 f!8 bes gis a f~ | f r r4 r4 r8 aes~ | aes4 g8 f! e g f c | f!4 ees8 d r4 r8 des'8~ |

	%% part "B"
		des4 c8 bes a c bes g | a4 g8 fis r4 r8 d |
	} \alternative {
		{
			a' g d bes f' d ees d~ | d a' \tuplet 3/2 { fis! g a fis g a fis g a } |
			d4 r r8 a \tuplet 3/2 { fis g a } | \tuplet 3/2 { fis g a fis g a fis g a fis g a } |
			d b a g c aes fis d | ees f! g b bes ges e! d |
		}
		{
			a' g d b f'! d ees d~ | d a' \tuplet 3/2 { fis! g a fis g a fis g a } |
			d r r4 r2 | r8 a \tuplet 3/2 { fis g a fis g a fis g a } |
			d a \tuplet 3/2 { fis g a fis g a fis g a } | d r r4 r2 |
		}
	}
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1946 ATLANTIC MUSIC CORP." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Polka Dots And Moonbeams / Jimmy Van Heusen, Johnny Burke"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Polka Dots And Moonbeams" }
			\fill-line {
				"Lyrics by Johnny Burke"
				"Music by Jimmy Van Heusen"
			}
			\fill-line {
				"Slowly, with expression"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f2 d:m7 | g:m7 c4:7 c:7/bes | a2:m7 d:m7 | g:m7 e4:m7.5- a:7.9- | \myEndLine
	d2:m d:m7+/cis | d:m7/c a4:m7 aes:m7 | g2:m7 c4:7 c:9/bes | a4:m7 d:7.9- g:m7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f2 d:m7 | g:m9 c4:7 c:7/bes | a2:m7 d:m7 | g:m7 e4:m7.5- a:7.9- | \myEndLine
	d2:m d:m7+/cis | d:m7/c a4:m7 aes:m7 | g2:m7 c4:9 c:7.9- | f2:6 b4:m7.5- e:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	a2 ais:dim7 | b:m7 e4:7 e:7/d | cis2:m7 fis:m7 | b:m7 e:7 | \myEndLine
	a2 ais:dim7 | b:m7 e:7 | a:7 d:7 | g:m7 c:9 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f2 d:m7 | g:m9 c4:7 c:7/bes | a2:m7 d:m7 | g:m7 e4:m7.5- a:7.9- | \myEndLine
	d2:m d:m7+/cis | d:m7/c a4:m7 aes:m7 | g2:m7 c4:9 c:7.9- | f4:6 ees:6 e:6 f:6.9 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



% the tune was turned into 8'th notes instead of triplets.
{
	\tempo "Adagio" 4 = 76
	\time 4/4
	\key f \major

%% part "A"
	r8 c d e f g a c | a4 g8 f e d4. | r8 c d e f g a c | d4 c8 bes a g4. |
	f8 g f g f2 | a8 a g f e ees4. | d8 bes' g f e d'4 c8~ | c1 |

%% part "A"
	r8 c, d e f g a c | a4 g8 f e d4. | r8 c d e f g a c | d4 c8 bes a g4. |
	f8 g f g f2 | a8 a g f e ees4. | d8 bes' g f e a4 f8~ | f2. e8 fis |

%% part "B"
	e4 cis'2 e8 ees | d cis b a gis e4. | e8 fis fis gis \tuplet 3/2 { gis4 a cis } | e2. e,8 fis |
	e4 cis'2 e8 ees | d cis b a gis e4. | r8 a4 b8 a4 bes | c bes8 g~ g r8 r4 |

%% part "A"
	r8 c, d e f g a c | a4 g8 f e d4. | r8 c d e f g a c | d4 c8 bes a g4. |
	f8 g f g f2 | a8 a g f e ees4. | d8 bes' g f e a4 f8~ | f2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	A coun -- try dance was be -- ing held in a gar -- den,
	I felt a bump and heard an "\"Oh," beg your par -- "don,\""
	sud -- den -- ly I saw Pol -- ka Dots And Moon -- beams
	all a -- round a pug -- nosed dream. __

%% part "A"
	The mus -- ic start -- ed and was I the per -- plexed one,
	I held my breath and said "\"may" I have the next "one.\""
	In my fright -- ened arms Pol -- ka Dots And Moon -- beams
	spark -- led on a pug -- nosed dream. __

%% part "B"
	There were ques -- tions in the eyes of oth -- er danc -- ers
	as we float -- ed o -- ver the floor.
	There were ques -- tions but my heart knew all the an -- swers,
	and per -- haps a few things more. __

%% part "A"
	Now in a cot -- tage built of li -- lacs and laugh -- ter
	I know the mean -- ing of the words "\"ev" -- er af -- "ter.\""
	And I'll al -- ways see Pol -- ka Dots And Moon -- beams
	when I kiss the pug -- nosed dream. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1940 by ARC Music Corp., now Bourne Co. and Dorsey Bros." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Poor Butterfly / Raymond Hubbell, John L. Golden"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Poor Butterfly" }
			\fill-line {
				"Lyrics by John L. Golden"
				"Music by Raymond Hubbell"
			}
			\fill-line {
				"Moderately Slow"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\partial 2. s2. |

	\myMark "A"
	\startPart
	bes1:m7 | ees:7 | aes1*2:maj7 | \myEndLine
	c:7.5+ | f:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	bes1:m7 | ees:7 | g2:m7.5- c:7.5+ | f1:m7 | \myEndLine
	bes1*2:7 | bes1:m7 | ees:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	bes1:m7 | ees:7 | aes1*2:maj7 | \myEndLine
	c:7.5+ | f:7 | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	bes1:m7 | des2:m7 ges:7 | aes1:maj7 | c2:m7 f:7 | \myEndLine
	bes1:m7 | ees:7 | aes1*2 | \myEndLine
	\endPart

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 88
	\time 4/4
	\key aes \major

	\partial 2. ees4 e f |

%% part "A"
	des'1~ | des4 c8 bes des4 c | bes2 bes~ | bes4 aes b, c |
	aes'1~ | aes4 b,8 c aes'4 g | g1~ | g4 f b, c |

%% part "B"
	g' f8 g f2~ | f4 ees d ees | bes' aes8 bes aes2~ | aes4 f g aes |
	c bes8 c bes2~ | bes4 aes e f | bes1~ | bes4 ees,4 e f |

%% part "A"
	des'1~ | des4 c8 bes des4 c | bes2 bes~ | bes4 aes b, c |
	aes'1~ | aes4 b,8 c aes'4 g | g1~ | g2 f4 c |

%% part "C"
	des ees8 f ees'2~ | ees4 des8 c ees4 des | des b8 c g2~ | g4 aes c, g' |
	f1~ | f4 d8 ees des'?4 c | aes1~ | aes4 r r2 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	Poor But -- ter -- fly, __ 'neath the blos -- soms wait -- int, __ Poor But -- ter --
	fly __ for she loved him so. __ The mo -- ments pass in -- to hour, __ the hours _
	pass in -- to years, __ and as she smiles through her tears, __ she mur -- murs low, __
	"\"The" moon and I __ know that he'll be faith -- ful. __ I'm sure he'll come __
	to me by and bye. __ But if he don't come back, __ then I'll nev -- er
	sigh or _ cry, __ I just mus' "die.\"" Poor _ But -- ter -- fly. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1998 Hal Leonard Corporation" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Prelude To A Kiss / Duke Ellington, Irving Gordon and Irving Mills"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Prelude To A Kiss" }
			\fill-line {
				"Lyrics by Irving Gordon and Irving Mills"
				"Music by Duke Ellington"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\myMark "A"
	\startPart
	d2:9 g:7.5+ | c:9 f:maj7 | b:7 e:7 | a:7 d:m |
	d:m7 g:7 | c d:7 d:m7 g:7.9- | c a:7 |
	\endPart

	\myMark "A"
	\startPart
	d2:9 g:7.5+ | c:9 f:maj7 | b:7 e:7 | a:7 d:m |
	d:m7 g:7 | c d:7 d:m7 g:7.9- | c1 |
	\endPart

	\myMark "B"
	\startPart
	e2 cis:m | fis:m7 b:7 | e2 cis:m | fis:m7 b:7 | e2 cis:m |
	fis:m7 b:7 | e4. a:7 d4:9 |
	d:m7 dis:m7 e:m7 a:7.9- |
	\endPart

	\myMark "A"
	\startPart
	d2:9 g:7.5+ | c:9 f:maj7 | b:7 e:7 | a:7 d:m |
	d:m7 g:7 | c d:7 d:m7 g:7.9- | c1 |
	\endPart

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante Moderato" 4 = 88
	\time 4/4
	\key c \major

%% part "A"
	b'4 bes a gis | g a8 e~ \tuplet 3/2 { e4 f g } | gis4 g fis f | e f8 d~ d2 |
	\tuplet 3/2 { g4 g g } \tuplet 3/2 { g gis a } | c,4 d'8 b~ b2 | d,8 e f gis~ gis4 gis8 a~ | a2. r4 |

%% part "A"
	b4 bes a gis | g a8 e~ \tuplet 3/2 { e4 f g } | gis4 g fis f | e f8 d~ d2 |
	\tuplet 3/2 { g4 g g } \tuplet 3/2 { g gis a } | c,4 d'8 b~ b2 | d,8 e f gis~ gis4 a8 c,~ | c2. r4 |

%% part "B"
	r4 ais'8 b dis, e dis' cis | b a c,2 cis4 | r fis8 fis fis4 e |
	r4 a8 a a2 | r4 ais8 b dis, e dis' cis | b a c,2 cis4 | e8 e4 e8~ e4 e8 e |
	g4 gis a ais |

%% part "A"
	b4 bes a gis | g a8 e~ \tuplet 3/2 { e4 f g } | gis4 g fis f | e f8 d~ d4 d |
	\tuplet 3/2 { g4 g g } \tuplet 3/2 { g gis a } | c,4 d'8 b~ b2 | d,8 e f gis~ gis4 a8 c,~ | c1 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	If you hear a song in blue __ like a flow -- er cry -- ing for the dew __
	that was my heart ser -- e -- nad -- ing you __ my Pre -- lude To A Kiss. __ If you hear a
	song that grows from my ten -- der sen -- ti -- men -- tal woes __ That was my heart try -- ing to com -- pose __
	a Pre -- lude To A Kiss. __ Though it's just a sim -- ple mel -- o -- dy with noth -- ing fan -- cy,
	noth -- ing much you could turn it to a sym -- pho -- ny a Schu -- bert tune __ with a
	Gersh -- win touch. Oh! How my love song gen -- tly cries __ for the ten -- der -- ness with --
	in your eyes __ my love is a pre -- lude that nev -- er dies __ a Pre -- lude To A Kiss. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Quiet Nights Of Quiet Stars / Antonio Carlos Jobim, Antonio Carlos Jobim, Gene Lees"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Quiet Nights Of Quiet Stars" }
			\fill-line { \large \smaller \bold \larger "Corcovado" }
			\fill-line {
				"Lyrics by Antonio Carlos Jobim, Gene Lees"
				"Music by Antonio Carlos Jobim"
			}
			\fill-line {
				"Moderately Slow"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	d1*2:9 | aes:dim7 | \myEndLine
	g1:m7 | c8*5:7 ges4.:7 | f2:dim7 f:maj7 | f1:maj7 | \myEndLine
	f:m7 | bes:13 | e:m7 | a:7.5+ | \myEndLine
	d:9 | d2.:9 d4:m7 | d2.:m7 aes4:dim7 | aes1:dim7 | \myEndLine
	\endPart

	\myMark "A'"
	\startPart
	d1*2:9 | aes:dim7 | \myEndLine
	g1:m7 | c8*5:7 ges4.:7 | f2:dim7 f:maj7 | f1:maj7 | \myEndLine
	f:m7 | bes:7.5- | e:m7 | a:m7 | \myEndLine
	d:m7 | g:7.9- | e:m7 | a:7.5+ | \myEndLine
	d:m7 | g:9 | c1*2:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key c \major

%% part "A"
	r8 e4 d8 e d4 e8~ | e d e2. | r8 e4 d8 e d4 e8~ | e d e2. |
	r8 d4 c8 d c4 d8~ | d c4 f8~ f e4 e8~ | e4. d8~ d2~ | d2. r4 |
	r8 g4 f8 g f4 g8~ | g f4 g8~ g2 | r8 f4 e8 f e4 f8~ | f e f2. |
	r8 e4 d8 e d4 e8~ | e d4 e8~ e d f4~ | f8 e4 f8 e4 f~| f8 e4 d8~ d c4. |

%% part "A'"
	r8 e4 d8 e d4 e8~ | e d4 e8~ e2 | r8 e4 d8 e d4 e8~ | e d e4~ e8 g4 d8~ |
	d2 \tuplet 3/2 { c4 d c } | d8 c4 f8~ f e4 e8~ | e4. d8~ d2~ | d2. r4 |
	r8 c'4 bes8~ bes aes g f | e4. d8~ d2 | r4 r8 b' a g f e | d4. c8~ c2 |
	r4 r8 a' g f e d | c b4 c8~ c d4 g8~ | g1~ | g2 r |
	r4 r8 a g f e d | c b4 c8~ c d4 c8~ | c1~ | c2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Qui -- et Nights Of Qui -- et Stars,
	qui -- et chords from my __ gui -- tar
	float -- ing on the si -- lence that __ sur -- rounds __ us. __
	Qui -- et thoughts and qui -- et dreas, __
	qui -- et walks by qui -- et streams,
	and a win -- dow look -- ing on __ the moun -- tains and the sea. __
	How love -- ly!

%% part "A'"
	This is where I want __ to be. __
	Here, with you so close __ to me __
	un -- til __ the fin -- al flick -- er of __ life's em -- ber. __
	I, who __ was lost and lone -- ly, __
	be -- liev -- ing life was on -- ly __
	a bit -- ter tra -- gic joke, have found __ with you, __
	the mean -- ing of ex -- ist -- ence.
	Oh, __ my love. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1962, 1964 by Antonio Carlos Jobim, Brazil" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Red Sails In The Sunset / Hugh Williams, Jimmy Kennedy"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Red Sails In The Sunset" }
			\fill-line {
				"Lyrics by Jimmy Kennedy"
				"Music by Hugh Williams"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		g1*2 | c2 c:m6 | g1 | \myEndLine
		g2 gis:dim7 | a2:m7 d:7 | a:m7 d:7 | g1 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		g1*2 | c2 c:m6 | g1 | \myEndLine
		g2 gis:dim7 | a2:m7 d:7 | a:m7 d:7 | g1 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		c2 c:m6 | g1 | d:7 | g | \myEndLine
		c2 c:m6 | g1 | a:7 | a2:m7 d:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		g1*2 | c2 c:m6 | g1 | \myEndLine
		g2 gis:dim7 | a2:m7 d:7 | a:m7 d:7 |
	} \alternative {
		{
			g2 a4:m7 d:7 | \myEndLineVoltaNotLast
		}
		{
			g1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Moderato" 4 = 100
	\time 2/2
	\key g \major

	\repeat volta 2 {

	%% part "A"
		r4 b' \tuplet 3/2 { b c b } | d d2. | r4 g, \tuplet 3/2 { g a g } | b1 |
		r4 d, \tuplet 3/2 { d e d } | a' a2. | r4 a \tuplet 3/2 { a g fis } | g1 |

	%% part "A"
		r4 b \tuplet 3/2 { b c b } | d d2. | r4 g, \tuplet 3/2 { g a g } | b1 |
		r4 d, \tuplet 3/2 { d e d } | a' a2. | r4 a \tuplet 3/2 { a g fis } | g1 |

	%% part "B"
		a2 \tuplet 3/2 { g4 a g } | e d2. | r4 a' \tuplet 3/2 { a g e } | g1 |
		a2 \tuplet 3/2 { g4 a g } | e d2. | r8 b' b b b a4 g8 | a1 |

	%% part "A"
		r4 b \tuplet 3/2 { b c b } | d d2. | r4 g, \tuplet 3/2 { g a g } | b1 |
		r4 d, \tuplet 3/2 { d e d } | a' a2. | r4 a \tuplet 3/2 { a g fis } |
	} \alternative {
		{
			g2 r |
		}
		{
			g1 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Red Sails In The Sun -- set way out on the sea, oh! car -- ry my loved one
	home safe -- ly to me.

%% part "A"
	He sailed at the dawn -- ing, all day I've been blue.
	Red Sails In The Sun -- set I'm trust -- ing in you.

%% part "B"
	Swift wings you must bor -- row, make stright for the shore.
	We mar -- ry to -- mor -- row and he goes sail -- ing no more.

%% part "A"
	Red Sails In The Sun -- set way out on the sea, oh! car -- ry my loved one home safe -- ly to me.

%% part "Volta"
	me.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1935 The Peter Maurice Music Co. Ltd., London, England" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "'Round Midnight / Cootie Williams, Thelonious Monk, Bernie Hanighen"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "'Round Midnight" }
			\fill-line {
				"Lyrics by Bernie Hanighen"
				"Music by Cootie Williams, Thelonious Monk"
			}
			\fill-line {
				"Ballad"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
	%% the bes:7 on the next line should be altered
		ees2:m c:m7.5- | f:m7.5- bes:7 | ees:m7 aes:7 | b4:m7 e:7 bes:m7 ees:7 | \myEndLine
		aes2:m7 des:7 | ees:m7 aes:7 |
	} \alternative {
		{
			b1:7 | bes:7 | \myEndLineVoltaNotLast
		}
		{
			b2:7 bes:7 | ees1:m7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	c2:m7.5- f:7.9- | bes1:7 | c2:m7.5- f:7.9- | bes1:7 | \myEndLine
	aes4:m7 des:7 ges2:maj7 | ces:7 bes:7 | ees:7 des:7 | ces:7 bes:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
%% the bes:7 on the next line should be altered
	ees2:m c:m7.5- | f:m7.5- bes:7 | ees:m7 aes:7 | b4:m7 e:7 bes:m7 ees:7 | \myEndLine
	aes2:m7 des:7 | ees:m7 aes:7 | ces:7 bes:7 | ees1:m | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\time 4/4
	\key ees \minor

%% part "A"
	\repeat volta 2 {
		r4 bes16 ees f bes ges4. bes,8 | ees4. d16 ees bes'8 aes r4 |
		r ees16 ges bes des c4. ees,8 | a8 fis16 d gis4 aes8 f16 des g4 |
		r4 aes16 ces ees ges f4. ces8 | bes4 \tuplet 3/2 { ees,8 d des } c aes'4 ees16 f |
	} \alternative {
		{
			\tuplet 3/2 { fis8 fis fis fis f dis } f4. dis8 | d bes r4 r2 |
		}
		{
			fis'4 f8 dis f4 ees8 des | ees2. ees8 f |
		}
	}

%% part "B"
	ges4 f8 ees f4. ees8 | d bes' r4 r ees,8 f | ges4 f8 ees f4. ees8 | d bes r4 r bes'4 |
	ces4. ces8 bes4. bes8 | aes4 ges f4. bes8 | ees ees ees4 des8 des des4 | ces ees,8 d bes' aes e d |

%% part "A"
	r4 bes16 ees f bes ges4. bes,8 | ees4. d16 ees bes'8 aes r4 |
	r ees16 ges bes des c4. ees,8 | a8 fis16 d gis4 aes8 f16 des g4 |
	r4 aes16 ces ees ges f4. ces8 | bes4 \tuplet 3/2 { ees,8 d des } c aes'4 ees16 f |
	ges4 f8 ees f4 ees8 des | ees1 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	It be -- gins to tell, 'round midnight, mid -- _ _ night.
	I do pre -- tty well, till af -- _ _ ter sun -- _ _ down,
	Sup -- per -- time I'm fee -- lin' sad; _ _ _ _ _
	But it real -- ly gets _ _ _ bad, 'round mid -- night.

%% part "Volta"

	mid -- _ _ night knows it, too.

%% part "B"
	When a quar -- rel we had needs men -- ding,
	Does it mean that our love is end -- ing.
	Dar -- lin' I need you, lately I find
	You're out of my heart,
	And I'm out of my mind. _ _ _

%% part "A"
	Let our hearts take wings' 'round midnight, mid -- _ _ night.
	Let the an -- gels sing, for your -- _ _ re tur -- _ _ ning.
	Till our love is safe and sound. _ _ _ _ _
	And old mid -- _ _ night comes a -- round.
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	Memo -- ries al -- ways start 'round midnight, mid -- _ _ night.
	Ha -- ven't got the heart to stand -- _ _ those me -- _ _ mories,
	When my heart is still with you, _ _ _ _ _
	And ol'
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1944 (Renewed) Warner Bros. Inc. and Thelonian Music" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Satin Doll / Duke Ellington, Billy Strayhorn, Johnny Mercer"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Satin Doll" }
			\fill-line {
				"Lyrics by Johnny Mercer"
				"Music by Duke Ellington, Billy Strayhorn"
			}
			\fill-line {
				"Smoothly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		d2:m7 g:7 | d:m7 g:7 | e:m7 a:7 | e:m7 a:7 | \myEndLine
		a:m9 d:9 | aes:m9 des:9 |
	} \alternative {
		{
			c d:m7 | e:m7 a:7 | \myEndLineVoltaNotLast
		}
		{
			c f:7 | c1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	g2:m7 c:7 | g:m7 c:9- | f:maj7 g:m7 | a:m7 bes:m7 | \myEndLine
	a:m7 d:7 | a:m7 d:9- | g:7 d:m7 | g1:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	d2:m7 g:7 | d:m7 g:7 | e:m7 a:7 | e:m7 a:7 | \myEndLine
	a:m9 d:9 | aes:m9 des:9 | c4 c:7/e f aes/ges | c/g g:7 c2:6.9 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key c \major

%% part "A"
	\repeat volta 2 {
		a'8. g16 a8 g~ g a4. | r8 a4. g8 a4. | b8. a16 b8 a~ a b4. | r8 b4. a8 b4. |
		r8 d4. c8 d4. | r8 bes4. aes4 bes8 g~ |
	} \alternative {
		{
			g1~ | g |
		}
		{
			g1\repeatTie | r2 r4 r8 g |
		}
	}

%% part "B"
	c4 bes8. a16 g8. a16 bes4 | c4 bes8. a16 g8. a16 bes8 c~ | c1~ | c2. r8 c |
	d8. c16 b8. a16~ a8. b16 c4 | d8. c16 b8 a~ a8. b16 c8 d~ | d1~ | d8 \xNote { d4^"(Spoken)" d8 d d4. } |

%% part "A"
	a8. g16 a8 g~ g a4. | r8 a4. g8 a4. | b8. a16 b8 a~ a b4. | r8 b4. a8 b4. |
	r8 d4. c8 d4. | r8 bes4. aes4 bes8 g~ | g1~ | g2. r4 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Cig -- a -- rette hold -- er which wigs me, o -- ver her shoul -- der, she digs me.
	Out cat -- tin' that Sat -- in Doll. __

%% part "B"
	_ She's no -- bod -- y's fool, so I'm play -- ing it cool as can be. __
	I'll give it a whirl, __ but I ain't for no girl __ catch -- ing me. __
	\markup \italic Switch -- \markup \italic E -- \markup \italic Roo -- \markup \italic ney

%% part "A"
	Tel -- e -- phone num -- bers well you know, do -- ing my rhum -- bas
	with u -- no, and that 'n' my Sat -- in Doll. __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	Ba -- by shall we __ go out skip -- pin' care -- ful a -- mi -- go, you're flip -- pin'.
	Speaks lat -- in that Sat -- in Doll.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1958 Tempo Music, Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Serenade To A Cuckoo / Roland Kirk"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Serenade To A Cuckoo" }
			\fill-line {
				""
				"Music by Roland Kirk"
			}
			\fill-line {
				"Med"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		f2:m f:m/ees | f:m/des f:m/c | f2:m f:m/ees | f:m/des f:m/c | \myEndLine
		f2:m f:m/ees | f:m/des f:m/c | f2:m f:m/ees | f:m/des f:m/c | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		bes:m7 ees:7 | aes:maj7 des:maj7 | g:m7.5- c:7 | f:m f:7 | \myEndLine
		bes:m7 ees:7 | aes:maj7 des:maj7 | g:m7.5- c:7 | f1:m | \myEndLine
		\endPart
	}

	\myMark "Ending"
	\startPart
	g2:m7.5- c:7 | f1:m | \myEndLine
	\endPart

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \minor

	\repeat volta 2 {

	%% part "A"
		r8 c'4 f,8 c'4. f,8 | c' c bes bes aes f4 ees8 | f4 f8 f aes aes4 c8~ | c1 |
		r8 c4 f,8 c'4. f,8 | c' c bes bes aes f4 ees8 | f4 f8 f aes f ees f~ | f1 |

	%% part "B"
		r8 f'4-^ r8 bes,2 | r8 ees4-^ r8 aes,2 | r8 des4-^ r8 g,2 | g8 aes bes c~ c2 |
		r8 f4-^ r8 bes,2 | r8 ees4-^ r8 aes,2 | r8 des4-^ r8 g,2 | g8 aes g f~ f2 |
	}

%% part "Ending"
	c'8 c c ees-^ r des4.-> | c4-> r r2 |
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Solar / Miles Davis"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Solar" }
			\fill-line {
				""
				"Music by Miles Davis"
			}
			\fill-line {
				"Jazz"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		c1*2:m | g1:m7 | c:7 | \myEndLine
		f1*2:maj7 | f1:m7 | bes:7 | \myEndLine
		ees:maj7 | ees2:m7 aes:7 | des1:maj7 | d2:m7.5- g:7.9- | \myEndLine
		\endPart
	}

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

	\repeat volta 2 {
		r8 c'4. b4 d8 c | r g4.~ g a8 | bes4 bes8 bes a4 c8 bes~ | bes1 |
		r8 a4. gis4 bes8 a | r c,4.~ c4 f8 g | aes4 aes8 aes g4 bes8 aes~ | aes2. r8 g~ |
		g4 f8 ees d c4 ges'8~ | ges4 f8 ees des c4 f8~ | f1 | r8 d! ees f g aes b!4 |
	}
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts









\bookpart {

% this causes the variables to be defined...














% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Someday My Prince Will Come / Frank Churchill, Larry Morey"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Someday My Prince Will Come" }
			\fill-line {
				"Lyrics by Larry Morey"
				"Music by Frank Churchill"
			}
			\fill-line {
				"Med. Jazz Waltz"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		bes2.:maj7 | d:7.5+ | ees:maj7 | g:7.5+ | \myEndLine
		c:m7 | g:7.5+ | c:7 | f:7 | \myEndLine
		\endPart
	} \alternative {
		{

			\myMark "B"
			\startPart
			d:m7 | des:dim | c:m7 | f:7 | \myEndLine
			d:m7 | des:dim | c:m7 | f:7 | \myEndLineVolta
			\endPart
		}
		{

			\myMark "C"
			\startPart
			f:m7 | bes:7 | ees | e:dim | \myEndLine
			bes/f | c2:m7/f f4:7 | bes2.*2 | \myEndLineVolta
			\endPart
		}
	}

	\endSong
	\endChords
}





% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 3/4
	\key bes \major

%% part "A"
	\repeat volta 2 {
		f2. | bes2 fis4 | a2 g4 | g2. |
		g | ees'2 b4 | d2 c4 | c d ees |
	} \alternative {
		{

		%% part "B"
			f2 f4 | a2 a4 | f2. | c4 d ees |
			f2 f4 | a2 a4 | f2.~ | f |
		}
		{

		%% part "C"
			f4. e8 f4 | c'2 bes4 | c,4 bes c | a'2 g4 |
			f2 ees4 | d2 c4 | bes2.~ | bes |
		}
	}
}




}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

%% part "A"
	Some -- day my prince will come
	Some -- day I'll find my love

%% part "B"
	And how thrilling that moment will be
	When the prince of my dreams_comes to me
}



\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	He'll whis -- per I love you
	And steal a kiss or two

%% part "C"
	Though he's
	_ _ _ _ _ _ _ _ _ _ _ _ _
	far _ a -- way I'll find my love_some -- day
	Some -- day_when my dreams come true
}


	>>
	\layout {
	}
}








% More lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\concat {
			\column {
				\box "A"
				"Someday I'll find my love"
				"Someone to call my own"
				\box "B"
				"And I know at the moment we meet"
				"my heart will start skipping the beats"
				\vspace #0.3
				\box "A"
				"Someday we'll say and do"
				"Things we've been longing to"
				\box "C"
				"Though he's far away I'll find my love someday"
				"Someday when my dreams come true"
			}
			\hspace #3
			\column {
				\box "A"
				"Someday my prince will come"
				"Someday we'll meet again"
				\box "B"
				"And away to his castle we'll go"
				"To be happy forever I know"
				\vspace #0.3
				\box "A"
				"Someday when spring is here"
				"We'll find our love anew"
				\box "C"
				"And the birds will sing and weddingbells will ring"
				"Someday when my dreams come true"
			}
		}
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Someone To Watch Over Me / George Gershwin, Ira Gershwin"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Someone To Watch Over Me" }
			\fill-line {
				"Lyrics by Ira Gershwin"
				"Music by George Gershwin"
			}
			\fill-line {
				"Jazz Ballad"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		aes2:maj7 aes:7 | d:m7.5- des:dim7 | c:m7 b:dim7 | bes:m6 c4:m7 f:7.5+ | \myEndLine
		bes2:m7 c4:m7 des:6 | d2:dim7 ees:7.4 |
	} \alternative {
		{
			c:m7 f:7 | bes:m7 ees:7 | \myEndLineVoltaNotLast
		}
		{
			aes1:maj7 | ees2:m7 aes:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
		des1:maj7 | des1:maj7 | des2:maj7 d:dim7 | aes1:maj7/ees | \myEndLine
		d:m7.5- | g:7 | c2:m7 f:7.9- | bes:m7 ees:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
		aes2:maj7 aes:7 | d:m7.5- des:dim7 | c:m7 b:dim7 | bes:m6 c4:m7 f:7.5+ | \myEndLine
		bes2:m7 c4:m7 des:6 | d2:dim7 ees:7.4 | aes:maj7 f:7 | bes:m7 ees:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 92
	\time 4/4
	\key aes \major

%% part "A"
	\repeat volta 2 {
		r4 aes8 bes c ees f aes | bes bes4 aes8 g2 | aes8 aes4 g8 f2 | g8 g4 f8 ees2 |
		r4 f ees des | aes'2 aes,8 bes4. |
	} \alternative {
		{ c1~ | c2 r | }
		{ aes1 | r4 bes c ees | }
	}

%% part "B"
	g4 aes g aes | bes aes2 g4 | bes aes2 g4 | bes aes2 f4 |
	aes g2 f4 | aes g2 e4 | c1~ | c2 r |

%% part "A"
	r4 aes8 bes c ees f aes | bes bes4 aes8 g2 | aes8 aes4 g8 f2 | g8 g4 f8 ees2 |
	r4 f ees des | aes'2 aes,8 bes4. | aes1 | r |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% lyrics from the internet adjusted for the real book
\lyricmode {
%	There's a saying old, says that love is blind
%	Still we're often told, "seek and ye shall find"
%	So I'm going to seek a certain lad I've had in mind

%	Looking everywhere, haven't found him yet
%	He's the big affair I cannot forget
%	Only man I ever think of with regret

%	I'd like to add his initial to my monogram
%	Tell me, where is the shepherd for this lost lamb?

%% part "A"
	There's a some -- bo -- dy I'm lon -- gin' to see
	I hope that he, turns out to be
	Some -- one who'll watch o -- ver me

	me

%% part "B"
	Al -- though he may not be the man some
	Girls think of as hand -- some
	To my heart he car -- ries the key

%% part "A"
	Won't you tell him please to put on some speed
	Fol -- low my lead, oh, how I need
	Some -- one to watch o -- ver me

%	Won't you tell him please to put on some speed
%	Follow my lead, oh, how I need
%	Someone to watch over me

%	Someone to watch over me
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	I'm a lit -- tle lamb who's lost in the wood
	I know I could, al -- ways be good
	To one who'll watch o -- ver %% me
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts












\bookpart {

% this causes the variables to be defined...

















% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Somewhere, Over The Rainbow / Harold Arlen, Edgar Yipsel 'Yip' Harburg"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Somewhere, Over The Rainbow" }
			\fill-line {
				"Lyrics by Edgar Yipsel 'Yip' Harburg"
				"Music by Harold Arlen"
			}
			\fill-line {
				"Ballad"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		a2:m7.5- d:7.9- | g2.:m7 a4:7.5- | aes2:maj7 a4:m7.5- d:7.9- | g2:m7 c:7.9- | \myEndLine
		f:m7 aes:m7 | g:m7 c:7.9- | f:m7 bes:7.9- |
	} \alternative {
		{
			ees:maj7 f4:m7 bes:7.9- | \myEndLineVoltaNotLast
		}
		{
			ees2:maj7 f4:m7 bes:7.9- | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	ees1:maj7 | f2:m7 bes:7.9- | g:m7 c:7.9- | f:m7 bes:7.9- | \myEndLine
	ees1:maj7 | a2:m7.5- d:7.9- | g:m7 c:9 | f:m7 bes:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	a:m7.5- d:7.9- | g2.:m7 a4:7.5- | aes2:maj7 a4:m7.5- d:7.9- | g2:m7 c:7.9- | \myEndLine
	f:m7 aes:m7 | g:m7 c:7.9- | f:m7 bes:7.9- | ees:maj7 f4:m7 bes:7.9- | \myEndLine
	\endPart

	\endSong
	\endChords
}








% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 80
	\time 4/4
	\key ees \major

%% part "A"
	\repeat volta 2 {
		ees2 ees' | d4 bes8 c d4 ees | ees,2 c' | bes1 |
		c,2 aes' | g4 ees8 f g4 aes | f d8 ees f4 g |
	} \alternative {
		{
			ees2 r |
		}
		{
			ees2. bes'4 |
		}
	}

%% part "B"
	g8 bes g bes g bes g bes | aes bes aes bes aes bes aes bes | c2 c~ | c r4 bes |
	g8 bes g bes g bes g bes | a c a c a c a c | d2 d | f c |

%% part "A"
	ees,2 ees' | d4 bes8 c d4 ees | ees,2 c' | bes1 |
	c,2 aes' | g4 ees8 f g4 aes | f d8 ees f4 g | ees2 r |
}







}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Some -- where o -- ver the rain -- bow
	Way up high,
	There's a land that I heard of
	Once in a lu -- lla -- by.

%% part "B"
	_ Some -- day I'll wish u -- pon a star
	And wake up where the clouds are far
	Be -- hind me.
	Where trou -- bles melt like le -- mon drops
	A -- way a -- bove the chim -- ney tops
	That's where you'll find me.

%% part "A"
	Some -- where o -- ver the rain -- bow
	Blue -- birds fly.
	Birds fly o -- ver the rain -- bow.
	Why then, oh why can't I?
}






\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	Some -- where o -- ver the rain -- bow
	Skies are blue,
	And the dreams that you dare to dream
	Real -- ly do come _ true.
}





	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © Musicopy" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "St. Thomas / Sonny Rollins"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "St. Thomas" }
			\fill-line {
				""
				"Music by Sonny Rollins"
			}
			\fill-line {
				"Latin/Calypso"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		c1 | a:7 | d2:m7 g4:7 c~ | c2 g:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		c1 | a:7 | d2:m7 g4:7 c~ | c1 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		e1:m7.5- | a:7 | d:m7 | g:7 | \myEndLine
		\endPart

		\myMark "C"
		\startPart
		c:7 | f2 fis:dim7 | c/g g4:7 c~ | c1 | \myEndLine
		\endPart
	}

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Presto" 4 = 200
	\time 4/4
	\key c \major

	\repeat volta 2 {

	%% part "A"
		r4 g'8 c r b r a | g4 a e f | g c b c | r1 |

	%% part "A"
		r4 g8 c r b r a | g4 a e f | g c b c | r1 |

	%% part "B"
		e2 f4. g8 | r1 | f2 e4. d8 | r1 |

	%% part "C"
		e2 d | c a | g4 c b c | r1 |
	}
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1963, Prestigve Music" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Stella By Starlight / Victor Young, Ned Washington"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Stella By Starlight" }
			\fill-line {
				"Lyrics by Ned Washington"
				"Music by Victor Young"
			}
			\fill-line {
				"Slowly, with Expression"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	e1:m7.5- | a:7.9- | c:m7 | f:7 | \myEndLine
	f:m7 | bes:7 | ees:maj7 | aes:7 | \myEndLine
	bes:maj7 | e2:m7.5- a:7.9- | d1:m7 | bes2:m7 ees:7 | \myEndLine
	f1:maj7 | e2:m7.5- a:7 | a1:m7.5- | d:7.9- | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	g1*2:7.5+ | c:m7 | \myEndLine
	aes:7 | bes:maj7 | \myEndLine
	e1:m7.5- | a:7.9- | d:m7.5- | g:7.9- | \myEndLine
	c:m7.5- | f:7.9- | bes1*2:maj7 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key bes \major

	\partial 4 bes'4 |

%% part "A"
	a1~ | a4 g a bes | f1~ | f2. f4 |
	g1~ | g4 f f g | bes,1~ | bes2. c4 |
	ees d c bes | d2. e4 | g4. f8 f2~ | f2. g4 |
	bes a g f | g2 a4 bes | d4. c8 c2~ | c d |

%% part "B"
	ees1~ | ees4 ees ees d | f1~ | f4 ees \tuplet 3/2 { d c bes } |
	d2 d2~ | d4 c bes a | c1~ | c2. bes4 |
	a1~ | a4 g a bes | f1~ | f4 f f ees |
	ges1~ | ges4 ges ges f | f1~ | f1 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

%% part "A"
	The song a rob -- in sings,
	Through years of end -- less springs,
	The mur -- mur of a brook at even -- ing tides.
	That rip -- ples through a nook where two lov -- ers hide.

%% part "B"
	That great sym -- pho -- nic theme,
	That's Stel -- la by star -- light,
	And not a dream,
	My heart and I ag -- ree,
	She's eve -- ry -- thing on_this earth to me.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Stormy Weather / Harold Arlen, Ted Koehler"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Stormy Weather" }
			\fill-line { \large \smaller \bold \larger "Keeps Rainin' All the Time" }
			\fill-line {
				"Lyrics by Ted Koehler"
				"Music by Harold Arlen"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		g2 gis:dim7 | a:m7 d:9 | g e:7 | a:m7 d:9 | \myEndLine
		g e:7 | a:m7 d:7.5+.9- |
	} \alternative {
		{
			g1 | a2:m7 d:9 | \myEndLineVoltaNotLast
		}
		{
			g2 c | g2 b4:m7 e:7 | a2:m7 d:7.9- | g d4:m7 g:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
%% Jazz Fakebook has the following d:7.5+.9- chord without the augmented, but
%% given the melody note, and the fact that this exact figure appears in
%% two other places augmented, I'm assumign this was a typo.
	c1:maj7 | g4/b a:m7 g2:maj7 | c1:maj7 | g2/b a4:m7 g:maj7 | \myEndLine
	c2 cis:dim7 | g/d e:7 | a4:m7 b:7 e2:m7 | a:7 a4:m7 d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2 gis:dim7 | a:m7 d:9 | g e:7 | a:m7 d:9 | \myEndLine
	g e:7 | a:m7 d:7.5+.9- | g1 | a2:m7 d:7.5+.9- | \myEndLine
	g a4:m7 aes:maj7 | g:maj7 c g2:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 80
	\time 2/2
	\key g \major

	\partial 4 ais'8 b |

%% part "A"
	\repeat volta 2 {
		d2.~ d8 ais16 b | d8 b d cis c4 ais8 b | d d,4.~ d2 | a'8. a16 a8. a16 a4~ a8 g16 e |
		g8 d4.~ d2 | c8 e g ais~ ais4. ais8 |
	} \alternative {
		{
			b8 g4.~ g2 | r2 r4 ais8 b |
		}
		{
			b8 g4.~ g4 g | e8 d4.~ d2 | c8 e g ais~ ais4. ais8 | b8 g4.~ g2 |
		}
	}

%% part "B"
	e8. fis16 \tuplet 3/2 { g8 a g~ } g8. g16 g8. g16 | g4. g8 b g4. |
	e8. fis16 \tuplet 3/2 { g8 a g~ } g8. g16 g8. g16 | g4. g8 e d4. | e8. fis16 \tuplet 3/2 { g8 a g~ } g8. g16 g8. g16 | g4. g8 c8 b4. |

%% part "A"
	d4 b8 a g4 e | a2. ais8 b | d2.~ d8 ais16 b | d8 b d cis c4 ais8 b |
	d d,4.~ d2 | a'8. a16 a8. a16 a4~ a8 g16 e | g8 d4.~ d2 | c8 e g ais~ ais4. ais8 |
	b g4.~ g2 | c,8 e g ais~ ais4. ais8 | b g4.~ g2~ | g2. r4 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Don't know

%% part "Volta"
	why __ there's no sun up in the sky, Storm -- y Weath -- er, __
	since my man and I __ ain't to -- geth -- er, __ keeps rain -- in' all __ the time. __ _
	Life is

	time, __ _ the time. __ _ So wear -- y all __ the time. __ _

%% part "B"
	When he went a -- way __ the blues walked in and met me. If he stays a -- way __ old rock -- in'
	chair will get me. All I do is pray __ the Lord a -- bove will let me walk in the sun once
	more.

%% part "A"
	Can't go on, __ ev -- 'ry -- thing I had is gone, Storm -- y Weath -- er, __
	since my man and I __ ain't to -- geth -- er, __ keeps rain -- in' all __ the time. __ _
	Keeps rain -- in' all __ the time. __ _
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	_ _
	bare __ gloom and mis -- 'ry ev -- 'ry -- where, Storm -- y Weath -- er, __
	just can't get my poor __ self to -- geth -- er, __ I'm wear -- y all __ the
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1933 MILLIS MUSIC, INC." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Strang Fruit / Lewis Allan"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Strang Fruit" }
			\fill-line {
				""
				"Lyrics and Music by Lewis Allan"
			}
			\fill-line {
				"Andante Moderato"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\myMark "A"
	\startPart
	c1:m | g2:7.5+ g:7 | c1:m | g:7 | \myEndLine
	d2:m7.5- g:7.9- | d:m7.9- g:7 | c:m g:7 | c1:m | \myEndLine
	c2:m g:7/d | c:m/ees c:m | c1:m | \myEndLine
	c2:m g:7/d | c:m/ees c:m | c:m d:m7.5- | g1:7.9- | \myEndLine
	c2:m g:7 | c:m g:7 | g:7.9-/f g:7.9-/d | g:7.9-/b g:7.9- | g1:7.9- | \myEndLine
	c2:m c:m/bes | aes:maj7 g:7 | d:m7.5- g:7 | d:m7.5- g:7 | \myEndLine
	c1:m | d:m7.5- | c2:m/g g:7 | \myEndLine
	c1:m | g2:7 des:6.9 | c:m g:7 | c1:m | \myEndLine
	\endPart

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante Moderato" 4 = 88
	\time 4/4
	\key c \minor

%% part "A"
	c4 c c c8 c | ees2 d | \tuplet 3/2 { c4 c c } c c | \tuplet 3/2 { d d d } d2 |
	d4 d8 d f f f f | aes^"Piu mosso (a little faster)" aes g2. | c,4 c b8 b b b | c c4 c8~ c2 |
	ees4 c d b | c g g2 | ees' d |
	\tuplet 3/2 { ees'4 c ees } \tuplet 3/2 { d b d } | c4. g8 g4. b,8 | c4. c8 c4 c8 c | d4. d8 d2 |
	\tuplet 3/2 { ees'4 c ees } \tuplet 3/2 { d b d } | \tuplet 3/2 { c bes! aes } g4 d8 d | d4 d f f | aes aes b r | r1 |
	c,4 c8 c c4 c8 c | ees4 ees d d8 d | d4 d f8 f f f | aes4 aes g g8 g |
	g4 g g g8 g | bes4 bes aes r | ees2 d |
	c4 c8 c c4 c | ees8 d4. g2 | ees4 ( c d b | c1 ) |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	South -- ern trees bear a strange fruit, blood on the leaves and blood at the root, black bod -- y swing -- ing in the
	south -- ern breeze; Strange Fruit hang -- ing from the pop -- lar trees. __ \markup \italic (Humming) __ _ _ _ _ _ _ _ _
	Pas -- tor -- al scene of the gal -- lant South, the bulg -- ing eyes and the twist -- ed mouth; scent of mag -- no -- _ lia
	sweet __ _ and fresh, and the sud -- den smell of burn -- ing flesh! Here is the fruit for the
	crows to pluck, for the rain to gath -- er, for the wind to suck, for the sun to rot, for the tree to drop.
	\markup \italic (Hum) __ _ Here is a strange and bit -- ter crop. \markup \italic (Hum) __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1940 by Edward B. Marks Music Company. Copyright Renewed." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Strangers In The Night / Bert Kaempfert, Charles Singleton, Eddie Snyder"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Strangers In The Night" }
			\fill-line {
				"Lyrics by Charles Singleton, Eddie Snyder"
				"Music by Bert Kaempfert"
			}
			\fill-line {
				"Moderately Slow"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f1*4:maj7 | \myEndLine
	f1:maj7 | f2/a aes:dim7 | g:m7 ees/g | g:m6 ees/g | \myEndLine
	\endPart

	\myMark "A'"
	\startPart
	g1*4:m7 | \myEndLine
	g1.:m7 g4:m7/c c:7.9- | f1*2:maj7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	a1*2:m7.5- | d:7.9- | \myEndLine
	g1:m7 | bes:m6 | f2 d:m7 | g:m7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1*3:maj7 | f2:maj7 f4/a aes:dim7 | \myEndLine
	g1:m | c2:7.9- g4:m7/c c:7.9- | f1*2:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 88
	\time 2/2
	\key f \major

%% part "A"
	f8 g g f g2~ | g8 f g a g4 f | e8 f f e f2~ | f8 e f g f4 e |
	d8 e e d e2~ | e8 d e f e4 d | bes'1~ | bes2. r4 |

%% part "A'"
	g8 a a g a2~ | a8 g a bes a4 g | f8 g g f g2~ | g8 f g a g4 f |
	e8 f f e f2~ | f8 e f g f4 e | c'1~ | c |

%% part "B"
	c8 bes bes a a2~ | a8 bes bes c c bes bes a | c bes bes a a2~ | a8 bes bes c c bes bes a |
	bes a a g g2 | bes8 a a g g2 | bes8 a a g g f e f | a g g f f e d e |

%% part "A"
	f8 g g f g2~ | g8 f g a g4 f | e8 f f e f2~ | f8 e f g f4 e |
	d8 e e d e2~ | e8 e f g f4 e | f1~ | f2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Stran -- gers In The Night __ ex -- chang -- ing glanc -- es
	won -- d'ring in the night __ what were the chanc -- es
	we'd be shar -- ing love __ be -- fore the night was through. __

%% part "A'"
	Some -- thing in your eyes __ was so in -- vit -- ing,
	some -- thing in your smile __ was so ex -- cit -- ing,
	some -- thing in my heart __ told me I must have you. __

%% part "B"
	Stran -- gers In The Night, __ two lone -- ly peo -- ple we were
	Stran -- gers In The Night __ up tp the mo -- ment when we
	said our first hel -- lo. Lit -- tle did we know
	love was just a glance a -- way, a warm em -- brac -- ing dance a -- way and

%% part "A"
	ev -- er since that night __ we've been to -- geth -- er.
	Lov -- ers at first sight, __ in love for -- ev -- er.
	It turned out so right __ for Strang -- ers In The Night. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1966 by Champion Music Corporation and Screen Gems-EMI" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts











\bookpart {

% this causes the variables to be defined...
















% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Summertime / George Gershwin, DuBose Heyward"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Summertime" }
			\fill-line {
				"Lyrics by DuBose Heyward"
				"Music by George Gershwin"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	






\chordmode {
	\startChords
	\startSong

	\partial 2 s2 |

	\myMark "A"
	\startPart
	a:m6 e:7/b | a:m6/c e:7/b | a:m6 e:7/b | a:m6/c e4:7/b a:m6 | \myEndLine
	d2:m f | f2.:maj7 dis4:dim | e2 b:7 | e e8:m6 e4.:7.5- | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	a2:m6 e:7/b | a:m6/c e:7/b | a:m6 e:7/b | a:m d:7 | \myEndLine
	c a:m | d d:m7/g | a1:m | a2:m a:m7+ | a:m6 a:m7+ | d:9 e:5+ | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	a2.:m6 e4:7/b | a2:m6/c e:7/b | a:m6 e:7/b | a:m6/c e4:7/b a:m6 | \myEndLine
	d2:m f | f2.:maj dis4:dim | e2 b:7 | e e4:m6 e:7.5- | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	a2:m6 e:7/b | a:m6/c e:7/b | a:m6 e:7/b | a:m d:7 | \myEndLine
	c a:m | d d:m7/g | a1:m | d2 f | c f:9 | bes e:13.11 | a1:m | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 







{
	\tempo "Moderato" 4 = 108
	\time 2/2
	\key a \minor

	\partial 2 e'4 c |

%% part "A"
	e1~ | e8 r d8. c16 d8. e16 c4 | a2 e~ | e4 r e' c |
	d8 d4.~ d2 | r4 c8. a16 c8. a16 c4 | b1~ | b2 r8 e4 c8 |

%% part "B"
	e8 e4 e8~ e2 | r4 d8. c16 d8. e16 c4 | a2 e~ | e r4 e |
	g e8 g a4 c | e8 d4. c2 | a1~ | a1~ | a4 r4 r2 | r \tuplet 3/2 { e'4 e c } |

%% part "A"
	e4 e2. | r8. e16 d8. c16 d8. e16 c4 | a2 e~ | e e'4 c |
	d8 d4 d8~ d2 | r4 c8. a16 c8. a16 c4 | b1~ | b2 r8 e e c |

%% part "B"
	e8 e4.~ e2 | r4 d8. c16 d8. e16 c4 | a2 e~ | e r4 e |
	g e8 g a4 c | e8 d4. c2 | a1~ | a1~ | a1~ | a1~ | a2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	








\lyricmode {

%% part "A"
	Sum -- mer -- time __
	an' the liv -- in' is eas -- y, __
	fish are jump -- in'; __
	an' the cot -- ton is high. __

%% part "B"
	Oh, yo' dad -- dy's rich, __
	an' yo' ma is good look -- in', __
	so hush, lit -- tle ba -- by, __
	don' __ _ yo' cry. __

%% part "A"
	One of these morn -- in's __
	you goin' to rise __ _ up sing -- in', __
	then you'll spread yo' wings __
	an' you'll take __ _ the sky. __

%% part "B"
	But 'til that morn -- in' __
	there's a -- noth -- in' can harm you __
	with dad -- dy an' mam -- my
	stand -- _ in' by. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1935 by Gershwin Publishing Corporation" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Take Five / Paul Desmond"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Take Five" }
			\fill-line {
				""
				"Music by Paul Desmond"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\partial 2 s2 |

	\myMark "A"
	\startPart
	d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | \myEndLine
	d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	bes2. c2:7 | a2.:m7 d2:m | g2.:m7 c2:7 | f2. f2:7 | \myEndLine
	bes2. c2:7 | a2.:m7 d2:m | g2.:m7 c2:7 | e2.:m7 a2:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | \myEndLine
	d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | d2.:m d2:m | \myEndLine
	\endPart

	\endChords
	\endSong
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante Moderato" 4 = 88
	\time 5/4
	\key d \minor

	\partial 2 a8 d f g |

%% part "A"
	gis a gis g f4 a, c | d2. \tuplet 3/2 { e16 f e } d8 c4 | d2. \tuplet 3/2 { c16 d c } a8 g4 | a2.~ a8 d f g |
	gis a gis g f4 a, c | d2. \tuplet 3/2 { e16 f e } d8 c4 | d2. \tuplet 3/2 { c16 d c } a8 g4 | a2.~ a2 |

%% part "B"
	d'8 f4 d8 bes4 g8 a bes b | c e4 c8 a4 f8 g gis a | bes8 d4 bes8 g4 e8 f g gis | a gis a bes c4 c8 b c cis |
	d8 f4 d8 bes4 g8 a bes b | c e4 c8 a4 f8 g gis a | bes8 d4 bes8 g4 e8 g c bes | a2. a,8 d f g |

%% part "A"
	gis a gis g f4 a, c | d2. \tuplet 3/2 { e16 f e } d8 c4 | d2. \tuplet 3/2 { c16 d c } a8 g4 | a2.~ a8 d f g |
	gis a gis g f4 a, c | d2. \tuplet 3/2 { c16 d c } a8 g4 | a2. \tuplet 3/2 { e'16 f e } d8 c4 | d2.~ d2 |
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1960 (Renewed) Desmond Music Company (U.S.A.) and Derry Music Company (Canada)" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Take the 'A' Train / Billy Strayhorn, The Delta Rhythm Boys, Joya Sherrill"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Take the 'A' Train" }
			\fill-line {
				"Lyrics by Joya Sherrill"
				"Music by Billy Strayhorn, The Delta Rhythm Boys"
			}
			\fill-line {
				"Easy Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		c1*2:6 | d:7.5- | \myEndLine
		d1:m7 | g:7 | c |
	} \alternative {
		{
			c | \myEndLineVoltaNotLast
		}
		{
			c | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	f1*4:maj7 | \myEndLine
	d1*2:7 | d2:m9 g:9 | g:9 des:9 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c1*2:6 | d:7.5- | \myEndLine
	d1:m7 | g:7 | c8 c:7/e f4 aes2:7/ges | c4/g g:9 c:6 c:maj7.9 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 168
	\time 4/4
	\key c \major

%% part "A"
	\repeat volta 2 {
		g'1~ | g8 e'4. g,4 c | e8 aes,~ aes2.~ | aes1 |
		a! | a8 bes b e g, fis f cis' | c! e,~ e2.~ |
	} \alternative {
		{
			e1 |
		}
		{
			e2\repeatTie r |
		}
	}

%% part "B"
	a8 c~ c2. | e8 f,4. a4 c | e8 a,4.~ a2~ | a1 |
	a8 c~ c2. | e4 fis, a c | e8 a,~ a2.~ | a2 aes |

%% part "A"
	g1~ | g8 e'4. g,4 c | e8 aes,~ aes2.~ | aes1 |
	a! | a8 bes b e g, fis f cis' | c! e,~ e2.~ | e2 r2 |
%% These small cue notes were in the fake book, but splitting the voices
%% breaks the tie from the previous measure. Maybe some can find a fix?
%%<< { \teeny g8 a_\markup { \italic "(Instrumental)" } b c~ c4 c, } \\ { \normalsize e2 r2 } >> |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	You __ must take the "\"A\"" Train __ To go to Sug -- ar Hill way up in Har -- lem. __
	_

%% part "B"
	Hur -- ry, __ get on now it's com -- ing. __ Lis -- ten __ to those rails a --
	thrum -- ming. __ All

%% part "A"
	'board! __ Get on the "\"A\"" Train, __ soon
	you will be on Sug -- ar Hill in Har -- lem. __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	If __ you miss the "\"A\"" Train, __ You'll find you've missed the quick -- est way to Har -- lem. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1941 and 1943 by Tempo Music, Inc. Copyright Renewed 1969" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Tenderly / Walter Gross, Jack Lawrence"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Tenderly" }
			\fill-line {
				"Lyrics by Jack Lawrence"
				"Music by Walter Gross"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4. s4. |

	\myMark "A"
	\startPart
	ees2.:maj7 | aes:9 | ees:m7 | aes:9 | \myEndLine
	f:m7 | des:9 | ees4 g:m7 f:m7 | ees2.:maj7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	f2.:m7.5- | bes:7 | f:m7.5- | bes2:7 b4:dim7 | \myEndLine
	c2.:m7 | f:7 | f:m9 | bes:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees2.:maj7 | aes:9 | ees:m7 | aes:9 | \myEndLine
	f:m7 | des:9 | ees4 g:m7 f:m7 | ees2.:maj7 | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	f2.:m7.5- | bes2:7 b4:dim7 | c2.:m7 | f2:9 fis4:dim7 | \myEndLine
	g4.:m7 c:7 | f2:m7 bes4:7 | ees2.*2 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 3/4
	\key ees \major

	\partial 4. bes'8 c ees |

%% part "A"
	d4. bes8 c ees | d2 bes8 ges | f2.~ | f4 r8 ees f aes |
	g4. ees8 f aes | g2 ees8 ces | bes2.~ | bes4 r bes |

%% part "B"
	ces2 bes'4 | g2 bes,4 | ces ees bes' | g2 f4 |
	ees g f' | d2 f,4 | bes2.~ | bes4 r8 bes8 c ees |

%% part "A"
	d4. bes8 c ees | d2 bes8 ges | f2.~ | f4 r8 ees f aes |
	g4. ees8 f aes | g2 ees8 ces | bes2.~ | bes4 r bes |

%% part "C"
	ces ees bes' | g2 f4 | ees g f' | d4. ees8 c d |
	bes4. c8 aes bes | g4. f8 aes d, | ees2.~ | ees4. r8 r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	The eve -- ning breeze ca -- ressed the trees Ten -- der -- ly, __
	The termb -- ling trees em -- braced the breeze Ten -- der -- ly. __

%% part "B"
	Then you and I came wand -- er -- ing by and lost in a sigh were we. __

%% part "A"
	The shore was kissed by sea and mist Ten -- der -- ly. __
	I can't for -- get how two hearts met breath -- less -- ly. __

%% part "C"
	Your arms op -- ened wide and closed me in -- side; you took my lips, you took my love so Ten -- der -- ly. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1946, 1947, 1987 EDWIN H. MORRIS & COMPANY, A Division of MPL Communications, Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "That's All / Alan Brandt, Bob Haymes"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "That's All" }
			\fill-line {
				""
				"Lyrics and Music by Alan Brandt, Bob Haymes"
			}
			\fill-line {
				"Slowly, with expression"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		c2 d:m7 | e:m7 f4:m7 g:7 | e2:m7 a:9 | d:m7 g:7 | \myEndLine
		fis:m7.5- f:m7 | e:m7 ees:dim7 |
	} \alternative {
		{
			e:m7 a:7.9- | d:7.5- g:7 | \myEndLineVoltaNotLast
		}
		{
			e4:m7 a:7.9- d:m7 g:7.9- | c1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	g2:m7 c:9 | f:maj7.9 d:9 | g:m7 c:9 | f:maj7 f:6 | \myEndLine
	a:m7 d:9 | g:maj7.9 e:9 | a:m7 d:9 | d:m7 g:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c2 d:m7 | e:m7 f4:m7 g:7 | e2:m7 a:9 | d:m7 g:7 | \myEndLine
	fis:m7.5- f:m7 | e:m7 ees:dim7 | e4:m7 a:7.9- d:m7 g:7.9- | c1 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 90
	\time 2/2
	\key c \major

	\partial 4 e8 f |

%% part "A"
	\repeat volta 2 {
		g b g e g b g e | g g~ g2 e8 f | g b g e g b g e | g2. a8 b |
		c e c a c4. a8 | c e c a c4. a8 |
	} \alternative {
		{
			g2. e4 | d2. e8 f |
		}
		{
			g2. e4 | c2. c8 c' |
		}
	}

%% part "B"
	a4 c,8 c' a4 c,8 c' | a4 a2 c,8 c' | a4 c,8 c' a4 c,8 c' | a2. d,8 d' |
	b4 d,8 d' b4 d,8 d' | b4 b2 d,8 d' | b4 d,8 d' b4 d,8 b' | g2. e8 f |

%% part "A"
	g b g e g b g e | g g~ g2 e8 f | g b g e g b g e | g2. a8 b |
	c e c a c4. a8 | c e c a c4. a8 | g2. e4 | c1 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	I can on -- ly give you love that lasts for -- ev -- er, __
	and the prom -- ise to be near each time you call;
	and the on -- ly heart I own, for you and you a -- lone, That's All, That's All. I can
	_ _ _ _ _
%%All, That's All.

%% part "B"
	those I am sure who have told you
	they would give you the world for a toy.
	All I have are these arms to en -- fold you
	and a love time can nev -- er de -- stroy.

%% part "A"
	If you're won -- d'ring what I'm ask -- ing in re -- turn dear, __
	you'll be glad to know that my de -- mands are small:
	say it's me that you'll a -- dore,
	for now and ev -- er -- more,
	That's All, That's All.
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	_ _
	on -ly give you coun -- try walks in spring -- time, __
	and a hand to hold when leaves be -- gin to fall;
	and a love whose burn -- ing light,
	will warm the win -- ter night,
	That's
	_ _ _ _ _
	All, That's All. There are
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1952 Renewed 1982 Mixed Bag Music, Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "The Girl From Ipanema / Antonio Carlos Jobim, Vincius De Moraes, Norman Gimbel"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "The Girl From Ipanema" }
			\fill-line { \large \smaller \bold \larger "Garota De Ipanema" }
			\fill-line {
				"Lyrics by Vincius De Moraes, Norman Gimbel"
				"Music by Antonio Carlos Jobim"
			}
			\fill-line {
				"Moderate Bossa Nova"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f1*2:maj7 | g:7 | \myEndLine
		g1:m7 | ges:7 |
	} \alternative {
		{
			f1:maj7 | ges:7.5- | \myEndLineVoltaNotLast
		}
		{
			f1*2:maj7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	ges1*2:maj7 | ces:7.9 | \myEndLine
	fis:m7 | d:7.9 | \myEndLine
	g:m7 | ees:7.9 | \myEndLine
	a1:m7 | d:7.5-.9- | g:m7 | c:7.5-.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1*2:maj7 | g:7 | \myEndLine
	g1:m7 | ges:7.5- | f:maj7 | ges:7 | \myEndLine
	f:maj7 | ges:7 | f1*2:maj7 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key f \major

%% part "A"
	\repeat volta 2 {
		g'4. e8 e4 d8 g~ | g4 e8 e~ e e d g~ | g4 e e d8 g~ | g g e e~ e e d f~ |
		f d4 d8~ d d c e~ | e c4 c8~ c c bes4 |
	} \alternative {
		{
			r c2.~ | c2 r |
		}
		{
			r4 c2.~ | c2 r |
		}
	}

%% part "B"
	f1~ | \tuplet 3/2 {f4 ges f} \tuplet 3/2 {ees f ees} |
	des4. ees8~ ees2~ | ees2. r8 gis~ |
	gis1~ | \tuplet 3/2 {gis4 a gis} \tuplet 3/2 {fis gis fis} |
	e4. fis8~ fis2~ | fis2. r8 a~ |
	a1~ | \tuplet 3/2 {a4 bes a} \tuplet 3/2 {g a g} |
	f4. g8~ g2~ | g2 \tuplet 3/2 {r4 a bes} |
	\tuplet 3/2 {c c, d} \tuplet 3/2 {e f g} | gis2. a4 |
	\tuplet 3/2 {bes bes, c} \tuplet 3/2 {d e f} | fis2. r4 |

%% part "A"
	g4. e8 e4 d8 g~ | g4 e8 e~ e e d g~ | g4 e e d8 g~ | g g e e~ e e d a'~ |
	a4. f8 f f d c'~ | c4. e,8 \tuplet 3/2 {e4 e d} | e1 | r4 r8 e \tuplet 3/2 {e4 e d} |
	e1 | r4 r8 e \tuplet 3/2 {e4 e d} | e1~ | e2. r4 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	Tall and tan and young __ and love -- __ ly,
	the Girl __ From I -- pa -- ne -- __ ma goes walk -- __ ing,
	and when __ she pass -- __ es, each one __ she pass -- __ es goes "\"ah!\"" __

%% part "volta"
	_

%% part "B"
	Oh, __ but I watch her so sad -- ly. __
	How __ can I tell her I love her? __
	Yes, __ I would give my heart glad -- ly, __
	but each day when she walks to the sea,
	she looks straight a -- head not at me.

%% part "A"
	Tall and tan and young __ and love -- __ ly,
	The Girl __ From I -- pa -- ne -- __ ma goes walk -- __ ing,
	and when __ she pass -- es I smile, __
	but she does -- n't see.
	She just does -- n't see.
	No, she does -- n't see. __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	When she walks she's like __ a sam -- __ ba
	that swings __ so cool and sways __ _ so gen -- __ tle,
	that when __ she pass -- __ es, each one __ she pass -- __ es goes _ "\"ah!\"" __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1963, Antonio Carlos Jobim and Vincius De Moraes, Brazil" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts










\bookpart {

% this causes the variables to be defined...















% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "The Man I Love / George Gershwin, Ira Gershwin"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "The Man I Love" }
			\fill-line {
				"Lyrics by Ira Gershwin"
				"Music by George Gershwin"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "Intro"
	\startPart
	ees1:6 | b2:7 bes:7 | \myEndLine
	\endPart

	\repeat volta 2 {

		\myMark "A"
		\startPart
		ees2. ees4:7 | ees1:m7 | bes:m | c2:7.5+ c:7 | \myEndLine
		aes1:m6 | bes:7 | ees2 aes:maj7 | g:m bes:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		ees2. ees4:7 | ees1:m7 | bes:m | c2:7.5+ c:7 | \myEndLine
		aes1:m6 | bes2:7 bes4:7.11 bes:7 | ees2 aes | ees aes4:7 g:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		c1:m7 | d2:7 bes4:7 d:dim | c1:m | g:7 | \myEndLine
		c:m7 | d2:7 bes4:7 d:dim | c2:m g:dim | aes bes:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		ees2. ees4:7 | ees1:m7 | bes:m | c2:7.5+ c:7 | \myEndLine
		aes1:m | bes2:7 bes4:7.11 bes:7 | ees2 aes |
	} \alternative {
		{
			ees bes:7 | \myEndLineVoltaNotLast
		}
		{
			ees1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}






% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 76
	\time 4/4
	\key ees \major

%% part "Intro"
	r8. bes'16[ c8. bes16] c8.[ bes16 ees,8. f16] | ges8-. ges-. ges-. ges-. ges-> f~ f4 |

	\repeat volta 2 {

	%% part "A"
		r8 bes c bes c bes des4 | r8 bes c bes des2 | r8 bes c bes c bes des4 | r8 aes bes aes c2 |
		r8 aes bes aes bes aes ces4 | r8 g aes g bes4 aes | g2 g | g1 |

	%% part "A"
		r8 bes c bes c bes des4 | r8 bes c bes des2 | r8 bes c bes c bes des4 | r8 aes bes aes c2 |
		r8 aes bes aes bes aes ces4 | r8 g aes g bes4 g | ees2 ees | ees1 |

	%% part "B"
		ees8 f g fis g4 ees' | ees d bes b | d c g a | b1 |
		ees,8 f g fis g4 ees' | ees d bes b | d c bes! aes | g f g aes |

	%% part "A"
		r8 bes c bes c bes des4 | r8 bes c bes des2 | r8 bes c bes c bes des4 | r8 aes bes aes c2 |
		r8 aes bes aes bes aes ces4 | r8 g aes g bes4 g | ees2 ees |
	} \alternative {
		{
			ees f |
		}
		{
			ees1 |
		}
	}
}





}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% these are lyrics from the internet adjusted for the real book
\lyricmode {

%% part "Intro"
	_ _ _ _ _ _ _ _ _ _ _ _ _

%% part "A"
	Some -- day he'll come a -- long, the man I love
	And he'll be big and strong, the man I love
	And when he comes my way
	I'll do my best to make him stay

%% part "A"
	He'll look at me and smile, I'll un -- der -- stand
	And in a lit -- tle while he'll take my hand
	And though it seems ab -- surd
	I know we both won't say a word

%% part "B"
	May -- be I shall meet him Sun -- day
	May -- be Mon -- day, may -- be not
	Still I'm sure to meet him one day
	May -- be Tues -- day will be my good news day

%% part "A"
	He'll build a lit -- tle home, just meant for two
	From which we'll ne -- ver roam; Who would, would you?
	And so all else a -- bove
	I'm wait -- ing for the man I love
%% Volta
	_ love
}




	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "(I'm Afraid) The Masquerade Is Over / Allie Wrubel, Herb Magidson"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "(I'm Afraid) The Masquerade Is Over" }
			\fill-line {
				"Lyrics by Herb Magidson"
				"Music by Allie Wrubel"
			}
			\fill-line {
				"Moderately Slow"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		ees1 | g2:7/d g:7 | c2.:m c4:m7 | bes2:m7 ees:7 | \myEndLine
		aes1 | c2:7/g c:7 | f1:7 | f2:m7.5-/bes bes:7 | \myEndLine
		ees1 | ees:7 | aes | aes:m6 | \myEndLine
	} \alternative {
		{
			ees:maj7 | c:7.9- | f:m7 | bes:7 | \myEndLineVoltaNotLast
		}
		{
			ees | f2:m7 bes:7.9- | ees1 | ees | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	f2:m7 bes:7 | ees4:maj9 ees2.:6 | f2:m7 bes:7 | ees2:maj9 ees:6 | \myEndLine
	a:m7 d:7 | g:maj7 g:6 | f1:m7 | b2:7.5- bes4:7 bes:7.5+ | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees1 | g2:7/d g:7 | c2.:m c4:m7 | bes2:m7 ees:7 | \myEndLine
	aes1 | c2:7/g c:7 | f1:7 | f2:m7.5-/bes bes:7 | \myEndLine
	ees1 | ees2.:7 ees4:7.5+ | aes1 | aes | \myEndLine
	f:9 | f2.:m7 f4:m7.5-/bes | ees1*2:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Presto" 4 = 196
	\time 4/4
	\key ees \major

	\partial 4 bes4 |

%% part "A"
	\repeat volta 2 {
		g'2. g4 | g2~ \tuplet 3/2 { g4 bes aes } | g2. g4 | f2 r4 d8 ees |
		c'2. c4 | bes2~ \tuplet 3/2 { bes4 c bes } | a2. f4 | aes2 r4 g8 aes |
		bes2~ bes8 g f ees | ees'2. c4 | bes2 aes | r4 ees4 f ees |
	} \alternative {
		{
			bes'1~ | bes4 g c4. g8 | bes1~ | bes2 r4 aes |
		}
		{
			bes1~ | bes4 ees, g g | ees1~ | ees2 r4 ees |
		}
	}

%% part "B"
	f8 f f g aes4 g | bes bes2 ees,4 | f8 f f g aes4 g | bes2 r4 g |
	a4 b c b8 a | d4 d2 d4 | f2~ \tuplet 3/2 { f4 ees c } | f,2 r4 <bes, \parenthesize fis'> |

%% part "A"
	g'2. g4 | g2~ \tuplet 3/2 { g4 bes aes } | g2. g4 | f2 r4 d8 ees |
	c'2. c4 | bes2~ \tuplet 3/2 { bes4 c bes } | a2. f4 | aes?2 r4 g8 aes |
	bes2~ bes8 g f ees | ees'2. ees4 | ees2 f, | r4 f g aes |
	c1~ | c4 aes c ees | ees1~ | ees\fermata |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	Your eyes don't shine __ like they used to shine. And the thrill is
	gone __ when your lips meet mine. I'm A -- fraid __ The Mas -- que -- rade Is
	O -- ver And so is love, __ and so is love. __
	Your love, __ and so is love. __ I
	guess I'll have to play Pag -- liac -- ci and get my self a clown's dis -- guise, and
	learn to laugh like Pag -- liac -- ci with tears __ in my eyes. You look the
	same, __ you're a lot the same, but my heart says, "\"No," __ no, you're
	not the "same.\"" I'm A -- fraid __ The Mas -- que -- rade Is O -- ver
	and so is love, __ and so is love. __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {
	_ words don't mean __ what they used to mean. They were once in --
	spired, __ now they're juse rou -- tine.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- help me fill it out this copyright notice --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "The Nearness Of You / Hoagy Carmichael, Ned Washington"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "The Nearness Of You" }
			\fill-line { \large \smaller \bold \larger "From the Paramount Picture 'Romance in the Dark'" }
			\fill-line {
				"Lyrics by Ned Washington"
				"Music by Hoagy Carmichael"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startSong
	\startChords

	\partial 4. s4. |

	\myMark "A"
	\startPart
	ees1:maj7 | bes2:m7 ees:7 | aes1:maj7 | aes:dim7 | \myEndLine
	g2:m7 c:7 | f:m7 bes:7 | g:m7 c:7 | f:m7 bes:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees1:maj7 | bes2:m7 ees:7 | aes1:maj7 | aes:dim7 | \myEndLine
	g2:m7 c:7 | f:m7 bes:7 | ees:maj7 aes:7 | ees1:maj7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	f:m7 | bes:7 | ees2:maj7 ees:7 | bes:m7 ees:7 | \myEndLine
	aes:maj7 a4:m7.5- d:7 | g2:m7 c:7 | f1:7 | f2:m7 bes:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees1:maj7 | bes2:m7 ees:7 | aes1:maj7 | aes:dim7 | \myEndLine
	g2:m7 c:7 | f:m7 bes:7 | g1:m7.5- | c:7 | \myEndLine
	f:m7 | bes:7 | ees1*2:maj7 | \myEndLine
	\endPart

	\endChords
	\endSong
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante Moderato" 4 = 88
	\time 4/4
	\key ees \major

	\partial 4. bes8 ees f |

%% part "A"
	g2 bes4 aes8 g | f4 aes2 g4 | ees2 g4 f | d f2 ees4 |
	bes1~ | bes8 c d ees \tuplet 3/2 { f4 ees d } | bes'1~ | bes2~ bes8 bes, ees f |

%% part "A"
	g2 bes4 aes8 g | f4 aes2 g4 | ees2 g4 f | d f2 ees4 |
	bes1~ | bes8 c d ees \tuplet 3/2 { f4 ees d } | ees1~ | ees2 bes8 c d ees |

%% part "B"
	f1~ | f4 d8 ees f ees4 d8 | g4. d8 des2~ | des~ des8 ees4 ees8 |
	c'2. c4 | bes2. aes4 | f1~ | f2~ f8 bes, ees f |

%% part "A"
	g2 bes4 aes8 g | f4 aes2 g4 | ees2 g4 f | d f2 ees4 |
	bes1~ | bes8 c d ees \tuplet 3/2 { f4 ees d } | bes'1~ | bes4 g8 aes \tuplet 3/2 { bes4 aes g } |
	c2. c,4 | d ees2 f4 | ees1~ | ees2 r |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	It's not the pale moon that ex -- cites me, that thrills and de -- lights me. Oh,
	no, __ it's just The Near -- ness Of You. __

%% part "A"
	It is -- n't your sweet con -- ver -- sa -- tion that brings this sen -- sa -- tion. Oh,
	no, __ It's just the Near -- ness Of You. __

%% part "B"
	When you're in my arms __ and I feel you so close to me __ all my
	wild -- est dreams com true. __

%% part "A"
	I need no soft lights to en -- change me if you'll on -- ly grant me the
	right __ to hold you ev -- er so tight __ and to feel in the
	night The Near -- ness Of You. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1937, 1940 Famous Music Corporation" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Jordan Eldredge <JordanEldredge@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "The Shadow of Your Smile / Johnny Mandel, Paul Francis Webster"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "The Shadow of Your Smile" }
			\fill-line {
				"Lyrics by Paul Francis Webster"
				"Music by Johnny Mandel"
			}
			\fill-line {
				"Slow Bossa"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 8*5 s8 s2 |

	\myMark "A"
	\startPart
	fis1:m7 | b2:7.9 b:7.9- | e1:m7 | a:7 | \myEndLine
	a:m7 | d:7 | g:maj7| c:maj7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	fis:m7.5- | b:7 | e1.:m7 e2:m7/d | \myEndLine
	cis1:m7.5- | fis:7 | fis:m7 | b:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	fis1:m7 | b2:7.9 b:7.9- | e1:m7 | a:7 | \myEndLine
	a:m7 | d:7 | b:m7.5- | e:7.3-.5-.9-.11-.13- | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	a:m7 | c2:m7 f:7 | b1:m7 | e:7.9- | \myEndLine
	a2:7 ees:7 | a:m7 d:7.9- | g1.:6 \OPC b2:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key g \major

	\partial 8*5 b8 e fis g b |

%% part "A"
	cis,2. fis4 | dis2. c!4 | b1~ | b4. b8 e fis g b |
	e,2. a4 | fis2. d4 | b'1~ | b2 c8 b a g |

%% part "B"
	a2. c,4 | b2. a'4 | g1~ | g2 b8 a g fis |
	g2. b,4 | ais2. g'4 | fis1~ | fis4 r8 b, e fis g b |

%% part "A"
	cis,2. fis4 | dis2. c!4 | b1~ | b4. b8 e fis g b |
	e,2. c'4 | a2. fis4 | d'1~ | d2 e8 d c b |

%% part "C"
	c4. e,8 c'2~ | c d8 c b a | b4. d,8 b'2~ | b c8 b a gis |
	a4. cis,8 a'2~ | a4. c,!8 b' a g fis | g1 | r4_\markup { \italic { Fine } } r8 b, e fis g b |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics).
\lyricmode {

%% part "A"
	The sha -- dow of your smile, when you are gone. __
	Will co -- lor all my dreams, and light the dawn. __

%% part "B"
	Look in -- to my eyes, my love, and see. __
	All the love -- ly things you are to me. __

%% part "A"
	A wist -- ful lit -- tle star, was far too high. __
	A tear drop kissed your lips, and so did I. __

%% part "C"
	Now when I re -- mem -- ber spring. __
	All the joy that love can bring. __
	I will be re -- mem -- be -- ring __
	The sha -- dow of your smile.

%% part "return"
	The sha -- dow of your
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1965 (Renewed 1993) MGM/EMI Miller Catalog, Inc" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "The Things We Did Last Summer / Sammy Chan, Jule Styne"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "The Things We Did Last Summer" }
			\fill-line {
				""
				"Lyrics and Music by Sammy Chan, Jule Styne"
			}
			\fill-line {
				"Slow Ballad"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

%% Intro
	\partial 8 s8 |

	\myMark "A"
	\startPart
	g2 e:7 | a:m7 d:7 | g1 | b2:m7.5- e:7.9- | \myEndLine
	a:m7 d:7 | g e:m7 | a:m7 d:7 | g d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2 e:7 | a:m7 d:7 | g1 | b2:m7.5- e:7 | \myEndLine
	a:m7 d:7 | g e:m7 | a:m7 d:7 | g1 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	d2:m7 g:7 | d:m7 g:7 | c g:7 | c1 | \myEndLine
	e2:m7 a:7 | e:m7 a:7 | d a:7.9- | d1:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2 e:7 | a:m7 d:7 | g1 | b2:m7.5- e:7 | \myEndLine
	a:m7 d:7 | b:m7 e:7 | a:m7 d:7 | g1 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Adagio" 4 = 66
	\time 4/4
	\key g \major

%% Intro
	\partial 8 b8 |

%% part "A"
	d8.[ e16 b8. c16] d4. b'8 | b8.[ c16 e,8. g16] a4. b8 | a8.[ g16 d'8. b16] a8.[ g16 fis8. d16] | f!2. r8 e |
	c4 b' b a | d, d2 a'8. g16 | d4 d~ d8. a'16 g8. fis16 | e2. r8 b |

%% part "A"
	d8.[ e16 b8. c16] d4. b'8 | b8.[ c16 e,8. g16] a4. b8 | a8.[ g16 d'8. b16] a8.[ g16 fis8. d16] | f!2. r8 e |
	c4 b' b a | d, d2 a'8. g16 | d4 d~ d8. a'16 g8. fis16 | g2. r8 gis |

%% part "B"
	a8.[ d,16 e8. f!16] g4. gis8 | a8.[ d,16 e8. f!16] g4. dis8 | e8.[ g16 a8. c16] b4 g8 e~ | e2. r8 ais |
	b8.[ e,16 fis8. g16] a4. ais8 | b8.[ e,16 fis8. g16] a4. g8 | fis[ d d d] g4 e8 a~ | a2. r8 b,8 |

%% part "A"
	d8.[ e16 b8. c16] d4. b'8 | b8.[ c16 e,8. g16] a4. b8 | a8.[ g16 d'8. b16] a8.[ g16 fis8. d16] | f!2. r8 e |
	c4 b' b a | d, d2 b'8. b16 | b4 c~ c8. a16 g8. fis16 | g2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	The boat rides we would take,
	the moon -- light on the lake,
	the way we danced and hummed our fav -- 'rite song.
	The Things We Did Last Sum -- mer
	I'll re -- mem -- ber __ all win -- ter long.

%% part "A"
	The mid -- way and the fun,
	the kew -- pie dolls we won,
	the bell I/you rang to prove that I/you was/were strong;
	The Things We Did Last Sum -- mer
	I'll re -- mem -- ber __ all win -- ter long.

%% part "B"
	The ear -- ly morn -- ing hike.
	The rent -- ed tan -- dem bike.
	The lunch -- es that we used to pack: __
	We nev -- er could ex -- plain
	that sud -- den sum -- mer rain.
	The looks we got when we got back. __

%% part "A"
	The leaves be -- gan to fade
	like prom -- is -- es we made.
	How could a love that seemed so right go wrong?
	The Things We Did Last Sum -- mer
	I'll re -- mem -- ber __ all win -- ter long.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1946 by Edwin H. Morris & Co., Inc" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "The Way You Look Tonight / Jerome Kern, Dorothy Fields"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "The Way You Look Tonight" }
			\fill-line {
				"Lyrics by Dorothy Fields"
				"Music by Jerome Kern"
			}
			\fill-line {
				"Med.-Up Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "Instr."
	\repeat volta 2 {
		f2:6 d:m7 | g:m9 c:7 | f:maj7 d:m7 | g:m9 c:7 | \myEndLine
	}

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f1:maj7 | d:m7 | g:m7 | c:7 | \myEndLine
		f2:maj7 ees:13 | d1:7 | g:m7 | c:7 | \myEndLine
		c:m7.11 | f:7 | bes:maj7 | g2:m7 c:7 | \myEndLine
		f:6 d:m7 | g:m9 c:7 | f:maj7 d:m7 |
	} \alternative {
		{
			g:m9 c:7 | \myEndLineVoltaNotLast
		}
		{
			bes:m7 ees:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	aes1:maj7 | a:dim7 | bes:m7 | ees:7 | \myEndLine
	aes:maj7 | c2:m7 b:dim7 | bes1:m7 | ees:9 | \myEndLine
	aes:maj7 | a:dim7 | bes:m7 | ees:13 | \myEndLine
	aes:maj7 | des:maj7 | g:m7.11 | c:7 | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	f1:maj7 | d:m7 | g:m7 | c:7 | \myEndLine
	f2:maj7 ees:13 | d1:7 | g:m7 | c:7 | \myEndLine
	c:m7.11 | f:7 | bes:maj7 | g2:m7 c:7 | \myEndLine
	f:6 d:m7 | g:m9 c:7 | f:maj7 d:m7 | g:m9 c:7 | \myEndLine
	g1:m7 | c:7 | f2:6 d:m7 | g:m7 c:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

%% part "Instr."
	\repeat volta 2 {
		r4 c' d2 | r4 a' g2 | r4 e d2 | r4 a g2 |
	}

%% part "A"
%%\mark \markup { \musicglyph #"scripts.segno" }
	\repeat volta 2 {
		c1 | f, | g4 a bes a | g1 |
		a4 bes c bes | a1 | bes4 c d c | bes c d e |
		f1 | f, | g4 a c bes | a2 g |
	%%<< { r4 c d2 } \\ { f,1 } >> | << { r4 a' g2 } \\ { r1 } >> | << { r4 e d2 } \\ { r1 } >> |
		f1 | r1 | r1 |
	} \alternative {
		{
		%%<< { r4 a g2} \\ { r4 d e g } >> |
			r4 d e g |
		}
		{
		%%<< { r1 } \\ { r4 aes g2 } >> |
			r1 |
		}
	}

%% part "B"
	c2 c | c c | c4 ees des bes~ | bes1 |
	bes4 c aes g~ | g2 aes | f'1~ | f2. r4 |
	ees2 ees | ees ees | ees4 f des c~ | c1 |
	bes4 c2 aes4 | g2 aes | c1~ | c2. r4 |

%% part "C"
	c1 | f, | g4 a bes a | g1 |
	a4 bes c bes | a1 | bes4 c d c | bes c d e |
	f1 | f, | g4 a c bes | a2 g |
%%<< { r4 c d2 } \\ { f,1 } >> | << { r4 a' g2 } \\ { r1 } >> | << { r4 e d2 } \\ { r1 } >> | << { r4 a g2} \\ { r1 } >> |
	f1 | r1 | r1 | r1 |
	g4 a c bes | a2 g | f4 r r2 | r1 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "Instr."
	_ _ _ _ _ _ _ _

%% part "A"
	Some -- day when I'm aw -- fly low,
	When the world is cold,
	I will feel a glow just think -- ing
	of you,
	And the way you look to -- night.
	Oh, but you're

%% part "B"
	With each word your ten -- der -- ness grows, __
	tear -- ing my fear __ a -- part, __
	And that laugh that wrin -- kles your nose __
	touch -- es my fool -- ish heart. __

%% part "C"
	Love -- ly, nev -- er, nev -- er change,
	Keep that breath -- less charm,
	Won't you please ar -- range it 'cause I love you,
	Just the way you look to -- night,
	Just the way you look to -- night.
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "Instr."
	_ _ _ _ _ _ _ _

%% part "A"
	Love -- ly, with your smile so warm,
	And your cheek so soft,
	There is noth -- ing for me but to
	love you,
	Just the way you look to -- night.
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1936 T B Harms Co." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts










\bookpart {

% this causes the variables to be defined...















% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "There Will Never Be Another You / Harry Warren, Mack Gordon"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "There Will Never Be Another You" }
			\fill-line {
				"Lyrics by Mack Gordon"
				"Music by Harry Warren"
			}
			\fill-line {
				"Easy Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	





\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	ees1:maj7 | aes:maj7 | d1:m7.5- | g:7.9- | \myEndLine
	c1*2:m7 | bes1:m7 | ees:7 | \myEndLine
	aes:maj7 | des:7.9 | ees:6 | c:m7 | \myEndLine
	f1*2:7 | f1:m7/bes | bes:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	ees1:maj7 | aes:maj7 | d1:m7.5- | g:7.9- | \myEndLine
	c1*2:m7 | bes1:m7 | ees:7 | \myEndLine
	aes:maj7 | des:7.9 | g2:m7 c:7 | fis1:dim7 | \myEndLine
	ees2:6 d:7.9- | g:7.5+ c:7.9- | f:m7 bes:7.9 | ees1:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 






{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key ees \major

	\partial 4 bes4 |

%% part "A"
	c d ees f | g bes f4. ees8 | f1~ | f2. g4 |
	ees f g bes | c ees c4. bes8 | c1~ | c2. bes4 |
	ees c bes aes | g f g4. aes8 | bes4 g f ees | f ees f4. ees8 |
	d'4 c bes a | g f g f | aes1~ | aes2. bes,4 |

%% part "B"
	c d ees f | g bes f4. ees8 | f1~ | f2. g4 |
	ees f g bes | c ees c4. bes8 | c1~ | c2. bes4 |
	ees4 c bes aes | g f g4. aes8 | bes4 g f ees | d'2. c4 |
	bes ees d c | bes ees, bes' aes | f2 g | ees2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	







\lyricmode {

%% part "A"
	There will be man -- y oth -- er nights like this, __
	and I'll be stand -- ing here with some -- one new, __
	There will be oth -- er songs to sing, an -- oth -- er fall, an -- oth -- er spring,
	but There Will Nev -- er Be An -- oth -- er You. __

%% part "B"
	There will be oth -- er lips that I may kiss, __
	but they won't thrill me like yours used to do. __
	Yes, I may dream a mil -- lion dreams, but how can they come true,
	if there will nev -- er ev -- er be an -- oth -- er you?
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1942, 1987 Twentieth Century Music Corporation" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "They All Laughed / George Gershwin, Ira Gershwin"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "They All Laughed" }
			\fill-line {
				"Lyrics by Ira Gershwin"
				"Music by George Gershwin"
			}
			\fill-line {
				"Medium Swing"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		g2 e:m | a:m7 d:7 | a:m7 d:7.9- | g4 bes:7 a:7 d:7 | \myEndLine
		g2 e:m | a:m7 d:7 | g:6 e:m7 | a:m7 d:7 | \myEndLine
		\endPart

		\myMark "A'"
		\startPart
		g2 e:m | a:m7 d:7 | cis:7.9- fis:7.9- | b:m7 e:7 | \myEndLine
		d1:6 | a:7 | d1*2:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		g4*11:7 b4:7 | e1:7.5+ | \myEndLine
		a1*2:7 | a1:m7 | ees2:7 d2:7 | \myEndLine
		\endPart

		\myMark "A''"
		\startPart
		g2 e:m | a:m7 d:7 | b:7 e:7 | a1:7 | \myEndLine
		g2 e:7 | a:m7 d:7 |

	} \alternative {
		{
			g e:7.9+ | a:7.9- d:7.9- | \myEndLineVoltaNotLast
		}
		{
			ees1 | bes2/d d:7/c | g/b e:7 | a:m7 d:7 | g1*2 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key g \major

	\repeat volta 2 {

	%% part "A"
		r8 d e4 g a | b8.[ b16 a8. g16] a8 b4. | b8.[ b16 a8. g16] a8 b4 d,8~ | d1 |
		r8 d e4 g a | b8.[ b16 a8. g16] a8 b4 g8~ | g1~ | g2. r4 |

	%% part "A"
		r8 d e4 g a | b8.[ b16 a8. g16] a8 b4. | d8.[ d16 cis8. b16] cis8 d4 fis,8~ | fis1 |
		b4 a8. gis16 a8 b4. | b8.[ c16 a8. gis16] a8 b4. | a4 b c b | a d d d |

	%% part "B"
		d2~ d8 b4 g8 | a2~ a8.[ b16 c8. cis16] | d4 e d b | c2. b4 |
		e2~ e8 cis4 a8 | b2~ b8 a4 b8 | c4 e e, g | a1 |

	%% part "A"
		r8 d, e4 g a | b8.[ b16 a8. g16] a8 b4. | c8 b4 a8 b4 c | b2. a4 |
		d4 d d2 | e8 e4 e8 b4 b |
	} \alternative {
		{
			g1~ | g2 r |
		}
		{
			g4 g g2 | bes8 bes4 bes8 fis4 fis | d'4 d d2 | e8 e4 e8 b4 b | g1~ | g4 r r2 |
		}
	}
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	They All Laughed at Chris -- to -- pher Co -- lum -- bus
	when he said the world was round. __
	They All Laughed when Ed -- i -- son re -- cord -- ed sound. __

%% part "A"
	They All Laughed at Wil -- bur and his broth -- er,
	when they said that man could fly. __
	They told Mar -- co -- ni wire -- less was a pho -- ney;
	it's the same old cry.

%% part "B"
	They laughed at me __ want -- ing you, __
	said I was reach -- ing for the moon.
	But oh, __ you came through __
	now they'll have to change their tune.

%% part "A"
	They all said we nev -- er could be hap -- py,
	they laughed at us and how!
	But ho, ho, ho!
	Who's got the last laugh now? __

%% part "Volta"
	He, he, he!
	Let's at the past laugh,
	Ha, ha, ha!
	Who's got the last laugh now? __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	They All Laughed at Rock -- e -- fel -- ler Cen -- ter,
	now they're fight -- ing to get in. __
	They All Laughed at Whit -- ney and his cot -- ton gin. __

%% part "A"
	They All Laughed at Ful -- ton and his steam -- boat,
	Her -- shey and his choc' -- late bar. __
	Ford and his Liz -- zie kept the laugh -- ers bus -- y;
	that's how peo -- ple are.

%% part "B"
	They laughed at me __ want -- ing you, __
	said it would be hel -- lo, good -- bye.
	But oh, __ you came through __
	now they're eat -- ing hum -- ble pie.

%% part "A"
	They all said we'd nev -- er get to -- geth -- er;
	dar -- ling, let's take a bow.
	For ho, ho, ho!
	Who's got the last laugh
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1937, Gershwin Publishing Corporation" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "They Can't Take That Away From Me / George Gershwin, Ira Gershwin"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "They Can't Take That Away From Me" }
			\fill-line {
				"Lyrics by Ira Gershwin"
				"Music by George Gershwin"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

%% Intro
	\partial 8*7 s8*7 |

	\myMark "A"
	\startPart
	ees1:6 | ees2/g ges:dim7 | f:m7 bes:9 | f:m7 bes:7.11 | \myEndLine
	ees1 | bes2:m7 ees:13 | aes c4:7 f:7 | f1:m7/bes | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees1:6 | ees2/g ges:dim7 | f:m7 bes:7 | f:m7 bes:7.11 | \myEndLine
	ees1 | bes2:m7 ees:13 | aes bes:7 | ees1:6 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	g2:m c4:7 d:7.9- | g2:m c4:7 d:7.9- | g2:m a:7 | a:m7 d:7 | \myEndLine
	g2:m c4:7 d:7.9- | g2:m bes4:m c:7 | f2:7 bes:7 | f1:m7/bes | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees1:6 | ees2/g ges:dim7 | f:m7 bes:7 | f:m7 bes:5.11 | \myEndLine
	ees:7 d:7 | bes2:m7 ees:7 | aes bes:7 | c:m aes:m6 | \myEndLine
	ees1 | f2:m7 bes:7 | ees1*2 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 120
	\time 4/4
	\key ees \major

%% part "Intro"
	\partial 8*7 ees8 ees ees ees4 ees8 g~ |

%% part "A"
	g1 | r8 ees ees ees ees4 ees8 bes~ | bes1 | r8 ees ees ees ees4 ees8 bes'~ |
	bes1~ | bes8 r c4 c c | ees8.[ c16 bes8. aes16] bes4 g8 f | r ees ees ees ees4 ees8 g~ |

%% part "A"
	g1 | r8 ees ees ees ees4 ees8 bes~ | bes1 | r8 ees ees ees ees4 ees8 bes'~ |
	bes1~ | bes4 c4 c c | ees8.[ c16 bes8. aes16] bes4 g8 ees~ | ees2. g8 a! |

%% part "B"
	bes4 g d' c | bes g d' c8 bes | g g g2 f4 | d2. g8 a! |
	bes4 a! d c | bes g c c | f,1 | r8 ees ees ees ees4 ees8 g~ |

%% part "A"
	g1 | r8 ees ees ees ees4 ees8 bes~ | bes1 | r8 ees ees ees ees4 ees8 c'~ |
	c1~ | c4 ees ees ees | ees8.[ c16 bes8. aes16] bes4 g8 ees~ | ees r bes'2 aes4 |
	g aes g bes | f2 g | ees1~ | ees2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	The way you wear your hat, __
	the way you sip your tea, __
	the mem -- 'ry of all that __
	no, no! They Can't Take That A -- way From Me!

%% part "A"
	The way your smile just beams, __
	the way you sing off key, __
	the way you haunt my dreams, __
	no, no! They Can't Take That A -- way From Me! __

%% part "B"
	We may nev -- er, nev -- er meet a -- gain on the bump -- y road to love,
	still I'll al -- ways, al -- ways keep the mem -- 'ry of

%% part "A"
	the way you hold your knife, __
	the way we danced till three, __
	the way you changed my life, __
	no, no! They Can't Take That A -- way From Me! __
	No! They Can't Take That A -- way From Me! __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1937 by Gershwin Publishing Corporation" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "This Can't Be Love / Richard Rodgers, Lorenz Hart"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "This Can't Be Love" }
			\fill-line {
				"Lyrics by Lorenz Hart"
				"Music by Richard Rodgers"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	g1*2:6 | c:7 | \myEndLine
	g1*2 | a2:m7 d:7 | a:m7 d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g1*2:6 | c:7 | \myEndLine
	g1 | a2:m7 d:7 | g c:7 | g1 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	fis:m7 | b:7 | e1*2:m7 | \myEndLine
	f1:13 | e:7.5+ | a:9 | d:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g1*2 | c:7 | \myEndLine
	g1:6 | a2:m7 d:7 | g d:7 | g1 | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Presto" 4 = 200
	\time 2/2
	\key g \major

%% part "A"
	g'2 fis4 g | d g fis g | e2 g4 a~ | a2. g4 |
	b r d, d~ | d e g2 | a1~ | a2. r4 |

%% part "A"
	g2 fis4 g | d g fis g | e2 g4 a~ | a2. g4 |
	d' r g, g~ | g b a2 | g1~ | g4 b b b |

%% part "B"
	cis, r e dis~ | dis b' b8 b4. | d1 | r4 b b b |
	d1 | c | b | a |

%% part "A"
	g2 fis4 g | d g fis g | e2 g4 a~ | a g a g |
	e' r g, g~ | g b a2 | g1~ | g2. r4 |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	This Can't Be Love be -- cause I feel so well, __
	no sobs, no sor -- rows, no sighs; __

%% part "A"
	This Can't Be Love, I get no diz -- zy spell. __
	My head is not __ in the skies, __

%% part "B"
	my heart does not stand still, __ just hear it beat!
	This is too sweet to be love.

%% part "A"
	This Can't Be Love be -- cause I feel so well; __
	but still I love to look __ in your eyes. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1938 by Chappell & Co., Inc. Copyright Renewed" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Unforgettable / Irving Gordon"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Unforgettable" }
			\fill-line {
				""
				"Lyrics and Music by Irving Gordon"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	g1 | g:maj7 | g1*2:dim7 | \myEndLine
	c1 | c:maj7 | a2:7.9 e:m7 | a1:7.9 | \myEndLine
	f:6 | f:m7 | c2 e:m7.5-/b | a1:7 | \myEndLine
	d:7.9 | d2.:7.9 des4:7 | d1*2:7 | \myEndLineVolta
	\endPart

	\myMark "B"
	\startPart
	g1 | g:maj7 | g1*2:dim7 | \myEndLine
	c1 | c:maj7 | a2:7.9 e:m7 | a1:7.9 | \myEndLine
	f:6 | f:m | c | a2:7 a:7.9 | \myEndLine
	d1:7.9 | d2:m7 g:7 | c d4:m7 des:maj7 | c1:6.9 | \myEndLineVolta
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key g \major

	\repeat unfold 2 {
		d4 e e8 fis4 fis8~ | fis2 \tuplet 3/2 { d4 e g } | fis1~ | fis2. r4 |
		g4 a a8 b4 b8~ | b2 \tuplet 3/2 { g4 a c } | b1~ | b2. r4 |
		c d d c | c d8 ees~ ees d c4 | g a a g | g a8 b~ b a g4 |
	} \alternative {
		{
			e e a e~ | e2. f4 | fis? fis c' fis,~ | fis2. r4 |
		}
		{
			d e e d | d e8 g~ g e d4 | c1~ | c2. r4 |
		}
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	Un -- for -- get -- ta -- ble, __ that's what you are, __
	Un -- for -- get -- ta -- ble, __ tho' near or far. __
	Like a song of love that clings __ to me,
	how the thought of you does things __ to me,
	nev -- er be -- fore __ has some -- one been more __

	Un -- for -- get -- ta -- ble, __ in ev -- 'ry way, __
	and for -- ev -- er more, __ that's how you'll stay. __
	That's why, dar -- ling, it's in -- cred -- i -- ble,
	that some -- one so Un -- for -- get -- __ ta -- ble,
	thinks that I am Un -- for -- get -- __ ta -- ble too. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1951, Bourne Co. Copyright Renewed." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts









\bookpart {

% this causes the variables to be defined...














% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Waltz For Debby / Bill Evans, Gene Lees"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Waltz For Debby" }
			\fill-line {
				"Lyrics by Gene Lees"
				"Music by Bill Evans"
			}
			\fill-line {
				"Moderately, in one"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 3 {
		g2.:m7 | c:m7 | f:m7 | bes:7 | g:7 | g2:m7.5- c4:7 | f2.:7 | bes:7 |
		ees:7 | aes:maj7 |
	} \alternative {
		{
			f:m7.5- | bes2:7 bes4:7/aes | g2.:m7 | c:7 | f:m7 | bes:7 | \myEndLineVoltaNotLast
		}
		{
			a:m7 | d2:7 d4:7/c | b2.:m7 | a:m7 | g:maj7 | fis:m7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	f2.:m7 | bes:7 | g:m7 | c2:7.5- c4:7 | f2.:m7 | g:7 | c:m7 | bes:m7/ees | \myEndLine
	aes:maj7 | g:7 | c:m7 | f:9 | g:m7 | ges:7 | f:m7 | bes:7 | \myEndLine
	\endPart

%%\myMark "Coda"
	\mark \markup { \musicglyph #"scripts.coda" }
	\startPart
	g2.:m7 | c2:7.5- c4:7 | a2.:m7 | d:7 | g:m7 | ees2:11 ees4:7 | \myEndLine
	aes2.:maj7 | des:9 | c:m | c:m7/bes | f:7/a | aes:dim7 | ees:6/g | ges:dim7 | \myEndLine
	f:m7 | bes2:9 bes4:7.9- | ees2. | ees:6.9 | \myEndLine
	\endPart

	\endSong
	\endChords
}





% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Presto" 4 = 200
	\time 3/4
	\key ees \major

%% part "A"
%%\repeat volta 2 {
		bes'2. | ees, | aes | d, | g~ | g | r4 f ees | d ees f |
		g2 f4 | ees f g |
%%} \alternative {
	\set Score.repeatCommands = #'((volta "1, 3") end-repeat)
%%	{
			aes aes g | f g aes | bes2.~ | bes~ | bes~ | bes |
%%	}
	\set Score.repeatCommands = #'((volta #f) (volta "2.") end-repeat)
%%	{
			a!2 g4 | fis! g a! | b!2.~ | b~ | b~ | b |
%%	}
%%}
	\set Score.repeatCommands = #'((volta #f))

%% part "B"
	c2.~ | c2 bes4 | c2.~ | c2 bes4 | c bes aes | g2 d4 | f2 ees4 | c' bes aes |
	g2 aes4 | g2 d4 | ees g bes | d ees c | bes2.~ | bes~ | bes~ | bes^\markup {D.C. al Coda} |

%% part "Coda"
	c2.~ | c | r4 d c | d c d | bes2.~ | bes |
	r4 bes aes | bes aes bes | g2.~ | g~ | g | r4 f ees | f ees f | ees f ees |
	c'2. | d, | ees( | bes') |
}




}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	In her own sweet world, __ pop -- u -- lat -- ed by dolls and clowns and a
	prince and a big pur -- ple bear, __
	wear -- y grown -- ups all wear. __

%% part "B"
	In __ the sun, __ she danc -- es to si -- lent mu -- sic, songs that are spun of
	gold some -- where in her own lit -- tle head. __

%% part "Coda"
	bear. __ When she goes they will cry __ as they whis -- per "\"good" -- "bye.\"" __
	They will miss her, I fear, but then, so will I. __
}



\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	lives my fav -- 'rite girl, __ un -- a -- ware of the wor -- ried frowns that we
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	






\lyricmode {

%% part "A"
	one day all too soon __ she'll grow up and she'll leave her dolls and her prince and
	her sil -- ly old
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1964 and 1965 Acom Music Corp., New York, NY." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Watermelon Man / Herbie Hancock"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Watermelon Man" }
			\fill-line {
				""
				"Music by Herbie Hancock"
			}
			\fill-line {
				"16-Bar Blues"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f1*4:7 | \myEndLine
	bes1*2:7 | f:7 | \myEndLine
	c1:7 | bes:7 | c:7 | bes:7 | \myEndLine
	c:7 | bes:7 | f1*2:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

%% part "A"
	ees'1\p\<~ | ees4\! f,8 f <aes c> ( <bes d>4-. ) f8~ | f1~ | f2 r |
	f'1\p\<~ | f4\! f,8 f <aes c> ( <bes d>4-. ) f8~ | f1~ | f2 r |
	r4 c'8 ( c g'4 a | aes8 g f d f4 g-. ) |
	r c,8 ( c g'4 a | aes8 g f d c4 d-. ) |
	r c8 ( c g'4 aes | \mark \markup { \italic { break } } f-. ) f,8 f <aes c> ( <bes d>4-. ) f8~ | f1 | r |
}

}
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1962, 1963 & 1965 By Hancock Music Co., New York, NY" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "What A Diff'rence A Day Made / Maria Grever, Stanley Adams"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "What A Diff'rence A Day Made" }
			\fill-line {
				"Lyrics by Stanley Adams"
				"Music by Maria Grever"
			}
			\fill-line {
				"Relaxed"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 2. s2. |

%%\myMark "A"
	\mark \markup { \musicglyph #"scripts.segno" }
	\startPart
	g1:m7 | c:7 | f | f2/a aes:dim7 | \myEndLine
	g1:m7 | c2:7 c:7.5+ | f1*2 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	e1:m7 | a:7 | d1*2:m7 | \myEndLine
	g:7 | g1:m7 | c2:7 r | \myEndLine
	\endPart

%% end of the "A" part
	\mark \markup { \musicglyph #"scripts.coda" } c1:m7 | f:7 | \myEndLine

	\myMark "C"
	\startPart
	bes1:maj7 | bes:m6 | f | aes:dim7 | \myEndLine
	g:m7 | c:7 | f1*2 | \myEndLine
	\endPart

	\endSong
	\endChords
}




% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 76
	\time 2/2
	\key f \major

	\partial 2. c8 d \tuplet 3/2 { f4 d f } |

%% part "A"
	g2 g~ | \tuplet 3/2 { g4 f g f e f } | e2 d~ | d4 d8 e \tuplet 3/2 { f4 d f } |
	bes2 bes~ | bes4 c8 c \tuplet 3/2 { c4 c^\markup {To Coda \musicglyph #"scripts.coda"} c } | c1~ | c4 r8 a a a a a |

%% part "B"
	a2 a~ | a4. a8 a a a a | a2 a~ | a4. a8 a a a aes |
	g2 g~ | g4 d8 e f e f4 | g1~ | g4 c,8 d \tuplet 3/2 { f4 d f^\markup {D.S. al Coda} } |

%% part "end of A"
	c'2 \tuplet 3/2 { a4 c a } | g2 r8 a c bes |

%% part "C"
	a2 a~ | a4 g a8 g f e | g2 g~ | g4 f8 g f e4 d8 |
	f2 f | r4 e8 e e f g4 | f1~ | f4 r r2 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	What A Diff -- 'rence A Day Made, __
	twen -- ty -- four lit -- tle ho -- urs, __
	brought the sun and the flow -- ers __
	where there used to be rain. __

%% part "B"
	My yes -- ter day was blue dear, __
	to -- day I'm part of you dear, __
	my lone -- ly nights are thru dear, __
	since you said you were mine, __

	What A Diff -- 'rence A

	bliss; that thrill -- ing kiss.

%% part "C"
	It's heav -- en when you __
	find ro -- mance on your men -- u. __
	What A Diff -- 'rence A Day Made,
	and the diff -- 'rence is you. __
}


\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {

%% part "A"
	_ _ _ _ _
	day makes, __ there's a rain -- bow be -- fore me, __
	skies a -- bove can't be storm -- y __
	since that mo -- ment of
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1934 by Edward B. Marks Music Company. Copyright Renewed." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "What A Wonderful World / George David Weiss, Bob Thiele"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "What A Wonderful World" }
			\fill-line {
				""
				"Lyrics and Music by George David Weiss, Bob Thiele"
			}
			\fill-line {
				"Slowly"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	f2 a:m | bes a:m | g:m7 f | a:7 d:m | \myEndLine
	des1 | g2:m7/c c:7 | f f:5+ | bes:maj7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f2 a:m | bes a:m | g:m7 f | a:7 d:m | \myEndLine
	des1 | g2:m7/c c:7 | f bes | bes f | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	c1:7 | f | c:7 | f | \myEndLine
	d2:m c | d:m c | d:m fis:dim7 | g4:m7 fis:dim7 g:m7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f2 a:m | bes a:m | g:m7 f | a:7 d:m | \myEndLine
	des1 | g2:m7/c c:7 | f a:m7.5- | d1:7 | \myEndLine
	g:m7 | g2:m7/c c:7.9- | f bes:6 | bes:6 f | \myEndLine
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 76
	\time 4/4
	\key f \major

	\partial 4 c8 e |

%% part "A"
	f4. a8 c2 | r8 d d d c2 | r8 bes bes bes a2 | r8 g g g f4~ \tuplet 3/2 { f8 f f } |
	f4~ \tuplet 3/2 { f8 f f } f2 | r4 f8 f \tuplet 3/2 {e4 f g} | a1~ | a2 r4 c,8 e |

%% part "A"
	f4. a8 c4. c8 | d4. d8 c4. c8 | bes4~ \tuplet 3/2 { bes8 bes bes } a4. a8 | g4~ \tuplet 3/2 { g8 g g } f4~ \tuplet 3/2 { f8 f f } |
	f4~ \tuplet 3/2 { f8 f f } f2 | r4 f8 f \tuplet 3/2 {e4 f g } | f1~ | f2 r4 f4 |

%% part "B"
	g8 g g g g c,4 c8 | bes' a a gis a4. f8 | g g g g g c,4 g'8 | bes a a gis a4 a8 c |
	d4 d8 d c4~ \tuplet 3/2 { c8 a c } | d4 d8 d c2 | r8 d d d c c4. | bes4 a g c,8 e |

%% part "A"
	f4. a8 c4. c8 | d4. d8 c2 | r8 bes bes bes a4. a8 | g4~ \tuplet 3/2 { g8 g g } f4~ \tuplet 3/2 { f8 f f } |
	f4~ \tuplet 3/2 { f8 f f } f2 | r4 f8 f \tuplet 3/2 {e4 f g} | a1~ | a4 r a a |
	\tuplet 3/2 {a4 f g} f2 | r4 f8 f \tuplet 3/2 {e4 f g} | f1~ | f\fermata |
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	I see trees of green, red ros -- es too, I see the bloom for me and you, __
	and I think __ to my -- self What A Won -- der -- ful World. __

%% part "A"
	I see skies of blue and clouds of white, the bright __ bless -- ed day, the dark __ sac -- red night, __
	and I think __ to my -- self What A Won -- der -- ful World. __

%% part "B"
	The col -- ors of the rain -- bow, so pret -- ty in the sky
	are al -- so on the fa -- ces of peo -- ple go -- in' by,
	I see friends shak -- in' hands, __ say -- in' "\"How" do you "do!\""
	They're real -- ly say -- in' "\"I" love "you,\""

%% part "A"
	I hear ba -- bies cry, I watch them grow.
	They'll learn much more than I'll __ ev -- er know, __
	and I think __ to my -- self What A Won -- der -- ful World. __
	Yes, I think to my -- self What A Won -- der -- ful World. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1967 by Range Road Music Inc. and Quartet Music Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "When I Fall In Love / Victor Young, Edward Heyman"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "When I Fall In Love" }
			\fill-line {
				"Lyrics by Edward Heyman"
				"Music by Victor Young"
			}
			\fill-line {
				"Moderately"
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
	\with {
		\remove "Bar_engraver"
	}
	


\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		ees2 c:7.9-.5+ | f:m7 bes:7 | ees c:7.9-.5+ | f:m7 bes:7 | \myEndLine
		ees1 | des2:9 c:9.5+ | f1:m7 | bes:7.9- | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		ees1 | f2:m7 bes:7 | g1:m7 | c:7 | \myEndLine
		f:m | c:7.9- | f:m7 | bes:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		ees2 c:7.9-.5+ | f:m7 bes:7 | ees c:7.9-.5+ | f:m7 bes:7 | \myEndLine
		ees1 | des2:9 c:9.5+ | f1:m7 | bes:7 | \myEndLine
		\endPart

		\myMark "C"
		\startPart
		ees1 | aes | g2:m7 c:7 | f:m7 des:9 | \myEndLine
		ees c:7.9-.5+ | f:m7 bes:7 |
	} \alternative {
		{
			ees c:m7 | f:m7 bes:7.9- | \myEndLineVoltaNotLast
		}
		{
			ees1*2 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}



% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
\new Staff="Melody" {
\new Voice="Voice"
	\relative c' 



{
	\tempo "Andante" 4 = 88
	\time 4/4
	\key ees \major

	\repeat volta 2 {

	%% part "A"
		bes4 ees aes g | ees1 | bes4 ees aes g | ees f2. |
		bes,4 ees c' bes | aes2. g4 | f1~ | f2. g8 aes |

	%% part "B"
		bes4. ees,8 ees4 ees | g f2 g8 aes | \tuplet 3/2 { bes4 g aes } \tuplet 3/2 { bes g aes } | bes2. aes8 bes |
		c4. f,8 f4 f | aes g2 aes8 bes | \tuplet 3/2 { c4 aes bes } \tuplet 3/2 { c aes c } | bes1 |

	%% part "A"
		bes,4 ees aes g | ees1 | bes4 ees aes g | ees f2. |
		bes,4 ees c' bes | aes2. g4 | f1~ | f2. g8 aes |

	%% part "C"
		bes4. ees,8 ees4 ees | d' c2 c,4 | c' bes2 c4 | aes2. f4 |
		bes, ees aes g | ees2 f |
	} \alternative {
		{ ees1~ | ees4 r r2 | }
		{ ees1~ | ees2. r4 | }
	}
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	When I Fall In Love
	it will be for -- ev -- er,
	or I'll nev -- er
	fall in love. __

%% part "B"
	in a rest -- less world like this is,
	love is end -- ed be -- fore it's be -- gun,
	and too man -- y moon -- light kiss -- es
	seem to cool in the warmth of the sun.

%% part "A"
	When I give my heart
	it will be com -- plete -- ly
	or I'll nev -- er
	give my heart. __

%% part "C"
	And the mo -- ment I can feel that
	you feel that way too,
	is When I Fall In
	Love with you. __

%% part "Volta"
	you. __
}

	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © 1952 by Victor Young Publications, Inc. Copyright Renewed, Assigned to Chappell & Co., Inc. and Intersong -USA,Inc." }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% book footer
%}
