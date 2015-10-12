\header {
    title = "A Night In Tunisia"
    composer = "Dizzie Gillespie"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    ees1:7 | d:m7 | ees1:7 | d:m7 |
    \partial 8 R8 |
    \repeat "volta" 2 {
	ees1:7 | d:m7 | ees1:7 | d:m7 | ees1:7 | d:m7 | e2:m7.5- a:7.5- |
    } \alternative { { d1:m7 } { d1:m7 } }
    a1:m7.5- | d:7.9- | g:m7 | g2:m7 c:7 |
    g1:m7.5- | c:7.9- | f:6 | e2:m7.5- a:7.5- |

    ees1:7 | d:m7 | ees1:7 | d:m7 | ees1:7 | d:m7 | e2:m7.5- a:7.5- | d1:m7 |

    e1*2:m7.5- | ees:7.11+^9.5 | d:m7 | g:7.11+^9.5 |
    g1:m7+ | g:m7 | ges1*2:7.9+ |
    f:maj | e1:m7.5- | a:7.9- |
}

partA = \notes \relative c' {
    \times 2/3 {bes8 des f} c'2 bes8 f | gis a4. ~ a a,8 | 
    \times 2/3 {bes des f} c'2 bes8 f | a2 r4 r8 a,8 | 
    \times 2/3 {bes des f} c'2 bes8 f | gis a4. ~ a2 | 
    a8 bes \times 2/3 {[a16 bes a} g8] ees4 cis8 d | 
}

Tune = \notes \relative c' {
    \time 4/4
    \key f \major

    \clef bass 
    \repeat percent 2 { ees,8 a d ees ~ ees d4 bes8 | d, f a b ~ b a4 f8 } \bar "||"

    \clef treble
    \partial 8 a8 | 
    \repeat "volta" 2 {
	\partA
    } \alternative { 
	{ ~ d2 r4 r8 a8 | }
	{ ~ d2. a'4 \bar "||" } 
    }
    c'2 a4. g8 | fis4 ees'8 d ~ d4 c8 a | bes g4 fis8 ~ fis g a g | ~ g2 r |
    bes2 g4. f8 | e4 des'8 c ~ c4 bes8 gis | a4. f8 g4 f8 e | ~ e2 r4 r8 a,8 \bar "||"

    \partA | ~ d4. a'8 r a4 a8 \bar "||" 
    ~ a4 g8 e a4 g8 e | a g e a r4 r8 a8 | 
    ~ a4 f8 des a'4 f8 des | a'8 f des a' r4 r8 a8 | 
    ~ a4 f8 d! a'4 f8 d | a'8 f d a' r4 r8 a8 | 
    ~ a4 f8 des a'4 f8 des | a'8 f des a' r4 r8 a8 | 
    ~ a4 fis8 d a'4 fis8 d | a'8 f! d a' r4 r8 a8 | 
    ~ a4 fes8 des a'4 fes8 des | a'8 fes des a' r4 a8 c | 
    r1_#'(bold "Solo break") r r r \bar "||"
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

#(set! minimumVerticalExtent 4)
