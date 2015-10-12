\header {
    title = "Old Devil Moon"
    composer = "E.Y Harburg \& Burton Lane"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    f1:maj | c:m7/+f | f1:maj  | c:m7/+f | f1:maj | c:m7/+f | f1:maj | c2:m7 f:7 | 
    bes1*2:maj      | bes1:m7 | ees:7  | aes2:m7 des:7 | ges:maj c:7 | f1:maj | c:m7/+f |
    f2:maj c2*3:m7/+f d2*3:maj d2*3:m7 | g1:7 | g:m7 | c:7 |

    f1:maj | c:m7/+f | f1:maj  | c:m7/+f | f1:maj | c:m7/+f | f1:maj | c2:m7 f:7 | 
    bes1*2:maj      | bes1:m7 | ees:7  | aes2:m7 des:7 | ges:maj c:7 | f1:maj | c:m7/+f |
    f2*3:maj c2:m7/+f | f1:maj | c:m7/+f | a2:m7 d:7.9+ | g:m7 c:7 | f1:maj | g2:m7 c:7 |
    
}

Tune = \notes \relative g' {
    \time 4/4
    \key f \major

    \repeat unfold 2 {
	f1 | ees8. ees16 ees8. ees16 ees4 g | f1 | g8. g16 g8. g16 g4 bes | a1 |
	bes8. bes16 bes8. bes16 bes4 d | c1 ~ | c2 c4 c \bar "||" 

	c2 bes8 a4 f8 ~ | f2 a4 bes | c2 bes8 a4 f8 ~| f2 a4 bes | des2 b8 bes4 ges8 ~ | 
	ges2 a8 g!4 f8 ~ | f1 |  
    } \alternative {
	{  r2 ees8. c16 ees8 f8 ~ | f2 ees8. c16 ees8 g8 ~ | 
	   g2 \times 2/3 { ees4 c ees } | a2 a2 ~ | a2 f8. d16 f8 a ~ | a2 f8. d16 f8 b ~ | 
	   b2 \times 2/3 { f4 d f } | c'2 c2 ~ | c8 d4 aes8 g8. f16 d8. c16 \bar "||" }
	{  r2 ees8. c16 ees8 f8 ~ | f2 f2 ~ | f2 ees8. c16 ees8 f8 ~ | f1 ~ | 
	   f2 \times 2/3 { ees'4 ees ees } | c2 \times 2/3 { bes4 c bes } | 
	   a2 \times 2/3 { f4 ees e } | f1 | r \bar "|." }
    }
}

Score =   <
    \context ChordNames \Chords
    \context Staff \Tune
>

