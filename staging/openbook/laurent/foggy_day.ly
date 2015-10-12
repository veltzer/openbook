\header {
    title = "A Foggy Day"
    composer = "Ira and George Gershwin"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 4 R4 | 
    f1:maj | aes:7 | g:m7 | c2:7 c:7.9- | f1:maj | \break aes:7 | g:7 | c:7 |
    f:maj | c2:m7 f:7 | bes1:maj | \break ees:7 | f:maj | d:7 | g:7 | c:7 | \break
    f1:maj | aes:7  g:m7 | c:7 | f:maj | aes:7 | \break g:7 | c:7 | 
    c:m7 | f:7 | bes:maj | ees:7 | \break
    f2:maj/+c g:m7/+c | f:maj/+c g:m7/+c | a:m7 d:m7 | 
    g:m7 c:7 | f:maj d:7 | g:m7 c:7 |
}

Tune = \notes \relative c' {
    \time 4/4
    \key f \major

    \partial 4 c4 \bar "||"
    c c2 ees4 ~ | ees2. ees4 | d d2 a'4 ~ | a1 |
    f2 f4 aes ~ | aes2. aes4 | g2 g4 d'4 ~ | d1 \bar "||"

    r4 e e e | c c2. | a2 a4 f ~ | f2. f4 | 
    a a a c ~ | c c2 c4 | a2 a4 d, ~ | d2. c4 \bar "||"

    c2 c4 ees ~ | ees ees2 ees4 | d2 d4 a' ~ | a2 a4 a | 
    f2 f4 aes ~ | aes bes aes2 | g2 g4 d' ~ | d2. d4 \bar "||"
    
    f2 f4 d ~ | d2. d4 | c2 c4 a ~ | a2 a4 bes | 
    c f, g bes | a f g bes | a2 f' | f, g | f1 | r \bar "|."
}

Score =   <
    \context ChordNames \Chords
    \context Staff \Tune
>

