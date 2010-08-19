\include "src/include/common.lyi"
\header {
	title="Autumn Leaves"
	subtitle="Les Feuilles Mortes"
	composer="Joseph Kosma"
	copyright="1947, 1950, 1987 Enoch Et Cie. Renewed 1975, 1978 Enoch Et Cie"
%% Sole Selling Agent for U.S.A (including it's territories and possessions)
%% and Dominion of Canada: Morley Music Co., by arrangement with Enoch Et Cie
%% international Copyright Secured. All Rights Reserved.
	poet="Jacques Prevert, Johnny Mercer"
	style="Jazz"
	piece="Medium Swing"
	remark="derived from the real book and the fake book by Mark Veltzer on Mon May 22 02:18:00 IDT 2006"

	completion="5"
	uuid="8c35acf6-a7c1-11df-9040-0019d11e5a41"
}

%{
	TODO:
	- turn the tune relative.
%}

myChords=\chordmode {
	\startChords

	\startSong

	\partial 2. r2. |

	\mark "A"
	\startPart
	\repeat volta 2 {
		a1:m7 | d1:7 | g1:maj7 | c1:maj7 | \myEndLine
		fis1:m7.5- |
	}
	\alternative {
		{
			b1:7 | e1:m | e1:m | \myEndLine
		}
		{
			b1:7 | e2:m a2:m | e1:m | \myEndLine
		}
	}
	\endPart

	\mark "B"
	\startPart
	fis1:m7.5- | b1:7.9- | e1:m | e1:m | \myEndLine
	a1:m7 | d1:7 | g1:maj7 | g1:maj7 | \myEndLine
	fis1:m7.5- | b1:7.9- | e2:m7 ees2:7 | d2:m7 des2:7 | \myEndLine
	c1:maj7 | b1:7.9- | e2:m a:m | e1:m | \myEndLine
	\endPart

	\endSong

	\endChords
}
myVoice={
	\time 4/4
	\key e \minor
	%% http://en.wikipedia.org/wiki/Tempo
	\tempo "Allegro" 4 = 130

	\partial 2. e'4 fis'4 g'4 |
	\repeat volta 2 {
		c''1~ | c''4 d'4 e'4 fis'4 | b'2 b'2~ | b'4 c'4 d'4 e'4 |
		a'1~ |
	}
	\alternative {
		{
			a'4 b4 cis'4 dis'4 | g'1 | r4 e'4 fis'4 g'4 |
		}
		{
			a'4 fis'4 a'4 g'4 | e'1~ | e'4 r4 dis'4 e'4 |
		}
	}
	fis'4 b4 fis'2~ | fis'4 fis'4 e'4 fis'4 | g'1~ | g'4 g'4 fis'4 g'4 |
	a'1~ | a'4 d'4 d''4 c''4 | b'1~ | b'4 r4 ais'4 b'4 |
	c''4 c''4 a'4 a'4 | fis'2. c''4 | b'2 b'2~ | b'2. e'4 |
	a'2. g'4 | fis'2 g'4 b4 | e'1~ | e'4 r4 r2 |
}
myLyrics=\lyricmode {
	The fall -- ing leaves drift by the win -- dow
	The au -- tumn leaves, of red and gold.
	I see your

	_ I used to hold. Since you

	went a -- way the days grow long,
	And soon I'll hear old win -- ter's song.
	But I miss you most of all my dar -- ling,
	When au -- tumn leaves start to fall.
}
myLyricsmore=\lyricmode {
	I see your lips, the sum -- mer kiss -- es,
	The sun -- burned hands
}
%% score for printing
\score {
	<<
		\new ChordNames="mychords" \myChords
		\new Voice="myvoice" \myVoice
		\new Lyrics \lyricsto "myvoice" \myLyrics
		\new Lyrics \lyricsto "myvoice" \myLyricsmore
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
