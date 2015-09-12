\header{
    title = "Insensatez"
    subtitle = "How insensitive"
    composer = "Antonio Carlos Jobim"
    enteredby = "Laurent Martelli"
    copyright = "© 1963,1964 Antonio Carlos Jobim and Vinicius DeMoraes"
    tagline = #tagline
    head = #instrument
}

melody = \notes \relative g' {
    \time 4/4
    \key f \major
    
    a1 | ~ a4 bes8 a8 ~ a8 bes4 a8 | ~ a1 | ~ a4 bes8 a8 ~ a8 bes4 a8 |
    ~ a2 ~ a8 gis4 a8 | c8 b4 bes8 ~ bes a4 a8 | ~ a4. g8 ~ g2 | ~ g2 ~ g4. g8 \bar "||"

    ~ g1 | ~ g4 a8 g ~ g a4 g8 | ~ g1 | ~ g4 a8 g ~ g a4 g8 | 
    ~ g2 r8 fis4 g8 | bes a4 gis8 ~ gis g4 g8 | ~ g4. f8 ~ f2 | ~ f2 ~ f4. f8 \bar "||"

    ~ f1 | ~ f4 g8 f ~ f g4 f8 | ~ f1 | ~ f4 g8 f ~ f g4 a8 | 
    ~ a2. f4 | d e8 d ~ d e4 f8 | ~ f2 f | ~ f ~ f4. f8 | 
    ~ f1 | ~ f4 g8 f ~ f g4 e8 | ~ e1 | ~ e4 f8 e ~ e f4 e8 | 
    ~ e2 r8 dis8 e g | ~ g fis4 f8 ~ f e4 e8 | ~ e4. d8 ~ d2 | ~ d4 r r2 \bar "|."
    s1*5 s1*4
}


harmony = \notes \chords {
    d1*2:min7 | cis1*2:dim7 |  \break
    c1*2:min7 | g1*2:7/+b | \break
    bes1*2:maj | ees1*2:maj | \break
    e1:min7.5- | a:7.9+ | d1*2:min7 | \break

    c1:min7 | f:7 | b1*2:dim7 | \break
    bes1:maj | e2:min7.5- a:7.9+ | d1*2:min7 | \break
    c1:min7 | f:7 | b:min7 | e:7.9- | \break
    e:min7.5- | a:7.9+ | d:min7  \toCoda | a:7.9+ | \break \coda
    b1:min7.5- \bar "||" e:min7.5- | a:7.9+ | d:min7 | \break
    b:min7.5- | bes:maj | a:7.9+ | d:min7  g:7.4+ \bar "|."
}

Score =  < 
    \context ChordNames \harmony
    \context Staff \melody
>

#(set! minimumVerticalExtent 5)
