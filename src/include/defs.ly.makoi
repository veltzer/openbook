<%def name="chordDefs()">
	\new ChordNames="Chords"
	%% this adds a bar engraver which does not always come with chords
	%% I didn'f find a way to put this with the chords themselves...
	\with {
		%% for lilypond 2.12
		%%\override BarLine #'bar-size = #4
		\override BarLine #'bar-extent = #'(-2 . 2)
		\consists "Bar_engraver"
	}
</%def>
