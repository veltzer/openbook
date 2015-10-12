\header {
    title = "Las Vegas Tango"
    composer = "Gil Evans"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

phraseA = \notes \relative a' {
    g8 g a b4 b16 a | b1 ~ | b4 
}

phraseB = \notes \relative c'' {
    b8 b d e4 e16 d | e1 ~ | e4 
}

Tune = \notes \relative a' { 
    \key g \major
    \time 4/4

    r4 g8 g a b4 b16 a |
    \repeat volta 2 {
	b1 ~ | b4  \phraseA \phraseB \phraseA \phraseB \phraseA g8 g a b4 b16 a 
    }
}

Chords = \chords {
    R1 | \repeat volta 2 { e1*4:m7 | a1*2:m7 | e1*2:m7 | a1*2:m7 | e1*2:m7 | }
}

Breaks = \notes {
}

Score = <
    \context ChordNames \Chords
    \context Staff < \Tune \Breaks >
>

