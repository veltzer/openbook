\include "src/include/common.lyi"
\header {
	title="The Girl From Ipanema"
	subtitle="Garota De Ipanema"
	composer="Antonio Carlos Jobim"
	copyright="1963, Antonio Carlos Jobim and Vincius De Moraes, Brazil"
	style="Jazz"
	piece="Med Swing"
	poet="Vincius De Moraes, Norman Gimbel"

	uuid="2c3b337c-a26f-11df-b7d1-0019d11e5a41"
}

%{
	TODO
		- the intro does not show
%}

tune={
	\time 4/4
	\key f \major
	\clef treble

	% intro
	%R1 * 4 \bar "||"

	{
	g'4. e'8 e'4 d'8 g' ~ |
	g'4 e'8 e' ~ e' e' d' g' ~ |
	g'4 e' e' d'8 g' ~ |
	g' g' e' e' ~ e' e' d' f' ~ |
	f' d'4 d'8 ~ d' d' c' e' ~ |
	e' c'4 c'8 ~ c' c' bes4 |
	r c'2. |
	r1 |
	% 9
	g'4. e'8 e'4 d'8 g' ~ |
	g'4 e'8 e' ~ e' e' d'4 |
	g' e' e' d'8 g' ~ |
	g'4 e'8 e' ~ e' e' d' f' ~ |
	f' d'4 d'8 ~ d' d' c' e' ~ |
	e' c'4 c'8 ~ c' c' bes4 |
	r c'2. | r1 |
	% 17
	{
	f1 ~ | \times 2/3 {f4 ges f} \times 2/3 {ees4 f ees} |
	des4. ees8 ~ ees2 |
	r2 r4 r8 gis ~ | gis1 ~ | \times 2/3 {gis4 a gis} \times 2/3 {fis gis fis} |
	e4. fis8 ~ fis2 |
	r2 r4 r8 a ~ | a1 ~ | \times 2/3 {a4 bes a} \times 2/3 {g a g} |
	f4. g8 ~ g2 |
	r2 \times 2/3 {r4 a bes} | \times 2/3 {c' c d} \times 2/3 {e f g} |
	gis2. a4 | \times 2/3 {bes bes, c} \times 2/3 {d e f} | fis2. r4 |
	% 33
	g4. e8 e4 d8 g8 ~ | g4 e8 e ~ e e d g ~ |
	g4 e e d8 g ~ | g g e e ~ e e d a ~ |
	a4. f8 f f d c' ~ | c'4. e8 \times 2/3 {e4 e d} |
	e1 | r |
	}
}
	\bar "|."
}

text=\lyrics {
Tall and tan and young ___ and love ___ -- ly
the girl ___ from I -- pa -- ne ___ -- ma goes walk ___ -- ing
and when ___ she pass ___ -- es, each one ___ she pass ___ -- es goes "Aaaah!"

When she walks she's like ___ a Sam ___ -- ba
that swings so cool and sways ___ so gen ___ -- tle,
that when ___ she pass ___ -- es, each one ___ she pass ___ -- es goes "Aaaah!"

Oh, ___ but I watch her so sad -- ly. ___
How ___ ___ can I tell her I love her? ___
Yes, ___ ___ I would give my heart glad -- ly. ___
}

intro=\chords {
	f1:6.9 | c2:m7 c:m6 | f1:6.9 | c2:m7 c:m6 |
}

harmony=\chords {
	\mark "A"
	f1:maj9 | r1 | g1:13 | r1 | \break
	g1:m7 | ges:7.5- | f:maj7 | ges:7 \bar "||" \break
	\mark "A"
	f1:maj9 | r1 | g1:13 | r1 |
	g1:m7 | ges:7.5- | f1:maj7 | r1 \bar "||" \break
	\mark "B"
	ges1:maj7 | r1 | ces1:9 | fis1:m9 |
	d1:9 | g1:m9 | r1 | ees1:9 |
	a1:m7 | d1:7.9-.11+ | g1:m7 | c1:7.9-.11+ \bar "||" \break
	\mark "A"
	f1:maj9 | r1 | g1:13 | r1 |
	g1:m9 | ges:7.5- | f:maj7 | ges:7.5- \bar "||" \break
}

\include "src/include/harmony_tune_lyrics.lyi"
