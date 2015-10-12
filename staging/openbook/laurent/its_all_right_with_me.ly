\header {
    title = "It's All Right With Me"
    composer = "Cole Porter"
    enteredby = "Laurent Martelli"
    copyright = "© 1953 by Cole Porter"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 2 R2 |

    \repeat volta 2 {
	c1*2:m | f:9 | c:m | f:m | 
	bes2 bes2.:9 bes:7 | bes2.:m6 c4*5:9 | 
    } \alternative { 
	{ f1..:9 f4:7 | g2 f:m6 | g f4 g:7 | } 
	{ f1:9 | f2.:m7 bes4:7 | ees1*2 | } 
    }
    
    ees1*2:9 | ees:dim7 | a1:m/+ees | f:dim7/ees | ees1 | ees2:maj ees:6 |
	bes1:m6 | c:7.9- | f1*2:7 | f:m6 | g2:7 c:m6 | g f4 g:7 |
    
    c1*2:m | f:9 | c:m | f:m | 
    bes2 bes2.:9 bes:7 | bes2.:m6 c4*5:9 | 
    f1..:9 f4:7 | bes2:9 g2.:m d4 f:m7 bes:7 |
    ees1:maj | ees2.:7 ees4:7.5+ | aes1:maj | aes:7 |
    f:9 | f:m7 | ees1 | g:7 | 
    
    ees1*2
}

Tune = \notes \relative c' {
    \time 4/4
    \key ees \major
    \partial 2 c4 d | \boxedMark \mark "A" 

    \repeat volta 2 {
	ees2 g ~ | g c,4 d | ees2 g ~ | g c,4 d | 
	ees2 f4 g ~ | g ees f g | aes2 c ~ | c b4 c | 
	d2 c ~ | c4 d,4 des d | c'2 ces4 bes ~ | bes2 c,4 d |
    } \alternative { 
	{ ees2 g ~ | g2. f4 | d1 ~ | d4 r c4 d | } 
	{ ees2 g ~ | g2. f4 | ees1 ~ | ees2 r4 ees | \bar "||" } 
    }
    
    \mark "B" 
    \repeat unfold 2 {
	bes'2 bes4 c | des des2 bes4 | a2 a4 bes | c2. a4 |
    } \alternative {
	{ aes!2 aes4 bes | ces ces2 aes4 | g1 ~ | g2 r4 ees | }
	{ aes!2 aes8 aes4 aes8 | aes4 bes2 aes4 | g1 ~ | g4 r4 c, d \bar "||" }
    }
    
    \property Score.RehearsalMark \override #'extra-offset = #'(0.5 . 0)
    \mark "A" 
    ees2 g ~ | g c,4 d | ees2 g ~ | g c,4 d | 
    ees2 f4 g ~ | g ees f g | aes2 c ~ | c b4 c | 
    d2 c ~ | c4 d,4 des d | c'2 ces4 bes ~ | bes2 c,4 d |
    ees2 g ~ | g2. f4 | d1 ~ | d4 r ees4 f | 
    g2 bes ~ | bes r4 b | c2 ees ~ | ees2. c4 | ees1 ~ | ees ~ | 
    \property Score.RehearsalMark \set #'extra-offset = #'(0 . 1)
    \unboxedMark \toCoda ees4 r r2 | r c,4 d \bar "|."

    \property Score.RehearsalMark \revert #'extra-offset
    \coda ees'1 ~ | ees4 r r2 
}

Breaks = \notes {
    \partial 2 s2
    s1*7 \break
    s1*7 \break
    s1*7 \break
}

Score = <
    \context ChordNames { \Chords }
    \context Staff { \Tune }
>

#(set! minimumVerticalExtent 3)
\midi { \tempo 4 = 220 }
