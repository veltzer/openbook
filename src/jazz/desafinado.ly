\include "src/include/common.lyi"
\header{
	title="Desafinado"
	subtitle="Slightly Out Of Tune"
	composer="Antonio Carlos Jobim"
	copyright="1959 1962, Editora Musical Arapua, Sao Paulo, Brazil"
	style="Jazz"
	piece="Medium Bossa Nova"
	poet="Newton Menonca, Jon Hendricks and Jessie Cavanaugh"
}

%{
	TODO:
	- add lyrics.
%}

tune={
	\time 4/4
	\key f \major
	\clef treble
\mark "A"
	r8 c'4 d'8 e'4 f' |
	e'4. d'8 cis'4 d' |
	f'4. des'8 des'2 ~ |
	des'2. r4 | \break
	r8 d'4 e'8 f'4 g' |
	f'4. e'8 dis'4 e' |
	c''4. ees'8 ees'2 ~ |
	ees'2. r4 | \break
	r8 d' c'' bes' a' g'4 bes'8 ~ |
	bes'4. a'8 dis'4 e' |
	fis'8 a' fis'2 d'4 |
	ees'1 | \break
	r8 aes'4 g'8 f'4 d' |
	aes'4. g'8 f'4 e' |
	f'4. des'8 des'2 ~ |
	des' r | \break
\mark "B"
	r8 c'4 d'8 e'4 f' |
	e'4. d'8 cis'4 d' |
	f'4. des'8 des'2 ~ |
	des'2. r4 | \break
	r8 d'4 e'8 f'4 g' |
	f'4. e'8 dis'4 e' |
	c''4. ees'8 ees'2 ~ |
	ees'2. r4 | \break
	r8 c''4 bes'8 a' g'4 bes'8 ~ |
	bes'4. a'8 g'4 f' |
	g'8 f' g'2. ~ |
	g'2 r | \break
\mark "C"
	e'4 fis' e'8 fis'4 e'8 ~ |
	e'4. d'8 cis'4 d' |
	e'1 ~ |
	e'2 r4 cis' | \break
	e' fis' e'8 fis'4 e'8 ~ |
	e'4. d'8 cis'4 d' |
	e'4. b8 e'2 ~ |
	e' r | \break
\mark "D"
	r8 e'4 fis'8 gis'4 a' |
	b'4. a'8 cis'4 d' |
	e'8 fis' e' fis' e'2 ~ |
	e' r4 e' | \break
	g' a' g'8 a'4 g'8 ~ |
	g'4. f'8 e'4 f' |
	g' d'8 g' ~ g' d' g'4 ~ |
	g' r r8 d' g' a' | \break
	bes'4 a' bes'8 a'4 c''8 ~ |
	c''4. bes'8 a'4 bes' |
	g'1 ~ |
	g'4 r r2 | \break
\mark "E"
	r8 c'4 d'8 e'4 f' |
	e'4. d'8 cis'4 d' |
	f'4. des'8 des'2 ~ |
	des'2. r4 | \break
	r8 d'4 e'8 f'4 g' |
	f'4. e'8 dis'4 e' |
	d'' des'' c'' b' |
	bes' d'' r a' | \break

	c''4. b'8 bes'4 a' |
	bes' a' g' f' |
	a'2. e'4 |
	g'2. d'8 e' | \break
	f' f' f' f' f'4 f' |
	r8 d'4 e'8 f'4 f' |
	f'8 f' f' f' c''4 bes' ~ |
	bes'2. d'8 e' | \break
	f' f' f' f' f'4 e'8 f' ~ |
	f'4 r8 e' dis'4 e' |
	g'4. f'8 f'2 ~ |
	f'2. r4 \bar "|."
}

harmony=\chords {
	f1:maj7 | r1 | g1:7.5- | r1 | g1:m7 | c1:7 | a1:m7.5- | d1:9- |
	g1:m7 | a1:9- | d1:7 | d1:9- | g1:9- | r1 | ges1:maj7 | r1 \bar "||"
	f1:maj7 | r1 | g1:7.5- | r1 | g1:m7 | c1:7 | a1:m7.5- | d1:9- |
	g1:m7 | bes1:m | a1:m7 | b2:m7.5- e2:9+ \bar "||"
	a1:maj7 | bes1:dim | b1:m11 | e1:7 |
	a1:maj7 | bes1:dim | b1:m11 | e1:7 |
	a1:maj7 | fis1:m7 | b1:m11 | e1:7 \bar "||"
	c1:maj7 | cis1:dim | d1:m11 | g1:7 | g1:m7 | fis1:m7 | g1:7 | c1:7 \bar "||"
	f1:maj7 | r1 | g1:7.5- | r1 | g1:m7 | c1:7 | a1:m7.5- | d1:9- |
	g1:m7 | bes1:m | a1:m7 | aes1:dim |
	g1:7 | r1 | bes1:m7 | ees1:9 |
	g1:7 | g2:m7 c2:9+ | f1:6.9 | r1 \bar "|."
}

text=\lyrics {
	Love is like a never ending melody; poets have compared it to a symphony,
	a symphony conducted by the lighting of the moon,
	but our song of love is Slightly Out Of Tune. Once your kisses raised me to
	a fever pitch, now the orchestration doesn't seem to rich. Seems to me you've
	changed the tune we used to sing; like the Bossa Nova, love should swing. We
	used to harmonize two souls in perfect time. Now the song is diff'rent and the
	words don't even rhyme, 'cause you forgot the melody our hearts would always
	croon, and so what good's a heart that's Slightly Out Of Tune.
	Tune your heart to mine the way it uysed to be; join with me in harmony and sing a
	song of loving. We're bound to get in tune again before too long.
	There'll be no Desafinado when your heart belongs to me completely. Then you won't
	be Slightly Ouf Of Tune, you'll sing along with me.
}

\include "src/include/harmony_tune_lyrics.lyi"
