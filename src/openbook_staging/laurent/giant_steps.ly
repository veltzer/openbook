\header{
    title = "Giant Steps"
    composer =  "John Coltrane"
    enteredby = "Laurent Martelli"
    copyright = "© 1974 Jowcol Music"
    tagline = #tagline
    head = #instrument
}

melody = \notes \relative c' {
    \time 4/4
    \key c \major

    fis'2 d | b g4. bes8 | ~ bes1 | b4. a8 ~ a2 |
    d bes | g dis4. fis8 | ~ fis1 | g2 f4. bes8 \bar "||"
    ~ bes1 | b2 a4. d8 | ~ d1 | dis2 dis4. fis8 | 
    ~ fis1 | g2 g4. bes8 | ~ bes1 | fis4. fis8-. r2 \bar "||"
}

harmony = \notes \chords {
    bes2:maj d:7 | g:maj   bes:7 | ees1:maj   | a2:m7   d:7   | \break
    g:maj bes:m7 | ees:maj fis:7 | b1:maj     | f2:m7   bes4.:7 ees8:maj | \break
    
    ees1:maj     | a2:m7   d4.:7 g8:maj | R1     | cis2:m7 fis4.:7 bes8:maj | \break
    bes1:maj     | f2:m7   bes4.:7 ees8:maj | R1  | cis4.:m7 fis8:7 R2 |
}

Score =  \notes < 
    \context ChordNames \harmony
    \context Staff \melody
>

\midi { \tempo 4 = 150 }


