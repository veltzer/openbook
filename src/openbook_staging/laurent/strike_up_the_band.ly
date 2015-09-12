\header {
    title = "Strike Up the Band"
    composer = "George Gershwin"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    c1:min7.9 | f:7 | d:min7 | g:7 | c:min7 | f2:7.4^3 f:7.13 | bes1:6 | f:7 |

    bes1*2:6 | b1*2:dim7 | 
    f1*2:7 | bes1:6 | f2:min7 bes:7 |

    ees1*2:6 | e1*2:dim7 |
    f1:min7 | bes:7.9 | ees:6 | f:7 |

    bes1*2:maj | a1:min7 | d:min7 |
    bes:min7 | c:7 | c:min7 | f:7 |

    bes1*2:6 | d1:min7.5- | g:7 |
    c:min7 | f:7.9 | bes:6 | c2:min7 f:7 |

    c1:min7.9 | f:7 | d:min7 | g:7 |
    c:min7 | f:7.13 | bes1*2:6 | 
}

Tune = \notes \relative c'' {
    \time 4/4
    \key bes \major
    
    r8 d4. bes4 g | bes4. c8 ~ c2 | r8 g'4. f4 c | bes'4. aes8 ~ aes2 | \noBreak
    r8 d,4. bes4 g | bes2 d | bes8 f4 f8 f2 | r2 r4 f8 e \bar "||" \break

    f8 g4 g8 ~ g2 | ~ g2. f8 e | f aes4 aes8 ~ aes2 | ~ aes2. f8 e | \break
    f8 a4 a!8 ~ a2 | ~ a2 f8 g4 f8 | bes1 | ~ bes2. bes8 a  \bar "||" \break

    bes8 c4 c8 ~ c2 | c2. bes8 a | bes des4 des8 ~ des2 | ~ des2. bes8 a | \break
    bes d!4 d8 ~ d2 | ~ d2 bes8 c4 bes8 | ees1 | ~ ees4 f2 ees4 \bar "||" \break

    d4 d8 bes d4 d8 bes | d2 r8 ees r d | c4 c8 a c4 c8 a | c2 r8 d r c | \break
    bes4 bes8 g bes4 bes8 g | bes2 bes8 d r f | ~ f1 | ~ f2 r4 f,8 e \bar "||" \break
    
    f8 g4 g8 ~ g2 | ~ g2. d'8 cis | d f4 f8 ~ f2 | ~ f2. r4 \toCoda | \break
    r4 ees4 d  c | g' f2 d4 | bes r r2 | r1 \bar "||" \break

    \coda r8 d4. bes4 g | bes4. c8 ~ c2 | r8 g'4. f4 c | bes'4. aes8 ~ aes2 |
    r8 d,4. bes4 g | d'2 d | bes4 r <ees-. bes'> r | <e4.-. bes'> <f8-\accent bes> r4 bes,,-\tenuto | 
    c1-\fermata \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

#(set! minimumVerticalExtent 4)

\midi { \tempo 4 = 120 }
