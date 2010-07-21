\include "src/include/common.lyi"
\header {
	title="Bass Lines"
	style="Jazz"

	completion="5"
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
	d1:min7 | g1:7 | c1:maj7 | c1:maj7 \bar "||" \break
}
\new Voice="melody" {
	\time 4/4
	\key f \major
	\clef bass
	\relative c, {
		\mark "A"
		d4 e f fis | g d b des | c d e f | g f e des |
		\mark "B"
		d4 e f fis | g f d des | c d e f | g f e des |
		\mark "C"
		d4 e f fis | g aes a b | c d e d | c g e des |
		\mark "D"
		d'4 a f fis | g aes a b | c e g f | e d des b |
		\mark "E"
		d'4 a f fis | g d b des | c g c d | e d des b |
		\mark "F"
		d4 e f fis | g b d des | c g e f | g aes a b |

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
