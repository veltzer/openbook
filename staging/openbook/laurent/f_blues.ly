\header {
    title = "F Blues (``Tootsie'')"
    composer = "Jamey Aebersold"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 4. R4. |
    \repeat "volta" 2 {
	f1:7 | bes:7 | f1*2:7 | 
	bes1*2:7 | f1:7 | a4*3:min7 d4:7 |
	g1:min7 | c:7 | a2:7 d:7 | g:7 c:7 |
    }
}

Tune = \notes \relative c' {
    \time 4/4
    \key f \major

    \partial 4. c8 [f8. bes16] | 
    \repeat "volta" 2 {
	a8.\( f16 d8. c16 \)f4-- r8 aes->\( ~ | aes8. f16 g8 \)f r c8 [f8. bes16] | 
	a8.\( f16 d8. \)c16 f8\( g4-. \)ees8 ~ | ees2 r8 c [f8. bes16] | \break

	aes8.\( f16 d8 c \)f4-- r8 aes->\( ~ | aes8. f16 g8 \)f r c8 [f8. bes16] | 
	a8.\( f16 d8. c16 f8 g4-. \)d8 ~ | d2. r8 \phrasingSlurDown d\( | \break

	a'8. a16 \times 2/3 {f8 d f} a8. a16 \times 2/3 {f8 d f} | 
	a8. c16 bes8 a f8. c16 e8 \)f ~ | f1 | r2 r8 c [f8. bes16] | 
    } 
}

\paper {
    indent = .7\cm
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

