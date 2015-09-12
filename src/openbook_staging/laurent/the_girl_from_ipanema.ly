\header {
    filename = "the_girl_from_ipanema.ly"
    title = "The Girl From Ipanema"
    subtitle = "garota de ipanema"
    composer = "Antonio Carlos Jobim"
    enteredby = "Laurent Martelli"
    copyright = "© 1959 editora musical arapua, brazil"
    tagline = #tagline
    head = #instrument
}

#(set! minimumVerticalExtent 4)

\include "the_girl_from_ipanema_inc.ly"

Score = <
    {
	\context ChordNames \intro
	\context ChordNames \harmony
    }
    \context Staff \melody
>
