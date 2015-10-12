\header{
    title = "Perdido"
    composer = "Juan Tizol"
    enteredby = "Laurent Martelli"
    copyright = "© 1942 Tempo Music, Inc. and Music Sales Corporation (ASCAP)"
    tagline = #tagline
    head = #instrument
}

melody = \notes \relative c' {
    \time 4/4
    \key bes \major

    \partial 8 c8
    \repeat volta 2 {
	ees8 f ~ f2 r8 c | ees f4 c8 ees f4 bes,8 | 
	d f ~ f2 r8 bes, | d f4 bes,8 d f4 c8 |
	ees f ~ f2 r8 c | \times 2/3 {ees4 f d'} c4. f,8 | 
    } \alternative {
	{ g8 bes8 ~ bes2. | r2 r4 r8 c,8 }
	{ g8 bes8 ~ bes2. | ~ bes2 r }
    }
    d'1 | \times 2/3 { a4 b c } d d8 e | ~ e1 | b8 a ~ a2. |
    c1 | \times 2/3 { g4 a bes } c c8 d | ~ d1 | a8 g ~ g2 r8 c,8 \bar "||"
}

harmony = \notes \chords {
    \partial 8 R8 |
    \repeat volta 2 {
	c1:m7 | f:7 | bes2:maj ees:7 | d:m7 g:7 | \break
	c1:m7 | c2:m7 f:7 | 
    } \alternative {
	{ bes2:maj ees:7 | d:m7 g:7 | \break }
	{ bes1:maj | bes1:maj | }
    }
    d1:7 | a2:m7 d:7 | g1:7 |  \break g:7 |
    c:7 | g2:m7 c:7 | f1:7 | f1:7 |
}

Score =  \notes < 
    \context ChordNames \harmony
    \context Staff \melody
>

\midi { \tempo 4 = 132 }


