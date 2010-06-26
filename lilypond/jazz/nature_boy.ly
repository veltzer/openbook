\include "lilypond/include/common.lyi"
\header {
	filename="[% target_node %]"
	title="Nature Boy"
	subtitle=""
	composer="Eben Ahbez"
	copyright=""
	style="Jazz"
	note="7th bar of letters A and B were originally 2 bars each. Melody is straight eights, though rather freely interpreted rhythmically."
	piece="Med. Ballad"
}

%{
	todo:
	0. do a repeat in the chords on the whole first 8 bars.
%}

tune={
	\time 4/4
	\key d \minor
	\partial 8 a8	\bar "||"
	a'8 f'8 d'2.	| r4 r8 a8 e'8 f'8 g'8 bes'8	| a'8 f'8 d'2.	| r4 r8 a8 e'8 f'8 g'8 bes'8 | \break
	a'4. d''8 cis''2	| a'4. c''8 b'2		| g'4. bes'8 a'4. d'8	| e'2. r8 a8	| \break
	a'2. g'4	| e'2. a4		| g'2. f'4		| d'2. a4		| \break
	f'2. e'4	| b2.	c'4	| cis'1		| r2 r4 r8 a8	\bar "||" \break
	a'8 f'8 d'2.	| r4 r8 a8 e'8 f'8 g'8 bes'8	| a'8 f'8 d'2.	| r4 r8 a8 e'8 f'8 g'8 bes'8 | \break
	a'4. d''8 cis''2	| a'4. c''8 b'2		| g'4. bes'8 a'4. d'8	| e'2. r8 a8	| \break
	a'2. g'4	| e'2. a4		| g'2. f'4		| d'2. a4		| \break
	a'4. e'8 b4. a8	| g'4 f'2 a8 e'8 	| d'1		| r1		\bar "|." \break
}

harmony=\chords {
	\partial 8 r8	|
	\mark "A"
	d1:min		| e2:min7.5- a2:7	| d1:min		| e2:min7.5- a2:7	|
	d2:min d2:min7+	| d2:min7 d2:min6	| g2:min6 d2:min	| e1:min7.5-		|
	a1*2:7		| d1*2:min		|
	e1*2:7.9-	| a1*2:7		\bar "||"
	\mark "B"
	d1:min		| e2:min7.5- a2:7	| d1:min		| e2:min7.5- a2:7	|
	d2:min d2:min7+	| d2:min7 d2:min6	| g2:min6 d2:min	| e1:min7.5-		|
	a1*2:7		| d1:min		| b1:min7.5-		|
	e1:7.9-		| a1:7.5+		| d1:min		| e2:min7.5- a2:7	\bar "|."
}

text=\lyrics {
	\partial 8 There8
	was8 a8 boy,2. | -4. A8 ver-8 y8 strange8 en-8 | chant-8 ed8 boy,2. | -4. They8 say8 he8 wan-8 dered8 |
	ver-4. y8 far,2 | ver-4. y8 far,2 | o-4. ver8 land4. and8 | sea;2. -8 A8 |
	Lit-2. tle4 | shy2. and4 | sad2. of4 | eye,2. But4 |
	ver-2. y4 | wise2. was4 | he.1 | -2. -8 And8 |
	then8 one8 day,2. | -4. One8 mag-8 ic8 day8 he8 | came8 my8 way,2. | -4. And8 as8 we8 spoke8 of8 |
	man-4. y8 things,2 | fools4. and8 kings,2 | this4. he8 said4. to8 | me:2. -8 The8 |
	great-2. est4 | thing2. you'll4 | ev-2. er4 | learn2. is4 |
	just4. to8 love4. and8 | be4 loved2 in8 re-8 | turn.1 | -1 |
}

\score {
	<<
		\context ChordNames \harmony
		\context Staff \tune
		\context Lyrics \text
	>>
	\midi {}
	\layout {}
}
