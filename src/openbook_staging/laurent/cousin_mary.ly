\header {
    title = "Cousin Mary"
    composer = "John Coltrane"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    aes1*4:7 | des1*2:7 | aes:7 | d1:7 | des:7 | aes1*2:7 |
}

Tune = \notes \relative c' {
    \time 4/4
    \key des \major

    r4 ees8 r ges4. ees8 ~ | ees1 | r4 ees8 r ges4. ees8 ~ | ees1 | \break
    r4 ees8 r ges4. aes8 ~ | aes1 | r4 ees8 r ges4. ees8 ~ | ees1 | \break
    r8 aes ges aes ~ aes4 ges8 aes ~ | aes4 aes8 ges ees ees des r |
    r4 ees8 r ges4. ees8 ~ | ees1 \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

