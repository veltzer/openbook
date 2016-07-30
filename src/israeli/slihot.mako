<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	version['doExtra']=True
	attributes.addVersion('My', version)
	attributes.setDefaultVersionName('My')

	attributes['heb']=True

	attributes['title']=u'סליחות'
	attributes['style']='Israeli'
	attributes['subtitle']=u'באת אלי'
	attributes['composer']=u'עודד לרר'
	attributes['poet']=u'לאה גולדברג'
	attributes['piece']=u'בלדה מתונה'
	attributes['singer']=u'יהודית רביץ'
	attributes['typesetter']=u'מרק ולצר <mark.veltzer@gmail.com>'

	attributes['completion']='5'
	attributes['uuid']='11ad0c38-6dc9-4318-873f-5e7e80b7c8a8'

	attributes['idyoutube1']='DZd_Ik2SNcg'
	attributes['idyoutube2']='jZ_8rSmLFwU'
	attributes['lyricsurl']='http://shironet.mako.co.il/artist?type=lyrics&lang=1&prfid=462&wrkid=2413'
%>
% endif

% if part=='Doc':
	DONE:
	- did the opening.
	- did the lyrics for the first half of the song.
	TODO:
	- check the rythm of the melody to see if it's ok.
	- add the ending.
	- check the singers word intonation to check if it's ok.
	- document the you tube performances.
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myWordMark "Intro"
	\startPart
	a2.:m | d:m7 | g:7 | c:maj7 |
	f:maj7 | b:7 | e:7 | \myEndLine
	\endPart

	\myWordMark "A"
	\startPart
	a2.:m | d:m7 | e:7 | a:m |
	a:m | d:m7 | e:7 | a:7 | \myEndLine
	d:m7 | g:7 | c2:maj7 c4:maj7/d | e2.:7 |
	a:m | d:m7 | e:7 | a:7 | \myEndLine
	d:m7 | g:7 | c2:maj7 c4:maj7/d | e2.:7 |
	a:m | d:m7 | e:7 | a:m | a:m | \myEndLine
	\endPart

	\myWordMark "B"
	\startPart
	\repeat unfold 2 {
		a2.:m | d:m7 | g:7 | c:maj7 |
		f:maj7 | b:7 | e:7 | a:m |
	}
	a:m | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceMy':
{
	\tempo "Moderato" 4 = 112
	\time 3/4
	\key a \minor

	\partial 4 a'8 e |

	%% part "Intro"
	c'4 a4. e8 | f2 g8 a | b4 a4. g8 | f8 e4. f8 g |
	a2 f8 e | ees2 b8 a | gis4 a b |

	%% part "A"
	c'2 b8 a | g2 f8 d | e2 d4 | c8 b a2 |
	c'8 b a4 g8 f | e2 d8 e | f4 e ees | e2. |
	d4 e f | g a4. f8 | e4 e d | c b2 |
	a8 b c4 d8 e | g4 f d | e f ees | e2. |
	d4 e f | g a4. f8 | e4 e d | c b2 |
	a8 b c4 d8 e | g4 f d | e c b | a2. ~ | a2 a'8 e |

	%% part "B"
	c'2 a8 e | f2 g8 a | b4 a g | f e f8 g |
	a2 f8 e | ees2 b8 a | gis4 a b | c2 a'8 e |
	c'2 a8 e | f2 g8 a | b4 a g | f e f8 g |
	a2 b8 c | d2 b8 a | gis2 a8 b | a2. ~ | a2. |
}
% endif

% if part=='LyricsMy':
\lyricmode {
	_ _
	_ _ _ _ _ _ _ _ _ _ _ _ _
	_ _ _ _ _ _ _ _ _

	בא -- ת א -- לי את עי -- ני לפ -- ק -- ו -- ח,
	ו -- גופ -- ך לי מ -- בט ו -- ח -- לון ו -- ר -- אי,
	בא -- ת כ -- לי -- לה ה -- בא אל ה -- או -- ח
	ל -- הר -- אות לו ב -- חו -- שך את כל ה -- דב -- רים.
	בא -- ת כ -- לי -- לה ה -- בא אל ה -- או -- ח
	ל -- הר -- אות לו ב -- חו -- שך את כל ה -- דב -- רים. __

	ו -- ל -- מ -- ד -- תי: שם ל -- כל ריס ו -- צי -- פו -- רן
	ו -- ל -- כל ש -- ע -- רה ב -- ב -- שר ה -- ח -- שוף
	וריח _ _ _ יל -- דות רי -- ח ד -- בק ו -- או -- רן
	הוא ני -- חו -- ח לי -- לו של ה -- גוף, של ה -- גוף. __
}
% endif

% if part=='LyricsmoreMy':
\lyricmode {
	_ _
	_ _ _ _ _ _ _ _ _ _ _ _ _
	_ _ _ _ _ _ _ _ _

	אם ה -- יו עי -- נו -- יים - הם הפ -- לי -- גו אל -- יך
	מפר -- שי ה -- ל -- בן אל האו -- פל של -- ך
	תנני ללכת תנני ללכת
	לכרוע על חוף הסליחה.
}
% endif

% if part=='Extra':
%% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\fill-line {
			\hspace #0
			\concat {
				\right-column {

					\box "B"
					"ולמדתי: שם לכל ריס וציפורן"
					"ולכל שערה בבשר החשוף"
					"וריח ילדות ריח דבק ואורן"
					"הוא ניחוח לילו של הגוף."
					\vspace #0.3

					\box "A"
					"באת אלי את עיני לפקוח,"
					"וגופך לי מבט וחלון וראי,"
					"באת כלילה הבא אל האוח"
					"להראות לו בחושך את כל הדברים."
				}
				\hspace #3
				\right-column {

					\box "A"
					"באת אלי את עיני לפקוח,"
					"וגופך לי מבט וחלון וראי,"
					"באת כלילה הבא אל האוח"
					"להראות לו בחושך את כל הדברים."
					\vspace #0.3

					\box "B"
					"ולמדתי: שם לכל ריס וציפורן"
					"ולכל שערה בבשר החשוף"
					"וריח ילדות ריח דבק ואורן"
					"הוא ניחוח לילו של הגוף."
					\vspace #0.3

					\box "A"
					"אם היו עינויים - הם הפליגו אליך"
					"מפרשי הלבן אל האופל שלך"
					"תנני ללכת תנני ללכת"
					"לכרוע על חוף הסליחה."
				}
			}
		}
	}
}
% endif
