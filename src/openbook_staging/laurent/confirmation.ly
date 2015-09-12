\header {
    title = "Confirmation"
    composer = "Charlie Parker"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    f1:maj | e2:min7.5- a:7 | d:min7 g:7 | c:min7 f:7 |
    bes1:7 | a2:min7 d:7 | g1:7.4+ | g2:min7 c:7 |

    f1:maj | e2:min7.5- a:7 | d:min7 g:7 | c:min7 f:7 |
    bes1:7 | a2:min7 d:7 | g:min7 c:7 | f1:maj |
    
    c1:min7 | f:7 | bes1*2:maj | 
    ees1:min7 | aes:7 | des:maj | g2:min7 c:7 |

    f1:maj | e2:min7.5- a:7 | d:min7 g:7 | c:min7 f:7 |
    bes1:7 | a2:min7 d:7 | g:min7 c:7 |  f1:maj |
}

Tune = \notes \relative c'' {
    \time 4/4
    \key f \major
    a8 c r a bes a \times 2/3 {e f fis} | g d' bes g a cis, r g' |
    r f r4 r r8 a | g bes a g r f4 bes8 |
    b bes aes f bes aes ~ aes4 | r8 c bes g fis a d, b' | 
    ~ b4 e8 a, r4 r8 ees'16 d | des8 f, g e r c'4. \bar "||"

    a4 r8 f \times 2/3 {bes a aes} g a | f16 g ees8 r4 r8 cis4 g'8 |
    ~ g f4 r8 r4 r8 a | g bes a g f des f f |
    ~ f aes bes f aes bes r4 | r8 ees, g bes a fis r4 |
    [g8 bes]  [\times 2/3 {a16 bes a} g8] c gis a f | r2 r8 d'4. \bar "||"

    c4 r16 g ees c b'8 g4 g8 | \times 2/3 {bes! c bes} g ees aes ges b, f' |
    a f a g ~ g4. g8 | r2 r4 r8 bes | 
    des16 bes gis a c bes ges8 ~ ges aes f e | ees aes aes4 aes8 aes ~ [aes ges16 e!] | 
    [\times 2/3 {f16 aes c} ees8] ~ [ees d16 c] des bes r8 r4 | r8 g des f aes e des c \bar "||"
    
    r8 c'4. bes8 a \times 2/3 {e f fis} | g d' bes g a cis, r g' |
    r f r4 r r8 a | g bes a g r f4 bes8 |
    b bes aes f bes aes ~ aes4 | r8 c bes gis a cis, d f | 
    ~ f d f a r f ~ f d | f4-\marcato f2. \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

#(set! minimumVerticalExtent 4)
