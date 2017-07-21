



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
				\fill-line { \small "Git describe: 171-10-g6ee201a" }
				\fill-line { \small "Git commits: 1501" }
				\fill-line { \small "Build date: 21:29:32 21-07-2017" }
				\fill-line { \small "Build user: mark" }
				\fill-line { \small "Build host: fermat" }
				\fill-line { \small "Build kernel: Linux 4.10.0-26-generic" }
				\fill-line { \small "Lilypond version: 2.18.2" }
				\fill-line { \small "Number of tunes: 1" }
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



PartChords=\chordmode {
	\startSong
	\startChords

%% there is no need to worry about which instrument plays the chords
%% since they will not be heard...

	r2. |

	a:m | d:m | a2.*2:m | \myFakeEndLine
	a2.:m | d:m | a:m/e | a:m | \myFakeEndLine
	d:m | e:7 | a2.*2:m | \myFakeEndLine
	e:7 | a:m | \myFakeEndLine

	\repeat volta 2 {
		e2.*2:7 | a:m | \myFakeEndLine
		e2.:7 | e:7/d | a2.*2:m | \myFakeEndLine
		d:m | a:m | \myFakeEndLine
		e2.:7 |
	} \alternative {
		{ e2.:7 | a2.*2:m | }
		{ e2.:7 | a2.*2:m | }
	} \myFakeEndLine

	\repeat volta 2 {
		a2.*2:m | d2.:m | a:m | \myFakeEndLine
		d:m | a:m | e:7 | a:m | \myFakeEndLine
		a2.*2:m | d2.:m | a:m | \myFakeEndLine
		d:m | a:m/c | e:7/b |
	} \alternative {
		{ a:m | }
		{ a:m | }
	} \myFakeEndLine

	\endChords
	\endSong
}

PartHighVoice=\relative c' {

	\tempo "Allegro" 4 = 130
	\time 3/4
	\key c \major

%% this is to let lily know that this is voice one
	\voiceOne

	r8 e' g f e dis |

	\myMark "A"
	e2\segno e4 | f2 \tuplet 3/2 {f8 g f} | e2. | r8 e g f e dis | \myFakeEndLine
	e2 e4 | f2 \tuplet 3/2 {f8 g f} | e2. | r8 a b a gis a | \myFakeEndLine
	f2. | r8 gis a b a gis | e2. | r8 e g f e f | \myFakeEndLine
	e2. | r8 f e d c b | a2. ~ | a8-\markup { \italic "Fine" }
	\override BreathingSign.text = \markup {
		\musicglyph #"scripts.caesura.straight"
	}
	\breathe
	c b4 a | \myFakeEndLine

	\myMark "B"
	\repeat volta 2 {
		c4 b2 | r8 d c4 b | d c2 | r8 e d4 c | \myFakeEndLine
		e d2 | r8 f e4 dis | e2. | r8 g f4 e | \myFakeEndLine
		g f2 | r8 a a4 f | e c2 | r8 e a4 e | \myFakeEndLine
		e d2 |
	} \alternative {
		{ r8 b c d e f | e2. | r8 c b4 a | }
		{ r8 f' e4 gis, | a2 e'4 | <c e a>2. | }
	} \myFakeEndLine

	\myMark "C"
	\repeat volta 2 {
		r2. | r4 <a c e> <a c e> | r2. | r4 <a c e> <a c e> | \myFakeEndLine
		r2. | r4 <a c e> <a c e> | r4 <e gis d'> <e gis d'> | r4 <e a c> <e a c> | \myFakeEndLine
		r2. | r4 <a c e> <a c e> | r2. | r4 <a c e> <a c e> | \myFakeEndLine
		r2. | c | b |
	} \alternative {
		{ a2 <c e a>4 | }
		{ r8 e g f e dis_\markup {
			\center-column {
				\line
				{ \italic "D.C. "
				\tiny \raise #1
				\musicglyph #"scripts.segno"
				}
				\italic " al Fine"
			}
		} | }
	} \myFakeEndLine

	\endTune
}

PartMidVoice=\relative c' {
	\time 3/4

%% this is to let lily know that this is voice one
	\voiceTwo

	s2. |

	s4 <a' c> <a c> | s <a d> <a d> | s <a c> <a c> | s2. |
	s4 <a c> <a c> | s <a d> <a d> | s a c | s2. |
	s4 <a d> <a d> | s2. | s4 <a c> <a c> | s2. |
	s4 <gis d'> <gis d'> | s2. | s | s |

	\repeat volta 2 {
		s4 <e gis> <e gis> | s2. | s4 <e a> <e a> | s2. |
		s4 <e gis> <e gis> | s2. | s4 <a c> <a c> | s2. |
		s4 <a d> <a d> | s2. | s4 <e a> <e a> | s2. |
		s4 <e gis> <e gis> |
	} \alternative {
		{ s2. | s4 <a c> <a c> | s2. | }
		{ s2. | s2. | s2. | }
	}

	\repeat volta 2 {
		s2. | s2. | s2. | s2. |
		s2. | s2. | s2. | s2. |
		s2. | s2. | s2. | s2. |
		s2. | s4 e a | s e gis |
	} \alternative {
		{ s2. | }
		{ s2. | }
	}
}

PartLowVoice=\relative c' {
	\time 3/4

%% this is to let lily know that this is voice one
	\voiceThree

	s2. |

	a2. | d | a | a |
	a | d | e | a, |
	d | e, | a | a |
	e | e | a4 c e | a, s s |

	\repeat volta 2 {
		e2. | e | a | a |
		e | d' | a | a |
		d | d | a | a |
		e |
	} \alternative {
		{ e | a | a | }
		{ e | a | s | }
	}

	\repeat volta 2 {
		a8 b c cis d dis | e2. | a4 f d8 dis | e2. |
		a4 f d | c2. | b | c |
		a8 b c cis d dis | e2. | a4 f d8 dis | e2. |
		a4 f d | c2. | b |
	} \alternative {
		{ a | }
		{ a | }
	}
}



\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "Torcacita / Folk"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Torcacita" }
			\fill-line { \large \smaller \bold \larger "South American tune" }
			\fill-line {
				""
				"Music by Folk"
			}
			\fill-line {
				""
			}
		}
	}
}
\noPageBreak






% score for printing
\score {
	<<
		\new ChordNames="Partchords" \PartChords
		\new Staff="Melody" <<
			\new Voice="highvoice" \PartHighVoice
			\new Voice="midvoice" \PartMidVoice
			\new Voice="lowvoice" \PartLowVoice
		>>
	>>
	\layout {
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "Copyright © Public Domain" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by Mark Veltzer <mark@veltzer.net>" }
	}
}



}


% book footer
%}
