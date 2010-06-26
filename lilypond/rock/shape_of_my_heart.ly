\include "lilypond/include/common.lyi"
\header {
	filename="shape_of_my_heart.ly"
	title="Shape of My Heart"
	subtitle=""
	composer=""
	singer="Sting"
	style="Pop"
	piece="Med. Ballad"
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
