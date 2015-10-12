\paper {
    indent = 0.0 \cm
    textheight = \vsize - 3.\cm
    \translator {
	\ScoreContext 
	SpacingSpanner \override #'shortest-duration-space = #shortestDurationSpace
	RehearsalMark \override #'break-visibility = #all-visible
	\remove "Bar_number_engraver"
    }
    \translator { 
	\ChordNamesContext 
	ChordName \override #'style = #'jazz
	ChordName \override #'word-space = #2
	ChordName \override #'font-series = #'bold
	ChordName \override #'font-family = #'roman
	%ChordName \set #'extra-offset = #'(0 . -1.5) 
    }
    \translator { 
        \StaffContext
	VoltaBracket \set #'extra-offset = #'(0 . -0.5)
	minimumVerticalExtent = #(cons (- minimumVerticalExtent) minimumVerticalExtent)
    }
}
