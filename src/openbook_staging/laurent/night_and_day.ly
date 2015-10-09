\header {
    title = "Night and Day"
    composer = "Cole Porter"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 2 R2 |
    \repeat "volta" 2 {
	d1:m7.5- | g:7 | c1*2:maj | \break
	d1:m7.5- | g:7 | c1*2:maj | \break
	fis1:m7.5- | f:m7 | e:m7 | ees:dim7 | \break
	d:m7 | g:7 | c:maj
    } \alternative { { c1:maj | } { bes1:7 | \break } }
    ees1*2:maj | c1*2:maj | \break
    ees1*2:maj | c1*2:maj | \break
    fis1:m7.5- | f:m7 | e:m7 | ees:dim7 | \break
    d:m7 | g2:7 d:m7 | c1:6 | d2:m7 g:7 |
}

Tune = \notes \relative c'' {
    \time 4/4
    \key c \major
    
    \partial 2 g4 g8 g | 
    \repeat "volta" 2 {
	~ g1 | ~ g2 \times 2/3 { f4 e dis } | e1 | ~ e2 g4 g8 g | 
	~ g4 g g g | g f \times 2/3 { f4 e dis } | e1 | ~ e2 e4. e8 | 
	e4 e e e | ees2 ~ ees8 ees4 ees8 | d4 d d d | d des8 c ~ c4 b | 
	a aes8 g ~ g2 | g g'4 g8 g | ~ g1 | 
    } \alternative { 
	{ ~ g4 r g g8 g | }
	{ ~ g2 g4 g | } 
    } 
    bes1 | ~ bes2 \times 2/3 { g4 f ees } | g4 g8 g ~ g2 | ~ g2 g4. g8 | 
    bes8 c4 bes8 c4 bes8 c | ~ c bes4 g8 ~ \times 2/3 { g4 f ees } | g4 g8 g ~ g2 | ~ g2 e4. e8 |
    e4 e e e | ees2 ~ ees8 ees4 ees8 | d4 d d d | d8 des c b' ~ b bes a4 | 
    g4 g8 g ~ g2 | ~ g2 c4 c8 c | ~ c1 | r2 g4 g8 g \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

