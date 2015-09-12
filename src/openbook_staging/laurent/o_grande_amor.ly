\header{
    title = "O Grande Amor"
    composer =	 "Antonio Carlos Jobim \& Vinicius DeMoraes"
    enteredby =	 "Laurent Martelli"
    copyright =	 "© 1965 Antonio Carlos Jobim and Vinicius DeMoraes"
    tagline = #tagline
    head = #instrument
}

melody = \notes \relative g'' {
    \time 4/4
    \key c \major
    
    \repeat volta 2 { s1*4 }
    \repeat volta 2 {
	a2. f4 | e2 ~ e8 d4 c8 | ~ c1| r4 d8 c ~ c d4 b8 | 
	~ b2 c2 | b4. b8 ~ b d4 c8 | ~ c c4 c8 ~ c2 | r1 \bar "||"

	d2. a'4 | g2 ~ g8 f4 c8 | ~ c2 \times 2/3 {d4 c d} | e8 g4 f8 ~ f e4 d8 |
	~ d1 | r4 f8 e ~ e d4 c8 | c2 \times 2/3 {b4 ais b} | d1 |
	
	a'2. f4 | e2 ~ e8 d4 c8 | ~ c1| r4 d8 c ~ c d4 b8 | 
	~ b1 | r4 c8 b ~ b c4 bes8 | ~ bes1 | r4 c8 bes ~ bes c4 a8 \bar "||" 

	~ a1 | r4 b8 a ~ a b4 a8 | a1 | r4 b8 c ~ c e4 d8 | 
	~ d1 | r4 e8 gis ~ gis b4 a8 | ~ a1 | ~ a1 |
    }
}


harmony = \notes \chords {
    \repeat volta 2 { a1:m7 | a:m6 | d:m7/+a | a:m6 \break }
    \repeat volta 2 {
	a1:m7 | gis:dim7 | g:m7 | c:7 | \break
	b:m7.5- | e:7.9+ | a:m7 | a:7.9+ | \break

	d:m7 | g:7 | c:maj | f:maj | \break
	bes1*2:maj | b1:min7.5- | e:7.9+ | \break

	a1:m7 | gis:dim7 | g:m7 | c:7 | \break
	b:m7.5- | e:7.9+ | e:m7.5- | a:7.9+ | \break

	d:min7 | ees:dim7 | a:m7/+e | f:maj | \break
	bes:maj | b2:m7.5- e:7.9+ | a1:m7 | e:7.9+ | \break
    }
}

\midi { \tempo 4 = 144 }

Score =  < 
    \context ChordNames \harmony
    \context Staff \melody
>

#(set! minimumVerticalExtent 4)
