\header{
    title = "Wave"
    subtitle = "Vou Te Contar"
    composer =	 "Antonio Carlos Jobim"
    enteredby =	 "Laurent Martelli"
    copyright =	 "© 1967-1968 Antonio Carlos Jobim "
    indexTitle = "Wave (transposed in B flat)"
    themeid = "2223"
    tagline = #tagline
    head = #instrument
}

\include "wave_inc.ly"

Score =  < 
    \context ChordNames \harmony
    \context Staff \notes \transpose aes { \melody }
>
