\header{
    title = "Tenderly"
    subtitle = ""
    composer = "Walter Gross \& Jack Lawrence"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

melody = \notes \relative c'' {
    \time 4/4
    \key f \major
    
    \partial 4. c8 d f | 
    e2 ~ e8 c d f | e2. c8 aes | g1 | ~ g2 r8 f g bes | 
    a2 ~ a8 f g bes | a2. f8 des | c1 | ~ c2 r4 c |
    des2. c'4 | a2. c,4 | des2 f4 c' | a2. g4 |
    f2 a4 g' | e2. g,4 | c1 | ~ c2 r8 c d f \bar "||" 
    
    e2 ~ e8 c d f | e2. c8 aes | g1 | ~ g2 r8 f g bes | 
    a2 ~ a8 f g bes | a2. f8 des | c1 | ~ c2 r4 c |
    des2 f4 c' | a2. g4 | f2 a4 g' | e2 ~ e8 f d e | 
    c2 ~ c8 d bes c | a2 ~ a8 g bes e, | f1 | r |
}

harmony = \notes \chords {
    \partial 4. R4. |
    f1:maj      | bes:9         | f:m9    | bes:13         | \break
    g:m9        | ees:9         | f:maj   | a2:m7 d:7      | \break
    g1:m7.5-    | c:13          | g:m7.5- | c2:13 cis:dim7 | \break
    d1:m7       | g:13          | g:m7    | c:7            | \break
    
    f1:maj      | bes:9         | f:m9    | bes:13         | \break
    g:m9        | ees:9         | f:maj   | a2:m7 d:7      | \break
    g1:m7.5-    | c2:13 cis:dim7| d1:m7   | g2:13 gis:dim7 | \break
    a:m7 d:7.5+ | g:m9  c:7     | f1:6    | g2:m7 c:7      |
}

Score =  \notes \transpose bes < 
    \context ChordNames \harmony
    \context Staff \melody
>
