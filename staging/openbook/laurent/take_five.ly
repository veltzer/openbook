\header {
    title = "Take Five"
    composer = "Paul Desmond \& Iola Brubeck"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 2 R2 |
    \repeat unfold 8 { ees2.:m7 bes2:m7 | }
    \repeat unfold 2 { ces2.:maj aes2:m6 | bes2.:m7 ees2:m7 | aes2.:m7 des2:7 | }
    \alternative { { ges4*5:maj | } { f2.:m7 bes2:7 } }
    \repeat unfold 7 { ees2.:m7 bes2:m7 | } ees1:m7
}

TuneA = \notes \relative c' {
    bes8 ees ges aes \bar "||"
    a bes a aes ges4 bes,4 \( \)des-. | ees2. f16 \( ges f ees \) des4 | 
    ees2. des16 \( ees des bes \) aes4 |bes2. bes8 ees ges aes |  %\break 
    a bes a aes ges4 bes,4 \( \)des-. |  ees2. des16 \( ees des bes \) aes4 | 
    bes2. f'16 \( ges f ees \) des4 | ees2.
}

TuneB = \notes \relative c'' {
    ees8 des ees des \bar "||" %\break
    ees ges4 ees8 ces4 aes8 bes ces c | des8 f4 des8 bes4 ges8 aes a bes | 
    ces ees4 ces8 aes4 f8 ges aes a | bes a bes ces des4 des8 c des d | %\break
    ees ges4 ees8 ces4 aes8 bes ces c | des g4 des8 bes4 ges8 aes a bes |
    ces ees4 ces8 aes4 f8 aes des ces | bes2. 
}

Tune = \notes \relative c' {
    \time 5/4
    \key ges \major
    \partial 2 \TuneA \TuneB \TuneA r2 \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>
