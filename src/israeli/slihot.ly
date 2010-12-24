\include "src/include/common.lyi"
\header {
	title="סליחות"
	subtitle="באת אלי"
	composer="עודד לרר"
	%%copyright=""
	style="Israeli"
	piece="Med. Ballad"
	poet="לאה גולדברג"
	singer="יהודית רביץ"

	completion="5"
	uuid="11ad0c38-6dc9-4318-873f-5e7e80b7c8a8"

	idyoutube="DZd_Ik2SNcg"
	idyoutube="jZ_8rSmLFwU"
}

%{
	TODO:
%}

myChords=\chordmode {
	\startChords

	\startSong

	\mark "A"
	\startPart

	a2.:m | d:m7 | e:7 | a:m |
	a:m | d:m7 | e:7 | a:7 |
	d:m7 | g:7 | c2:maj7 c4:maj7/d | e2.:7 |
	a:m | d:m7 | e:7 | a:7 |
	d:m7 | g:7 | c2:maj7 c4:maj7/d | e2.:7 |
	a:m | d:m7 | e:7 | a:m |

	\endPart

	\mark "B"
	\startPart

	\repeat unfold 2 {
		a2.:m | d:m7 | g:7 | c:maj7 |
		f:maj7 | b:7 | e:7 | a:m |
	}

	\endPart

	\endSong

	\endChords
}
myVoice=\relative c' {
	\time 3/4
	\key a \minor
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Moderato" 4 = 112

	c'4 b a | g2 f8 d | e2 d4 | c8 b a2 |
	c'8 b a4 g8 f | e2 d8 e | f4 e ees | e2. |
	d4 e f | g a4. f8 | e4 e d | c b2 |
	a8 b c4 d8 e | g4 f4. d8 | e4 f ees | e2. |
	d4 e f | g a4. f8 | e4 e d | c b2 |
	a8 b c4 d8 e | g4 f4. d8 | e4 c b | a2 a'8 e |

	c'2 a8 e | f2 g8 a | b4 a g | f e f8 g |
	a2 f8 e | ees2 b8 a | gis4 a b | c2 a'8 e |
	c'2 a8 e | f2 g8 a | b4 a g | f e f8 g |
	a2 b8 c | d2 b8 a | gis4 a b | a2. |
}
myLyrics=\lyricmode {
	בא -- ת א -- לי את עי -- ני לפ -- ק -- ו -- ח,
	ו -- גופ -- ך לי מ -- בט ו -- ח -- לון ו -- ר -- אי,
	בא -- ת כ -- לי -- לה ה -- בא אל ה -- או -- ח
	ל -- הר -- אות לו ב -- חו -- שך את כל ה -- דב -- רים.
	בא -- ת כ -- לי -- לה ה -- בא אל ה -- או -- ח
	ל -- הר -- אות לו ב -- חו -- שך את כל ה -- דב -- רים.

	ו -- ל -- מ -- ד -- תי: שם ל -- כל ריס ו -- צי -- פו -- רן
	ו -- ל -- כל ש -- ע -- רה ב -- ב -- שר ה -- ח -- שוף
	וריח _ _ _ יל -- דות רי -- ח ד -- בק ו -- או -- רן
	הוא ני -- חו -- ח לי -- לו של ה -- גוף, של ה -- גוף.

%%	אם היו עינויים - הם הפליגו אליך
%%	מפרשי הלבן אל האופל שלך
%%	תנני ללכת תנני ללכת
%%	לכרוע על חוף הסליחה.
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
