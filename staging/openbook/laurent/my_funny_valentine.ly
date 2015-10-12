\header {
    title = "My Funny Valentine"
    composer = "Lorenz Hart \\& Richard Rodgers"
    enteredby = "Laurent Martelli"
    themeid = "92"
    tagline = #tagline
    head = #instrument
}

\include "my_funny_valentine_inc.ly"

Breaks = \notes \relative g' {
    \headOff \stemOff
    s1*8 | 
    s1*8 | 
    \repeat unfold 6 { g4 g g g | } g2 g | g4 g g g |
    s1*6 | g2 g | g g |
}

Score = <
    \context ChordNames \Chords
    \context Staff \notes \transpose ees' \Tune
    \context Staff \Breaks
>



