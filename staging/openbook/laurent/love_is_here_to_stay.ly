\header {
    title = "Love is Here to Stay"
    composer = "Ira and George Gershwin"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 2. R2. |
    g1:7 | g2:m7 c:7 | f1*2:maj | g1:7 | g2:m7 c:7 | ees:7.4+ d:7 | g:7 aes:dim.7 | 
    a:m7 d:7 | g:m7 c:7 | f:maj bes:maj | e:7.5- a:7.9+ | d1:m7 | g:7 | g:m7 | c:7 |
    g1:7 | g2:m7 c:7 | f1:maj | d:7.9+ | g:7 | g2:m7 c:7 | ees:7.4+ d:7 | g:7 aes:dim.7 |
    a:m7 d:7 | g:m7 c:7 | ees:7.4+ d:7 | g:m7 aes:dim.7 | a:m7 d:m7 | g:m7 c:7 | f1*2:maj |
}

Tune = \notes \relative c' {
    \time 4/4
    \key f \major

    \partial 2. c4 d a' \bar "||"
    f1 | f8 g4 f8 g4 g | f1 | r4 c4 d c' | 
    a1 | \break f8 g4 f8 g4 g | a1 | r4 e' e d \bar "||"
    
    c2 d4. c8 | bes bes bes4 c4. bes8 | a4 a c bes \break | g a a g | 
    f g e f | r8 g4 a8 fis4 g | d'1 | 
    
    r4 c,4 d a' \bar "||" 
    f1 \break | f8 g4 f8 g4 g | f1 | r4 c4 d c' | 
    a1 | f8 g4 f8 g4 g | a1 \break | r4 e' e4. d8 \bar "||"
    
    c8 c c4 d8 d4 c8 | bes bes bes4 c8 c4. | r8 a gis a c4 bes |  \break g2 d' |
    r4 c d a | c2 d, | f1 ~ | f4 r r2 \bar "|."
}

Score =   <
    \context ChordNames \Chords
    \context Staff \Tune
>

