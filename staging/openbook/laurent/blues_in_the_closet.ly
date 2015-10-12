\header {
    title = "Blues In The Closet"
    composer = "Oscar Pettiford"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

riffa = \notes \relative a' {
    aes8 ~ aes4 c8 aes des4 c8 aes des4 c8 aes ~ aes ees4 aes8 ~
    aes4 c8 aes des4 c8 aes ~ aes ees4. ~ ees4
}

riffb = \notes \relative a' {
    aes8 ~ aes4 ces8 aes des4 ces8 aes des4 ces8 aes ~ aes ees4 aes8 ~ 
    aes4 c8 aes des4 c8 aes ~ aes ees4. ~ ees4 
}

voiceb = \notes \relative a' {
    c8 ~ | c4 ees8 c f4 ees8 c f4 ees8 c ~ c aes4 c8 ~
    c4 ees8 c f4 ees8 c ~ c aes4. ~ aes4 r8

    ces8 ~ | ces4 ees8 ces f4 ees8 ces f4 ees8 ces ~ ces aes4 c8 ~
    c4 ees8 c f4 ees8 c ~ c aes4. ~ aes4 r8

    c8 ~ | c4 ees8 c f4 ees8 c f4 ees8 c ~ c aes4 c8 ~
    c4 ees8 c f4 ees8 c ~ c aes4. ~ aes4 r4
}

Tune = \notes \relative a' { 
    \key aes \major
    \time 4/4

    \partial 8 \riffa r8 \riffb r8 
    aes8 ~ | aes4 c8 aes des4 c8 aes | des4 c8 aes ~ aes ees4 aes8 ~ | 
    aes4 c8 aes des4 c8 aes ~ | aes ees4 des8 c4 \autoBeamOff ees8  \autoBeamOn
    < { \grace g8 \riffa r8 \riffb r8 \riffa r4 }
      { \grace bes'8 \voiceb } >
    
    
}

Chords = \chords {
    \partial 8 R8 |
    \repeat unfold 2 { aes1*4 | des1*2:7 | aes | bes1:m7 | ees:7 | aes1*2 | }
}

Breaks = \notes {
    \partial 8 s8 |
    s1*4 | \break s1*4 | \break s1*4 \bar "||" \break 
    s1*4 | \break s1*4 | \break s1*4 \bar "|." \break 
}

Score = <
    \context ChordNames \Chords
    \context Staff < \Tune \Breaks >
>

\midi { \tempo 4 = 188 }