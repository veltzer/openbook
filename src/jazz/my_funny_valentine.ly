\include "src/include/common.lyi"
\header {
	title="My Funny Valentine"
	composer="Richard Rodgers"
	poet="Lorenz Hart"
	style="Jazz"
	piece="Med Swing"
}

harmony=\chords {
	\repeat unfold 2 {
		c1:m7 | c:m7/+b | c:m7/bes | a:m7.5- |
		aes:maj7 | f:m7 |
	}
	\alternative {
		{ d:m7.5- | g:7 | }
		{ f:m7.5- | bes:7.9-}
	}
	\repeat unfold 4 { ees2:maj7 f:m7/+bes | }
	
	ees2:maj7 g:7 | c:m7 bes:m7 | aes1:maj7 | d2:m7.5- g:7 |
	c1:m7 | c:m7/+b | c:m7/bes | a:m7.5- |
	aes:maj7 | d2:m7.5- g:7 | c:m7 f:7.9- | bes:m7 ees:7.9- |
	aes1:maj7 | f2:m7 bes:7 | ees1:maj7 | d2:m7.5- g:7 |
}

tune=\relative a {
	\time 4/4
	\key c \major

	a2 b4 c | b4. c8 b2 | a2 b4 c | b4. c8 b2 |
	a2 b4 c | g'2 f4 e | \break d1 ~ | d \bar "||"
	c2 d4 e | d4. e8 d2 | c2 d4 e | d4. e8 d2 | \break
	c2 d4 e | b'4. a8 g4. fis8 | f1 ~ | f2 e4 d \bar "||"
	g4 r8 c, c4 b | c2 c4 b | \break a'4 r8 c,8 c4 b | c2 c4 b |
	b' r8 c, c4 b | c2 d4 e | a1 ~ | a2 b, \bar "||" \break
	a2 b4 c | b4. c8 b2 | c2 d4 e | d4. e8 d2 |
	a'2 b4 c | b4. c8 b2 | \break c1 ~ | c |
	c,2 d4 e | d4. e8 d2 | c1 ~ | c4 r r2 \bar "|."
}

\include "src/include/harmony_tune.lyi"
