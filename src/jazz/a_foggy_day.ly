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

	completion="5"
	uuid="87da6ece-a26e-11df-95d7-0019d11e5a41"
}
%{
	TODO:
	- turn this tune relative
%}

myChords=\chordmode {
	\set chordChanges = ##t

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
	f2:6 g2:m7 | a2:m7 bes2:m6 | a2:m7 d2:7 | g2:m7 c2:7 |
	f1:6 | f1:6 | \myEndLine
	\endPart

	\endSong
}

myVoice={
	%% http://en.wikipedia.org/wiki/Tempo
	\tempo "Allegra" 4 = 130
	\time 4/4
	\key f \major

	r4 c'4 c'4 c'4 | ees'2. ees'4 | d'4 d'2. | a'1 |
	r4 f'4 f'4 f'4 | aes'2. aes'4 | g'2. g'4 | d''1 |
	r4 e''4 e''4 e''4 | c''4 c''2. | a'2. a'4 | f'1 |
	r4 a'4 a'4 a'4 | c''4 c''2 c''4 | a'2. a'4 | d'1 |

	r4 c'4 c'4 c'4 | ees'2. ees'4 | d'2. d'4 | a'1 |
	r4 f'4 f'4 f'4 | aes'2. aes'4 | g'2. g'4 | d''1 |
	f''2 f''4 f''4 | d''2. d''4 | c''2 c''2 | a'2 a'4 bes'4 |
	c''4 f'4 g'4 bes'4 | a'4 f'4 g'4 bes'4 | a'2 f''2 | f'2 g'2 |
	f'1 ~ | f'2 r2 |

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
