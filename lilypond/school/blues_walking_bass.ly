\include "lilypond/include/common.lyi"
\header {
	title="Jazz Bass line for Blues in F"
	subtitle=""
	composer=""
	style="Jazz"
	piece="Upbeat Jazz Blues"
}

%{
	TODO:
	-make all 8'th notes here swing style (because they are swing and not straight 8'ths)
%}

tune={
	\time 4/4
	\key f \major
	\clef bass
	f, a, c b,	| bes, d, dis, e,	| f, a, d des	| c e, f, a,		| \break
	bes, f d c	| bes, b, c e		| f a, c cis	| d fis, a, aes,	| \break
	g, a, ais, b,	| c cis d e		| f a, d fis,	| g, b, c e		\bar "||" \break
	f f ees ees	| d d des des		| c d g, c	| f, fis, g, a,		| \break
	bes, b, c b,8 f,8-> | bes,8 f,8 aes,4 g, ges, | f, c b, bes, | a, ees d8 a,8 fis,4 | \break
	g, bes, d des	| c bes, a, g,		| f, ees d aes,	| g, des c bes,		\bar "||" \break
	a, c f ees	| d ees d des		| c d ees g,	| c bes, a, f		| \break
	bes, f, c f	| bes,8 f8-> b,4 c bes,	| a, bes, a, g, | fis, a, d8 a,8 fis,4	| \break
	g,8 g,8-> a,4 bes, b, | c d dis e8 f8->	| r8 a,4.-> d4 c | b, g, c8 e,4.->	\bar "||" \break
}

harmony=\chords {
	\set chordChanges = ##t
	\mark "A"
	f1:7		| bes1:7		| f1:7			| c2:min7 f2:7		|
	bes1:7		| bes1:7		| f1:7			| d1:7			| 
	g1:7		| c1:7			| f2:7 d2:7		| g2:7 c2:7	\bar "||"
	\mark "B"
	f1:7		| bes1:7		| f1:7			| c2:min7 f2:7		|
	bes1:7		| bes1:7		| f1:7			| a2:min7 d2:7		| 
	g1:min7		| c1:7			| f2:7 d2:7		| g2:min7 c2:7	\bar "||"
	\mark "C"
	f1:7		| bes1:7		| c1:min7		| f1:7			|
	bes1:7		| bes1:7		| f1:7			| d1:7			| 
	g2:7 g:min7	| c1:7			| f2:7 d2:7		| g2:7 c2:7	\bar "||"
}

\score {
	<<
		\context ChordNames \harmony
		\context Staff \tune
	>>
	\midi {}
	\layout {}
}
