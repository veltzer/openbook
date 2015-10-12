\header {
    title = "In Your Own Sweet Way"
    composer = "Dave Brubeck"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 4 R4 |
    \repeat volta 2 {
	a2:m7.5- d:7.9- | g:m7 c:7 | c:m7 f:7 | bes:6 ees:maj |
	aes:m7 des:7 | ges:maj ces:maj | c:m7.5- f:7.9- |
    } 
    \alternative { { c1:maj.11+^9 } { c1:maj.11+^9 } }
    
    e2:m7.5- a:7.9- | d1:maj | e2:m7 a:7 | d1:maj |
    d2:m7 g:7 | c1:maj | ees2:m7 aes:7 | g1:7 |
    
    a2:m7.5- d:7.9- | g:m7 c:7 | c:m7 f:7 | bes:6 ees:maj |
    aes:m7 des:7 | ges:maj ces:maj | c:m7.5- f:7.9- | c1:maj.11+^9 |
}

Tune = \notes \relative c'' {
    \time 4/4
    \key bes \major

    \partial 4 ees8 d |
    \repeat volta 2 {
	~ d2. c8 bes | ~ bes1 | 
	r8 d ees f ees4 d8 bes | ~ bes4 c8 d ~ d2 |
	r8 ces des ees des4 ces8 bes | ~ bes4 des8 ges,8 ~ ges4 bes8  aes | 
	~ aes2. ges8 fes |
    }
    \alternative { {  ~ fes4. f8 r4  ees'8 d | } {  ~ fes4. f8 r2 \bar "|." } }

    r4 a4 c4. bes8 | a1 | r4 a4 cis4 a8 fis | ~ fis1 |
    r4 r8 e8 c d e f | g2. ges8 f | ~ f2. ees8 d | ~ d2. ees'8 d \bar "||"
    
    ~ d2. c8 bes | ~ bes1 | 
    r8 d ees f ees4 d8 bes | ~ bes4 c8 d ~ d2 |
    r8 ces des ees des4 ces8 bes | ~ bes4 des8 ges,8 ~ ges4 bes8  aes | 
    ~ aes2. ges8 fes | ~ fes4. f8 r2 \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

