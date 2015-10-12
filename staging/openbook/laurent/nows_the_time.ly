\header {
    title = "Now's the time"
    composer = "Charlie parker"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 8 R8 |
    f1:7 | bes:7 | f:7 | c2:m7 f:7 | \break
    bes1:7 | bes2:7 b:dim7 | f bes:7 | a:m7.5- d:7.9+ | \break
    g:m7 c:9 | g:m7 c:7 | f:7 aes:7 | g:m7 c:7 | 
}

Tune = \notes \relative c' {
    \time 4/4
    \key f \major

    \partial 8 c8 \bar "||" f f g c, f4 r8 c8 | f f g c, f4 r8 c8 | 
    f f g c, f f g c, | f f g c, f4 r8 c | 
    f f g c, f bes, r c | f f g c, f b, r c | 
    f f g c, f f g c, | f f g c, f4 r8 aes | 
    ~ aes f d c d4 r | r8 g ~ g4 f8 g f ees | 
    ~ ees c4 a8 c4 r8 ees | r c4 bes8 c2 \bar "|."
    
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

