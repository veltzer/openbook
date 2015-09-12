\header {
    title = "Bye Bye Blackbird"
    composer = "Mort dixon \& Ray Henderson"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    f1*2:maj | f1*2:maj | \break
    a1:m7 | aes:m5-.7- | g:m7 | c:7 \bar "||" \break
    g:m7 | d:7 | g:m7 | c:7 | \break
    g:m7 | c:7 | f1*2:maj \bar "||" \break

    f1*2:7 | ees1:7 | d:7.9- | \break
    g1*2:m7 | des1:7 | c:7.9- | \break
    f1*2:maj |a1:7.5- | d:7.9- | \break
    g:m7 | c:7 | f:maj | g2:m7 c:7 |
}

Tune = \notes \relative c'' {
    \time 4/4
    \key f \major
    a4 a a a | bes a a2 | a4 g g2 | g4 f f2 |
    f1 | g | f2 e ~ | e4 r r2 | 
    bes'4 bes bes bes | c bes bes2 | bes4 a a2 | a4 g g2 | 
    g1 | a | g2 f ~ | f1 |

    f4 c' c c | c4. bes8 a4 g | g1 | fis | 
    d4 bes' bes bes | bes4. a8 g4 f | f1 | e |

    a4 a a a | bes a a2 | a4 g g2 | g4 fis fis2 |
    g2 bes ~ | bes e, | f r | r1 \bar "|."
}

Score = <
    \context ChordNames { 
	\property ChordNames.ChordName \override #'style = #'jazz
	\Chords
    }
    \context Staff = bottom {	
	\Tune
    }
>

#(set! minimumVerticalExtent 4)
