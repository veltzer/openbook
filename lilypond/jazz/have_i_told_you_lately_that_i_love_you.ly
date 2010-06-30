\include "lilypond/include/common.lyi"
\header {
	title="Have I told you lately that I love you"
	singer="Van Morrison"
	style="Pop"
	piece="Med. Ballad"
}

harmony=\chords {
	\repeat volta 2 {
		f2:maj7 a2:min7 | bes2:maj7 c2:7 |
	}
	bes1:maj7 | a1:min7 | g2:min7 c2:7 | f4*3:maj7 c4:7 \bar "||"
}

text=\lyrics {
	Have I told you lately that I love you.
	Have I told you that there's no one but you.
	You give me so much gladness.
	Take away all the sadness.
	Take my troubles that's what you do.
}

\score {
	<<
		\context ChordNames \harmony
		\context Lyrics \text
	>>
	\midi {}
	\layout {}
}
