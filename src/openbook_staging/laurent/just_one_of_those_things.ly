\header {
    title = "Just One Of Those Things"
    composer = "Cole Porter"
    enteredby = "Laurent Martelli"
    copyright = "© 1935 by Warner Bros. Inc."
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 2 R2 |

    \repeat volta 2 {
	d1*2:m | a | f:7 | b2.:m7.5- des4*5:dim7 |
	f1 | f:m  | g:m7 | c:7 | d2.:m7 ges4*5:dim7 | c1.:7 a2:7 | 

	d1*2:m | a | f:7 | b1:m7 | des:dim7 |
	f1 | f2.:dim7 f4 | g1:m7 | c:7 | d2.:m7 ges4*5:dim7 | f4*5:m7 bes2.:7 | 
	
	ees1*2 | bes:7 | ees | g:7 | 
	a:m7 | ges1:dim7 | f2.:m7 d4:m7 | e2.:m7 d4 | ees1:dim7 | c4*5 a2.:7 |

	d1*2:m | a | f:7 | bes2. g4*5:m7 | 
	a2.:m d4*5:7 | fis2.:dim7 g2.:m c2:7 | f1*2
    } 
    \alternative { {g2:m a1.:7} {d1*2} }
}

Tune = \notes \relative c' {
    \time 4/4
    \key f \major
    \partial 2 bes4 a |
    \repeat volta 2 {
	a'2 r4 a ~ | a gis a2 | a1 ~ | a2. r4 |
	a2 r4 a ~ |  a gis a2 | a a4 g! ~ | g1 |
	g4 e f2 | c'2. f,4 | f d f2 | e1 |
	d2 r4 d ~ | d cis d2 | c!1 ~ | c2 bes4 a \bar "||"

	a'2 r4 a ~ | a gis a2 | a1 ~ | a2. r4 |
	a2 r4 a ~ |  a gis a2 | a4 gis a2 | g2. e4 |
	\times 2/3 {g2 e f} | c'2. f,4 | \times 2/3 {f2 d f} | e1 |
	d2 r4 d ~ | d cis d2 | c!1 ~ | c4 c2 bes4 \bar "||"

	g'2 g4 g ~ | g fis2 g4 | c2 c4 c ~ | c b2 bes4 | 
	c,2 d4 ees ~ | ees f2 fis4 | g1 ~ | g2 g4 gis | 
	a2 a4 a ~ | a gis2 a4 | e'2 e4 e ~ | e ees2 d4 | 
	d2 r4 d4 ~ | d c a2 | c1 ~ | c2 bes4 a \bar "||" 

	a2 r4 a  ~ | a gis a2 | a1 ~ | a2. r4 |
	a2 r4 f' ~ | f d2 c4 | a gis a g ~ | g2 fis4 g | 
	e'2 r4 d ~ | d d, cis d | c'2 r4 bes ~ | bes g a2 | f1 ~ | f ~ | 
    }
    \alternative { { f4 r r2 | r2 bes,4 a | } {f1 ~ | f4 r r2 \bar "|." } }
}

Breaks = \notes {
    \partial 2 s2
    s1*7 \break
    s1*7 \break
    s1*7 \break
}

Score = <
    \context ChordNames { \Chords }
    \context Staff < \Tune \Breaks >
>

#(set! minimumVerticalExtent 3)
\midi { \tempo 4 = 220 }