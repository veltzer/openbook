\header {
    title = "September Song"
    composer = "Kurt Weill \& Maxwell Anderson"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Tune = \notes \relative c' { 
    \key c \major
    \time 4/4
    \partial 2. c4 e b' \bar "||"
    a a a2 | r4 c,4 \times 2/3 { c ees aes } | g4. g8 ~ g2 | r4 e8 e g4 c |
    d1 ~ | d4 d,4 \times 2/3 { d c d } | e4. e8 ~ e2 | r4 c8 c e4 b' | 
    a4. a8 ~ a2 | r4 c,8 c ees4 aes | g1 | r4 e4 g8 g c4 | 
    d1 ~ | d4 d,8 e f4 f | e1 ~ | e4 r c' c \bar "||" 
    
    d c8 b c2 ~ | c c4 c | ees4. c8 c2 ~ | c r4 r8 c8 | 
    d2 c | r2 r4 r8 c | ees2 c | r4 c, e b' \bar "||"

    a4. a8 ~ a2 | r4 c,4 ees aes | g1 | r4 e8 e g4 c |
    d2. a4 | c2 c | c1 | r1 \bar "|." 
}

Chords = \chords {
     \partial 2. R2. |

     f1:7 | f2:m7 bes:7 | c1*2:maj | 
     d1:7 | d2:m7.5- g:7.9+ | c1:maj | c:7 | 
     
     f1:7 | f2:m7 bes:7 | c1*2:maj | 
     d1:7 | d2:m7.5- g:7.9+ | c1:maj | c2:maj c:7.9+ |

     f1*2:m7 | fis:dim7 | f:m7 | fis1:dim7 | c:maj | 

     f1:7 | f2:m7 bes:7 | c1*2:maj | 
     d1:7 | d2:m7.5- g:7.9+ | c1:maj | c:7.9+ |      
}

Breaks =  \notes {
    \partial 2. s2. |
}

Score = <
    \context ChordNames \Chords
    \context Staff < \Tune \Breaks >
>

