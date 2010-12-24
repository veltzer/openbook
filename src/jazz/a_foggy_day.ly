\include "src/include/common.lyi"
\header {
	title="A Foggy Day"
	subtitle="From 'A Damsel In Distress'"
	composer="George Gershwin"
	style="Jazz"
	piece="Medium Swing"
	remark="copied from the real book"
	poet="Ira Gershwin"
	copyright="1937, Gershwin Publishing Corporation"
	%% Copyright Renewed, Assigned to Chappell & Co, Inc.

	completion="5"
	uuid="87da6ece-a26e-11df-95d7-0019d11e5a41"
}
%{
	TODO:
%}

%%#(define jazzyTune (\paper { between-system-padding = 1\mm }))

%%jazzyTune

%%#{
%%	\paper { between-system-padding = 1\mm }
%%#})

%%jazzyTune=\markup{ \paper { between-system-padding = 1\mm } }

%% this works...
%%\paper { between-system-padding = 1\mm }

%%\jazzyTune

%%jazzyTune=\markup { 'between-system-padding = 1\mm' }
%%\paper {
%%	jazzyTune
%%}

myChords=\chordmode {
	\startChords

	\startSong

	\mark "A"
	\startPart
	f1:maj7 | a2:m7.5- d2:7.9- | g1:m7 | c1:7 | \myEndLine
	f1:6 | d1:m7.5- | g1:7 | g2:m7 c2:7 | \myEndLine
	f1:maj7 | c2:m7 f2:7 | bes1:6 | bes:m6 | \myEndLine
	f1:maj7 | a2:m7 d2:7 | g1:7 | g2:m7 c2:7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	f1:maj7 | aes:m7 | g1:m7 | c1:7 | \myEndLine
	f1:6 | d1:m7.5- | g1:7 | g2:m7 c2:7 | \myEndLine
	c1:m7 | f1:7 | bes1:6 | ees1:7 | \myEndLine
	f2:6 g2:m7 | a2:m7 bes2:m6 | a2:m7 d2:7 | g2:m7 c2:7 | f1:6 | f1:6 | \myEndLine
	\endPart

	\endSong
}

myVoice=\relative c'{
	%% http://en.wikipedia.org/wiki/Tempo
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

	% Bar 1
	r4 c c c | ees2. ees4 | d d2. | a'1 |
	r4 f f f | aes2. aes4 | g2. g4 | d'1 |
	r4 e e e | c c2. | a a4 | f1 |
	r4 a a a | c c2 c4 | a2. a4 | d,1 |

	% Bar 17
	r4 c c c | ees2. ees4 | d d2. | a'1 |
	r4 f f f | aes2. aes4 | g2. g4 | d'1 |
	f2 f4 f | d2. d4 | c2 c | a a4 bes |
	c f, g bes | a f g bes | a2 f' | f, g | f1 | r |

}
myLyrics=\lyricmode {
	A Fog -- gy Day in Lon -- don town ha -- d me low and had me down.
	I viewed the morn -- ing with a -- larm, the Brit -- ish Mu -- seum had lost its charm.
	How long I wondered could this thing last? But_the age of mira -- cles had -- n't passed,
	for sud -- den -- ly I saw you there and through fog -- gy Lon -- don town the sun was shin -- ing ev -- 'ry where.
}
%% score for printing
\score {
	<<
		\new ChordNames="mychords" \myChords
		\new Voice="myvoice" \myVoice
		\new Lyrics \lyricsto "myvoice" \myLyrics
	>>
	\layout {
	}
}
%% score for midi
\score {
	\unfoldRepeats
	<<
		\new ChordNames="mychords" \myChords
		\new Voice="myvoice" \myVoice
	>>
	\midi {
	}
}
