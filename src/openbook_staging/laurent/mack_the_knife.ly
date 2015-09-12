\header {
    title = "Mack The Knife"
    composer = "Kurt Weill"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

\include "mack_the_knife_inc.ly"

Score = <
    \context ChordNames \Chords
    \context Staff < \Tune \Breaks >
>

