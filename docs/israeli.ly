



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
				\fill-line { \small "Build date: 21:29:28 21-07-2017" }
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




\tocItem \markup "איך הוא שר / דני רובס"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "איך הוא שר" }
			\fill-line {
				""
				"מילים ולחן: דני רובס"
			}
			\fill-line {
				"בלדת רוק"
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

	\myWordMark "בית"
	\startPart
	\repeat volta 2 {
		a1:m | d:m/f | e:sus4 | e:7 |
	}
	f | g:7 | c | e:7 |
	a:m | d:m | e:sus4 | e:7 |
	\endPart

	\myWordMark "פזמון"
	\startPart
	d:m | g | c | a:7 |
	d:m | e:7 | f | a:7 |
	d:m | g | c | a:7 |
	d:m | e:7 | f | a:m |
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
		\fill-line {
			\hspace #0
			\concat {
				\right-column {
					\box "Chorus"
					"איך הוא שר, איך הוא שר, הם רקדו מסביבו בטירוף הוא היה מאושר"
					"איך הוא שר, איך הוא שר, מה נשאר מהזוהר מכל השירים מה נשאר"
					\vspace #0.3
					\box "Verse"
					"הם סגדו לו כמו אל, הוא היה סך הכל בן-אדם"
					"הקולות ששמע בשכונה נמוגים לאיטם"
					"רק הפחד ההוא הלבן בעורקיו מתפתל"
					"הוא חשב שימריא איתו, לא, הוא נופל"
					\vspace #0.3
					\box "Chorus"
					"איך הוא שר, איך הוא שר, הם רקדו מסביבו בטירוף הוא היה מאושר"
					"איך הוא שר, איך הוא שר, מה נשאר מהזוהר מכל השירים מה נשאר"
				}
				\hspace #3
				\right-column {
					\box "Verse"
					"מרחוק הוא שומע תפילות בית הכנסת מלא"
					"הנרות הדולקים ריח ערב שבת שוב עולה"
					"איך כולם התגאו בו הילד עם קול הזהב"
					"והסוף כמו בקרב אבוד, סוגר עליו"
					\vspace #0.3
					\box "Verse"
					"ואמו לחשה לתינוק שרעד ובכה"
					"עוד תיראה לכולנו תהיה גאווה מקולך"
					"חום ידו של אביו כששר והאש בעיניו"
					"והסוף כמו בקרב אבוד, סוגר עליו"
				}
			}
		}
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- עיזרו לי למלא את שורת זכויות היוצרים הזו --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by מרק ולצר <mark.veltzer@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "איך זה שכוכב / מתי כספי, נתן זך"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "איך זה שכוכב" }
			\fill-line {
				"מלים: נתן זך"
				"לחן: מתי כספי"
			}
			\fill-line {
				"בוסה נובה"
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
	a1*3:maj7 | e2:m7 e:m6 | e1:m | \myEndLine
	d:m7 | d2:m7 d:m6 | a1*2:maj7 | \myEndLine
	f:maj7 | c:maj7 | \myEndLine
	f2 b:m7 | e1:7 | a1*2:maj7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	d1:7 | d:m | fis:dim | a:m | \myEndLine
	b:m7 | a:7 | d:m/f | fis1*2:m | \myEndLine
	a:maj7 | e2:m7 e:m6 | e1:m | \myEndLine
	d:m7 | d2:m6 d:m7 | a1*2:maj7 | \myEndLine
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
	\key a \major

%% part "A"
	e2 e | gis4 a8 gis~ gis4 a8 gis~ | gis4 fis8 e~ e4 fis8 g~ | g1 |
	r2 g8 fis e f~ | f1 | r4. f8 g a b cis~ | cis1 |
	r2. cis8 e~ | e4 e8 d~ d4 d8 c~ | c2. b8 d~ | d d d c~ c c c b~ |
	b4 r r8 a b d~ | d2. a8 d~ | d d~ d cis~ cis4 b8 a~ | a1~ | a2 r |

%% part "B"
	c2 c | c4 c8 c~ c4 c8 c~ | c4 c8 c~ c4 c8 c~ | c2 r |
	r d8 d d cis~ | cis2 r | r4 r8 a b b b a~ | a4 r r2 |
	r4 r8 a b b b a~ | a4 r r2 | r a8 gis fis g~ | g2 r |
	r g8 fis e f~ | f2 r | r4 r8 f g a b a~ | a1~ | a |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "A"
	איך זה ש -- כו -- כב __ א -- חד __ ל -- בד __ מ -- עז. __
	איך הוא מ -- עז, __ ל -- מ -- ען ה -- שם. __
	כו -- כב __ א -- חד __ ל -- בד. __
	א -- ני __ לא ה -- יי -- __ תי מ -- עז. __
	ו -- א -- ני, __ ב -- ע -- __ צם, __ לא __ ל -- בד. __ __

%% part "B"
	איך זה ש -- כו -- כב __ א -- חד __ ל -- בד __ מ -- עז. __
	איך הוא מ -- עז, __ ל -- מ -- ען ה -- שם. __
	ל -- מ -- ען ה -- שם. __
	לה לה לה לה __
	לה לה לה לה __
	לה לה לה לה לה __ __
}


	>>
	\layout {
	}
}







% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\fill-line {
			\hspace #0
			\concat {
				\right-column {

					\box "A"
					"איך זה שכוכב אחד לבד מעז."
					"איך הוא מעז, למען השם."
					"כוכב אחד לבד."
					"אני לא הייתי מעז."
					"ואני, בעצם, לא לבד."
				}
			}
		}
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- עיזרו לי למלא את שורת זכויות היוצרים הזו --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by מרק ולצר <mark.veltzer@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "גשם / יחיאל אמסלם, יעקב גלעד"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "גשם" }
			\fill-line {
				"מלים: יעקב גלעד"
				"לחן: יחיאל אמסלם"
			}
			\fill-line {
				"בלדת רוק"
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

	\myWordMark "Intro"
	\startPart
	g2. g4:sus4 | g2. g4:sus4 | \myEndLine
	\endPart

	\myWordMark "Verse"
	\startPart
	\repeat volta 2 {
		\repeat volta 2 {
			g1 | d | c2 d | e1:m |
		}
		d | \myEndLine
	}
	\endPart

	\myWordMark "Chorus"
	\startPart
	e1:m | d | c2 d | g2. g4/fis | \myEndLine
	e1:m | d | c2 d | e:m a:m | \myEndLine
	b:m c | des:m7.5- b:m | g c | e1 | \myEndLine
	\endPart

	\myWordMark "Verse"
	\startPart
	\repeat volta 2 {
		a | e | d2 e | fis1:m |
	}
	e | \myEndLine
	\endPart

	\myWordMark "Chorus"
	\startPart
	fis:m | e | d2 e | fis1:m | \myEndLine
	fis:m | e | d2 e | \time 2/4 fis2:m | \myEndLine
	\repeat volta 2 {
		\time 4/4 b2:m cis:m | d ees:m7.5- | cis:m a | d fis | \time 2/4 fis2 | \myEndLine
	}
	\endPart

%% commented in order to see the closing repeats
%%\endSong
%%\endChords
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
	\tempo "Moderato" 4 = 80
	\time 4/4
	\key e \minor

%% part "Intro"
	b2. c4 | b2. a8 b16 c |

%% part "Verse"
	d8. c16 b8 c d8. c16 b8 c | d2.. e16 fis | g8. fis16 e8 e d8. b16 d8 e | b2.. b16 c |
	d8. d16 d8 d d8. d16 e8 fis | d2.. e16 fis | g8. fis16 e8 e d4 \times 2/3 { d8 d d } | e1 |
}


}
	>>
	\layout {
	}
}





% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\fill-line {
			\hspace #0
			\concat {
				\right-column {
					\box "Verse"
					"אין מקום לדאגה היי שקטה"
					"אני איתך, את לא לבד לעת עתה"
					"עכשיו הכל זורם כאן במנוחה"
					"ואת בוכה, ואת בוכה."
					\vspace #0.3
					\box "Chorus"
					"ספרי לי מה כבד עלייך"
					"את כל מה שחבוי בך ונרדם"
					"אני אמחה את דמעותייך"
					"ורק שלא תבכי עוד לעולם."
				}
				\hspace #3
				\right-column {
					\box "Verse"
					"ברחובות כיבו מזמן את הניאון"
					"את נראית לי עייפה נלך לישון"
					"האור דולק בחדר השני"
					"אבל מישהו בוכה וזה לא אני."
					\vspace #0.3
					\box "Verse"
					"אני רוצה לשמור עלייך ועלי"
					"היום עבר עלינו יום קשה מדי"
					"בחוץ יורדים עכשיו גשמי ברכה"
					"ואת בוכה, ואת בוכה."
					\vspace #0.3
					\box "Chorus"
					"ספרי לי מה כבד עלייך"
					"את כל מה שחבוי בך ונרדם"
					"אני אמחה את דמעותייך"
					"ורק שלא תבכי עוד לעולם."
				}
			}
		}
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- עיזרו לי למלא את שורת זכויות היוצרים הזו --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by מרק ולצר <mark.veltzer@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts









\bookpart {

% this causes the variables to be defined...














% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "הרדופים ליד החוף / שלמה ארצי, נתן יונתן"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "הרדופים ליד החוף" }
			\fill-line {
				"מלים: נתן יונתן"
				"לחן: שלמה ארצי"
			}
			\fill-line {
				"שירי ארץ ישראל"
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
		d1:m | g2:m7 c:7 | f1:maj7 | g:m | \myEndLine
		g:m7 | bes:maj7 | d2:dim7 a:7 |
	} \alternative {
		{ d1:m | }
		{ d:m | }
	} \myEndLine
	\endPart

	\myMark "B"
	\startPart
	\repeat volta 2 {
		a2 a2:7 | d1:m | g2:m7/c c:7 | f1:maj7 | \myEndLine
	} \alternative {
		{
			bes2:maj7 a:7 | ees1:maj7 | e2:m7.5- ees:maj7 | d1:m | \myEndLine
		}
		{
			bes2:maj7 a:7 | d1:m/f | d2:dim7 a:7 | d1:m | \myEndLine
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

	\set Staff.midiInstrument = #"flute"

	\partial 4 f8 e |

%% part "A"
	\repeat volta 2 {
		d4. d'8 c4 bes8 a | g2. f8 g | a4. c,8 f4 a8 g | d2. e8 f |
		g4. f8 e4 d8 d' | bes2 a4 g | f4. f8 e4. e8 |
	} \alternative {
		{ d2. f8 e | }
		{ d2. cis8 d | }
	}

%% part "B"
	\repeat volta 2 {
		e4. a,8 d4. e8 | f4 f2 e8 f | g4. c,8 f4. g8 | a4 a2 bes8 c |
	} \alternative {
		{ d4. cis8 f4. e8 | d4 d2 c8 bes | a4. a8 bes c bes4 | a2. cis,8 d | }
		{ d'4. cis8 f4. e8 | d4 d2 bes8 c | d4. cis8 f4. e8 | d2. f,8 e | }
	}
}




}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	לא נפ -- רח כבר פ -- ע -- מ -- יים, ו -- ה -- רו -- ח על ה -- מ -- ים,
	י -- פ -- זר דמ -- מה צו -- נ -- נת על פ -- ני -- נו ה -- חיוו -- רות

	ש -- מה _

	בלי תו -- גה, כפו -- פי צ -- מ -- רת, בלו -- ר -- יות שי -- בה נב -- ד -- רת
	ב -- א -- שר י -- פות ה -- תו -- אר, בין שרי -- קות ה -- ע -- _ ד -- רים.

	תפ -- נו
}



\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {
	_ _ בין אי -- בי ה -- נ -- חל, ב -- ש -- עה א -- חת נש -- כ -- חת,
	זכ -- רו -- נות א -- זוב ש -- ל -- נו מת -- רפ -- קים על ה -- קי -- _ _ _ רות.

	_ _ קי ג -- וון יר -- טי -- טו, ב -- לכ -- תן לר -- חוץ ב -- ז -- רם
	נכ -- ל _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ מים נש -- פיל עי -- נ -- נו, אל ה -- מ -- ים ה -- קרי -- רים.

	לא נו
}


	>>
	\layout {
	}
}








% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\fill-line {
			\hspace #0
			\concat {
				\right-column {

					\box "B"
					"הרדופים שלי, כמוני, וכמוך שכל ימייך,"
					"את פרחי האור שלנו את פיזרת לכל רועה."
					"לא עופות מרום אנחנו, ואל גובה השמיים,"
					"גם אתם, גם אנוכי - לא נגיע כנראה."
					\vspace #0.3

					\box "A"
					"רק בהר על קו הרכס מישהו מוסיף ללכת,"
					"מן הואדי והאבן, לרכסים, אל הרוחות."
					"עד אשר בכסות הערב, יחזור נוגה אלייך,"
					"עם פכפוך פלגים, עם רחש הרדופים ליד החוף."
				}
				\hspace #3
				\right-column {

					\box "A"
					"לא נפרח כבר פעמיים, והרוח על המים,"
					"יפזר דממה צוננת על פנינו החיוורות"
					"שמה בין איבי הנחל, בשעה אחת נשכחת,"
					"זכרונות אזוב שלנו מתרפקים על הקירות."
					\vspace #0.3

					\box "B"
					"בלי תוגה, כפופי צמרת, בלוריות שיבה נבדרת"
					"באשר יפות התואר, בין שריקות העדרים."
					"תפנוקי גוון ירטיטו, בלכתן לרחוץ בזרם"
					"נכלמים נשפיל עיננו, אל המים הקרירים."
					\vspace #0.3

					\box "A"
					"לא נוסיפה עוד לנוע, משתאים נביט ברוח"
					"איך הוא יחד עם המים, מפרקים את הסלעים."
					"תאנה חנטה פגיה, והנשר היגע -"
					"אל קינו חזר בחושך מדרכי האלוהים."

				}
			}
		}
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- עיזרו לי למלא את שורת זכויות היוצרים הזו --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by מרק ולצר <mark.veltzer@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts







\bookpart {

% this causes the variables to be defined...












% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "היא חזרה בתשובה / מתי כספי, יעקב רוטבליט"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "היא חזרה בתשובה" }
			\fill-line {
				"מלים: יעקב רוטבליט"
				"לחן: מתי כספי"
			}
			\fill-line {
				"בוסה נובה"
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
	c1*2:m | g:7/b | c:7/bes | f1:m9/a | f1:m | \myEndLine
	g:m7.5- | c:7 | f1*2:m |
	\endPart

	\myMark "B"
	\startPart
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
}


}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
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
		\smaller \smaller { "-- עיזרו לי למלא את שורת זכויות היוצרים הזו --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by מרק ולצר <mark.veltzer@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "לא יכולתי לעשות כלום / אילן וירצברג, יונה וולך"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "לא יכולתי לעשות כלום" }
			\fill-line {
				"מלים: יונה וולך"
				"לחן: אילן וירצברג"
			}
			\fill-line {
				"בלדת רוק"
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
	a1 | fis:m | d | g | a | \myEndLine
	d | d:m | g | a | \myEndLine
	a1 | fis:m | d | g | a | \myEndLine
	a | cis:m | d | d:m | a | \myEndLine
	\endPart

	\myWordMark "Chorus"
	\startPart
	fis1*2:m | cis:m | b:m | fis:m | \myEndLine
	a | cis:m | b:m | fis:m | \myEndLine
	\endPart

	\myWordMark "Solo"
	\startPart
	\startRepeat
	fis1*2:m | cis:m | b:m | fis:m | \myEndLine
	\endRepeat
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
		\fill-line {
			\hspace #0
			\concat {
				\right-column {
					\box "Verse"
					"לא יכולתי לעשות עם זה כלום, אתה שומע?"
					"לא יכולתי לעשות עם זה כלום."
					"זה היה אצלי בידיים..."
					"ולא יכולתי לעשות כלום."
					\vspace #0.3
					\box "Verse"
					"אנלא יכולתי עם זה משהו, אתה שומע?"
					"יכולתי לגמגם"
					"מה רציתי להגיד"
					"יכולתי להרגיש הכי רע, שאפשר."
					\vspace #0.3
					\box "Verse"
					"ופתאום אתה עומד כמו ילד קטן"
					"בסינור לצוואר וחוזר על השאלה"
					"מה עשית עם זה, שואלים לאן"
					"בזבזת את כל זה היה לך סיכוי"
					"ואתה תצטרך להתחיל הכל מחדש."
					\vspace #0.3
					\box "Verse"
					"לא יכולתי לעשות עם זה כלום."
				}
				\hspace #3
				\right-column {
					\box "Verse"
					"לא יכולתי לעשות עם זה כלום, אתה שומע?"
					"לא יכולתי לעשות עם זה כלום."
					"זה היה אצלי בידיים..."
					"ולא יכולתי לעשות כלום."
					\vspace #0.3
					\box "Verse"
					"לא יכולתי לעשות משהו, אתה שומע?"
					"יכולתי לגמגם"
					"מה רציתי להגיד "
					"יכולתי להרגיש הכי רע, שאפשר."
					\vspace #0.3
					\box "Verse"
					"לא יכולתי לעשות עם זה כלום, אתה שומע?"
					"לא יכולתי לעשות עם זה כלום."
					"זה היה אצלי בידיים..."
					"ולא יכולתי לעשות כלום."
					\vspace #0.3
					\box "Verse"
					"לא יכולתי לעשות משהו, אתה שומע?"
					"יכולתי לגמגם"
					"מה רציתי להגיד"
					"יכולתי להרגיש הכי רע, שאפשר."
					\vspace #0.3
					\box "Verse"
					"ופתאום אתה עומד כמו ילד קטן"
					"בסינור לצוואר וחוזר על השאלה"
					"מה עשית עם זה, שואלים לאן"
					"בזבזת את כל זה היה לך סיכוי"
					"ואתה תצטרך להתחיל הכל מחדש."
				}
			}
		}
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- עיזרו לי למלא את שורת זכויות היוצרים הזו --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by מרק ולצר <mark.veltzer@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts








\bookpart {

% this causes the variables to be defined...













% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "נח / מתי כספי, יורם טהרלב"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "נח" }
			\fill-line {
				"מלים: יורם טהרלב"
				"לחן: מתי כספי"
			}
			\fill-line {
				"סמבה"
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

	\myWordMark "Intro"
	\startPart
	f1:m | bes:m | f:m | c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f:m | bes:m | f:m | c:7 | \myEndLine
	f:m | bes:m | f:m | c:7 | \myEndLine
	f:7 | bes:7 | c:7 | f | \myEndLine
	f:7 | bes:7 | c:7 | f:7 | \myEndLine
	bes | ees | ees:m7 | c:7 | \myEndLine
	f:m | bes:m | f:m | c:7 | \myEndLine
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
	\key f \minor

%% part "Intro"
	f8 aes bes b c f, c' b | bes f ees' d f, d' des f, | des' c f, c' b f bes aes | c, e g bes c4 c' |

%% part "A"
	f,,8 aes8~ aes2. | f'4 des8 bes4 g4 c8~ | c4 aes8 f4 c4 bes'8~ | bes4 g8 e4 c4. |
	f8 aes8~ aes2. | f'4 des8 bes4 g4 c8~ | c4 aes8 f4 c4 bes'8~ | bes4 g8 e4 c4. |
	g'4 f8 f4 c g'8~ | g f4 f2~ f8 | g4 f8 f4 c g'8~ | g f4 f c4. |
	g'4 f8 f4 c g'8~ | g f4 f bes,4. | g'4 f8 f4 c g'8~ | g f4 c'8~ c2 |
	c4 bes8 bes4 f c'8~ | c bes4 bes ees,4. | c'4 bes8 bes4 ges4 c8~ | c8 bes4 bes aes8 g aes~ |
	aes1 | f'4 des8 bes4 g f8~ | f c' bes aes bes aes f aes | c, e g bes c2 |
}



}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {

%% part "Intro"
	_ _ _ _ _ _ _ _
	_ _ _ _ _ _ _ _
	_ _ _ _ _ _ _ _
	_ _ _ _ _ _

%% part "A"
	נ -- ח- __ לא ש -- כ -- חנו איך __ ב -- ג -- שם ו -- __ ב -- ס -- ער
	נ -- ח- __ ל -- תי -- בה א -- ספ -- __ ת את ח -- יות __ ה -- י -- ער.
	שת -- יים, שת -- יים מ -- __ כל מין __
	ה -- אר -- יה ו -- ה -- __ מ -- מו -- תה, ה -- ג -- מל ו -- ה -- __ שי -- בו -- טה
	ו -- גם ה -- הי -- פו -- __ פו -- טם. __
	איך פ -- תח -- ת את __ ה -- צו -- הר
	ו -- מ -- תוך ה -- תכ -- __ לת ה -- ל -- ב -- נה __
	ב -- אה ה -- יו -- נה. __
}


	>>
	\layout {
	}
}







% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\fill-line {
			\hspace #0
			\concat {
				\right-column {

					\box "A"
					"נח - היונה כבר שבה עם עלה של זית"
					"נח - תן לנו לצאת ולחזור לבית"
					"כי כבר נמאסנו זה על זה"
					"האריה על הממותה, הגמל על השיבוטה"
					"וגם ההיפופוטם."
					"פתח לרגע את הצוהר"
					"ונעוף לתכלת הלבנה"
					"כך עם היונה."
				}
				\hspace #3
				\right-column {

					\box "A"
					"נח - כמה זמן נמשיך לשוט על פני המים?"
					"נח - כל החלונות סגורים כמעט חודשיים."
					"וכבר אין לנו אויר"
					"לאריה ולממותה לגמל ולשיבוטה"
					"וגם להיפופוטם."
					"פתח לרגע את הצוהר"
					"ואל תוך התכלת הלבנה"
					"שלח את היונה."
					\vspace #0.3

					\box "A"
					"נח - מה אתה דואג, הן כבר חדל הגשם"
					"נח - פתח את החלון, אולי הופיעה קשת"
					"ויראו אותה כולם"
					"האריה והממותה, הגמל והשיבוטה"
					"וגם ההיפופוטם."
					"פתח לרגע את הצוהר"
					"ואל תוך התכלת הלבנה"
					"שלח את היונה."
				}
			}
		}
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- עיזרו לי למלא את שורת זכויות היוצרים הזו --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by מרק ולצר <mark.veltzer@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts









\bookpart {

% this causes the variables to be defined...














% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "סליחות / עודד לרר, לאה גולדברג"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "סליחות" }
			\fill-line { \large \smaller \bold \larger "באת אלי" }
			\fill-line {
				"מלים: לאה גולדברג"
				"לחן: עודד לרר"
			}
			\fill-line {
				"בלדה מתונה"
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

	\myWordMark "Intro"
	\startPart
	a2.:m | d:m7 | g:7 | c:maj7 |
	f:maj7 | b:7 | e:7 | \myEndLine
	\endPart

	\myWordMark "A"
	\startPart
	a2.:m | d:m7 | e:7 | a:m |
	a:m | d:m7 | e:7 | a:7 | \myEndLine
	d:m7 | g:7 | c2:maj7 c4:maj7/d | e2.:7 |
	a:m | d:m7 | e:7 | a:7 | \myEndLine
	d:m7 | g:7 | c2:maj7 c4:maj7/d | e2.:7 |
	a:m | d:m7 | e:7 | a:m | a:m | \myEndLine
	\endPart

	\myWordMark "B"
	\startPart
	\repeat unfold 2 {
		a2.:m | d:m7 | g:7 | c:maj7 |
		f:maj7 | b:7 | e:7 | a:m |
	}
	a:m | \myEndLine
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
	\tempo "Moderato" 4 = 112
	\time 3/4
	\key a \minor

	\partial 4 a'8 e |

%% part "Intro"
	c'4 a4. e8 | f2 g8 a | b4 a4. g8 | f8 e4. f8 g |
	a2 f8 e | ees2 b8 a | gis4 a b |

%% part "A"
	c'2 b8 a | g2 f8 d | e2 d4 | c8 b a2 |
	c'8 b a4 g8 f | e2 d8 e | f4 e ees | e2. |
	d4 e f | g a4. f8 | e4 e d | c b2 |
	a8 b c4 d8 e | g4 f d | e f ees | e2. |
	d4 e f | g a4. f8 | e4 e d | c b2 |
	a8 b c4 d8 e | g4 f d | e c b | a2. ~ | a2 a'8 e |

%% part "B"
	c'2 a8 e | f2 g8 a | b4 a g | f e f8 g |
	a2 f8 e | ees2 b8 a | gis4 a b | c2 a'8 e |
	c'2 a8 e | f2 g8 a | b4 a g | f e f8 g |
	a2 b8 c | d2 b8 a | gis2 a8 b | a2. ~ | a2. |
}




}
\new Lyrics="Lyrics" \lyricsto "Voice"
	




\lyricmode {
	_ _
	_ _ _ _ _ _ _ _ _ _ _ _ _
	_ _ _ _ _ _ _ _ _

	בא -- ת א -- לי את עי -- ני לפ -- ק -- ו -- ח,
	ו -- גופ -- ך לי מ -- בט ו -- ח -- לון ו -- ר -- אי,
	בא -- ת כ -- לי -- לה ה -- בא אל ה -- או -- ח
	ל -- הר -- אות לו ב -- חו -- שך את כל ה -- דב -- רים.
	בא -- ת כ -- לי -- לה ה -- בא אל ה -- או -- ח
	ל -- הר -- אות לו ב -- חו -- שך את כל ה -- דב -- רים. __

	ו -- ל -- מ -- ד -- תי: שם ל -- כל ריס ו -- צי -- פו -- רן
	ו -- ל -- כל ש -- ע -- רה ב -- ב -- שר ה -- ח -- שוף
	וריח _ _ _ יל -- דות רי -- ח ד -- בק ו -- או -- רן
	הוא ני -- חו -- ח לי -- לו של ה -- גוף, של ה -- גוף. __
}



\new Lyrics="Lyrics" \lyricsto "Voice"
	





\lyricmode {
	_ _
	_ _ _ _ _ _ _ _ _ _ _ _ _
	_ _ _ _ _ _ _ _ _

	אם ה -- יו עי -- נו -- יים - הם הפ -- לי -- גו אל -- יך
	מפר -- שי ה -- ל -- בן אל האו -- פל של -- ך
	תנני ללכת תנני ללכת
	לכרוע על חוף הסליחה.
}


	>>
	\layout {
	}
}








% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\fill-line {
			\hspace #0
			\concat {
				\right-column {

					\box "B"
					"ולמדתי: שם לכל ריס וציפורן"
					"ולכל שערה בבשר החשוף"
					"וריח ילדות ריח דבק ואורן"
					"הוא ניחוח לילו של הגוף."
					\vspace #0.3

					\box "A"
					"באת אלי את עיני לפקוח,"
					"וגופך לי מבט וחלון וראי,"
					"באת כלילה הבא אל האוח"
					"להראות לו בחושך את כל הדברים."
				}
				\hspace #3
				\right-column {

					\box "A"
					"באת אלי את עיני לפקוח,"
					"וגופך לי מבט וחלון וראי,"
					"באת כלילה הבא אל האוח"
					"להראות לו בחושך את כל הדברים."
					\vspace #0.3

					\box "B"
					"ולמדתי: שם לכל ריס וציפורן"
					"ולכל שערה בבשר החשוף"
					"וריח ילדות ריח דבק ואורן"
					"הוא ניחוח לילו של הגוף."
					\vspace #0.3

					\box "A"
					"אם היו עינויים - הם הפליגו אליך"
					"מפרשי הלבן אל האופל שלך"
					"תנני ללכת תנני ללכת"
					"לכרוע על חוף הסליחה."
				}
			}
		}
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- עיזרו לי למלא את שורת זכויות היוצרים הזו --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by מרק ולצר <mark.veltzer@gmail.com>" }
	}
}



}


% include anything the user wants before the bookpart starts






\bookpart {

% this causes the variables to be defined...











% now play with the variables that depend on language



% calculate the tag line


% calculate the typesetby




\tocItem \markup "יום שישי את יודעת / יהודה פוליקר, יעקב גלעד"





% taken from "/usr/share/lilypond/2.12.3/ly/titling-init.ly"
\markup {
	\column {
		\override #'(baseline-skip . 3.5)
		\column {
			\huge \larger \bold
			\fill-line { \larger "יום שישי את יודעת" }
			\fill-line {
				"מלים: יעקב גלעד"
				"לחן: יהודה פוליקר"
			}
			\fill-line {
				"רוקנרול"
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

	\myWordMark "Intro"
	f1 | g | c | a:m | \myEndLine
	f | g | c1*2 | \myEndLine

	\myWordMark "Verse"
	\repeat volta 2 {
		c1*2 | g1*2 | \myEndLine
		g1*2 | c1*2 | \myEndLine
	}
	bes1 | a | aes | g | \myEndLine
	c2 c4 d | ees1 | c1*2 | \myEndLine

	\myWordMark "Chorus"
	\repeat volta 2 {
		f1 | g | c | a:m | \myEndLine
		d:m7 | g | c | c:7 | \myEndLine
	}
	\myWordMark "Bridge"
	f | g | c1*2 | \myEndLine

	\myWordMark "Outro"
	\repeat volta 2 {
		c1 | g | g | c | \myEndLine
	}

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
		\fill-line {
			\hspace #0
			\concat {
				\right-column {
					\box "Verse"
					"אז אני מטלפן מתכנן מתכונן"
					"מתקלח שעה מתבונן במראה"
					"מחטא יבלות ומרים משקולות"
					"משחרר כיווצים ומותח קפיצים"
					"כשהראש מסודר לא איכפת שום דבר"
					"יום שישי כבר מגיע"
					"השבוע נגמר"
					\vspace #0.3
					\box "Chorus"
					"יום שישי את יודעת..."
					\vspace #0.3
					\box "Verse"
					"כשעובר יום שבת והזמן זז לאט"
					"אני שוב מיובש, עוד שבוע חדש"
					"בעיות, עניינים, חדשות, עיתונים"
					"והכל שגרתי, שיעמום אמיתי"
					"אז עכשיו אני כאן, מעביר את הזמן"
					"אין לי דרך לברוח, לא יודע לאן"
					\vspace #0.3
					\box "Chorus"
					"יום שישי את יודעת..."
				}
				\hspace #3
				\right-column {
					\box "Verse"
					"השבוע מתחיל מאוחר כרגיל"
					"אין לי כח לקום אין לי חשק לכלום"
					"יום ראשון דיכאון יום שני עצבני"
					"יום שלישי לא ניגמר רביעי מיותר"
					"וביום חמישי מצב רוח חופשי"
					"זה כבר סוף השבוע"
					"ומחר יום שישי"
					\vspace #0.3
					\box "Chorus"
					"יום שישי את יודעת"
					"יש בעיר מסיבה"
					"נשארים כל הלילה"
					"עד הבוקר הבא"
					"יום שישי את יודעת"
					"והיום במיוחד"
					"אם תירצי כל הלילה"
					"הוא שלנו לבד"
				}
			}
		}
	}
}


\noPageBreak
\markup \column {
%% just a little space
	\null
	\fill-line {
		\smaller \smaller { "-- עיזרו לי למלא את שורת זכויות היוצרים הזו --" }
	}
	\fill-line {
		\smaller \smaller { "Typeset by מרק ולצר <mark.veltzer@gmail.com>" }
	}
}



}


% book footer
%}
