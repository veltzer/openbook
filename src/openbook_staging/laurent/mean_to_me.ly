\header {
    title = "Mean To Me"
    composer = "Fred E. Alert \& Roy Turk"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Tune = \notes \relative g' { 
    \key f \major
    \time 4/4
    \partial 4 gis4 |
    \repeat volta 2 {
	a c,8 d8 ~ d2 | bes'4. d,8 ~ d dis e4 | c' e,8 f ~ f2 | d'4. f,8 ~ f g gis4 | 
	a c,8 d8 ~ d2 | bes'8 c bes c ~ c4 a | 
    } \alternative { 
	{ g4 f2. | g8 a g c ~ c2 | }
	{ g4 f2. | r4 d' d c \bar "||" } 
    }

    c2 bes | r4 d8 d ~ d des c4 | bes1 ~ | bes4 bes bes a | 
    a2 g | r4 bes bes a | a4. d,8 ~ d e f4 | g2 gis \bar "||"

    a4 c,8 d8 ~ d2 | bes'4. d,8 ~ d dis e4 | c' e,8 f ~ f2 | d'4. f,8 ~ f g gis4 | 
    a c,8 d ~ d f a4 | c2. a4 | a f2. ~ | f4 r r2 \bar "|."
}

Chords = \chords {
     \partial 4 R4 |

     \repeat volta 2 {
	 f2:maj d:m7 | g:m7 c:7 | f:maj d:m7 | bes:maj ees:7 | 
	 a:m7 d:7.9+ | g:m7 c:7 | 
     } \alternative { { a2:m7 d:m7 | g:7 c:7 } { f1:maj | g2:7 c:7 | } }

     bes1:maj | c2:m7 f:7 | bes1:maj | a2:m7.5- d:7.9+ | 
     g1:m7 | a2:7.9- d:7 | g1:7 | c:7 |

     f2:maj d:m7 | g:m7 c:7 | a:m7 d:m7 | bes:maj ees:7 | 
     f:maj d:7.9+ | g:m7 c:7 | f1:maj | g2:m7 c:7 | 
     
}

Breaks =  \notes {
    \partial 4 s4 |
}

Score = <
    \context ChordNames \Chords
    \context Staff < \Tune \Breaks >
>

