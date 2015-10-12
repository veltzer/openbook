\header{
    title = "But Not For Me"
    composer =  "George and Ira Gershwin"
    enteredby = "Laurent Martelli"
    copyright = "© 1930 WB Music Copr."
    tagline = #tagline
    head = #instrument
}

melody = \notes \relative c' {
    \time 4/4
    \key f \major
    
    r8 g'4. a4 g | 
    \repeat volta 2 {
	a2 g4 f | ~ f g a g | a1 | r4 g a g | 
	a2 g4 f | ~ f g a g | a1 | r8 a4. bes 4 c \bar "||"
	cis2 d4 f | r g, a bes | 
    } \alternative {
	{ b2 c4 f | r f, g a | a2 bes4 f' | r f d bes | g1 | r4 g4 a g | }
	{ b2 c4 g' | r f d bes | a1 | g | f | r \bar "|." }
    }
}

harmony = \notes \chords {
    R1 |
    \repeat volta 2 {
	g1:7    | c:7      | f:maj | d:7.9+ | \break
	g:7     | c:7      | c:m7  | f:7    | \break
	bes:maj | ees:7.4+ |
    } \alternative {
	{ f1:maj | d:m7 | g1*2:7       | g1:m7 | c:7    | } 
	{ f1:maj | d:m7 | g:m7   | c:7 | f:maj | d:7.9+ | }
    }
}

Score =  \notes < 
    \context ChordNames \harmony
    \context Staff \melody
>

\midi { \tempo 4 = 150 }


