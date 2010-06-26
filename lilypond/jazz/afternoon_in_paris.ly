\include "lilypond/include/common.lyi"
\header {
	filename="[% target_node %]"
	title="Afternoon in Paris"
	subtitle=""
	composer="John Lewis"
	copyright=""
	style="Jazz"
	piece="Swing"
	note="song form is AABA"
}

harmony=\chords {
	\partial 4 r4 |
	\mark "A"
	\repeat volta 2 {
		c1:maj7 | c2:m7 f2:7 | bes1:maj7 | bes2:m7 ees2:7 | \break
		aes1:maj7 | d2:m7 g2:7.9- | c1:maj7 |
	}
	\alternative {
		{
			d2:m7 g2:7 |
		}
		{
			c1:maj7 \bar "||"
		}
	}
	\break
	\mark "B"
	d1:m7 | g1:7 | c1:maj7/e | a1:7.9 | \break
	d1:m7 | g1:7 | c1:maj7 | d2:m7 g2:7 | \break
}

tune={
	\key c \major
	\time 4/4
	\partial 4 e''8 g''8 |
	\repeat volta 2 {
		r8 d''4 c''8 b'8 c''8 d''8 e''8 |
		ees''8 g'8 bes'8 d''8 c''4 d''8 f''8 |
		r8 c''4 bes'8 a'8 bes'8 c''8 d''8 |
		des''8 f'8 aes'8 c''8 bes'4 c''8 ees''8 |
		r8 c''4 aes'8 g'8 bes'8 aes'8 g'8 ~ |
		g'2 ~ g'8 bes'8 aes'8 g'8 ~ |
		g'1 |
	}
	\alternative {
		{
			r2. e''8 g''8 |
		}
		{
			r2 a'4 b'8 c''8 ~ |
		}
	}
	c''2. d''8 e''8 ~ | e''2. d''8 c''8 ~ | c''2. e''8 a'8 ~ | a'2. b'8 c''8~ |
	c''2. d''8 e''8 ~ | e''2. f''8 g''8 ~ | g''2 g''8 e''8 f''8 g''8 ~ |
	g''2. e''8 g''8 \bar "||"
}

\score {
	<<
		\context ChordNames \harmony
		\context Staff \tune
	>>
	\midi {}
	\layout {}
}
