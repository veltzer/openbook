\include "src/include/common.lyi"
\header {
	title="Watermelon Man"
	subtitle=""
	composer="Herbie Hancock"
	copyright="1962, 1963 & 1965 By Hancock Music Co., New York, NY"
	style="Jazz"
	piece="16-Bar Blues"
	poet=""

	completion="5"
	uuid="359f7428-a26f-11df-ad8c-0019d11e5a41"
}

%{
	TODO:
	- add the piano accompaniment for this song (rythm pattern with some notes - ripp
	it off the album).
%}

myChords=\chordmode {
	\startChords

	\startSong

	f1:7 | f1:7 | f1:7 | f1:7 | \myEndLine
	bes1:7 | bes1:7 | f1:7 | f1:7 | \myEndLine
	c1:7 | bes1:7 | c1:7 | bes1:7 | \myEndLine
	c1:7 | bes1:7 | f1:7 | f1:7 | \myEndLine

	\endSong

	\endChords
}

myVoice=\relative ees'' {
	\key c \major
	\time 4/4
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130

	ees1\< ~ | ees4\! f,8 f8 <aes c> ( <bes d>4-. ) f8 ~ | f1 ~ | f2 r2 |
	f'1\< ~ | f4\! f,8 f8 <aes c> ( <bes d>4-. ) f8 ~ | f1 ~ | f2 r2 |
	r4 c'8 ( c8 g'4 a4 | aes8 g8 f8 d8 f4 g-. ) |
	r4 c,8 ( c8 g'4 a4 | aes8 g8 f8 d8 c4 d-. ) |
	r4 c8 ( c8 g'4 aes4 | \mark \markup { \italic { break } } f-. ) f,8 f8 <aes c> ( <bes d>4-. ) f8 ~ | f1 | r1 |
}
%% score for printing
\score {
	<<
		\new ChordNames="mychords" \myChords
		\new Voice="myvoice" \myVoice
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
