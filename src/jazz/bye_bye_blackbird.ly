\include "src/include/common.lyi"
\header {
	title="Bye Bye Blackbird"
	subtitle=""
	composer="Ray Henderson"
	poet="Mort Dixon"
	style="Moderately"
	piece="Jazz Ballad"
	copyright="1926 (Renewed) Warner Bros. Inc."

	structure="ABCD"

	completion="5"
	uuid="612da3c4-e08a-4afb-b257-ea67f45a0b5d"

	remark="taken from the jazz fakebook"
}

%{
	TODO:
	- add repeat on the whole song (it's supposed to repeat twice with the same lyrics).
	- add an optional ending to this standard from the fakebook (instead of the final
		turn around):
		f2 bes:2 bes2:m6 f2:6
	- add the real book harmonization option:
		f1 f f f f aes:dim g:m7 c:7
		g1:m7 g:m7 g:m7 c:7 g:m7 c:7 f f
		f1:7 f:7 a:m7.5- d:7 g:m7 g:m7 bes2:m7 ees2:7 g2:m7 c2:7
		f1 f a:m7.5- d:7 g:m7 c:7 f f
	- add a favourite performance of this song
%}
myChords=\chordmode {
	\startChords

	\startSong

	\mark "A"
	\startPart
	f1 | f2 d2:7 | g:m7 c:7.9 | f1 | \myEndLine
	f/a | aes:dim | g2:m7 c:7 | c1:7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	g2:m ees/g | g:m6 ees/g | g1:m7 | c:7 | \myEndLine
	g1:m7 | c:7 | f2:maj7 f:6 | f1:6 | \myEndLine
	\endPart

	\mark "C"
	\startPart
	f1:7 | f:7 | a:m7.5- | d:7 | \myEndLine
	g:m | g:m | g:m7.5- | c:7 | \myEndLine
	\endPart

	\mark "D"
	\startPart
	f1 | f | ees:7 | d:7 | \myEndLine
	g:m7 | g2:m7 c:7 | f d:m7 g:m7 c:7 | \myEndLine
	\endPart

	\endSong

	\endChords
}

myVoice=\relative f' {
	\time 4/4
	\key f \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Moderato" 4 = 116

	%% A part
	a4 a a a | bes a a2 | a4 g g2 | g4 f f2 |
	f1 | g | f2 e2 ~ | e1 |

	%% B part
	bes'4 bes bes bes | c bes bes2 | bes4 a a2 | a4 g g2 |
	g1 | a | g2 f ~ | f1 |

	%% C part
	f4 c' c c | c bes a g | g1 | fis |
	d4 bes' bes bes | bes a g f | f1 | e1 |

	%% D part
	a4 a a a | bes a a2 | a4 g g2 | g4 fis fis2 |
	g2 bes ~ | bes e, | f2 r2 | r1 |
}

myLyrics=\lyricmode {
	Pack up all my care and woe,
	Here I go,
	Sing -- ing low,
	Bye Bye Black -- bird,
	Where some -- bod -- y waits for me,
	Sug -- ar's sweet, so is she,
	Bye Bye Black -- bird.

	No one here can love or un -- der -- stand me,
	Oh, what hard luck sto -- ries they all hand me.
	Make my bed and light the light,
	I'll ar -- rive late to -- night,
	black -- bird bye bye.
}

%% score for printing
\score {
	<<
		\new ChordNames="mychords" \myChords
		\new Voice="myvoice" \myVoice
		\new Lyrics \lyricsto "myvoice" \myLyrics
	>>
	\layout {
	}
}
%% score for midi
\score {
	\unfoldRepeats
	<<
		\new ChordNames="mychords" \myChords
		\new Voice="myvoice" \myVoice
	>>
	\midi {
	}
}
