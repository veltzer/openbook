\header {
    title = "Black Orpheus"
    composer = "Louis Bonfi"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 4 R4 |
    a1:m7 | b2:m7.5- e:7.9- | a1:m7 | b2:m7.5- e:7.9- |
    a1:m7 | d2:m7 g:7 | c1:maj | cis2:dim7 a:7.9- |
    d1:m7 | g:7 | c:6 | f:maj | 
    b1:m7.5- | e:7.9- | a:m7 | b2:m7.5- e:7.9- |

    a1:m7 | b2:m7.5- e:7.9- | a1:m7 | b2:m7.5- e:7.9- |
    e1:m7.5- | a:7.9- | d1*2:m7 |
    d2:m7 d:m7/c | b:m7.5- e:7.9- | a:m7 a:m7/g | f1:maj |
    b:m7.5- | e:7.9- | a:m7 | b2:m7.5- e:7.9- |

    a1:m7 | d2:m7 a:m7 | d2:m7 a:m7 | d:m7 e:m7 | a1*2:m7
}

Tune = \notes \relative e' {
    \time 4/4
    \key c \major

%    \property Score.SpacingSpanner \override #'shortest-duration-space = #'1.0

    \partial 4 e4 \bar "|:"
    c'2. b8 a | a2. fis8 b | e,1 | ~ e2. e4 | \break
    c'2. b8 a | a2 ~ \times 2/3 { ~ a4 g b } | e,1 | ~ e2 r8 e f g | \break
    a4. d,8 d2 | ~ d r8 d e f | g4. c,8 c2 | ~ c r8 c d e | \break
    f4. b,8 b2 | ~ b r8 b c d | e1 | ~ e2. e4 \bar "||" \break

    c'2. b8 a | a2. gis8 b | e,1 | ~ e2. e4 | \break
    bes'2. a8 g | g2. f8 e | a1 | ~ a2. d,4 | \break
    d2. e8 f | b1 | r4 c,4 c d8 e | a2. gis4 | \break
    e1 | r2 e4 gis8 b | a1 \toCoda | ~ a2. e4 \bar ":|" \break
    \coda ~ a2. a8 b | c4 d8 c b4 a8 b | c4 d8 c b4 a8 b | 
     c4 d8 c b4 a8 g | a1 ~ a2. r4 \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

#(set! minimumVerticalExtent 4)
