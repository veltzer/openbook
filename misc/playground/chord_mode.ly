%% this example shows how to use chords instead of chordmode

\score {
	<<
		\new ChordNames="mychordname" {
			\chordmode {
			  c1:7.3-.5-.9-.11-.13-
			}
		}
		\new Voice="foo" { c'2 }
	>>
}
