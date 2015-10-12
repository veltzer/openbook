\header {
    title = "My Favorite Things"
    composer = "Oscar Hammerstein \\& Richard Rodgers"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
				% Intro
    \repeat volta 2 { \repeat percent 4 { e4*3:m7 | f:maj.4+ } }

    \repeat volta 2 {
	e4*12:m7 | c:maj \bar "||"
	a4*3:m7 | d:7 | g:maj | c:maj | g:maj | c:maj | fis:m7.5- | b:7.9- |
    }
    e4*12:m7 | a:maj \bar "||"
    a4*3:m7 | d:7 | g:maj | c:maj | g:maj | c:maj | fis:m7.5- | b:7.9- \bar "||"
    
    e4*6:m7 | fis4*3:m7.5- | b:7.9- | e:m7 | e:m7/+d | c4*6:maj |
    c4*6:maj | a:7 | g4*3:maj | c4*6:maj | d4*3:7 \bar "||"

    \repeat unfold 3 { g4*3:maj | c:maj } fis:m7.5- | b:7.9- 
}

Tune = \notes \relative e' {
    \time 3/4
    \key g \major

				% Intro
    \repeat volta 2 { \repeat percent 4 { R4*3 | R4*3 } } \break

    \repeat volta 2 {
	\repeat unfold 2 { e4 b' b | fis e e | b e e | fis e2 | } \break
	e4 b' a | e fis d | d a' g | c,2. | b4 c d | e fis g | a b a | dis,2. |
    }  \break
    \repeat unfold 2 { e4 b' b | fis e e | b e e | fis e2 | } \break
    e4 b' a | e fis d | d a' g | c,2. | b4 c d | e fis g | a ais b | c2. | \break

    r4 b b | b2 e,4 | r a a | a2 dis,4 | r g g | g2 b,4 | e2. ~ | e2 e4 |
    e fis e | fis e fis | g a g | a2 g4 | b c b | c2. ~ | c2. | b | \break
    g2. ~ | g ~ | g ~ | g | r | r | r | r |
}

Score = <
    \context ChordNames \Chords
    \context Staff \Tune
>

%#(set! minimumVerticalExtent 4)
