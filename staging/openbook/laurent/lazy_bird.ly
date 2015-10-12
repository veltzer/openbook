\header {
    title = "Lazy Bird"
    composer = "John Coltrane"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \repeat volta 2 { 
	a2.:m7 d4:7 | c2:m7 f:7 | f1:m7 | bes:7 | 
	ees:maj | a2.:m7 d4:7 | g1:maj | 
    } \alternative { 
	{ aes2.:m7.5- des4:7.9- | } 
	{ g1:maj | } 
    }
    b1:m7 | e:7 | a:maj | bes2:m7 ees:7 | 
    a1:m7 | d:7 | g:maj | aes2:m7 des:7 | 
    a2.:m7 d4:m7 | c2:m7 f:7 | f1:m7 | bes:7 |
    ees1:maj | a2.:7 d4:7 | g1*2:maj | 

    f1:7.11+^9.5 | ees:7 | a:m7 | d:7.9- |
    g:maj | c:7.9- | f:maj | bes:7.9- |
    ees:7 | aes:maj | des:7 |
}

Tune = \notes \relative c'' {
    \time 4/4
    \key g \major
    \repeat volta 2 {
	b2. a4 | d2 c | bes1 | f2 g4 aes8 bes ~ |
	bes2 g4 bes8 c ~  \break | c2 a4 c8 d ~ | d1 ~ | 
    } \alternative { 
	{ d2. r4 | } 
	{ d2. b4 \bar "||" \break } 
    }

    d1 ~ | \times 2/3 {d4 b c} \times 2/3 {d4 fis e}  | cis1 ~ | cis | \break
    c!1 ~ | \times 2/3 {c4 a b} \times 2/3 {c4 e d}  | b1 ~ | b \bar "||"  \break

    b2. a4 | d2 c | bes1 | f2 g4 aes8 bes ~ | \break
    bes2 g4 bes8 c ~ | c2 a4 c8 d ~ \toCoda | d1 ~ | d1 \bar "|." \break

    \coda 
    d2. d4 | f2. e4 | c2. r4 | r ees2 d4 |
    b1 | \break bes | a | aes | 
    g | g2. r4 | g1-\fermata \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

