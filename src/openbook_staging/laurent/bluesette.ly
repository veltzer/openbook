\header {
    title = "Bluesette"
    composer = "Toots Thielemans"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    bes2.*2:maj | a2.:m7.5- | d:7   | g:m7 | c:7   | f:m7     | bes:7 | 
    ees2.*2:maj | ees2.:m7  | aes:7 | des2.*2:maj  | des2.:m7 | ges:7 | 
    b2.*2:maj   | c2.:m7.5- | f:7   | d:m7 | des:7 | c:m7     | f:7    \bar "|."
}

Tune = \notes \relative f' {
    \time 3/4
    \key bes \major

    f4 g a    | bes c d | ees2 g,4  | fis2. | 
    d'2 f,4   | e2.     | \break c'2 ees,4 | d2.   |
    bes'2 d,4 | ees4. f8 ges aes | bes2 ges'4 | f2 ees4 | \break
    aes,2 f'4 | ees2 des4 | aes2 fes' 4 | ees2 des4 | 
    ges,4 aes bes | ces des ees | \break f2 ees4 | d2 c4 |
    f,2. | ~ f | ~ f | ~ f
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

