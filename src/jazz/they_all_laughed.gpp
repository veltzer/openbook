<%inherit file="/src/include/common.lyi"/>
<%
	attributes['jazzTune']=True
%>
\header {
	default_header

	title="They All Laughed"
	composer="George Gershwin"
	style="Jazz"
	piece="Medium Swing"
	remark="copied from the ultimate fake book"
	poet="Ira Gershwin"
	copyright="1937, Gershwin Publishing Corporation"
	%% Copyright Renewed, Assigned to Chappell & Co, Inc.
	structure="AA'BA''"

	completion="5"
	uuid="89e1c354-f2a2-11e0-9cf1-0019d11e5a41"

	idyoutube="9InLhEc6K2g"
	idyoutube="TdLm9qRRdh4"
	lyricsurl="http://www.sing365.com/music/lyric.nsf/They-All-Laughed-lyrics-Ella-Fitzgerald/2123DA2C32C02AF848256AAB000AB847"
}

<%doc>
	TODO:
</%doc>

myChords=\chordmode {
	\startChords

	\startSong

	\repeat volta 2 {

	\mark "A"
	\startPart
	g2 e:m | a:m7 d:7 | a:m7 d:7.9- | g4 bes:7 a:7 d:7 | \myEndLine
	g2 e:m | a:m7 d:7 | g:6 e:m7 | a:m7 d:7 | \myEndLine
	\endPart

	\mark "A'"
	g2 e:m | a:m7 d:7 | cis:7.9- fis:7.9- | b:m7 e:7 | \myEndLine
	d1:6 | a:7 | d:7 | d:7 | \myEndLine

	\mark "B"
	\startPart
	g:7 | g:7 | g2.:7 b4:7 | e1:7.5+ | \myEndLine
	a1:7 | a:7 | a:m7 | ees2:7 d2:7 | \myEndLine
	\endPart

	\mark "A''"
	\startPart
	g2 e:m | a:m7 d:7 | b:7 e:7 | a1:7 | \myEndLine
	g2 e:7 | a:m7 d:7 |

	} \alternative {
		{
			g e:7.9+ | a:7.9- d:7.9- | \myEndLine
		}
		{
			ees1 | bes2/d d:7/c | g/b e:7 | a:m7 d:7 | g1 | g | \myEndLine
		}
	}
	\endPart

	\endSong
}

myVoice=\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key g \major

	\repeat volta 2 {

	%% Bar 1
	r8 d e4 g a | b8 b a g a b4. | b8 b a g a b4 d,8~ | d1 |
	r8 d e4 g a | b8 b a g a b4 g8~ | g1~ | g2. r4 |

	%% Bar 9
	r8 d e4 g a | b8 b a g a b4. | d8 d cis b cis d4 fis,8~ | fis1 |
	b4 a8 gis a b4. | b8 c a gis a b4. | a4 b c b | a d d d |

	%% Bar 17
	d2~ d8 b4 g8 | a2~ a8 b c cis | d4 e d b | c2. b4 |
	e2~ e8 cis4 a8 | b2~ b8 a4 b8 | c4 e e, g | a1 |

	%% Bar 25
	r8 d, e4 g a | b8 b a g a b4. | c8 b4 a8 b4 c | b2. a4 |
	d4 d d2 | e8 e4 e8 b4 b |

	} \alternative {
		{
			g1~ | g2 r |
		}
		{
			g4 g g2 | bes8 bes4 bes8 fis4 fis | d'4 d d2 | e8 e4 e8 b4 b | g1~ | g4 r4 r2 |
		}
	}

}
myLyrics=\lyricmode {
	They All Laughed at Chris -- to -- pher Co -- lum -- bus
	When he said the world was round. __
	They All Laughed when Ed -- i -- son re -- cord -- ed sound. __

	They All Laughed at Wil -- bur and his bro -- ther,
	When they said that man could fly. __
	They told Mar -- co -- ni wire -- less was a pho -- ny;
	It's the same old cry.

	They laughed at me __ want -- ing you, __
	Said I was reach -- ing for the moon.
	But oh, __ you came through __
	Now they'll have to change their tune.

	They all said we nev -- er could be hap -- py,
	They laughed at us and how!
	But "\"ho," ho, "ho!\""
	Who's got the last laugh now? __

	"\"Hee," hee, "hee!\""
	Let's at the past laugh,
	"\"Ha," ha, "ha!\""
	Who's got the last laugh now? __
}
myLyricsmore=\lyricmode {

	They All Laughed at Rock -- e -- fel -- ler Cen -- ter,
	Now they're fight -- ing to get in. __
	They all laughed at Whit -- ney and his cot -- ton gin. __

	They all laughed at Ful -- ton and his steam -- boat,
	Her -- shey and his choc' -- late bar. __
	Ford and his Liz -- zie Kept the laugh -- ers bus -- y;
	That's how peo -- ple are.

	They laughed at me __ want -- ing you, __
	Said it would be "\"Hel" -- lo, Good -- "bye.\""
	And oh, __ you came through __
	Now they're eat -- ing hum -- ble pie.

	They all said we'd nev -- er get to -- geth -- er;
	Dar -- ling, let's take a bow.
	For "\"ho," ho, "ho!\""
	Who's got the last laugh
}

include(src/include/harmony_tune_lyricsmore.lyi)
