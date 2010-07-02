\include "src/include/common.lyi"
\header {
	title="Kama Yafe Poreach Halilach"
	style="Israeli"
	piece="Med. Ballad"
}

harmony=\chords {
	\mark "verse"
	a1:min7 | d1:min7 | a1:min7 | e1 | \break
	a1:min7 | d2:min7 g2:7 | c2:maj7 d4:min7 g4:7 | c1:maj7 | \break
	\mark "chorus"
	f1:maj7 | e1:min7 | d2:min7 e2:7 | a1:min7 | \break
	d2:7 e2:min7 | f2:maj7 d4:min7 g4:7 | c2:maj7 d4:min7 e4:7 | a1:min7 | \break
}

\score {
	<<
		\context ChordNames \harmony
	>>
	\midi {}
	\layout {}
}
