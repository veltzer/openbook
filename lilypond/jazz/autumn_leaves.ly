\include "lilypond/include/common.lyi"
%{
	this version was entered by Mark Veltzer from the real book
	on Mon May 22 02:18:00 IDT 2006
%}
\header {
	filename="[% target_node %]"
	title="Autumn Leaves"
	subtitle=""
	composer="Joseph Kosma"
	poet="Jacques Prevert"
	style="Jazz"
	piece="Med Swing"
	remark="copied from the real book"
}

harmony=\chords {
	\partial 2. r2. |
	\mark "A"
		\repeat volta 2 {
			a1:min7 | d1:7 | g1:maj7 | c1:maj7 | fis1:min7.5- |
		}
		\alternative {
			{
				b1:7 | e1:min | e1:min |
			}
			{
				b1:7 | e1:min | e1:min |
			}
		}
	\break
	\mark "B"
		fis1:min7.5- | b1:7.9- | e1:min | e1:min |
		a1:min7 | d1:7 | g1:maj7 | g1:maj7 |
		fis1:min7.5- | b1:7.9- | e2:min7 ees2:7 | d2:min7 des2:7 |
		c1:maj7 | b1:7.9- | e1:min | e1:min
	\break
}

tune={
	\time 4/4
	\key e \minor

	\partial 2. e'4 fis'4 g'4 |
	\repeat volta 2 {
		c''1~ | c''4 d'4 e'4 fis'4 | b'2 b'2~ | b'4 c'4 d'4 e'4 |
		a'1~ | \break
	}
	\alternative {
		{
			a'4 b4 cis'4 dis'4 | g'1 | r4 e'4 fis'4 g'4 | \break
		}
		{
			a'4 fis'4 a'4 g'4 | e'1~ | e'4 r4 dis'4 e'4 \bar "||" \break
		}
	}
	fis'4 b4 fis'2~ | fis'4 fis'4 e'4 fis'4 | g'1~ | g'4 g'4 fis'4 g'4 | \break
	a'1~ | a'4 d'4 d''4 c''4 | b'1~ | b'4 r4 ais'4 b'4 | \break
	c''4 c''4 a'4 a'4 | fis'2. c''4 | b'2 b'2~ | b'2. e'4 | \break
	a'2. g'4 | fis'2 g'4 b4 | e'1 | r4 e'4 fis'4 g'4 \bar "|."
}

\score {
	<<
		\context ChordNames \harmony
		\context Staff \tune
	>>
	\midi {}
	\layout {}
}
