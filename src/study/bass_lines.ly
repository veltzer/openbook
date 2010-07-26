\include "src/include/common.lyi"
\header {
	title="Bass Lines"
	style="Jazz"
	piece="Upbeat Jazz"

	copyright="[no copyright notice for study materials]"

	completion="5"
}

%{
	TODO:
	- Emphasize the bars which are important in the variations (how do you do that in lilypond ?)
	- add short bass lines, ones which form the harmony Dm7,G7,Cm7,F7,...
	- add long bass lines for harmony: Dm7,Dm7,G7,G7
	- add turn around bass lines for harmony: Cmaj7,A7,Dm7,G7
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
		%% Dm has: d e f fis, d a f fis, d f a aes
		%% G7 has: g d b des, g f d des, g aes a b
		%% Cmaj has:
		%% c d e d c g e des 
		%% c d e f g f e des
		%% c g c d e d des b
		%% c g e f g aes a b
		%% I should have at least 3 x 3 x 4 = 9 X 4 = 36 options
		\mark "Dm 1"
		d4 e f fis | g d b des | c d e f | g f e des |
		\mark "Dm 2"
		d'4 a f fis | g d b des | c d e f | g f e des |
		\mark "Dm 3"
		d f a aes | g d b des | c d e f | g f e des |

		\mark "G7 1"
		d4 e f fis | g d b des | c d e f | g f e des |
		\mark "G7 2"
		d4 e f fis | g f d des | c d e f | g f e des |
		\mark "G7 3"
		d4 e f fis | g aes a b | c d e f | g f e des |

		\mark "Cmaj7 1"
		d4 e f fis | g aes a b | c d e d | c g e des |
		\mark "Cmaj7 2"
		d4 e f fis | g aes a b | c d e f | g f e des |
		\mark "Cmaj7 3"
		d,4 e f fis | g aes a b | c g c d | e d des b |
		\mark "Cmaj7 4"
		d,4 e f fis | g aes a b | c g e f | g aes a b |
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
