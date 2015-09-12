\header {
    title = "All Blues"
    composer = "Miles Davis"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    g2.*4:7 | c2.*2:7 | g2.*2:7 | 
    d2.:7.9+ | ees4.:7.9+ d:7.9+ | g2.*2:7 |
}

Tune = \notes \relative c'' {
    \time 6/8
    \key c \major
    
    b4. ~ b4 ~ b16 d, | b' c b4 ~ b ~ b16 d, | b' c b4 ~ b ~ b16 d, | \break
    b'4. ~ b4 r8  | a4 bes8 c4 d8 | c4 bes8 a4 ~ a16 d, | \break
    b'!2. | g4. ~ g4 ~ g16 gis | a2. | \break 
    bes | a4. b! | a g \bar "|."
}

Accomp = \notes \relative c' {
    \time 6/8
    \key c \major
    
    \repeat percent 4 { <b4 d> <c8 e> <d4 f> <c8 e> }
    \repeat percent 2 { <bes4 d> <c8 e> <d4 f> <c8 e> }
    \repeat percent 2 { <b!4 d> <c8 e> <d4 f> <c8 e> }
    \chords { d'2.:7.9+ | ees'4.:7.9+ d':7.9+ | \repeat percent 2 { g'2.:7 } }
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = top { \Tune }
    \context Staff = bottom { \Accomp }
>
