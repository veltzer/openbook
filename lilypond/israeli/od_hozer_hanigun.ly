\include "lilypond/include/common.lyi"
\header {
	filename="od_hozer_hanigun.ly"
	title="Od hozer hanigun"
	subtitle=""
	composer=""
	singer="Berry Saharof"
	copyright=""
	style="Pop"
	piece="Med. Ballad"
}

harmony=\chords {
	\mark "opening"
	\repeat volta 4 {
		b2:min7 a2:7 |
	}
	\mark "verse"
	d2 e2:min7 | g2 b2:min7 | e2:min7 fis2:7 | g2 d2 | \break
	g2 d2 | e2:min7 b2:min7 | e2:min7 fis2:7 | g2 a2:7 | \break
}

\score {
	<<
		\context ChordNames \harmony
	>>
	\midi {}
	\layout {}
}
