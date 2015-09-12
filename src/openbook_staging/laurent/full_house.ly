\header {
    title = "Full House"
    composer = "Wes Montgomery"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords \transpose bes {
    R4 g2:m7 
    \repeat volta 2 {
	R8 g4.:m7 R4 | R4 c2:3/g | R8 g4.:m7 R4 | R4. c:3/g | 
	R4 g2:m7 | R8 c2:3/g R8 | R8 g4.:m7 R4 }
    \alternative { { R8 c2:7 R8 } { R2. } }

    \repeat unfold 3 { R8 g:m7 R2 | R8 c:7 R2 } R8 ees:7 R2 | R4 d2:7 |
    \repeat unfold 3 { R8 g:m7 R2 | R8 c:7 R2 } ees4.:7 d:7 | R8 g:7 R2 |

    c2.:m7 ~ c4.:m7 f:7 | bes2.:maj ~ bes4.:maj ees:7 | 
    aes2.:maj | r4 cis2:7 | a2.:m7 | d:7 |
    
    \repeat unfold 3 { R8 g:m7 R2 | R8 c:7 R2 } R8 ees:7 R2 | R4 d2:7 |
    \repeat unfold 3 { R8 g:m7 R2 | R8 c:7 R2 } ees4.:7 d:7 | g2.:7 |
    
}

Tune = \notes \transpose bes \relative c' {
    \time 3/4
    \key d \major

    r8 d d f g f 
    \repeat volta 2 {
	g8 d f g r4 | r a a8 d, | f f d f r4 | r8 d4 f d8 | 
	g8 d f g r a ~ | a g4 f8 d c | d c bes g r4 | 
    }
    \alternative { { r8 d'4 f d8 | } { r2 r4 } }
    
    g'8 bes r2 | g8 c r4 r8 g | r4 bes8 g bes4 | c8 bes c4 bes | 
    g8 bes r2 | g8 c r4 r8 g ~ | g bes4 g8 bes4 | r d,2 \bar "||"

    g8 bes r2 | g8 c r4 r8 g ~ | g bes4 g bes8 | c8 bes c4 bes | 
    g8 bes r2 | g8 c r4 r8 d, | g bes a f4 d8 | g a4 bes d8 \bar "||"
    
    g2. ~ | g4. a4 f8 | d2. ~ | d4. g4 ees8 | c2. | r4 a8 bes c cis | d2. | r4 d2\accent \bar "||"

    g,8 bes r2 | g8 c r4 r8 g ~ | g bes4 g8 bes4 | c8 bes c4 bes | 
    g8 bes r2 | g8 c r4 r8 g ~ | g bes4 g8 bes4 | r4 d,2 \bar "||"

    g8 bes r2 | g8 c r4 r8 g ~ | g bes4 g8 bes4 | c8 bes c4 bes | 
    g8 bes r2 | g8 c r4 r8 <g e> | g bes a f4 d8 | g2. \bar "||"

}

Score = <
    \context ChordNames { \Chords }
    \Tune
>

\midi { \tempo 4 = 160 }

#(set! minimumVerticalExtent 4)
