\include "lilypond/include/common.lyi"
\header {
	filename="shape_of_my_heart.ly"
	title="Shape of My Heart"
	subtitle=""
	composer=""
	singer="Sting"
	copyright=""
	style="Pop"
	piece="Med. Ballad"

	enteredby="[% lily_enteredby %]"
	maintainerEmail="[% lily_maintaineremail %]"
	footer="[% lily_footer %]"
	tagline="[% lily_tagline %]"
}

%{
	TODO:
	- add lyrics
	- add tune
%}

harmony=\chords {
	\mark "verse"
	ges2:min ges2:min
	\mark "chorus"
%{
	verse:
	Gbm Gbm|E | Dmaj7 D/Db7 | x2 
	Dmaj7 | Amaj7 Db7 | Dmaj7 Db7 | Gbm |
	chorus:
	Gbm Gbm|E | Dmaj7 Db7 | x2 
	Dmaj7 | Amaj7 Db7 | Dmaj7 Db7 | Gbm |
%}
}

\score {
	<<
		\context ChordNames \harmony
	>>
	\midi {}
	\layout {}
}
