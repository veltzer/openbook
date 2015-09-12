#(define instrument "B$\\flat$")
\include "defs.ly"
\include "__input__"
\include "chord-name.ly"
\include "paper.ly"

\score {
    \notes \transpose d' {
	\property Score.extraNatural = ##f
	\Score
    }
    \paper { }
}
