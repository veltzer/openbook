\header {
    title = "Laura"
    composer = "David Raksin"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    e1:m7 \bar "|:"
    a:m7 | a2:m7/+d d | g:maj c:7 | g1:maj | \break
    g:m7 | g2:m7/+c c:7.9-.5+ | f:maj g:m7 | a:m7 g:m7 \bar "||" \break
    f1:m7 | bes:7 | ees:maj | g2:m7 c:m7 | \break
    a1:7.5- | d2:7.9- d:9 | g1:maj | b2:m7.5- e:7.9- \bar "||" \break

    a1:m7 | a2:m7/+d d:7.5+.9- | g:maj a:m7 | bes:dim7 b:m7 | \break
    g1:m7 | des2:7 c:7.5+.9- | f:maj bes:7 | f1:maj | \break
    f2:m7 f:m.7+ | d:m7.5- g:7.5- | c:maj d:m7 | e:m7 a:m7 | \break
    d1:7.5+.9- | g:9 | fis2:m7.5- b:7 | f:m7 bes:7 | \break

    fis2:m7.5- f:m7 | e:m7 ees:7 | d:m7 des:maj | c:maj.11+^5.9
}

Tune = \notes \relative c'' {
    \time 4/4
    \key c \major

    r8 e4. c4 d \bar "|:" 
    b4. b8 ~ b2 | \times 2/3 { r4 ais b } \times 2/3 { ais fis g } |
    a!4. a8 e2 | ~ e2 e8 b \times 2/3 {d8 e g} | a4. a8 ~ a2 | 
    ~ a4. gis16 a \times 2/3 { gis4 e f } | g1 | ~ g2. r4 \bar "||"

    r8 c, ees f ~ f2 | ~ f4 ees \times 2/3 {f ees f } | g4 g8 d ~ d2 |
    r8 ees4. g4 bes8 ees ~ | ees4. ees8 gis,2 | 
    ~ gis a2 | d1 | ~ d4 e c d \bar "||" 

    b2 b2 |  \times 2/3 { ~ b4 ais b } \times 2/3 {ais fis g} | 
    a4 a8 e ~ e2 | ~ e2 ~ e8 d e16 d cis d |
    a'4. a8 ~ a2 | ~ a4 \times 2/3 {r8 gis a} g8 a f g | ~ g1 | g2. c,4 |
    g'4. g8 ~ g2 | ~ \times 2/3 { g2 a4 } \times 2/3 {f gis b} | d4. c8 d2 | ~ d2 b4 c |
    ees2 ees | \times 2/3 { ees4 e ees } \times 2/3 {d4 a b} \toCoda | c1 | ~ c4 r c2 \bar ":|"

    \coda c1 | c | c | c-\fermata \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

#(set! minimumVerticalExtent 5)
