\header{
    title = "Mr P.C."
    composer =  "John Coltrane"
    enteredby = "Laurent Martelli"
    %copyright = "© 1974 Jowcol Music"
    tagline = #tagline
    head = #instrument
}

melody = \notes \relative c' {
    \time 4/4
    \key ees \major

    c8 c d d ees ees f f | g g f f ees c4 bes8 | c2 bes4. c8 ~ |  c2 r |
    f8 f g g aes aes bes bes | c c bes bes aes f4 ees8 | c2 bes4. c8 | 
    r2 ees8 c ees ges | r f4. ~ f4. ges8 | r f4 ees8 f4 ees | c2 bes4. c8 ~ | c2 r2 \bar "|."
}

harmony = \notes \chords {
    c1*2:m7 | c2:m7 bes | c1:m7 | f1*2:m7 | c2:m7 bes | 
    c2.:m7 R8 d:7 | R g2.:7 d8:7 | R g4.:7 R2 | c2:m7 bes | c1:m7 |
}

Score =  \notes < 
    \context ChordNames \harmony
    \context Staff \melody
>

\midi { \tempo 4 = 60 }


