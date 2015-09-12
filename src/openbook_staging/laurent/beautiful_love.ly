\header {
    filename = "beautiful_love.ly"
    title = "Beautiful Love"
    composer = "Victor Young"
    enteredby = "Laurent Martelli"
    copyright = "© 1931-1959 Movietone Music Corp.NY"
    tagline = #tagline
    head = #instrument
}


melody = \notes \relative c' {
    \time 4/4
    \key f \major
    \clef treble

    r8 d4. e4 f 
    \repeat volta 2 {
	a2. g4 | f4. e8 d4 e8 f | ~ f1 | r8  f4. g4 a | \break
	c2. bes4 | a4. g8 f4 g8 a | ~ a1 | r8 a4. b4 cis | \break
	e4. d8 ~ d4. a8 | c4. bes8 ~ bes4 d,4 | e1 | r8 e4. f4 g | \break
    } \alternative { 
	{ a2. d,4 | cis2. d4 | e1| r8 d4. e4 f | \break } 
	{ a2 cis,4 d | f2 e | d1 | r \bar "|." } 
    }
}

harmony =  \chords {
    R1 |
    \repeat volta 2 {
	e1:m7.5- | a:7 | d1*2:m7 | 
	g1:m7 | c:7 | f:maj | e2:m7.5- a:7 | 
	d1:m7 | g:m7 | bes:7 | e2:m7.5- a:7 | 
    } \alternative {
	{ d1:m7 | g:7.4+ | e:m7.5- | a:7.9- | }
	{ d2:m7 b:7.9+ | bes:7 a:7 | d1*2:m7 | }
    }
}

Score = <
    \context ChordNames \harmony
    \context Staff \melody
>
