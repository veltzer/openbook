\header{
    title = "Everything Happens To Me"
    composer =  "Matt Denis \& Tom Adair"
    enteredby = "Laurent Martelli"
    copyright = "© 1941 Dorsey Bros. Music and Criterion Music Corp. International"
    tagline = #tagline
    head = #instrument
}

melody = \notes \relative g' {
    \time 4/4
    \key bes \major
    
    \partial 8 g8 \bar "||" 
    d' d d ees c c bes a | c c c d bes4 r8 g |
    bes bes bes c a a g f | aes aes aes bes g4 r8 d |
    f f f g ees fis a bes | c c \times 2/3 { c c a ~ } a2 |
    g8 g g a ~ a a a f ~ | f2. r8 g | 
    
    d' d d ees c c bes a | c c c d bes4 r8 g |
    bes bes bes c a a g f | aes aes aes bes g4 r8 d |
    f f f g ees fis a bes | c c \times 2/3 { c c a ~ } a2 |
    g8 g g a ~ a a a bes ~ | bes2. r8 bes \bar "||" 
    
    bes bes bes bes des des b des | bes bes bes2 r8 bes |
    bes bes bes bes b ges f ees | bes'2. r8 bes |
    a a a a c c bes c | a a a2 r8 a |
    bes bes bes bes bes bes a bes | c2. r8 g \bar "||"

    d' d d ees c c bes a | c c c d bes4 r8 g |
    bes bes bes c a a g f | aes aes aes bes g4 r8 d |
    f f f g ees fis a bes | c c \times 2/3 { c c a ~ } a2 |
    g8 g g d' ~ d d d bes ~ | bes2. r4 \bar "||" 

}

harmony = \notes \chords {
    \partial 8 R8 | 
    c2:m7.9 f:7 | d:m7 cis:dim7 | c:m7 f4:7 ees:7 | d2:m7.5- g:7 |
    b:dim7 c:m7.5- | d:m7 g:9 | c:m7 f:7 | bes1:maj |
    
    c2:m7.9 f:7 | d:m7 cis:dim7 | c:m7 f4:7 ees:7 | d2:m7.5- g:7 |
    b:dim7 c:m7.5- | d:m7 g:9 | c:m7 f:7 | bes1:6 |
    
    f2:m7.11^9 bes:7.5+.9+ | ees:maj c:m7 | f2:m7.11^9 bes:7.5+.9+ | ees1:maj |
    e2:m7.11^9 a:7.5+.9+ | d:maj b:m7 | g:m7 c:7 | f:sus9 f:7 |
    
    c:m9 f:7 | d:m7 cis:dim7 | c:m7 f4:7 ees:7 | d2:m7.5- g:7 |
    b:dim7 c:m7.5- | d:m7 g:9 | c:m7 f:13 | bes1:6 |
}

Score =  < 
    \context ChordNames \harmony
    \context Staff \melody
>

\midi { \tempo 4 = 60 }
