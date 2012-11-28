<%page args="part"/>
% if part=='Vars':
<%
	attributes['doOwn']=True
	attributes['doGuitar']=True

	attributes['title']="Ain't No Sunshine"
	attributes['composer']="Bill Withers"
	attributes['style']="Pop"
	attributes['piece']="Med. Ballad"

	attributes['completion']="0"
	attributes['uuid']="669540fe-d851-11df-ae78-0019d11e5a41"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- finish the tune and the chords...
% endif

% if part=='Own':
PartChords=\chordmode {
	\startChords

	\mark "Intro"
	c1 | g1:7 | a1:m | f1 | g1:7 | d1:m | f1 | c2. g4:7 |
	\mark "Verse"
	c1 | g1:7 | a1:m | f1 | g1:7 | d1:m | f1 | a2.:m g4:7 |

	\endChords
}
PartFrets=\new FretBoards {
	\PartChords
}
\score {
<<
		\PartFrets
		\new ChordNames="Chords"
		%% this adds a bar engraver which does not always come with chords
		%% I didn'f find a way to put this with the chords themselves...
		\with {
			%% for lilypond 2.12
			%%\override BarLine #'bar-size = #4
			\override BarLine #'bar-extent = #'(-2 . 2)
			\consists "Bar_engraver"
		}
		\PartChords
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
% endif
