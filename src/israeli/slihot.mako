<%def name="vars()">
<%
	attributes['jazzTune']=True
	attributes['type']="harmony_tune_lyricsmore"
	attributes['render']="My"

	attributes['title']=u"סליחות"
	attributes['subtitle']=u"באת אלי"
	attributes['composer']=u"עודד לרר"
	attributes['piece']=u"בלדה מתונה"
	attributes['poet']=u"לאה גולדברג"
	attributes['singer']=u"יהודית רביץ"

	attributes['completion']="5"
	attributes['uuid']="11ad0c38-6dc9-4318-873f-5e7e80b7c8a8"

	attributes['idyoutube']="DZd_Ik2SNcg"
	attributes['idyoutube']="jZ_8rSmLFwU"
%>
</%def>

<%doc>
	DONE:
	- did the opening.
	- did the lyrics for the first half of the song.
	TODO:
	- check the rythm of the melody to see if it's ok.
	- add the ending.
	- check the singers word intonation to check if it's ok.
	- document the you tube performances.
</%doc>

<%def name="myChordsMy()">
\chordmode {
	\startChords

	\startSong

	\mark "Intro"
	\startPart

	\partial 4 r4

	a2.:m | d:m7 | g:7 | c:maj7 |
	f:maj7 | b:7 | e:7 |

	\endPart

	\mark "A"
	\startPart

	a2.:m | d:m7 | e:7 | a:m |
	a:m | d:m7 | e:7 | a:7 |
	d:m7 | g:7 | c2:maj7 c4:maj7/d | e2.:7 |
	a:m | d:m7 | e:7 | a:7 |
	d:m7 | g:7 | c2:maj7 c4:maj7/d | e2.:7 |
	a:m | d:m7 | e:7 | a:m | a:m |

	\endPart

	\mark "B"
	\startPart

	\repeat unfold 2 {
		a2.:m | d:m7 | g:7 | c:maj7 |
		f:maj7 | b:7 | e:7 | a:m |
	}
	a:m |

	\endPart

	\endSong

	\endChords
}
</%def>

<%def name="myVoiceMy()">
\relative c' {
	\time 3/4
	\key a \minor
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Moderato" 4 = 112

	%% Intro
	\partial 4 a'8 e |
	c'4 a4. e8 | f2 g8 a | b4 a4. g8 | f8 e4. f8 g |
	a2 f8 e | ees2 b8 a | gis4 a b |

	%% A part
	c'2 b8 a | g2 f8 d | e2 d4 | c8 b a2 |
	c'8 b a4 g8 f | e2 d8 e | f4 e ees | e2. |
	d4 e f | g a4. f8 | e4 e d | c b2 |
	a8 b c4 d8 e | g4 f d | e f ees | e2. |
	d4 e f | g a4. f8 | e4 e d | c b2 |
	a8 b c4 d8 e | g4 f d | e c b | a2. ~ | a2 a'8 e |

	%% B part
	c'2 a8 e | f2 g8 a | b4 a g | f e f8 g |
	a2 f8 e | ees2 b8 a | gis4 a b | c2 a'8 e |
	c'2 a8 e | f2 g8 a | b4 a g | f e f8 g |
	a2 b8 c | d2 b8 a | gis2 a8 b | a2. ~ | a2. |
}
</%def>

<%def name="myLyricsMy()">
\lyricmode {
	_ _
	_ _ _ _ _ _ _ _ _ _ _ _ _
	_ _ _ _ _ _ _ _ _

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
}
</%def>

<%def name="myLyricsMymore()">
\lyricmode {
	_ _
	_ _ _ _ _ _ _ _ _ _ _ _ _
	_ _ _ _ _ _ _ _ _

	אם ה -- יו עי -- נו -- יים - הם הפ -- לי -- גו אל -- יך
	מפר -- שי ה -- ל -- בן אל האו -- פל של -- ך
	תנני ללכת תנני ללכת
	לכרוע על חוף הסליחה.
}
</%def>

