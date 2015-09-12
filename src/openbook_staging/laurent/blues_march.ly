\header {
    title = "Blues March"
    composer = "Benny Golson"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Tune = \notes \relative a' { 
    \key bes \major
    \time 4/4

    \property Voice.autoBeamSettings \override #'(end * * * *) = #(make-moment 1 4)
    \property Voice.autoBeamSettings \override #'(start * * * *) = #(make-moment 1 4)

    \partial 8
    f8 | bes2 d16 bes r8 r8. bes16 | des2 ees16 des r8 r8. f,16 | 
    bes2. \grace cis8 d8 d | bes4. aes8 r4 r8 f8 | 
    bes8. bes16 des8. des16 \times 2/3 {ees8 fes ees} \times 2/3 {des8 bes des} | 
    bes8. bes16 aes8. aes16 \times 2/3 {ges8 ees ges} des8. ees16 |
    f2 r8 f \times 2/3 {aes f aes} | ges2 r8 ges ces des | 
    bes4 ~ \times 2/3 {bes8 aes ges} bes4 ~ \times 2/3 {bes8 aes ges} |
    a!8 r f'8. f16 \times 2/3 {ees8 c a} f8 ees | d bes' ~ bes2. ~ | bes1 \bar "|."
}

Chords = \chords {
    \partial 8 R8 | 
    bes1:7 | ees:7 | bes1*2:7 | 
    ees2:m7 aes:m7 | des1:m7 | aes:7 | g2.:m7.5- gis4:dim7 | 
    a2:dim7 bes:m7.5- | c4:7 f:7 bes des:7 | c:7 f2.:7 | bes1
}

Breaks = \notes {
    \partial 8 s8 |
}

Score = <
    \context ChordNames \Chords
    \context Staff < \Tune \Breaks >
>

