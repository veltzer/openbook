\header{
    title = "Maiden Voyage"
    composer = "Herbie Hancock"
    enteredby = "Laurent Martelli"
    copyright = "© 1973 Hancock Music Co."
    tagline = #tagline
    head = #instrument
}

Melody = \notes \relative a' {
    \time 4/4
    \key c \major

    \partial 4 a8( )d | 
    \repeat "volta" 2 {
	d1 ~ | d ~ | d2 r | r r4 c8( )d | 
	ees f c2. ~ | c1 ~ | c2 r | 
    } \alternative {
	{ r2 r4 a8( )d | }
	{ r2 r4 c8( )f | } 
    }
    f1 ~ | f1 ~ | f2 r | r r4 ees8( )e | e fis cis2. ~ | cis1 | cis2 r | 
    r r4 a8( )d \bar "||" d1 ~ | d1 ~ | d2 r | r r4 c8( )d |
    ees f c2. ~ | c1 | c2 r | r1 |
}

Harmony = \notes \chords {
    \partial 4 R4 |
    \repeat "volta" 2 {
	a1*4:m7/+d | c1*3:m7/+f |
    } \alternative { {R1} {R1} }
    bes1*4:m7/+ees | cis1*4:m7 | 
    a1*4:m7/+d | c1*4:m7/+f |
}


Score =  < 
    \context ChordNames \Harmony
    \context Staff \Melody
>
