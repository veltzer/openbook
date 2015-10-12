\header{
    title = "Cherokee"
    composer = "Ray Noble"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

melody = \notes \relative c' {
    \time 4/4
    \key bes \major

    \repeat volta 2 { d1 f2 g | bes1 g | f d2 f | d1 c | bes d2 f | d'1 bes  }
    \alternative { { g f2 d | c1 cis } { g d | bes ~ bes \bar "||" } } 

    dis1 ~ dis2 cis | cis4 ais fis2 ~ fis cis' | cis4 a fis2 ~ fis b | e,1 ~ e | 
    b' ~ b2 a | a4 fis d2 ~ d a' | a4 f d2 ~ d g | c,1 cis \bar "|." 
    
    d1 f2 g | bes1 g | f d2 f | d1 c | bes d2 f | d'1 bes | g d | bes ~ bes
}


harmony = \notes \chords {
    \repeat volta 2 { 
	bes1.:maj f2:7 | f1:m7 | bes:7 | ees1*2:maj | aes1*2:7 \break | bes1. d2:m7 | c1*2:7 |
    }
    \alternative { { c1:m7 | d2:m7.5- g:7 | c1:m7 | f:7 \break } { c1:m7 | f:7 | bes1*2:maj} }

    cis1:m7 | fis:7 | b1*2:maj | b1:m7 | e:7 | a1*2:maj | a1:m7 | d:7 | 
    g1*2:maj | g1:m7 | c:7 | c:m7 | f:7 |

    bes1.:maj f2:7 | bes1*2:7 | ees:maj | aes:7 | bes1. d2:m7 | c1*2:7 | c1:m7 | f:7 | bes1*2 \bar "|."
}

\midi { \tempo 4 = 200 }

Score =  < 
    \context ChordNames \harmony
    \context Staff \melody
>
