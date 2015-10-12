\header{
    title = "Agua De Beber"
    indexTitle = "Agua De Beber (uncomplete)"
    composer = "Antonio Carlos Jobim"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

melody = \notes \relative c' {
    \time 4/4
    \key ees \major
    \clef treble

    r4 c8 ees ~ ees g4 fis8 ~ | fis2 g | ees2 ~ ees8 c4 ees8 ~ | ees c4. ~ c2 |
    r4 c8 ees ~ ees g4 bes8 ~ | bes4. c8 ~ c4. g8 | g2 ~ g8 f4 g8 ~ | g2. r4 |
    r4 c8 ees ~ ees g4 fis8 ~ | fis2 g | ees2 ~ ees8 c4 ees8 ~ | ees c4. ~ c2 |
    r2 r4 r8 ees8 ~ | ees ees4 ees8 ~ ees ees ees4 | d4. a8 ~ a c4 ees8 ~ | ees d4 c8 ~ c2 | 
    c4 c8 ees8 ~ ees g4 f8 ~ | f1 | g4 f8 ees8 ~ ees c4 ees8 ~ | c4 c8 c2 | 
    c4 c8 ees8 ~ ees g4 f8 ~ | f1 | f4 f8 
    \bar "|."
}

harmony = \notes \chords {
    R1 |
    d2:7 c:m/+e | f8*5:m7 aes4:maj f8:m7/aes | c1:m7 | c8*7:m7 g2:m7 aes:maj aes8:maj/g | 
    
}

Score = <
    \context ChordNames \harmony
    \context Staff \melody
>
