\include "src/include/common.lyi"
\header {
	title="Comping Rhythms"
	style="Jazz"
	piece="Upbeat Jazz"

	copyright="[no copyright notice for study materials]"

	completion="5"
}

%{
	TODO:
%}

\score {
<<
\chords {
	\set chordChanges = ##t
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
