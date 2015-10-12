\header {
    title = "Autumn Leaves"
    composer = "Joseph Kosma \& Jacques Prévert"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 2. R2. |
    \repeat "volta" 2 {
	c1:min7 | f:7 | bes:maj | ees:maj.4+ | a:min7.5- | 
    } \alternative { { d1:7.9+ | g1*2:min7 | } { d1:7.9+ | g1*2:min7 | } }
    a1:min7.5- | d:7.9- | g1*2:min7 | c1:min7 | f:7 | bes:maj | ees:maj.4+ | 
    a:min7.5- | d:7.9+  | g2:min7 c:7 | f:min7 bes:7 | ees1:7 | 
    a2:min7.5- d:7.9+ | g1:min7 | g:7.9+ |
}

Tune = \notes \relative c'' {
    \time 4/4
    \key bes \major
    
    \partial 2. g4 a bes | 
    \repeat "volta" 2 {
	ees1 ~ | ees4 f, g a | d2 d ~ | d4 ees, f g | 
	c1 ~ | \break
    } \alternative { 
	{ c4 d, e fis | bes1 | r4 g a bes \bar "||" }
	{ c4 a c bes | g1 | \break r2 fis4 g \bar "||" } 
    } 
    a4 d, a'2 ~ | a4 a g a | bes1 ~ | bes4 bes a bes | 
    c1 ~ | c4 f, f'4. ees8 | d1 ~ | d2 cis4 d | 
    ees ees c! c | a2. ees'4 | d2 d ~ | d g, | 
    c2. bes4 | a2 bes4 d, | g1 | r \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

