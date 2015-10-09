\header {
    title = "If You Could See Me Now"
    composer = "Tadd Dameron"
    enteredby = "Laurent Martelli"
    themeid = "2810"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \repeat "volta" 2 {
	f2:maj d:m7 | bes1:sus4.7 | f2:7 d8:m7 des:m7 c:m7 b:m7 | bes2:m7 ees:7 \toCoda |
	a4:m7 d:m7 aes:m7 des:7 | g:m7 c:7 b:m7 fis:7 | 
    } \alternative { 
	{ ees2:9 d:7 | g:m7 c:7 } 
	{ b2:m7.5- c:m7 | a4:m7 d:m7 c:m7 f:7 | } 
    }
    b2:m7 e:7 | cis:m7.5- fis:7 | b:m7 e:7 | a:maj fis:m7 | b:m7 d4:m7 g:7 |
    e2:m7 a:m7 | d:m7.5- g:7 | g4:m7 aes des ges | f2:maj des:7 | c1:sus4.7 | \coda 
}

Tune = \notes \relative c' {
    \time 4/4
    \key c \major

    
    \repeat "volta" 2 {
				%\bar "|:"
	r8 e f a c e d a | c b bes c g2 | 
	r8 e f a c e d a | c b bes c g4. a8 | 
	c4 a8 c des ges, f4 | d' bes8 g e'4. c8 | \break
    } \alternative { { a1 | ~ a | } { f1 | ~ f2. f4 | } } \break

    e4 e8 e \times 2/3 { e4 fis d } | \times 2/3 { cis4 cis cis } cis4. d16 e |
    b4 b8 b b4 cis8 d | f2. fis,4 | \break cis'8 b a b c d e f | 
    g2 r8 e d b | f2 r8 d' c b | \break {c1 | f1 | ~ f1} \bar ":|" \break

    c4 a8 c des ges, f4 | d'! b8 d ees aes, g4 | e'! cis8 e f4 fis | g1-\fermata \bar "||"
}

Spaces = \notes \transpose c' {
    \stemOff  \headOff 
    \repeat volta 2 { s1*6 } \alternative { { s1*2 | }  { s1*2 | } }
    s1*7 | d,4 d d d | d2 d | d d
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { < \Tune \Spaces > }
>

#(set! shortestDurationSpace 3)
