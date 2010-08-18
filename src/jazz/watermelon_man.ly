\include "src/include/common.lyi"
\header {
	title="Watermelon Man"
	composer="Herbie Hancock"
	style="Jazz"
	piece="Med Swing"

	uuid="359f7428-a26f-11df-ad8c-0019d11e5a41"
}

%{
	TODO:
	- turn the tune relative
%}

myChords=\chordmode {
	\startChords

	\startSong

	\repeat volta 2 {
		f1:7 | f1:7 | f1:7 | f1:7 | \myEndLine
		bes1:7 | bes1:7 | f1:7 | f1:7 | \myEndLine
		c1:7 | bes1:7 | c1:7 | bes1:7 | \myEndLine
		c1:7 | bes1:7 | f1:7 | f1:7 | \myEndLine
	}
	\endSong

	\endChords
}

myVoice={
	\key c \major
	\time 4/4
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130

	ees''1 ~ | ees''4 f'8 f'8 <aes' c''> ( <bes' d''>4-. ) f'8 ~ | f'1 ~ | f'2 r2 |
	f''1 ~ | f''4 f'8 f'8 <aes' c''> ( <bes' d''>4-. ) f'8 ~ | f'1 ~ | f'2 r2 |
	r4 c''8 ( c''8 g''4 a''4 | aes''8 g''8 f''8 d''8 f''4 g''-. ) |
	r4 c''8 ( c''8 g''4 a''4 | aes''8 g''8 f''8 d''8 c''4 d''-. ) |
	r4 c''8 ( c''8 g''4 aes''4 | f''-. ) f'8 f'8 <aes' c''> ( <bes' d''>4-. ) f'8 ~ | f'1 | r1 |
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
