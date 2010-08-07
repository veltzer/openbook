\include "src/include/common.lyi"
\header {
	title="Foolish Heart"
	composer="Victor Young"
	poet="Ned Washington"
	style="Jazz"
	piece="Med Swing"

	uuid="ce9be996-a26e-11df-bf2c-0019d11e5a41"
}

tune={
	\key bes \major
	\time 4/4

	\partial 4 f4 \bar "||"
	f2 ~ f8 bes, d f | g a g2 g4 | g2 ~ g8 c, ees g | a2. a4 |
	a2 ~ a8 d, f a | bes c bes2 bes4 | bes2 ~ bes8 ees, g bes |
	c2. bes8 c | d4. d8 d4 c8 bes | d4 d2 c8 bes |
	c4. c16 c \times 2/3 {c8 d c} a8 bes | c2. bes8 a |
	bes4. bes8 bes a g a | bes4 bes2 a8 g | a4. a8 a f g f |
	a2. g4 \bar "||"
	f2 ~ f8 bes, d f | g a g2 g4 | g2 ~ g8 c, ees g | a2. a4 |
	a2 ~ a8 d, f a | bes c bes2 bes4 | bes2 ~ bes8 ees, g bes |
	d2. c4 \bar "||" bes4. bes8 bes a g a | bes4 bes2 bes8 c |
	d4. d8 d d c bes | d,2. g4 | bes2 ~ bes8 ees, g bes |
	c4 d bes c | bes1 | r1 \bar "|."
}

harmony=\chords {
	\partial 4 r4 |
	bes2:maj7 ees2:maj7 | d2:m7 g2:7 | c2:m7 c2:m7/bes | e2:m7/+a a2:7.9 \break
	d2:m7 d2:7.9+.5+ | g2:m7 des2:7 | c1:m7 | c2:m7.5- f2:7.9- \break
	bes1:maj7 | f2:m7 bes2:7 | ees1:maj7 | a2:m7.5- d2:7.9 \break
	g2:m7 des2:7.9- | g2:m7 c2:7 | c2:m7 g2:7.5+ | c2:m7 f2:7 \break

	bes2:maj7 ees2:maj7 | d2:m7 g2:7 | c2:m7 c2:m7/bes | e2:m7/a a2:7.9+.5+ \break
	d2:m7 d2:7.9+.5+ | g2:m7 des2:7 | c2:m7 c2:m7/bes | a2:m7.5- d2:7.9+.5+ \break

	g1:m7 | ees2:m7 aes2:7 | bes2:maj7 ees2:maj7 | aes2:7.4+ g2:7 \break
	c2:m7 g2:7.9+.5+ | c4:7 c4:7.5+ c4:m7 f4:7.9- |
	bes2:maj7 g2:m7 | ges2:maj7 f2:7 |
}

\include "src/include/harmony_tune.lyi"
