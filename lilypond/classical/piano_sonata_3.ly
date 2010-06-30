\include "lilypond/include/common.lyi"
\header {
	title="Sonata III"
	composer="Wolfgang Amadeus Mozart"
	copyright="1918, G.Schirmer Inc."
	style="Classical"
	remark="Edited, revised and fingered by Richard Epstein"
}
%{
	Schirmer's library of musical classics"
	An accompaniment for Second Piano by Edvard Grieg may be found in Schirmer's Library, Vol. 1440.
%}

tune={
	\key c \major
	\time 4/4
	\partial 4 e'4 |
	\repeat volta 2 {
		c'1 | a'4 g'2 a'4 | b1 | b'4 a'2 b'4 |
		e'1 | d''4 c''2 e'4 | g'1 | e''4 d''2 g'4 |
	}
	\alternative {
		{
			c''4 b'4 c''4 d''4 | \times 2/3 { c''4 b'4 bes'4 } a'4 aes'4 | g'2 g'2~ | g'2. g'4 |
			a'4 gis'4 a'4 b'4 | \times 2/3 { a'4 aes'4 g'4 } ges'4 f'4 | e'2 e'2~ | e'2 e'2 |
		}
		{
			c''4 b'4 c''4 d''4 | \times 2/3 { e''4 d''4 c''4 } b'4 bes'4 | a'1 | \times 2/3 { c''4 b'4 bes'4 } a'4 aes'4 |
			g'1 | \times 2/3 { b'4 a'4 aes'4 } g'4 d''4 | c''1~ | c''2 r4 <\parenthesize e'>4 \bar "|."
		}
	}
}

\score {
	<<
		\context Staff \tune
	>>
	\midi {}
	\layout {}
}
