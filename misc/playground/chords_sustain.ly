\version "2.16.2"

%% this example explores how to write sustain chords in lilypond

chordset = \chordmode
{
	c:sus c:7sus c:9sus c:11sus c:13sus
	c:sus2 c:7sus2 c:9sus2 c:11sus2 c:13sus2
	c:sus4 c:7sus4 c:9sus4 c:11sus4 c:13sus4
}

\score { \new ChordNames \chordset }
