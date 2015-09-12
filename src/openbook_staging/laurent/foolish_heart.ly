\header {
    title = "Foolish Heart"
    composer = "Ned Washington \\& Victor Young"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

%% the tune in C
Tune = \notes \relative c' { 
    \key bes \major
    \time 4/4
    
    \partial 4 f4 \bar "||"
    f2 ~ f8 bes, d f | g a g2 g4 | g2 ~ g8 c, ees g | a2. a4 | 
    a2 ~ a8 d, f a | bes c bes2 bes4 | bes2 ~ bes8 ees, g bes | 
    c2. bes8 c | d4. d8 d4 c8 bes | d4 d2 c8 bes | 
    c4. c16 c \times 2/3 {c8 d c} a8 bes | c2. bes8 a | 
    bes4. bes8 bes a g a | bes4 bes2 a8 g | a4. a8 a f g f |
    a2. g4 \bar "||"
    f2 ~ f8 bes, d f | g a g2 g4 | g2 ~ g8 c, ees g | a2. a4 | 
    a2 ~ a8 d, f a | bes c bes2 bes4 | bes2 ~ bes8 ees, g bes | 
    d2. c4 \bar "||"  bes4. bes8 bes a g a | bes4 bes2 bes8 c | 
    d4. d8 d d c bes | d,2. g4 | bes2 ~ bes8 ees, g bes | 
    c4 d bes c | bes1 | r1 \bar "|."
}

Chords = \chords {
    \partial 4 R4 | 
    bes2:maj ees:maj | d:m7 g:7 | c:m7 c:m7/bes | e:m7/+a a:7.9 \break
    d:m7 d:7.5+.9+ | g:m7 des:7 | c1:m7 | c2:m7.5- f:7.9- \break
    bes1:maj | f2:m7 bes:7 | ees1:maj | a2:m7.5- d:7.9 \break
    g:m7 des:7.9- | g:m7 c:7 | c:m7 g:7.5+ | c:m7 f:7 \break
    
    bes:maj ees:maj | d:m7 g:7 | c:m7 c:m7/bes | e:m7/a a:7.9+.5+ \break
    d:m7 d:7.9+.5+ | g:m7 des:7 | c:m7 c:m7/bes | a:m7.5- d:7.9+.5+ \break
    
    g1:m7 | ees2:m7 aes:7 | bes:maj ees:maj | aes:7.4+ g:7 \break
    c:m7 g:7.9+.5+ | c4:7 c:7.5+ c:m7 f:7.9- |
    bes2:maj g:m7 | ges:maj f:7 |
} 

Score = <
    \context ChordNames \Chords
    \context Staff \Tune
>

#(set! minimumVerticalExtent 4)
