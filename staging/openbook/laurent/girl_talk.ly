\header {
    title = "Girl Talk"
    composer = "Neil Hefti"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \repeat "volta" 2 {
	ees2:maj a:7.9 | aes:maj f4:m7 bes:7.9- | 
	g2:m7 c:7.9- | f4:m7 g:m7 aes:6 bes:7.9 | 
	ees2:maj aes:m7 | f:7.5-.9- f4:m7/+bes bes:7.9- |
	g2:m7 c:7.9- | g4:m7 aes:6 bes:m6 c:7 |
	c2:m7/+f f:7.9 | f:m7/+bes aes:m7 | 
	g:m7 c:m7.9
    } \alternative { { f2:m7 bes:7.9 | } { R4 f2:m7 bes4:7.9 | } }
    ees2:maj ges:maj | f:m7 bes:7.9- |
}

Tune = \notes \relative g' {
    \time 4/4
    \key ees \major
    
    \repeat "volta" 2 {
	r8 g [g g] g g g g | g g c, c ees ees f4 |
	r8 g [g g] g g g g | aes aes g g ees ees c4 |
	r8 ges' [ges ges] ges ges ges ges | ges ges ces, ces ees ees f4 |
	r8 g [g g] g g g g | bes bes aes aes g g c,4 |
	\repeat unfold 3 {r8 g' \times 2/3 {g8 c, ees}} r8 ges [f ees] | bes'2 g4 r |	
    } \alternative { 
	{ ees2 c4 r | \break }
	{ r4 ees2 c4 | } 
    } 
    ees1 | ~ ees2 r \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

