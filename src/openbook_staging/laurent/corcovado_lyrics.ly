\header{
    title = "Corcovado"
    subtitle = "quiet nights of quiet stars"
    composer = "Antonio Carlos Jobim"
    enteredby = "Laurent Martelli"
    copyright = "© 1959 Editora Musical Arapua, Brazil"
    indexTitle = "Corcovado (with english lyrics)"
    tagline = #tagline
    head = #instrument
}

\include "corcovado_inc.ly"

text = \lyrics {
    Qui -- et nights of qui -- et stars,
    qui -- et chords from my gui -- tar
    float -- ing on the si -- lence that sur -- rounds us

    Qui -- et thoughts and qui -- et dreams 
    qui -- et walks by qui -- et streams, 
    and a win -- dow look -- ing on the mount -- tains and the sea.
    How love -- ly!

    This is where I want to be,
    here with you so close to me,
    un -- til the fina -- al flick -- er of life's em -- ber.

    I who was lost and lone -- ly,
    be -- liev -- ing life was on -- ly
    a bit -- ter tra -- gic joke have found with you 
    the mean -- ing of ex -- is -- tence, oh, my love.

}

Score =  < 
    \context ChordNames \harmony
    \addlyrics
    	\context Staff \melody
    	\context Lyrics \text
>
