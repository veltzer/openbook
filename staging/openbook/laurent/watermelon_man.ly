\header {
    title = "Watermelon Man"
    composer = "Herbie Hancock"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

%% the tune in C
Tune = \notes \relative c''' { 
    \key c \major
    \time 4/4

    \property Staff.midiInstrument = "trumpet"

    \repeat "volta" 2 {
	ees1 | ~ ees4 f,8 f <aes c(> <)bes4-. d-.> f8 | ~ f1 | ~ f2 r | \break
	f'1 | ~ f4 f,8 f <aes c> <bes4-. d-.> f8 | ~ f1 | ~ f2 r | \break
	r4 c'8( c g'4 a | aes8 g f d f4 )g-. | 
	r4 c,8( c g'4 a | aes8 g f d c4 )d-. | \break
	r4 c8( c g'4 aes | )f-. f,8 f <aes c> <bes4-. d-.> f8 | ~ f1 | r1 
    }
}

Chords = \chords {
    \repeat "volta" 2 {
	f1*4:7 | bes1*2:7 | f1*2:7 | 
	c1:7 | bes:7 | c:7 | bes:7 | c:7 | bes:7 | f1*2:7 |
    } 
}

Score = <
    \context ChordNames \Chords
    \context Staff \Tune
>

