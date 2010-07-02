\include "src/include/common.lyi"
\header {
	title="Chega De Saudade"
	subtitle="No More Blues"
	composer="Antonio Carlos Jobim"
	copyright="1962,1967, Editora Musical Arapua, Sao Paulo, Brazil"
	style="Jazz"
	piece="Med Swing"
}

tune=\relative f'' {
	\time 4/4
	\key f \major

	% A
	f4. a,8 ~ a4. d8 ~ | d2 ~ d8 f4 e8 ~ | e4. b8 ~ b4. d8 ~ | d2 ~ d8 e4 f8 ~ |
	f4. bes,8 ~ bes4. cis8 ~ | cis2 ~ cis8 f4 e8 ~ | e d4 f8 e d4 a8 ~ | a1 |
	f'4. a,8 ~ a4. cis8 ~ | cis2 ~ cis8 d4 c8 ~ | c4. e8 ~ e2 ~ | e4 e8 d ~ d c4 c8 ~ |
	c4. bes8 ~ bes2 ~ | bes4 f'8 e ~ e d4 d8 ~ | d cis4 e8 cis4 bes~ | bes2. r4 \bar "|."
}

harmony=\chords {
	% A
	d1:m7 | d:m7/c | e1*2:7/b | \break
	a1*2:7.5+.9- | d1:m7 | e2:m7.5- a:7 | \break
	d1:m7 | b2:m7.5- e:7 | a1*2:m7 | \break
	bes1:maj7 | bes:6 | a1*2:7.9- | \break
}

\include "src/include/harmony_tune.lyi"
