\header {
    title = "Billie's Bounce"
    composer = "Charlie Parker"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Tune = \notes \relative c' { 
    \key c \major
    \time 4/4

    \partial 8 c8 |
    b c f gis a f d f ~ | f d f r r f4 d8 | 
    f r4 f8 ~ f d f d | aes' a \times 2/3 {[f16 g f} d8] f g f f | 
    r4 r8 a bes f r aes ~ | aes bes ~ bes4 ees8 c f ees | 
    r f c4 r r8 e!-\accent ~ | e4 g,8 e fis ees' c cis | 
    d4 r8 g \times 2/3 {[fis16 g fis} d8] [bes f] | f'4 r8 f e e d d |
    c4 r8 f, ~ f d f4 | r8 f ~  [f d] f4 r4 \bar "|."
}

Chords = \chords {
    \partial 8 R8 |
    f1:7 | bes2:7 b:dim7 | f1*2:7 | 
    bes:7 | f1:7 | a2:m7 d:7 | 
    g1:m7 | c:7 | f2:7 d:7 | g:m7 c:7 | 
}

Score = <
    \context ChordNames \Chords
    \context Staff \Tune
>
