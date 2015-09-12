\header {
    title = "Sweet Georgia Brown"
    composer = "Bernie, Pinkard \& Casey"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument    
}

Chords = \chords {
    \repeat "volta" 2 {
	d1*2:7 | d1*2:7 | 
	g1*2:7 | g1*2:7 | 
	c1*2:7 | c1*2:7 | 
	f1:maj | c:7.5+ | f:maj | e2:min7 a:7 |
	d1*2:7 | d1*2:7 | 
	g1*2:7 | g1:7 | a:7 |
	d:min7 | a:7 | d:min7 | a:7 |
	f2:maj e:7 | ees:7 d:7 | g:7 c:7 | f:7 e4:7 ees:7 |
    }
}

Tune = \notes \relative f' {
    \time 4/4
    \key f \major

    \repeat "volta" 2 {
	d4 e fis d | a' fis b a | d2 a8 fis4 d8 | ~ d1 | \break
	d4 e f! d | a' f b! a | d2 b8 a4 g8 | ~ g1 | \break
	c,4 d e c | g' e a g  | c2 g8 e4 c8 | ~ c4 c8 d ~ d c d4 | \break
	a'1 | ~ a4 c,8 d ~ d c d4 | a'2 ~ a8 a4. | g a8 ~ a2 \bar "||" \break
	
	d,4 e fis d | a' fis b a | d2 a8 fis4 d8 | ~ d1 | \break
	d4 e f! d | a' f b! a | d2 b8 a4 g8 | ~ g2 a | \break
	\repeat "unfold" 2 { a4. a8 ~ a2 | g8 e4 a8 ~ a2 | } \break
	c,8 d4 f8 ~ f a4 c8 | ~ c a cis d ~ d4 a | g2 c8 a4 f8 \toCoda | ~ f4 r r2
    }
    \coda ~ f1-\fermata \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

\midi { \tempo 4 = 160 }
