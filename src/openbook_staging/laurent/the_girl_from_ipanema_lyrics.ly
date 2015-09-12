\header {
    filename = "the_girl_from_ipanema.ly"
    title = "The Girl From Ipanema"
    indexTitle = "The Girl From Ipanema (with english lyrics)"
    subtitle = "garota de ipanema"
    composer = "Antonio Carlos Jobim"
    enteredby = "Laurent Martelli"
    copyright = "© 1959 editora musical arapua, brazil"
    tagline = #tagline
    head = #instrument
}

\include "the_girl_from_ipanema_inc.ly"

Score = <
    {
	\context ChordNames \intro
	\context ChordNames \harmony
    }
    \addlyrics
    	\context Staff \melody
    	\context Lyrics <\texta \textb> 
>
