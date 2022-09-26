<%def name="chordDefs()">
	\new ChordNames="Chords"
	\with {
		\override BarLine #'bar-extent = #'(-2 . 2)
		\consists "Bar_engraver"
	}
</%def>
