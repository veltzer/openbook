\header{
    title = "Four Brothers"
    composer = "Jimmy Giuffre"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

A = \notes \relative c'' {
    d8 cis d cis d bes g e | ees g bes d cis a f ees | 
    d f a c r bes r f | a g4. r4 r8 a | 
    bes g ees c bes' g ees c | a'4-. c,8 b ~ b4 r8 fis' |
}

melody = \notes \relative c'' {
    \time 4/4
    \key bes \major
    
    \property Staff.midiInstrument = "tenor sax"

    \rehearsalBeginOfLine \firstMarkOffset
    \boxedMark \mark "A" 
    \repeat volta 2 {
	\A
    } \alternative {
	{ g8 ees d c f d ees f ~ | f4 r r r8 cis' | }
	{ g8 ees d c f cis d bes ~ | bes4 r r r8 a' \bar "||" }
    }
    \break
    \markOffset \mark "B"
    bes ges ees des c ees ges bes | aes f ges aes ~ aes4 r |
    gis8 e dis cis b' g a b ~ | b2 r4 r8 gis |
    g! fis e d cis e g b | a g fis e dis c' b f | 
    a g r d fis4 e8 d | r g4. r4 r8 cis8 \bar "||"

    \break
    \mark "C"
    \A
    g8 ees! d c f cis d bes ~ | bes4 r r2 \bar "|." 
}

harmony = \notes \chords {
    \repeat volta 2 {
	c1:9 | c2:m7 f:7.5+ | bes1:maj | g:9 |
	c:m7 | d2:m7 g:7 | 
    } \alternative {
	{ c:m7 f:7 | bes:maj g:7 | }
	{ c:m7 f:7 | bes1:6 | }
    }

    ees2:m7 aes:7 | des1:maj | fis2:m7 b:7 | e1:maj |
    e2:m7 a:7 | d:maj dis:dim7 | e:m7 a:7 | d:m7 g:7 |

    c1:9 | c2:m7 f:7.5+ | bes1:maj | g:9 |
    c:m7 | d2:m7 g:7 | c:m7 f:7 | bes1:6 |
    
}

Score =  \notes \transpose bes < 
    \context ChordNames \harmony
    \context Staff \melody
>

\midi { \tempo 4 = 178 }

#(set! shortestDurationSpace 3)
#(set! minimumVerticalExtent 4)
