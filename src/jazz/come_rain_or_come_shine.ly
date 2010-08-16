\include "src/include/common.lyi"
\header {
	title="Come Rain Or Come Shine"
	subtitle=""
	composer="Harold Arlen"
	poet="Johnny Mercer"
	style="Jazz"
	piece="Modeartely Slow"
	copyright="1946, by A-M Music Corp. Copyright Renewed, all rights controlled by Chappell & Co., Inc."

	completion="5"
	uuid="b109cd80-a26e-11df-8c11-0019d11e5a41"
}

%{
	TODO:
	- Enter Amits chords for this as an alternative...
%}

%% this set of chords is from Amit Golan
myChordsAmit=\chordmode {
	\set chordChanges = ##t
	\mark "A"
	f1:maj7 | e2:m7.5- a2:7.9- | d1:m6 | d1:m6 | \break
	g1:7.9 | g2:m7 c2:7 | f1:maj7 | c2:m7 f2:7 | \break

	bes1:m6 | f1:m6 | bes2:m7 bes2:m7/aes | g2:m7 c2:m7.5+ | \break
	d2:m7.5- g2:7.9- | c2:m7 c2:m7/bes | a2:m7.5- d2:7.9- | g2:m7 c2:7 \bar "||" \break

	\mark "B"
	f1:maj7 | e2:m7.5- a2:7.9- | d1:m6 | d1:m6 | \break
	b1:m7.5- | e:7 | a1:7 | bes2:7 a2:7 | \break

	d2:7 ees2:maj7 | d1:7 | g2:7 aes2:7.9 | g2.:7.9 a4:7 | \break
	d2:m6 b2:m7.5- | e2:m7.5- a2:7.9- | d1:m6 | g2:m7 c2:7 | \break
}
%% this set of chords is taken from the fake book
myChords=\chordmode {
	\set chordChanges = ##t
	\mark "A"
	f2:maj7 b2:m7.5- | e2:m7.5- a2:7.9- | d1:m7 | g1:7.9 | \break
	g1:7.9 | g2:m7 c2:7 | f1:7 | c2:m7 f2:7 | \break

	bes1:m7 | f1:m | bes2:m g2:m7.5- | c2:7.5- c4:7.5 c4:7.5+ | \break
	d2:m7.5- g2:7.9- | c1:m | c4:m7 f4:7 bes4:m7 ees4:m7 | a2:m7 g4:m7 c4:7 \bar "||" \break

	\mark "B"
	f2:maj7 b2:m7.5- | e2:m7.5- a2:7.9- | d1:m7 | g1:7.9 | \break
	cis1:m7.5- | fis2:m7 b2:7 | a1:7 | bes2:7 a2:7 | \break

	d2:7 ees2:maj7 | d1:7 | g2:7 aes2:7.9 | g2.:7.9 a4:7 | \break
	d2:m7 g4:7 g4:7/f | e2:m7.5- a2:7.9- | d1:m7 | g2:m7 c2:7 | \break
}

myVoice=\relative f' {
	\time 4/4
	\key f \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Moderato" 4 = 100

	a4 a8 a8 a8 a4 a8 | a4 a8 a8 a8 a4 a8 | a8 f f f ~ f2 ~ | f1 |
	a4 a8 a8 a8 a4 a8 | c4 a8 a8 a8 a4 a8 | a8 f f f ~ f2 ~ | f1 |

	bes2 bes4 aes8 bes8 | c4 f,2 f8 f8 | bes2 bes4 aes8 bes8 | c1 |
	d2 d4 c8 d8 | ees4 c2 c8 d8 | ees8 c8 d4 c4 bes8 g8 | a4 g2. |

	a4 a8 a8 a8 a4 a8 | a4 a8 a8 a8 a4 a8 | a8 f f f ~ f2 ~ | f1 |
	b4 b8 b8 b8 b4 b8 | b4 b8 b8 b8 b4 b8 | cis8 a8 a8 a8 ~ a2 ~ | a1 |

	d4 d8 d8 d8 d4 d8 | d4 d,2 d4 | d'4 d8 d8 d8 d4 d8 | d4 d,2 e4 |
	a4 a8 bes8 b8 d4. | e4 e8 d8 e8 d8 e4 | d1 ~ | d2 r2 |
}
myLyrics=\lyricmode {
	I'm gon -- na love you like no -- bod -- y's loved you,
	Come Rain Or Come Shine.
	High as a moun -- tain and deep as a riv -- er,
	Come Rain Or Come Shine.

	I guess when you met me
	It was just one of those things.
	But don't ev -- er bet me,
	'Cause I'm gon -- na be true if you let me.

	You're gon -- na love me like no -- bod -- y's loved me,
	Come Rain Or Come Shine.
	Hap -- py to -- geth -- er, un -- hap -- py to -- geth -- er
	And won't it be fine.

	Days may be cloud -- y or sun -- ny,
	We're in or we're out of the mon -- ey.
	But I'm with you al -- ways,
	I'm with you rain _ or shine!
}
%% score for printing
\score {
	<<
%%		\new ChordNames="mychords" \myChords
		\new ChordNames="mychords" \myChordsAmit
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
%%		\new ChordNames="mychords" \myChords
		\new ChordNames="mychords" \myChordsAmit
		\new Voice="myvoice" \myVoice
	>>
	\midi {
	}
}
