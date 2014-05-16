%% this example shows how to add bar engravers to plain chords

\score {
	<<
		\new ChordNames="mychordname"
			%% this adds a bar engraver which does not always come with chords
			%% I didn'f find a way to put this with the chords themselves...
			\with {
				%% for lilypond 2.12
				%%\override BarLine #'bar-size = #4
				\override BarLine #'bar-extent = #'(-2 . 2)
				\consists "Bar_engraver"
			}
			\chordmode {
				c1*4:7 |
				f1*2:7 | c1*2:7 |
				g1:7 | f:7 | c1*2:7 |
			}
	>>
}
