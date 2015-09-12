\header{
    title = "The Shadow Of Your Smile"
    composer = "Mandel"
    enteredby = "Laurent Martelli"
    tagline = #tagline
}

melody = \notes \relative c' {
    \time 4/4 
    \key g \major

    \partial 8*5 b8 e fis g b | 
    \repeat volta 2 {
	cis,2. fis4 | dis2. c!4 | b1 ~ | b4. b8 e fis g b | 
	e,2. a4 | fis2. d4 | b'1 ~ | b2 c8 b a g \bar "||"

	a2. c,4 | b2. a'4 | g1 ~ | g2 b8 a g fis | 
	g2. b,4 | ais2. g'4 | fis1 ~ | fis4 r8 b,8 e fis g b \bar "||" 

	cis,2. fis4 | dis2. c!4 | b1 ~ | b4. b8 e fis g b | 
	e,2. c'4 | a2. fis4 | d'1 ~ | d2 e8 d c b \bar "||"

	c4. e,8 c'2 ~ | c d8 c b a | b4. d,8 b'2 ~ | b c8 b a gis | 
	c4. cis,8 a'2 ~ | a4. c,!8 b' a g fis | g1 | r4 r8 b,8 e fis g b | 
    }
}


harmony = \notes \chords {
    \partial 8*5 R8 R2 |
    \repeat volta 2 {
	fis1:m7 | b2.:7.9 b4:7.9- | e1:m7 | a:7 |
	a:m7 | d:7 | g:maj | c:maj | 

	fis1:m7 | b:7 | e1.:m7 e2:m7/+d |
	cis1:m7.5- | fis:7 | fis:m7 | b:7 |

	fis1:m7 | b2.:7.9 b4:7.9- | e1:m7 | a:7 |
	a:m7 | d:7 | b:m7.5- | e:7.5+ | 

	a:m7 | c2:m7 f:7 | b1:m7 | e:7.9- |
	a2:7 ees:7 | a:m7 d:7.9- | g1.:6 b2:7 |
    }
}

Score =  < 
    \context ChordNames \harmony
    \context Staff \melody
>
