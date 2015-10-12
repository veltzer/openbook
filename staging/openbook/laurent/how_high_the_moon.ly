\header {
    title = "How High the Moon"
    composer = "Morgan Lewis"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 2. R2. |
    \repeat "volta" 2 {
	g1*2:maj | g1:min7 | c:7 | \break
	f1*2:maj | f1:min7 | bes:7 | \break
    } \alternative {
	{ ees1:maj | a2:min7 d:7 | g1:min7 | a2:min7.5- d:7.9- | \break
	  g1:maj | a2:min7 d:7 | b:min7 bes:7 | a2:min7 d:7 | \break }
	{ ees1:maj | a2:min7 d:7 | g1:maj | a2:min7.5- d:7.9- | \break
	  b:min7 bes:7 | a2:min7 d:7 | g1:6 | a2:min7 d:7 | \break }
    }
}

Tune = \notes \relative c' {
    \time 4/4
    \key g \major
    
    \partial 2. d4 g a | 
    \repeat "volta" 2 {
	a2 b | ~ b4 d, g a | bes1 | ~ bes4 c, f g | 
	g2 a | ~ a4 c, f g | aes1 | ~ aes4 d, ees f \bar "||"
    } \alternative {
	{ g g g g | g g8 a ~ a g a4 | bes1 | ~ bes4. a8 ~ a  g a4 |
	  b!1 | ~ b4 a b c | d d d d | d8 r d,4 g a | }
	{ g g g g | g g8 a ~ a g a4 | b1 | ~ b4 a b c | 
	  d d d d | d d, g a | g1 | ~ g \bar "|." }
    }
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

