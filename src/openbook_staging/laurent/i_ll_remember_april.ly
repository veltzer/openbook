\header {
    title = "I'll Remember April"
    composer = "Gene de Paul"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
    themeid = "3291"
}

Chords = \chords {
    g1:maj | g:6 | g:maj | g:6 |
    g:m7 | g:m6 | g:m7 | g:m6 |
    a:m7.5- | d:7 | b:m7.5- | e:7 | 
    a:m7 | d:7 | g:maj | g:7.9- |

    c:m7 | f:7 | bes:maj | g:m7 |
    c:m7 | f:7 | bes:maj | bes:6 |
    a:m7 | d:7 | g:maj | g:6 |
    fis:m7 | b:7 | e:maj | a2:m7 d:7 |

    g1:maj | g:6 | g:maj | g:6 |
    g:m7 | g:m6 | g:m7 | g:m6 |
    a:m7.5- | d:7 | b:m7.5- | e:7 | 
    a:m7 | d:7 | g1*2:maj |    
}

Tune = \notes \relative c'' {
    \time 4/4
    \key g \major
    r4 b c d | c b a g | a2. g4 | fis e2. | 
    r4 a bes c | bes a g f | g8 a g2. | ~ g2 r8 g4. | 
    a2. a4 | a a b c | d4. d8 ~ d2 | ~ d e4. d8 | 
    b4 c d c ~ | c2 b4 ais | b1 | ~ b2 r8 b4.  \bar "||" \break

    g4 g g2 | ~ g4 a4 bes c | d2. c4 | bes g2 f4 |
    g4 g g2 | ~ g4 a bes c | d2 d4 d | ~ d d \times 2/3 {d d d} |
    d2. d4 | e c d4. b8 | a4 b2. | ~ b4 b d c | 
    b b2. | ~ b2 \times 2/3 {b4 a gis} | b1  | ~ b \bar "||" \break

    r4 b c d | c b a g | a2. g4 | fis e2. | 
    r4 a bes c | bes a g f | g8 a g2. | ~ g2 r8 g4. | 
    a4. a8 a2 | ~ a4 a \times 2/3 {a b c} | d2 d ~ | d e4. d8 | 
    b4 c d c | ~ c2 b4 b | g1  |~ g4 r r2 \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff { \Tune }
>

#(set! minimumVerticalExtent 4)
