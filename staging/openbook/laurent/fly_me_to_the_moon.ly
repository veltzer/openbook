\header{
    title = "Fly Me To The Moon"
    composer =  "Bart Howard"
    enteredby = "Laurent Martelli"
    copyright = "© 1954 Hapshire House Publishing Corp."
    tagline = #tagline
    head = #instrument
}

melody = \notes \relative c' {
    \time 4/4
    \key c \major
    
    \repeat volta 2 {
	c'4. b8 a4 g8 f ~ | f g ~ g4 a c | b4. a8 g4 f8 e | ~ e1 |
	a4. g8 f4 e8 d | ~ d e ~ e4 f a | gis4. f8 e4 d8 c | ~ c2. cis4 \bar "||"
    } \alternative {
	{ d8 a'4 a8 ~ a2 | ~ a2 c4 b | g1 | ~ g2. b,4 | 
	  c8 f4 f8 ~ f2 | ~ f4 a2 g4 | f4. e8 ~ e2 | ~ e2 r | }
	{ d8 a'4 a8 ~ a2 | ~ a2 c4 b | g1 | ~ g2. gis4 | 
	  a8 c,4 c8 ~ c2 | ~ c2 c4 d | c1 | r \bar "||" }
    }
}

harmony = \notes \chords {
    \repeat volta 2 {
	a1:m7 | d:m7 | g:7 | c:maj | \break
	f:maj | b:m7.5- | e:7.9+ | a:m7 | \break
    } \alternative {
	{ d1:m7 | g:7 | e:m7.5- | a:7.9+ | \break
	  d:m7 | g:7 | c:maj | b2:m7.5- e:7.9+ | \break }
	{ d1:m7 | g:7 | e:m7.5- | a:7.9+ | \break
	  d:m7 | g:7 | c:maj | b2:m7.5- e:7.9+ | \break }
    }
}

text = \lyrics {
    Fly me to the moon and let me play a -- mong the stars
    Let me see what spring is like on ju -- pi -- ter and mars
    In o -- ther words hold my hand
    In o -- ther words dar -- ling kiss me
}

Score =  \notes < 
    \context ChordNames \harmony
    \addlyrics
    \context Staff \melody
    \context Lyrics \text
>

\midi { \tempo 4 = 132 }


