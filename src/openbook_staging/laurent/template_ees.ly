#(define instrument "E$\\flat$")
\include "defs.ly"
\include "__input__"
\include "chord-name.ly"
\include "paper.ly"

\score {
    \notes \transpose a' {
	\property Score.extraNatural = ##f
	\Score
    }
    \paper { }
}
