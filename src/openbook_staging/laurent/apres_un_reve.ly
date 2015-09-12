\header {
    title = "Après un rêve"
    composer = "Gabriel Fauré"
    asplayedby = "Belmondo"
    date = "1877"
    source = "Choudens, 1880"
    style = "Romantic"
    copyright = "Public Domain"
    enteredby = "Tak-Shing Chan"
    maintainerEmail = "chan12@alumni.usc.edu"
    tagline = #tagline
    head = #instrument
}

chant = \notes \relative c'' {
    \key c \minor
    \time 3/4
    
    \property Voice.tupletSpannerDuration = #(make-moment 1 4)

    \repeat volta 2 {
	g4 c d |  ees ~ \times 2/3 { [ees8 d c] [ees d c] } |
	c2 bes4 | des8 f, des'4 c8 b |
	c4. c8 bes8. aes16 |
	g4 ~ \times 2/3 { \tupletBracketDown [g8( aes bes] \tupletBracketUp [aes bes )c] } |
	g2. \bar "||"
	
	g4 \times 2/3 { ees4 f8 g4 aes8 } |
	bes4 ~ \times 2/3 {[bes8 f f] [f e f] } |
	aes2 g4 | c c4. ces8 |
	bes4 ees, ees |
	f ~ \times 2/3 {
	    \tupletBracketDown
	    [f8 ges aes]
	    \tupletBracketUp
	    [ges aes bes] } |
	bes2 ees,4 | R2. \break
    }

    g4 c d | ees ~ \times 2/3 { [ees8 d c] [ees d c] } |
    c2 bes4 | des8 f, des'4 c8 b |
    c4. c8 bes aes |
    g4 ~ \times 2/3 {
	\tupletBracketDown
	[g8( aes bes]
	\tupletBracketUp
	[aes bes )c] } |
    g2. \bar "||"
    
    g4 \times 2/3 { ees4( )f8 g4( )aes8 } |
    bes4. f8 \times 2/3 { f e f } |
    aes4 g c, | des4 ~ \times 2/3 { [des8( ees )f] [ees( )f g]  } |
    g4 c, e |
    \times 2/3 {
	f4 f8 [f( )g aes] 
	\tupletBracketDown
	[bes( )aes bes] 
      \tupletBracketUp } |
    c4 c, c' |
    f2\f f,4 |
    f \times 2/3 {
	[f8 g a]
	\tupletBracketDown
	[bes( )c des]  } |
    des4 ~ \times 2/3 { [des8( c ees] [des c )bes] } |
    des2 bes8. bes16 |
    ees2 des4 |
    des4 ~ \times 2/3 { [des8( )c bes] \tupletBracketUp [aes g f] } |
    g4 ~ \times 2/3 { [g8( aes g] [f g )aes] } |
    g2 g4 |
    c2 c4 | c2 c8. d16 |
    ees2.\f | d2 d4 |
    d2\p c4 | bes4. g8 ees f |
    g4\pp ~ \times 2/3 { [g8( f ees] [f g aes] } | )g2. |
    c, | R |
    \bar "|."
}

Score = {
    \context Staff \notes \transpose b {\chant}
}

#(set! minimumVerticalExtent 5)

