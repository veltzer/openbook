\header {
    title = "It Don't Mean a Thing"
    composer = "Duke Ellington"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 4 R4 |
    \repeat "volta" 2 {
	g2:min7 g:min7/+fis | g:min7/+f c:7/+e |
	ees:7 d:7 | g1:min7 | 
	c:7 | cis:dim7 | 
	bes:maj/+d |
    } \alternative { {  d1:7.5+ | } { bes1:maj | } }
    f1:min7 | bes:7 | ees1*2:maj | 
    g1:min7 | c:7 | f:7 | d:7 | 

    g2:min7 g:min7/+fis | g:min7/+f c:7/+e |
    ees:7 d:7 | g1:min7 | 
    c:7 | cis:dim7 | 
    bes:maj/+d | d1:7.5+ |
}

Tune = \notes \relative c'' {
    \time 4/4
    \key bes \major
    
    \partial 4 d4 | 
    \repeat "volta" 2 {
	g,2 g4 bes | d2 g,4 bes | 
	des2 c8 bes4 g8 | ~ g1 | \break
	r4 bes8 bes ~ bes bes bes4 | bes8 bes4 bes8 bes4 bes8 bes | 
	~ bes bes bes4 bes8 bes4 bes8 |
    } \alternative { 
	{ bes4 r r bes | \break }
	{ bes2. c4 \bar "||" } 
    } 
    c4 c c8 bes4 c8 | ~ c4 bes c8 bes4. |
    g1 | ~ g2. c4 | \break
    c4 c4 c8 c4. | c4 bes c8 bes4. | 
    f1 | g2. bes4 \bar "||" \break

    g2 g4 bes | d2 g,4 bes | 
    des2 c8 bes4 g8 | ~ g1 | \break
    r4 bes8 bes ~ bes bes bes4 | bes8 bes4 bes8 bes4 bes8 bes | 
    ~ bes bes bes4 bes8 bes4 bes8 | bes1 \bar "|."
    
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

