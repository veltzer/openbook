\header {
    title = "Summertime"
    composer = "G. Gershwin"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

				%

Chords = \chords {
    \partial 4 R4 | 
    \repeat "volta" 2 {
	d1*4:min7 | g1*2:min7 | e1:min7.5- | a:7.9+ |
	d1*3:min7 | g2:min7 c:7 | 
	f1:maj | e2:min7.5- a:7.9+ | d1:min7 | a:7.9+ |
    }
}

Tune = \notes \relative c'''{
    \partial 4
    a8. f16 | \repeat "volta" 2 {
	a1 | r4 g8. f16 g8. a16 f4 | d2 a | ~ a4 r a' f |  \break
	g8 g ~ g2. | r4 f8. d16 f8. d16 f4 | e1 | ~ e2 r4   a8. f16 | \break
	a1 | r4 g8. f16 g8. a16 f4 | d2 a | ~ a2 r4 a | \break
	c a8 c d f ~ f4 | a8 g ~ g4 f2 | d1 | ~ d4 r r a'8. f16 |
    }
}

Score = <
    \context ChordNames \Chords
    \context Staff \Tune
>
