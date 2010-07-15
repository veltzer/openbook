\include "src/include/common.lyi"
\header {
	title="Bass Lines"
	style="Jazz"

	complet="5"
}

%{
	TODO:
%}

\score {
<<
\chords {
	\set chordChanges = ##t
	d1:min7 | g1:7 | c1:maj7 | c1:maj7 \bar "||" \break
	d1:min7 | g1:7 | c1:maj7 | c1:maj7 \bar "||" \break
	d1:min7 | g1:7 | c1:maj7 | c1:maj7 \bar "||" \break
	d1:min7 | g1:7 | c1:maj7 | c1:maj7 \bar "||" \break
	d1:min7 | g1:7 | c1:maj7 | c1:maj7 \bar "||" \break
}
\new Voice="melody" {
	\time 4/4
	\key f \major
	\clef bass
	\relative c, {

	d4 e f fis | g d b des | c d e f | g f e des |
	d4 e f fis | g aes a b | c d e d | c g e des |

	}
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
