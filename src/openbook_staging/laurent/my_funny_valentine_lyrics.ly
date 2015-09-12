\header {
    title = "My Funny Valentine"
    indexTitle = "My Funny Valentine (with lyrics)"
    composer = "Lorenz Hart \\& Richard Rodgers"
    enteredby = "Laurent Martelli"
    themeid = "92"
    tagline = #tagline
    head = #instrument
}

\include "my_funny_valentine_inc.ly"

Lyrics = \lyrics {
    My fun -- ny Va -- len -- tine
    Sweet co -- mic Va -- len -- tine
    You make me smile with my heart
    Your looks are laugh -- a -- ble
    Un -- pho -- to -- graph -- a -- ble
    Yet you're my fa -- vourite work of art

    Is your fi -- gure less than Greek
    Is your mouth a lit -- tle weak
    When you o -- pen it to speak
    Are you smart?

    But don't change a hair for me
    Not if you care for me
    Stay lit -- tle Va -- len -- tine stay
    Each day is Va -- len -- tine's day
}

Breaks = \notes \relative g' {
    \headOff \stemOff
    s1*8 | 
    s1*8 | 
    \repeat unfold 6 { g4 g g g | } g2 g | g4 g g g |
    s1*6 | g2 g | g g |
}

Score = <
    \context ChordNames \Chords
    \addlyrics
    	\context Staff \notes \transpose ees' \Tune
    	\context Lyrics \Lyrics
    \context Staff \Breaks
>
