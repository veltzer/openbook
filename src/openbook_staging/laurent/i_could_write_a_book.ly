\header {
    title = "I Could Write a Book"
    composer = "Lorenz Hart \\& Richard Rodgers"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 2 R2 |
    \repeat volta 2 {
	ees2:maj c:7 | f:m7 bes:7 | ees1:maj | f2:m7 bes:7 |
	ees1:maj | c:m7 | f:m7 | d2:m7.5- g:7.5+.9+ || 
	c1:m7 c:m7 |
    } \alternative {
	{ a2:m7.5- d:7.5+.9+ | g1:m7 | c:7 | c2:m7 f:7 | f1:m7 | bes:7 | }
	{ bes2:m7 ees:7 | aes:maj des:7 | ees:maj c:7.9- | f:m7 bes:7 | 
	  ees1:maj | f2:m7 bes:7 | }
    }
}

Tune = \notes \relative g' {
    \time 4/4
    \key ees \major

    \partial 2 g4 aes |
    \repeat volta 2 {
	bes2 d | c4. bes8 g f4 g8 ~ | g1 ~ | g4. bes8 g f4 g8 ~ |
	g4. bes8 g4 f | \break g ees'2 g,4 | bes1 ~ | bes2 c4 d \bar "||"
	ees2 ees | ees4 f2 d4 | \break
    } \alternative {
	{ c2 c | bes g8 a4 bes8 ~ | bes2 bes | bes4 c2 a4 | bes1 ~ | bes2 g4 aes! | }
	{ des2 des | c bes4 aes | g2 g | f4 ees'2 d4 | ees1 ~ | ees 2 g,4 aes \bar "|." }
    }
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

