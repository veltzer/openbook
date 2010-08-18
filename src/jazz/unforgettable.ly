\include "src/include/common.lyi"
\header {
	title="Unforgettable"
	composer="Irving Gordon"
	poet="Irving Gordon"
	copyright="1951, Bourne Co."
	style="Jazz"
	piece="Mederately"
	remark="copied from the fake book"

	uuid="3162420a-a26f-11df-aacf-0019d11e5a41"
}

harmony=\chords {
	\startChords

	\startSong

	\mark "A"
	\startPart
	g1 | g1:maj7 | g1:dim7 | r1 | \myEndLine
	c1 | c1:maj7 | a2:7.9 e2:m7 | a1:7.9 | \myEndLine
	f1:6 | f1:m7 | c2 e2:m7.5-/b | a1:7 | \myEndLine
	d1:7.9 | d2.:7.9 des4:7 | d1:7 | d1:7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	g1 | g1:maj7 | g1:dim7 | r1 | \myEndLine
	c1 | c1:maj7 | a2:7.9 e2:m7 | a1:7.9 | \myEndLine
	f1:6 | f:m | c1 | a2:7 a2:7.9 | \myEndLine
	d1:7.9 | d2:m7 g2:7 | c2 d4:m7 des4:maj7 | c1:6.9 | \myEndLine
	\endPart

	\endSong

	\endChords
}

tune={
	\key g \major
	\time 4/4
	d'4 e'4 e'8 fis'4 fis'8 ~ | fis'2 \times 2/3 { d'4 e'4 g'4 } |
	fis'1 ~ | fis'2. r4 |
	g'4 a'4 a'8 b'4 b'8 ~ | b'2 \times 2/3 { g'4 a'4 c''4 } |
	b'1 ~ | b'2. r4 |
	c''4 d''4 d''4 c''4 | c''4 d''8 ees''4 d''8 c''4 |
	g'4 a'4 a'4 g'4 | g'4 a'8 b'4 a'8 g'4 |
	e'4 e'4 a'4 e'4 ~ | e'2. f'4 |
	fis'4 fis'4 c''4 fis'4 ~ | fis'2. r4 |

	d'4 e'4 e'8 fis'4 fis'8 ~ | fis'2 \times 2/3 { d'4 e'4 g'4 } |
	fis'1 ~ | fis'2. r4 |
	g'4 a'4 a'8 b'4 b'8 ~ | b'2 \times 2/3 { g'4 a'4 c''4 } |
	b'1 ~ | b'2. r4 |
	c''4 d''4 d''4 c''4 | c''4 d''8 e''4 d''8 c''4 |
	g'4 a'4 a'4 g'4 | g'4 a'8 b'4 a'8 g'4 |
	d'4 e'4 e'4 d'4 | d'4 e'8 g'4 e'8 d'4 |
	c'1 ~ | c'2. r4 |

}

text=\lyrics {
	Un-4 for-4 get-8 ta-4 ble,8 ~ | -2 \times 2/3 { that's4 what4 you4 } |
	are,1 ~ | -2. -4 |
	Un-4 for-4 get-8 ta-4 ble,8 ~ | -2 \times 2/3 { tho'4 near4 or4 } |
	far,1 ~ | -2. -4 |
	Like4 a4 song4 of4 | love4 that8 clings4 to8 me,4 |
	how4 the4 thought4 of4 | you4 does8 things4 to8 me,4 |
	nev-4 -er4 be-4 -for4 ~ | -2. has4 |
	some-4 -one4 been4 more4 ~ | -2. -4 |
	Un-4 for-4 get-8 ta-4 ble,8 ~ | -2 \times 2/3 { in4 ev-4 -ry4 } |
	way,1 ~ | -2. -4 |
	and4 for-4 -ev-8 -er4 more8 ~ | -2 \times 2/3 { that's4 how4 you'll4 } |
	stay.-1 ~ | -2. -4 |
	That's4 why,4 dar-4 -ling,4 | it's4 in-8 -cred-4 -i-8 -ble,4 |
	that4 some-4 -one4 so4 | un-4 -for-8 -get-4 -ta-8 -ble,4 |
	thinks4 that4 I4 am4 | Un-4 -for-8 -get-4 -ta-8 -ble4 |
	too.1 ~ | -2. -4 |
}

\include "src/include/harmony_tune_lyrics.lyi"
