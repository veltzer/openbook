<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	#version['doChordBars']=True
	version['doGuitar']=True
	version['doExtra']=True
	attributes.addVersion('My', version)
	attributes.setDefaultVersionName('My')

	attributes['heb']=True

	attributes['title']=u'גשם'
	attributes['style']='Israeli'
	attributes['composer']=u'יחיאל אמסלם'
	attributes['poet']=u'יעקב גלעד'
	attributes['piece']=u'בלדת רוק'
	attributes['singer']=u'אלי לוזון'
	attributes['typesetter']=u'מרק ולצר <mark.veltzer@gmail.com>'

	attributes['completion']='5'
	attributes['uuid']='c562b5fa-c345-11e0-995c-0019d11e5a41'

	attributes['idyoutube1']='1CBj7q51-BQ'
	attributes['lyricsurl']='http://www.mp3music.co.il/lyrics/448.html'
%>
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\myWordMark "Intro"
	\startPart
	g2. g4:sus4 | g2. g4:sus4 | \myEndLine
	\endPart

	\myWordMark "Verse"
	\startPart
	\repeat volta 2 {
		\repeat volta 2 {
			g1 | d | c2 d | e1:m |
		}
		d | \myEndLine
	}
	\endPart

	\myWordMark "Chorus"
	\startPart
	e1:m | d | c2 d | g2. g4/fis | \myEndLine
	e1:m | d | c2 d | e:m a:m | \myEndLine
	b:m c | des:m7.5- b:m | g c | e1 | \myEndLine
	\endPart

	\myWordMark "Verse"
	\startPart
	\repeat volta 2 {
		a | e | d2 e | fis1:m |
	}
	e | \myEndLine
	\endPart

	\myWordMark "Chorus"
	\startPart
	fis:m | e | d2 e | fis1:m | \myEndLine
	fis:m | e | d2 e | \time 2/4 fis2:m | \myEndLine
	\repeat volta 2 {
		\time 4/4 b2:m cis:m | d ees:m7.5- | cis:m a | d fis | \time 2/4 fis2 | \myEndLine
	}
	\endPart

	%% commented in order to see the closing repeats
	%%\endSong
	%%\endChords
}
% endif

% if part=='VoiceMy':
{
	\tempo "Moderato" 4 = 80
	\time 4/4
	\key e \minor

	%% part "Intro"
	b2. c4 | b2. a8 b16 c |

	%% part "Verse"
	d8. c16 b8 c d8. c16 b8 c | d2.. e16 fis | g8. fis16 e8 e d8. b16 d8 e | b2.. b16 c |
	d8. d16 d8 d d8. d16 e8 fis | d2.. e16 fis | g8. fis16 e8 e d4 \times 2/3 { d8 d d } | e1 |
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
					\box "Verse"
					"אין מקום לדאגה היי שקטה"
					"אני איתך, את לא לבד לעת עתה"
					"עכשיו הכל זורם כאן במנוחה"
					"ואת בוכה, ואת בוכה."
					\vspace #0.3
					\box "Chorus"
					"ספרי לי מה כבד עלייך"
					"את כל מה שחבוי בך ונרדם"
					"אני אמחה את דמעותייך"
					"ורק שלא תבכי עוד לעולם."
				}
				\hspace #3
				\right-column {
					\box "Verse"
					"ברחובות כיבו מזמן את הניאון"
					"את נראית לי עייפה נלך לישון"
					"האור דולק בחדר השני"
					"אבל מישהו בוכה וזה לא אני."
					\vspace #0.3
					\box "Verse"
					"אני רוצה לשמור עלייך ועלי"
					"היום עבר עלינו יום קשה מדי"
					"בחוץ יורדים עכשיו גשמי ברכה"
					"ואת בוכה, ואת בוכה."
					\vspace #0.3
					\box "Chorus"
					"ספרי לי מה כבד עלייך"
					"את כל מה שחבוי בך ונרדם"
					"אני אמחה את דמעותייך"
					"ורק שלא תבכי עוד לעולם."
				}
			}
		}
	}
}
% endif
