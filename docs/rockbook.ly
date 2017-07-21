



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
				\fill-line { \small "Build date: 21:29:30 21-07-2017" }
				\fill-line { \small "Build user: mark" }
				\fill-line { \small "Build host: fermat" }
				\fill-line { \small "Build kernel: Linux 4.10.0-26-generic" }
				\fill-line { \small "Lilypond version: 2.18.2" }
				\fill-line { \small "Number of tunes: 9" }
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




\tocItem \markup "Ain't No Sunshine / Bill Withers"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Ain't No Sunshine" }
			\fill-line {
				""
				"Lyrics and Music by Bill Withers"
			}
			\fill-line {
				"Med. Ballad"
				""
			}
		}
	}
}
\noPageBreak









\score {
	<<
		\new FretBoards {
			
	\chordmode {
		\startChords
		\mark "Verse"
		\startPart
		a2:m7 e4:m7 e:m7/g | a1:m7 |
		a2:m7 e4:m7 e:m7/g | a1:m7 |
		e:m7 | d:m7 |
		a2:m7 e4:m7 e:m7/g | a1:m7 |
		\endPart
		\mark "Interlude"
		\startPart
	%% these chords are silent
		a1*8:m7 |
	%% these chords are even more silent
		a2:m7 e4:m7 e:m7/g | a1:m7 |
		\endPart
		\endChords
	}

		}
		
	\new ChordNames="Chords"
%% this adds a bar engraver which does not always come with chords
%% I didn'f find a way to put this with the chords themselves...
	\with {
	%% for lilypond 2.12
	%%\override BarLine #'bar-size = #4
		\override BarLine #'bar-extent = #'(-2 . 2)
		\consists "Bar_engraver"
	}

		
	\chordmode {
		\startChords
		\mark "Verse"
		\startPart
		a2:m7 e4:m7 e:m7/g | a1:m7 |
		a2:m7 e4:m7 e:m7/g | a1:m7 |
		e:m7 | d:m7 |
		a2:m7 e4:m7 e:m7/g | a1:m7 |
		\endPart
		\mark "Interlude"
		\startPart
	%% these chords are silent
		a1*8:m7 |
	%% these chords are even more silent
		a2:m7 e4:m7 e:m7/g | a1:m7 |
		\endPart
		\endChords
	}

	>>
%%\midi {}
	\layout {}
}

% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\concat {
			\column {
				\box "Verse"
				"Ain't no sunshine when she's gone."
				"It's not warm when she's away."
				"Ain't no sunshine when she's gone"
				"And she's always gone too long anytime she goes away."
				\vspace #0.3
				\box "Verse"
				"Wonder this time where she's gone,"
				"Wonder if she's gone to stay"
				"Ain't no sunshine when she's gone"
				"And this house just ain't no home anytime she goes away."
				\vspace #0.3
				\box "Special"
				"And I know, I know, I know, I know, I know,"
				"I know, I know, I know, I know, I know, I know, I know,"
				"I know, I know, I know, I know, I know, I know,"
				"I know, I know, I know, I know, I know, I know, I know, I know"
				"Hey, I ought to leave the young thing alone,"
			}
			\hspace #3
			\column {
				\box "Verse"
				"But ain't no sunshine when she's gone,"
				"Only darkness everyday."
				"Ain't no sunshine when she's gone,"
				"And this house just ain't no home anytime she goes away."
				\vspace #0.3
				\box "Ending"
				"Anytime she goes away."
				"Anytime she goes away."
				"Anytime she goes away."
				"Anytime she goes away."
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




\tocItem \markup "Baby One More Time / Max Martin"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Baby One More Time" }
			\fill-line {
				""
				"Lyrics and Music by Max Martin"
			}
			\fill-line {
				"Pop"
				""
			}
		}
	}
}
\noPageBreak









\score {
	<<
		\new FretBoards {
			
	\chordmode {
		\mark "Verse"
		\startRepeat
		b1:m | fis:7 | d | e2:m fis:7 |
		\endRepeat
		\mark "Special fill"
		g1 | a | g | e2:m fis:7 |
	}

		}
		
	\new ChordNames="Chords"
%% this adds a bar engraver which does not always come with chords
%% I didn'f find a way to put this with the chords themselves...
	\with {
	%% for lilypond 2.12
	%%\override BarLine #'bar-size = #4
		\override BarLine #'bar-extent = #'(-2 . 2)
		\consists "Bar_engraver"
	}

		
	\chordmode {
		\mark "Verse"
		\startRepeat
		b1:m | fis:7 | d | e2:m fis:7 |
		\endRepeat
		\mark "Special fill"
		g1 | a | g | e2:m fis:7 |
	}

	>>
%%\midi {}
	\layout {}
}

% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\concat {
			\column {
				\box "Verse"
				"Oh baby, baby"
				"How was I supposed to know"
				"That somethin' wasn't right?"
				\vspace #0.3
				\box "Verse"
				"Oh baby, baby"
				"I shouldn't have let you go"
				"And now you're outta sight"
				\vspace #0.3
				\box "Transition"
				"Show me how you want it to be"
				"Tell me baby 'cause I need to know now"
				"Oh because"
				\vspace #0.3
				\box "Chorus"
				"My loneliness is killin' me"
				"I must confess I still believe"
				"When I'm not with you I lose my mind"
				"Give me a sign, hit me baby one more time"
				\vspace #0.3
				\box "Verse"
				"Oh baby, baby"
				"The reason I breathe is you"
				"Now, boy you got me blinded"
				\vspace #0.3
				\box "Verse"
				"I bet you baby"
				"There's nothing that I would not do, no"
				"It's not the way I planned it"
				\vspace #0.3
				\box "Transition"
				"Show me how you want it to be"
				"Tell me baby 'cause I need to know now"
				"Oh because"
			}
			\hspace #3
			\column {
				\box "Chorus"
				"My loneliness is killin' me"
				"I must confess I still believe"
				"When I'm not with you I lose my mind"
				"Give me a sign, hit me baby one more time"
				\vspace #0.3
				\box "Chorus"
				"Oh baby baby, oh baby baby"
				"Oh baby, baby"
				"How was I supposed to know"
				"Oh baby, baby"
				"I shouldn't have let you go"
				\vspace #0.3
				\box "Chorus"
				"I must confess that my lonliness is killing me now"
				"Don't you know I still believe?"
				"That you will be here and give me a sign"
				"Hit me baby one more time"
				\vspace #0.3
				\box "Chorus"
				"My loneliness is killin' me"
				"I must confess I still believe"
				"When I'm not with you I lose my mind"
				"Give me a sign, hit me baby one more time"
				\vspace #0.3
				\box "Chorus"
				"I must confess that my lonliness is killing me now"
				"Don't you know I still believe?"
				"That you will be here and give me a sign"
				"Hit me baby one more time"
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




\tocItem \markup "Creep / Radiohead"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Creep" }
			\fill-line {
				""
				"Lyrics and Music by Radiohead"
			}
			\fill-line {
				"Med. Ballad"
				""
			}
		}
	}
}
\noPageBreak









\score {
	<<
		\new FretBoards {
			
	\chordmode {
		\startChords
		\startRepeat
		g1*4 | b | c | c:m |
		\endRepeat
		\endChords
	}

		}
		\new ChordNames="Chords"
		
	\new ChordNames="Chords"
%% this adds a bar engraver which does not always come with chords
%% I didn'f find a way to put this with the chords themselves...
	\with {
	%% for lilypond 2.12
	%%\override BarLine #'bar-size = #4
		\override BarLine #'bar-extent = #'(-2 . 2)
		\consists "Bar_engraver"
	}

		
	\chordmode {
		\startChords
		\startRepeat
		g1*4 | b | c | c:m |
		\endRepeat
		\endChords
	}

	>>
%%\midi {}
	\layout {}
}

% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\concat {
			\column {
				\box "Verse"
				"When you were here before"
				"Couldn't look you in the eye"
				"You're just like an angel"
				"Your skin makes me cry"
				\vspace #0.3
				\box "Verse"
				"You float like a feather"
				"In a beautiful world"
				"I wish I was special"
				"You're so fucking special"
				\vspace #0.3
				\box "Chorus"
				"But I 'm a creep"
				"I 'm a weirdo"
				"What the hell am I doing here?"
				"I don't belong here"
			}
			\hspace #3
			\column {
				\box "Verse"
				"I don't care if it hurts"
				"I want to have control"
				"I want a perfect body"
				"I want a perfect soul"
				\vspace #0.3
				\box "Verse"
				"I want you to notice"
				"When I'm not around"
				"You're so fucking special"
				"I wish I was special"
				\vspace #0.3
				\box "Chorus"
				"But I'm a creep"
				"I'm a weirdo"
				"What the hell am I doing here?"
				"I don't belong here"
			}
			\hspace #3
			\column {
				\box "Chorus"
				"She's running out again"
				"She's running out"
				"She run, run, run run"
				"Run"
				\vspace #0.3
				\box "Verse"
				"Whatever makes you happy"
				"Whatever you want"
				"You're so fucking special"
				"I wish I was special"
				\vspace #0.3
				\box "Chorus"
				"But I'm a creep"
				"I'm a weirdo"
				"What the hell am I doing here?"
				"I don't belong here"
				"I don't belong here."
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




\tocItem \markup "Days Like This / Van Morrison"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Days Like This" }
			\fill-line {
				""
				"Lyrics and Music by Van Morrison"
			}
			\fill-line {
				"Med. Ballad"
				""
			}
		}
	}
}
\noPageBreak









\score {
	<<
		\new FretBoards {
			
	\chordmode {
		\startChords
		\startSong

		\mark "Opening"
		\startPart
		aes2 ees | aes2 ees | aes2 ees | aes2 ees |
		\endPart

		\mark "Verse"
		\startPart
		ees2 c:m | aes ees | ees2 c:m | aes ees |
		aes bes:7 | ees4 ees/e c2:m | aes bes:7 | aes ees |
		\endPart

		\mark "Interlude"
		\startPart
		aes2 ees |
		\endPart

		\mark "Ending"
		\startPart
		ees c:m | aes ees | ees c:m | aes ees |
		aes bes:7 | ees4 ees/e c2:m | aes bes:7 | aes ees |
		aes bes:7 | aes ees | aes bes:7 | aes ees | aes bes:7 | aes ees |
		\endPart

		\endSong
		\endChords
	}

		}
		
	\new ChordNames="Chords"
%% this adds a bar engraver which does not always come with chords
%% I didn'f find a way to put this with the chords themselves...
	\with {
	%% for lilypond 2.12
	%%\override BarLine #'bar-size = #4
		\override BarLine #'bar-extent = #'(-2 . 2)
		\consists "Bar_engraver"
	}

		
	\chordmode {
		\startChords
		\startSong

		\mark "Opening"
		\startPart
		aes2 ees | aes2 ees | aes2 ees | aes2 ees |
		\endPart

		\mark "Verse"
		\startPart
		ees2 c:m | aes ees | ees2 c:m | aes ees |
		aes bes:7 | ees4 ees/e c2:m | aes bes:7 | aes ees |
		\endPart

		\mark "Interlude"
		\startPart
		aes2 ees |
		\endPart

		\mark "Ending"
		\startPart
		ees c:m | aes ees | ees c:m | aes ees |
		aes bes:7 | ees4 ees/e c2:m | aes bes:7 | aes ees |
		aes bes:7 | aes ees | aes bes:7 | aes ees | aes bes:7 | aes ees |
		\endPart

		\endSong
		\endChords
	}

	>>
%%\midi {}
	\layout {}
}

% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\concat {
			\column {
				\box "Verse"
				"When its not always raining therell be days like this"
				"When theres no one complaining therell be days like this"
				"When everything falls into place like the flick of a switch"
				"Well my mama told me therell be days like this"
				\vspace #0.3
				\box "Verse"
				"When you dont need to worry therell be days like this"
				"When no ones in a hurry therell be days like this"
				"When all the parts of the puzzle start to look like they fit"
				"Then I must remember therell be days like this"
				\vspace #0.3
				\box "Verse"
				"When you dont need an answer therell be days like this"
				"When you dont meet a chancer therell be days like this"
				"When you dont get betrayed by that old judas kiss"
				"Then I must remember therell be days like this"
			}
			\hspace #3
			\column {
				\box "Verse"
				"When everyone is up front and theyre not playing tricks"
				"When you dont have no freeloaders out to get their kicks"
				"When its nobodys business the way that you wanna live"
				"Well my mama told me therell be days like this"
				\vspace #0.3
				\box "Verse"
				"When no one steps on my dreams therell be days like this"
				"When people understand what I mean therell be days like this"
				"When you ring out the changes about how everything is"
				"Well my mama told me therell be days like this"
				\vspace #0.3
				\box "Ending"
				"Well my mama told me Therell be days like this"
				"Well my mama told me Therell be days like this"
				"Well my mama told me Therell be days like this"
				"Oh my mama told me (she said) Therell be days like this"
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




\tocItem \markup "Forever Young / Alphaville"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Forever Young" }
			\fill-line {
				""
				"Music by Alphaville"
			}
			\fill-line {
				"Med. Ballad"
				""
			}
		}
	}
}
\noPageBreak









\score {
<<
		\new FretBoards {
			
	\chordmode {
		\startChords
		\mark "Intro"
		c1 | g1:7 | a1:m | f1 | g1:7 | d1:m | f1 | c2. g4:7 |
		\mark "Verse"
		c1 | g1:7 | a1:m | f1 | g1:7 | d1:m | f1 | a2.:m g4:7 |
		\endChords
	}

		}
		
	\new ChordNames="Chords"
%% this adds a bar engraver which does not always come with chords
%% I didn'f find a way to put this with the chords themselves...
	\with {
	%% for lilypond 2.12
	%%\override BarLine #'bar-size = #4
		\override BarLine #'bar-extent = #'(-2 . 2)
		\consists "Bar_engraver"
	}

		
	\chordmode {
		\startChords
		\mark "Intro"
		c1 | g1:7 | a1:m | f1 | g1:7 | d1:m | f1 | c2. g4:7 |
		\mark "Verse"
		c1 | g1:7 | a1:m | f1 | g1:7 | d1:m | f1 | a2.:m g4:7 |
		\endChords
	}

\new Voice="melody" \relative c' {
	\time 4/4
	\key c \major

%% part "Intro"
	e'1 | d | c | c | d | d | c | c2. b4 |

%% part "Verse"
	r2 g8 g g g~ | g4 f e8 e d e~ | e2 e8 e g f~ | f4 e c8 c d d~ |
	d2 d8 c d c | e4 d c8 c a c~ | c4 c8 a c a c a | c4 a2 r4 |
}
\new Lyrics \lyricsto "melody" {
	_ _ _ _ _ _ _ _ _

	Let's dance in style, let's dance for a while
	Hea -- ven can wait we're only watching the skies
	Ho -- ping for the best but expecting the worst
	Are you gonna drop the bomb or not?

	Let us die young or let us live forever
	We don't have the power but we never say never
	Sitting in a sandpit, life is a short trip
	The music's for the sad man

	Can you imagine when this race is won
	Turn our golden faces into the sun
	Praising our leaders we're getting in tune
	The music's played by the, the madman

	Forever young, I want to be forever young
	Do you really want to live forever?
	Forever, or never

	Forever young, I want to be forever young
	Do you really want to live forever?
	Forever young

	Some are like water, some are like the heat
	Some are a melody and some are the beat
	Sooner or later they all will be gone
	Why don't they stay young?

	It's so hard to get old without a cause
	I don't want to perish like a fading rose
	Youth like diamonds in the sun
	And diamonds are forever

	So many adventures couldn't happen today
	So many songs we forgot to play
	So many dreams are swinging out of the blue
	We let 'em come true

	Forever young, I want to be forever young
	Do you really want to live forever?
	Forever, or never

	Forever young, I want to be forever young
	Do you really want to live forever?
	Forever, or never

	Forever young, I wanna be forever young
	Do you really want to live forever?
}
>>
%%\midi {
%%	\context {
%%		\Score
%%		tempoWholesPerMinute = #(ly:make-moment 130/4)
%%	}
%%}
	\layout {}
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




\tocItem \markup "I Am Beautiful / Linda Perry"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "I Am Beautiful" }
			\fill-line {
				""
				"Lyrics and Music by Linda Perry"
			}
			\fill-line {
				"Ballad"
				""
			}
		}
	}
}
\noPageBreak









\score {
	<<
		\new FretBoards {
			
	\chordmode {
		\startChords
		\startSong

		\mark "Opening"
		\startPart
		ees1 | des | c:m | ces |
		ees | des | c:m | ces |
		\endPart

		\mark "Verse"
		\startPart
		ees | des | c:m | ces |
		ees | des | c:m | ces |
		\endPart

		\mark "Chorus"
		\startPart
		aes | f:m | ees2 des | c1:m |
		aes | f:m | ees2 des | c1:m |
		f:m |
		\endPart

		\mark "Transition"
		\startPart
		ees | des | c:m | ces |
		\endPart

		\mark "Special part"
		\startPart
		ees | des | c:m | ces |
		ees | des | c:m | ces |
		\endPart

		\endSong
		\endChords
	}

		}
		
	\new ChordNames="Chords"
%% this adds a bar engraver which does not always come with chords
%% I didn'f find a way to put this with the chords themselves...
	\with {
	%% for lilypond 2.12
	%%\override BarLine #'bar-size = #4
		\override BarLine #'bar-extent = #'(-2 . 2)
		\consists "Bar_engraver"
	}

		
	\chordmode {
		\startChords
		\startSong

		\mark "Opening"
		\startPart
		ees1 | des | c:m | ces |
		ees | des | c:m | ces |
		\endPart

		\mark "Verse"
		\startPart
		ees | des | c:m | ces |
		ees | des | c:m | ces |
		\endPart

		\mark "Chorus"
		\startPart
		aes | f:m | ees2 des | c1:m |
		aes | f:m | ees2 des | c1:m |
		f:m |
		\endPart

		\mark "Transition"
		\startPart
		ees | des | c:m | ces |
		\endPart

		\mark "Special part"
		\startPart
		ees | des | c:m | ces |
		ees | des | c:m | ces |
		\endPart

		\endSong
		\endChords
	}

	>>
%%\midi {}
	\layout {}
}

% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\concat {
			\column {
				\box "Opening"
				"Don't look at me"
				\vspace #0.3
				\box "Verse"
				"Everyday is so wonderful"
				"Then suddenly"
				"It's hard to breathe"
				"Now and then I get insecure"
				"From all the pain"
				"I'm so ashamed"
				\vspace #0.3
				\box "Chorus"
				"I am beautiful"
				"No matter what they say"
				"Words can't bring me down"
				"I am beautiful"
				"In every single way"
				"Yes words can't bring me down"
				"Oh no"
				"So don't you bring me down today"
				\vspace #0.3
				\box "Verse"
				"To all your friends you're delirious"
				"So consumed"
				"In all your doom, ooh"
				"Trying hard to fill the emptiness"
				"The pieces gone"
				"Left the puzzle undone"
				"Ain't that the way it is"
			}
			\hspace #3
			\column {
				\box "Chorus"
				"You're beautiful"
				"No matter what they say"
				"Words can't bring you down"
				"Oh no"
				"You're beautiful"
				"In every single way"
				"Yes words can't bring you down"
				"Oh no"
				"So don't you bring me down today"
				\box "Chorus"
				"No matter what we do"
				"(No matter what we do)"
				"No matter what we say"
				"(No matter what we say)"
				"We're the song inside the tune"
				"(Yeah, oh yeah)"
				"Full of beautiful mistakes"
				\vspace #0.3
				\box "Chorus"
				"And everywhere we go"
				"(And everywhere we go)"
				"The sun will always shine"
				"(The sun will always, always, shine)"
				"And tomorrow we might awake"
				"On the other side"
			}
			\hspace #3
			\column {
				\box "Chorus"
				"We're beautiful"
				"No matter what they say"
				"Yes words won't bring us down"
				"Oh no"
				"We are beautiful"
				"In every single way"
				"Yes words can't bring us down"
				"Oh no"
				"So don't you bring me down today"
				\vspace #0.3
				\box "Chorus"
				"Oh, oh"
				"Don't you bring me down today"
				"Don't you bring me down, ooh"
				"Today"
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




\tocItem \markup "Lucky Man / Greg Lake"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Lucky Man" }
			\fill-line {
				""
				"Lyrics and Music by Greg Lake"
			}
			\fill-line {
				"Med. Ballad"
				""
			}
		}
	}
}
\noPageBreak









\score {
	<<
		\new FretBoards {
			
	\chordmode {
		\startChords
		\startSong

		\myWordMark "Verse"
		\startPart
		g1 | d | g | d | \myEndLine
		g | d | g | d | \myEndLine
		\endPart

		\myWordMark "Chorus"
		\startPart
		a:m | e:m | d1*2 | \myEndLine
		a1:m | e:m | d1*2 | \myEndLine
		\endPart

		\endSong
		\endChords
	}

		}
		
	\new ChordNames="Chords"
%% this adds a bar engraver which does not always come with chords
%% I didn'f find a way to put this with the chords themselves...
	\with {
	%% for lilypond 2.12
	%%\override BarLine #'bar-size = #4
		\override BarLine #'bar-extent = #'(-2 . 2)
		\consists "Bar_engraver"
	}

		
	\chordmode {
		\startChords
		\startSong

		\myWordMark "Verse"
		\startPart
		g1 | d | g | d | \myEndLine
		g | d | g | d | \myEndLine
		\endPart

		\myWordMark "Chorus"
		\startPart
		a:m | e:m | d1*2 | \myEndLine
		a1:m | e:m | d1*2 | \myEndLine
		\endPart

		\endSong
		\endChords
	}

	>>
%%\midi {}
	\layout {}
}

% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\concat {
			\column {
				\box "Verse"
				"He had white Horses"
				"And ladies by the score"
				"All dressed in satin"
				"And waiting by the door"
				\vspace #0.3
				\box "Chorus"
				"Ooooh, what a lucky man he was"
				"Ooooh, what a lucky man he was"
				\vspace #0.3
				\box "Verse"
				"White lace and feathers"
				"They made up his bed"
				"A gold covered mattress"
				"On which he was led"
				\vspace #0.3
				\box "Chorus"
				"Ooooh, what a lucky man he was"
				"Ooooh, what a lucky man he was"
			}
			\hspace #3
			\column {
				\box "Verse"
				"He went to fight wars"
				"For his country and his king"
				"Of his honor and his glory"
				"The people would sing"
				\vspace #0.3
				\box "Chorus"
				"Ooooh, what a lucky man he was"
				"Ooooh, what a lucky man he was"
				\vspace #0.3
				\box "Verse"
				"A bullet had found him"
				"His blood ran as he cried"
				"No money could save him"
				"So he laid down and he died"
				\vspace #0.3
				\box "Chorus"
				"Ooooh, what a lucky man he was"
				"Ooooh, what a lucky man he was"
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




\tocItem \markup "Shape of My Heart / Sting, Dominic Miller, Sting"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Shape of My Heart" }
			\fill-line {
				"Lyrics by Sting"
				"Music by Sting, Dominic Miller"
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

	\mark \markup { \tiny \center-column { Verse and chorus } }
	\startPart
	fis2:m fis:m9/e | b:m7 b4:m7 cis:7 | fis2:m fis:m9/e | b:m7 b4:m7 cis:7 | \myEndLine
	d1 | a2:9 cis:7 | d:maj7 cis:7 | fis1:m | \myEndLine
	\endPart

	\mark "When doubling"
	\startPart
	fis2:m fis:m9/e | b:m7 b4:m7 cis:7 | fis2:m fis:m9/e | b:m7 b4:m7 cis:7 | \myEndLine
	d1 | a2:9 cis:7 | d:maj7 cis:7 | fis:m fis:m9/e | \myEndLine
	d:maj7 cis:7 | fis1:m | \myEndLine
	\endPart

	\mark "Special"
	\startPart
	cis2:m cis:m9/b | fis:m7 fis4:m7 gis:7 | cis2:m cis:m9/b | fis:m7 fis4:m7 gis:7 | \myEndLine
	a1 | e2:9 gis:7 | a:maj7 gis:7 | cis:m cis:m9/b | \myEndLine
	a:maj7 gis:7 | a1 | \myEndLine
	\endPart

	\endSong
	\endChords
}


% this thing will only engrave voltas. This is required to put the volta under the chords.
% No great harm will happen if you don't put it, only the voltas will be above the chords.
%\new Staff \with {
%	\consists "Volta_engraver"
%}
	>>
	\layout {
	}
}







% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\concat {
			\column {
				\box "Verse"
				"He deals the cards as a meditation"
				"And those he plays never suspect"
				"He doesn't play for the money he wins"
				"He doesn't play for respect"
				\vspace #0.3
				\box "Verse"
				"He deals the cards to find the answer"
				"The sacred geometry of chance"
				"The hidden law of a probable outcome"
				"The numbers lead a dance"
				\vspace #0.3
				\box "Chorus"
				"I know that the spades are swords of a soldier"
				"I know that the clubs are weapons of war"
				"I know that diamonds mean money for this art"
				"But that's not the shape of my heart"
				\vspace #0.3
				\box "Verse"
				"He may play the jack of diamonds"
				"He may lay the queen of spades"
				"He may conceal a king in his hand"
				"While the memory of it fades"
			}
			\hspace #3
			\column {
				\box "Chorus"
				"I know that the spades are swords of a soldier"
				"I know that the clubs are weapons of war"
				"I know that diamonds mean money for this art"
				"But that's not the shape of my heart"
				"Shape of my heart"
				\vspace #0.3
				\box "Verse"
				"And if I told you that I loved you"
				"You'd maybe think there's something wrong"
				"I'm not a man of too many faces"
				"The mask I wear is one"
				\vspace #0.3
				\box "Verse"
				"Those who speak know nothing"
				"And find out to their cost"
				"Like those who curse their luck in too many places"
				"And those who fear are lost"
				\vspace #0.3
				\box "Chorus"
				"I know that the spades are swords of a soldier"
				"I know that the clubs are weapons of war"
				"I know that diamonds mean money for this art"
				"But that's not the shape of my heart"
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




\tocItem \markup "Talkin' Bout A Revolution / Tracy Chapman"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "Talkin' Bout A Revolution" }
			\fill-line {
				""
				"Lyrics and Music by Tracy Chapman"
			}
			\fill-line {
				"upbeat"
				""
			}
		}
	}
}
\noPageBreak










\storePredefinedDiagram #default-fret-table \chordmode {g:sus4} #guitar-tuning #"3-3;2-2;o;o;o;3-4;"
\storePredefinedDiagram #default-fret-table \chordmode {c:5.9} #guitar-tuning #"x;3-2;2-1;o;3-3;3-4;"
\storePredefinedDiagram #default-fret-table \chordmode {e:m7} #guitar-tuning #"o;2-1;2-2;o;3-3;3-4;"
\storePredefinedDiagram #default-fret-table \chordmode {d:sus4} #guitar-tuning #"x;x;o;2-1;3-3;2-2;"

\score {
	<<
		\new FretBoards {
			
	\chordmode {
		\startChords
		\startRepeat
		g2:sus4 c:5.9 | e:m7 d:sus4 |
		\endRepeat
		\endChords
	}

		}
		
	\new ChordNames="Chords"
%% this adds a bar engraver which does not always come with chords
%% I didn'f find a way to put this with the chords themselves...
	\with {
	%% for lilypond 2.12
	%%\override BarLine #'bar-size = #4
		\override BarLine #'bar-extent = #'(-2 . 2)
		\consists "Bar_engraver"
	}

		
	\chordmode {
		\startChords
		\startRepeat
		g2:sus4 c:5.9 | e:m7 d:sus4 |
		\endRepeat
		\endChords
	}

	>>
%%\midi {}
	\layout {}
}

% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\concat {
			\column {
				\box "A"
				"Don't you know you're talking about a revolution"
				"It sounds like a whisper"
				"Don't you know they're talking about a revolution"
				"It sounds like a whisper"
				\vspace #0.3
				\box "A"
				"While they're standing in the welfare lines"
				"Crying at the doorsteps of those armies of salvation"
				"Wasting time in unemployment lines"
				"Sitting around waiting for a promotion"
				\vspace #0.3
				\box "A"
				"Don't you know you're talking about a revolution"
				"It sounds like a whisper"
				\vspace #0.3
				\box "A"
				"Poor people are gonna rise up"
				"And get their share"
				"Poor people are gonna rise up "
				"And take what's theirs"
				\vspace #0.3
				\box "A"
				"Don't you know you better run, run, run, run, run,"
				"run, run, run, run, run, run, run, run"
				"Oh I said you better run, run, run, run, run, run,"
				"run, run, run, run, run, run, run"
			}
			\hspace #3
			\column {
				\box "A"
				"Finally the tables are starting to turn"
				"Talking about a revolution "
				"Finally the tables are starting to turn"
				"Talking about a revolution oh no"
				"Talking about a revolution oh no"
				\vspace #0.3
				\box "A"
				"While they're standing in the welfare lines"
				"Crying at the doorsteps of those armies of salvation"
				"Wasting time in unemployment lines"
				"Sitting around waiting for a promotion"
				\vspace #0.3
				\box "A"
				"Don't you know you're talking about a revolution"
				"It sounds like a whisper"
				\vspace #0.3
				\box "A"
				"And finally the tables are starting to turn"
				"Talking about a revolution"
				"Finally the tables are starting to turn"
				"Talking about a revolution oh no"
				"Talking about a revolution oh no"
				"Talking about a revolution oh no"
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


% book footer
%}
