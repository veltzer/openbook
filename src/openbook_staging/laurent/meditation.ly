\header {
    title = "Meditation"
    subtitle = "Meditacáo"
    composer = "Antonio Carlos Jobim"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}



Chords = \chords {
    \repeat volta 2 {
	c1*2 | fis1:m7/b | b:7 | 
	c1 | f:7 | e:m7 | a:7.5+ |

	d1*2:m7 | f1:m7 | bes:7 | 
	e:m7 | a:7.5+ | d:m7 | g:7.5+  |
    }

    f1*2:maj | f1:m7 | bes:7 | 
    e:m7 | ees:dim7 | d:m7 | g:7.5+ |

    c1*2 | fis1:m7/b | b:7 | 
    c1 | d2:m7 ees:dim7 | e1:m7 | a:7.5+ | 
    
    d1*2:m7 | f1:m7 | bes:7 | 
    e2:m7 a:7.5+ | d:m7 g:7.9- | c1:maj | d:m7/+g |
}

Tune = \notes \relative d'' {
    \time 4/4
    \key c \major

    \repeat volta 2 {
	a1 | ~ a2 ~ a8 g4 b8 | ~ b bes4 a8 ~ a2 | ~ a ~ a8 fis g a | 
	~ a a a a ~ a a a a | ~ a g4 b8 ~ b g4 a8 | ~ a b4 a8 ~ a2 | ~ a r \bar "||"

	f1 | ~ f2 ~ f8 e4 g8 | ~ g ges4 f8 ~ f2 | ~ f ~ f8 c d e | 
	~ e e e e ~ e dis e f | ~ f2 r8 e f g | ~ g g g  g ~ g fis g a | ~ a1 \break
    }

    c1 ~ | c2 ~ c8 b4 d8 | ~ d des4 c8 ~ c2 | ~ c r8 b4 d8 | 
    ~ d des4 c8 ~ c b4 d8 | ~ d des4 c8 ~ c b4 a8 | ~ a1 | ~ a2 r \bar "||"

    a1 | ~ a2 ~ a8 g4 b8 | ~ b bes4 a8 ~ a2 | ~ a ~ a8 fis g a | 
    ~ a a a a ~ a a a a | ~ a g4 b8 ~ b g4 a8 | ~ a b4 a8 ~ a2 | ~ a r \bar "||"
    
    f1 | ~ f2 ~ f8 e4 g8 | ~ g ges4 f8 ~ f2 | ~ f ~ f8 c d e | 
    ~ e e e f ~ f f f d | ~ d d d e ~ e e e c | ~ c1 | ~ c4 r4 r2 \bar "||" \break
    
%coda
    %\repeat volta 2 { s1*4 }
}

Spaces = \notes \transpose c' {
    \stemOff  \headOff 
    \repeat volta 2 { s1*14 } \alternative  { { s1*2 } { s1*2 } }
    s1*11 | d,2 d |
}

Score = <
    \context ChordNames \Chords
    \context Staff \Tune 
>
