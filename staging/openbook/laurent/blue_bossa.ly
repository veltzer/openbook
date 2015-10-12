\header {
    title = "Blue Bossa"
    composer = "Kenny Dorham"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    c1*2:m7 | f1*2:m7 | 
    d1:m7.5- | g:7 | c1*2:m7 |
    ees1:m7 | aes:7 | des1*2:maj |  
    d1:m7.5- | g:7 | c1:m7 | d2:m7.5- g:7
}

Tune = \notes \relative g'' {
    \time 4/4
    \key ees \major

    g4. f8 ees d4 c8 | ~ c2. bes4 | aes2 g'4. f8 | ~ f1 |  
    f4. ees 8 d c4 bes8 | ~ bes2. aes4 | g2 f'4. ees8 | ~ ees1 |
    ees4. des8 c bes4 aes8 | ~ aes2. ges4 | ges f8 bes ~ bes f aes4 | ~ aes1 |
    aes4 g8 bes ~ bes2 | aes4 g8 bes ~ bes4. aes8 | g1 | ~ g2. g4 \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>
