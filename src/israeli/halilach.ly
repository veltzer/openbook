\include "src/include/common.lyi"
\header {
	title="Kama Yafe Poreach Halilach"
	subtitle=""
	style="Israeli"
	composer="unknown"
	copyright="1959 1962, Editora Musical Arapua, Sao Paulo, Brazil"
	style="Israeli folk"
	piece="Med. Ballad"
	poet="unknown"

	completion="2"

	uuid="4ae1d01a-a26f-11df-8e51-0019d11e5a41"
}

%{
	TODO:
%}

\score {
<<
\chords {
	\startChords

	\startSong

	\mark "verse"
	\startPart
	a1:m7 | d1:m7 | a1:m7 | e1 | \myEndLine
	a1:m7 | d2:m7 g2:7 | c2:maj7 d4:m7 g4:7 | c1:maj7 | \myEndLine
	\endPart

	\mark "chorus"
	\startPart
	f1:maj7 | e1:m7 | d2:m7 e2:7 | a1:m7 | \myEndLine
	d2:7 e2:m7 | f2:maj7 d4:m7 g4:7 | c2:maj7 d4:m7 e4:7 | a1:m7 | \myEndLine
	\endPart

	\endSong

	\endChords
}
\new Voice="melody" {
	\time 4/4
	\key a \minor
	a1
}
\new Lyrics \lyricsto "melody" {
	hello
}
>>
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130 4)
		}
	}
	\layout {}
}
