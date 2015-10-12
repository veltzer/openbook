\header {
    title = "Freddy the Freeloader"
    composer = "Miles Davis"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \repeat volta 2 { bes1*4:7 | ees1*2:7 | bes1*2:7 |
	} \alternative { 
	{ f2.:7 bes4:7 | ees1:7 | aes1*2:7 } 
	{ f2.:7 bes4:7 | ees1:7 | bes1*2:7 }
    }
}

Tune = \notes \relative g' {
    \time 4/4
    \key ees \major
    
    \repeat volta 2 {
	g4. f8 ~ f2 | ~ f1 | g4. f8 ~ f2 | ~ f1 | \break
	c'4. bes8 ~ bes2 | ~ bes1 | g4. f8 ~ f2 | ~ f2. aes4-.  \break
    } \alternative { 
	{ a2. aes8 g | ~ g2. f8 ges | ~ ges1 | ~ ges | \break }
	{ a2. aes8 g | ~ g2. f4-. | g4. f8 ~ f2 | ~ f1  \bar "|."  }
    }
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

