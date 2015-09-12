\header{
    title = "Con Alma"
    composer = "Dizzy Gillespie"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

melody = \notes \relative g' {
    \time 4/4
    \key bes \major
    \repeat volta 2 {
	gis2 gis | gis gis | gis4 bes8 b bes4 gis | g!2 ges4 aes | \break
	f2 f | f f | f4 g8 aes g4 f8 g |
    } \alternative { { e2 r | \break } { e2 \times 2/3 {r4 ees f} } }
    \tupletBracketUp
    \times 2/3 {ges4 f ees8 d} ees2 ~ | ees ees8 f ges aes |
    \times 2/3 {a!4 gis fis8 f} fis2 ~ | \break fis ~ fis8 fis gis a | 
    b1 ~ | b2 \times 2/3 {e,4 gis b8 cis} | 
    bes1 ~ | bes \bar "||"
}


harmony = \notes \chords {
    \repeat volta 2 {
	e2:maj gis:7/dis | cis:m7 b:7 | bes1:7 | ees2:maj ees4:m7 aes:7 |
	des2:maj f:7/c | bes:m7 aes:7 | g1:7 | 
    } \alternative { {c2:maj fis4:m7 b:7} {c1:maj} }
    c1:m7.5- | f:7.9- | fis:m7 | b:7 | 
    e1*2:maj | f1:m7 | bes:7 |
}

\midi { \tempo 4 = 100 }

Score =  < 
    \context ChordNames \harmony
    \context Staff \melody
>
