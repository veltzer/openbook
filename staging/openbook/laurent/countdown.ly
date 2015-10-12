\header {
    title = "Countdown"
    composer = "John Coltrane"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    e2:m7 f:7 | bes:maj des:7 | ges:maj a:7 | d1:maj |
    d2:7 ees:7 | aes:maj b:7 | e:maj g:7 | c1:maj |
    c2:m7 des:7 | ges:maj a:7 | d:maj f:7 | bes1:maj |
    e1:m7 | f:7 | bes:maj | ees:7 |
}

Tune = \notes \relative c'' {
    \time 4/4

    a2 a | a bes | des c4 bes | a1 | \break
    g2 g | g gis | b bes4 aes | g1 | \break
    d4 ees bes' aes | des2 c4 bes | a2 c | f, g | \break
    a1 ~ | a4. g8 a c a g  |a1 ~ | a \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

