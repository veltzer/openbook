\include "src/include/common.lyi"
\header {
	title="Ain't No Sunshine"
	composer=""
	style="Pop"
	piece="Med. Ballad"

	completion="0"
	uuid="669540fe-d851-11df-ae78-0019d11e5a41"
}

%{
	TODO:
	- finish the tune and the chords...
%}

\include "predefined-guitar-fretboards.ly"

\score {
<<
\chords {
	\startChords

	\mark "Verse"

	\endChords
}
\new FretBoards {
	\chordmode {
		\mark "Intro"
		c1 | g1:7 | a1:m | f1 | g1:7 | d1:m | f1 | c2. g4:7 |
		\mark "Verse"
		c1 | g1:7 | a1:m | f1 | g1:7 | d1:m | f1 | a2.:m g4:7 |
	}
}
\new Voice="melody" \relative c'' {
	\time 4/4
	\key c \major
}
\new Lyrics \lyricsto "melody" {
	Ain't no sunshine when she's gone.
	It's not warm when she's away.
	Ain't no sunshine when she's gone
	And she's always gone too long anytime she goes away.

	Wonder this time where she's gone,
	Wonder if she's gone to stay
	Ain't no sunshine when she's gone
	And this house just ain't no home anytime she goes away.

	And I know, I know, I know, I know, I know,
	I know, I know, I know, I know, I know, I know, I know,
	I know, I know, I know, I know, I know, I know,
	I know, I know, I know, I know, I know, I know, I know, I know

	Hey, I ought to leave the young thing alone,
	But ain't no sunshine when she's gone, only darkness everyday.
	Ain't no sunshine when she's gone,
	And this house just ain't no home anytime she goes away.

	Anytime she goes away.
	Anytime she goes away.
	Anytime she goes away.
	Anytime she goes away.
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
