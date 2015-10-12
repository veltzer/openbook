\header{
    title = "Triste"
    composer =	 "Antonio Carlos Jobim"
    enteredby =	 "Laurent Martelli"
    copyright =	 "© 1967-1968 Antonio Carlos Jobim"
    tagline = #tagline
    head = #instrument
}

phraseA = \notes \relative c'' {
    r4 r8 bes ~ bes a4 bes8 | a4 g8 d ~ d ees4 f8 | ~ f1 | ~ f 
}

melody = \notes \relative c'' {
    \time 4/4
    \key bes \major

    %Intro
    \repeat percent 4 { s1 } \bar "||" \break 

    \repeat unfold 2 { \phraseA  } \bar "||"

    r4 r8 g8 f g4 f8 | ~ f ees4 d8 ~ d a4 c8 | 
    ~ c a bes d f a4 c8 | ~ c2 ~ c8 bes4 cis8 | 

    ~ cis a a a ~ a2 | a8 fis fis fis ~ fis4. e8 | 
    ~ e d d d ~ d4 g | ~ g8 f f f ~ f2 \bar "||"

    \repeat unfold 2 { \phraseA  } \bar "||"

    r8 bes bes, c d ees4 f8 | ~ f e4 ees8 ~ ees4 f4 | 
    ~ f ees8 d c bes4 c8 | ~ c1 | \break
    r4 r8 ees8 ~ ees d4 ees8 | c4 d8 bes8 ~ bes c4 bes8 | 
    ~ bes1 | ~ bes1 | ~ bes1 | ~ bes1 \bar "||" \break \codaAll

    \repeat percent 4 { s1 } \bar "||"    
}


harmony = \notes \chords {
    \repeat percent 4 { bes2:m7 ees:7 | }

    bes1*2:maj | ges1:maj | b:7.4+ |
    bes:maj | ees:7.4+ | d:m7 | g:7 |

    c:m7 | a2:m7 d:7.9+ | g1:m7 | e2:m7 a:7 |
    d1:maj | e2:m7 a:7 | d:m7 g:7 | c:m7 f:7 |

    bes1*2:maj | bes1*2:m7 |
    bes1*2:maj | f1:m7 | bes:7 |

    ees:maj | aes:7.4+ | d2:m7 g:m7 | c1:7 |
    c:m7 | f:7 | \repeat unfold 4 { bes2:m7 ees:7 | }

    \repeat percent 4 { bes2:m7 ees:7 | }
}

breaks = \notes \relative g' {
    \stemOff \headOff
    s1*4 | 
    s1*8 | s1*8 | s1*8 | 
    s1*6 | \repeat unfold 4 { g2 g | }
}

\midi { \tempo 4 = 152 }

Score =  < 
    \context ChordNames \harmony
    \context Staff \melody
    \context Staff \breaks
>

#(set! minimumVerticalExtent 5)
