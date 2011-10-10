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


\header {
	enteredby="Mark Veltzer"
	maintainerEmail="mark.veltzer@gmail.com"
	footer="this is the footer"
	copyright="-- help me fill it out copyright --"
	completion="0"
	tagline=\markup {\small {Typeset by Mark Veltzer <mark.veltzer@gmail.com>, Built at \date, Engraved by lilypond \lilyver}}
	style="not filled"
	poet="unkown"


	title="A Foggy Day"
	subtitle="From 'A Damsel In Distress'"
	composer="George Gershwin"
	style="Jazz"
	piece="Medium Swing"
	poet="Ira Gershwin"
	copyright="1937, Gershwin Publishing Corporation"
	%% Copyright Renewed, Assigned to Chappell & Co, Inc.

	completion="5"
	uuid="87da6ece-a26e-11df-95d7-0019d11e5a41"

	structure="AB"

	%% Wynton Marsalis Quartet
	idyoutube="-P2xoeGoWMs"
	%% Mel Torme (one of the greatest vocal versions)
	idyoutube="tVCDZaApwV8"

	lyricsurl="http://www.sing365.com/music/lyric.nsf/A-Foggy-Day-lyrics-Frank-Sinatra/0F2EB16090A785424825692000077664"
}
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
	TODO:
%}

%% this version of the chords is from the real book...
myChordsReal=\chordmode {
	\startChords

	\startSong

	\mark "A"
	\startPart
	f1:maj7 | a2:m7.5- d:7.9- | g1:m7 | c:7 | \myEndLine
	f:6 | d:m7.5- | g:7 | g2:m7 c:7 | \myEndLine
	f1:maj7 | c2:m7 f:7 | bes1:6 | bes:m6 | \myEndLine
	f:maj7 | a2:m7 d:7 | g1:7 | g2:m7 c:7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	f1:maj7 | aes:m7 | g:m7 | c:7 | \myEndLine
	f:6 | d:m7.5- | g:7 | g2:m7 c:7 | \myEndLine
	c1:m7 | f:7 | bes:6 | ees:7 | \myEndLine
	f2:6 g:m7 | a:m7 bes:m6 | a:m7 d:m7 | g:m7 c:7 | f1:6 | g2:m7 c:7 | \myEndLine
	\endPart

	\endSong

	\endChords
}

%% this version of the tune is from the real book...
myVoiceReal=\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

	% part "A"
	r4 c c c | ees2. ees4 | d d2. | a'1 |
	r4 f f f | aes2. aes4 | g2. g4 | d'1 |
	r4 e e e | c c2. | a a4 | f1 |
	r4 a a a | c c2 c4 | a2. a4 | d,1 |

	% part "B"
	r4 c c c | ees2. ees4 | d d2. | a'1 |
	r4 f f f | aes2. aes4 | g2. g4 | d'1 |
	f2 f4 f | d2. d4 | c2 c | a a4 bes |
	c f, g bes | a f g bes | a2 f' | f, g | f1~ | f2. r4 |

}

%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
myLyricsReal=\lyricmode {
	A Fog -- gy Day __ in Lon -- don town __ ha -- d me low __ and had me down. __
	I viewed the morn -- ing with a -- larm, __ the Brit -- ish Mu -- seum had lost its charm. __
	How long I wondered could this thing last? __ But_the age of mira -- cles had -- n't passed, __
	for sud -- den -- ly __ I saw you there __ and through fog -- gy Lon -- don town the sun was shin -- ing ev -- 'ry where.
}


%% this version of the chords is from the fake book...
myChords=\chordmode {
	\startChords

	\startSong

	\repeat volta 2 {

	\partial 4 r4 |

	\mark "A"
	\startPart
	f1:maj7 | a2:m7.5- d:7.9- | g1:m7 | c:7 | \myEndLine
	f2. d4:m7.5- | d1:m7.5- | g:7 | g2:m7 c:7 | \myEndLine
	f1:maj7 | c2:m7 f:7 | bes1:maj7 | bes:m6 | \myEndLine
	f:maj7 | a2:m7 d:7 | g1:7.9 | g2:m7 c:7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	f1:maj7 | a2:m7.5- d:7.9- | g1:m7 | c:7 | \myEndLine
	f2. d4:m7.5- | d1:m7.5- | g:7 | g2:m7 c:7 | \myEndLine
	c1:m7 | f:7 | bes:maj7 | ees:7 | \myEndLine
	f2 g:m7 | a:m7 bes:m6 | a:m7 d:m7 | g:m7 c:7 |

	} \alternative {
		{
			f1 | g2:m7 c:7 | \myEndLine
		}
		{
			f1 | bes2:7 bes:m6 | f1:maj7 | \myEndLine
		}
	}

	\endPart

	\endSong
}

%% this version of the tune is from the fake book...
myVoice=\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

	\repeat volta 2 {

	\partial 4 c4 |

	% part "A"
	c c2 ees4~ | ees2. ees4 | d d2 a'4~ | a1 | \myEndLine
	f2 f4 aes~ | aes2. aes4 | g2 g4 d'4~ | d1 | \myEndLine
	r4 e e e | c c2. | a2 a4 f~ | f2. f4 | \myEndLine
	a a a c~ | c c2 c4 | a2 a4 d,~ | d2. c4 | \myEndLine

	% part "B"
	c2 c4 ees~ | ees ees2 ees4 | d2 d4 a'~ | a2 a4 a | \myEndLine
	f2 f4 aes~ | aes bes aes2 | g g4 d'~ | d2. d4 | \myEndLine
	f2 f4 d~ | d2. d4 | c2 c4 a~ | a2 a4 bes | \myEndLine
	c f, g bes | a f g bes | a2 f' | f, g |

	} \alternative {
		{
			f1 | r2 r4 c | \myEndLine
		}
		{
			f1~ | f~ | f | \myEndLine
		}
	}
}

%% this version of the lyrics is from the fake book...
myLyrics=\lyricmode {
	A Fog -- gy Day __ in Lon -- don town __ had me low __ and had me down. __
	I viewed the morn -- ing with a -- larm, __ the Brit -- ish Mu -- se -- um had lost its charm. __
	How long I won -- dered could this thing last? __ But the age of mir -- a -- cles had -- n't passed, __
	for sud -- den -- ly, __ I saw you there __ and through fog -- gy Lon -- don town the sun was shin -- ing ev -- 'ry where.
	A where. __
}

%% score for printing
\score {
	<<
		\new ChordNames="Chords" \myChords
		\new Staff="Melody" {
			\new Voice="myvoice" \myVoice
		}
		\new Lyrics="Lyrics" \lyricsto "myvoice" \myLyrics
	>>
	\layout {
	}
}
%% score for midi
\score {
	\unfoldRepeats
	<<
		%% the ="Chords" is the name of the channel that will be in midi
		\new ChordNames="Chords" \myChords
		%% the ="Melody" is the name of the channel that will be in midi
		\new Staff="Melody" {
			\new Voice="myvoice" \myVoice
		}
		%% the ="Lyrics" is the name of the channel that will be in midi
		\new Lyrics="Lyrics" \lyricsto "myvoice" \myLyrics
	>>
	\midi {
	}
}

