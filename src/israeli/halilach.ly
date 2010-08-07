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
	\set chordChanges = ##t
	\mark "verse"
	a1:min7 | d1:min7 | a1:min7 | e1 | \break
	a1:min7 | d2:min7 g2:7 | c2:maj7 d4:min7 g4:7 | c1:maj7 | \break
	\mark "chorus"
	f1:maj7 | e1:min7 | d2:min7 e2:7 | a1:min7 | \break
	d2:7 e2:min7 | f2:maj7 d4:min7 g4:7 | c2:maj7 d4:min7 e4:7 | a1:min7 | \break
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
