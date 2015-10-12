\header{
    title = "Footprints"
    composer = "Wayne Shorter"
    enteredby = "Laurent Martelli"
    copyright = "© 1967 Miyako Music"
    tagline = #tagline
    head = #instrument
}

Melody = \notes \relative c'' {
    \time 6/4
    \key bes \major

%  \property Voice.autoBeamSettings \override #'(end * * * *) = #(make-moment 1 4)
%  \property Voice.autoBeamSettings \override #'(start * * * *) = #(make-moment 1 4)

    bes4-- bes-- bes-- bes8 \( c ~ c4. a8 | \times 6/5 { bes8 a g f d ~ } d2 \) c4-. |
    r2 r8 d8 ~ d2 c4-. | r2 r8 d8 ~ d2 c4-. |

    bes'4-- bes-- bes-- bes8 \( c ~ c4. d8 | \times 6/5 { ees8 d c bes g ~ } g2 \) f4-. |
    \times 6/5 { bes8 \( a g f d ~ } d2 \) c4-. | r2 r8 d8 ~ d2 c4-. |
    
    b'4 \( b b b8 d ~ d4 g,8 bes ~ | bes2 ~ \times 2/3 { bes8 a aes } g2 ~ g16 c g ges |
    f1. ~ | \) f1. \bar "|."
}

Harmony = \notes \chords {
    c1.*4:m7 | \break  f1.*2:m7 | c1.*2:m7 | \break
    fis1:m7.5- b2:7.9+ | e2.:7.9+ a:7.5+.9+ | c1.*2:m7 |
}


Score =  < 
    \context ChordNames \Harmony
    \context Staff \Melody
>
