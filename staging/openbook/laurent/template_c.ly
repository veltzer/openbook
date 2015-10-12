\midi { \tempo 4 = 120 }

#(define instrument "C")

\include "defs.ly"
\include "__input__"
\include "chord-name.ly"
\include "paper.ly"

\score {
    \notes \transpose c' {
	\property Score.extraNatural = ##f
	\Score
    }
    \paper { }
    \midi { }
}
