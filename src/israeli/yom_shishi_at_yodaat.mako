<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doChordBars']=True
	version['doGuitar']=True
	version['doExtra']=True
	attributes.addVersion('My', version)
	attributes.setDefaultVersionName('My')

	attributes['heb']=True

	attributes['title']=u'יום שישי את יודעת'
	attributes['style']='Israeli'
	attributes['composer']=u'יהודה פוליקר'
	attributes['poet']=u'יעקב גלעד'
	attributes['piece']=u'רוקנרול'
	attributes['singer']=u'יהודה פוליקר'
	attributes['typesetter']=u'מרק ולצר <mark.veltzer@gmail.com>'

	attributes['completion']='5'
	attributes['uuid']='d4c79db6-8aec-11e1-bca8-3b15b6cb5cfe'
	attributes['remark']='The chords were taken from the original song which is in the C scale'

	attributes['idyoutuberemark1']='הביצוע המקורי של בנזין'
	attributes['idyoutube1']='wD0Zlwg5VOg'
	attributes['lyricsurl']='http://shironet.mako.co.il/artist?type=lyrics&lang=1&prfid=187&wrkid=1537'
%>
% endif

% if part=='Doc':
	DONE:
	- put in the chords (my own extraction)
	- put in the lyrics.
	- put in a youtube performance.
	- checked the chords.
	- checked the lyrics.
	TODO:
	- put in the intro solo and the connection solo (it's pretty easy).
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\myWordMark "Intro"
	f1 | g | c | a:m | \myEndLine
	f | g | c1*2 | \myEndLine

	\myWordMark "Verse"
	\repeat volta 2 {
		c1*2 | g1*2 | \myEndLine
		g1*2 | c1*2 | \myEndLine
	}
	bes1 | a | aes | g | \myEndLine
	c2 c4 d | ees1 | c1*2 | \myEndLine

	\myWordMark "Chorus"
	\repeat volta 2 {
		f1 | g | c | a:m | \myEndLine
		d:m7 | g | c | c:7 | \myEndLine
	}
	\myWordMark "Bridge"
	f | g | c1*2 | \myEndLine

	\myWordMark "Outro"
	\repeat volta 2 {
		c1 | g | g | c | \myEndLine
	}

	\endSong
	\endChords
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
					"אז אני מטלפן מתכנן מתכונן"
					"מתקלח שעה מתבונן במראה"
					"מחטא יבלות ומרים משקולות"
					"משחרר כיווצים ומותח קפיצים"
					"כשהראש מסודר לא איכפת שום דבר"
					"יום שישי כבר מגיע"
					"השבוע נגמר"
					\vspace #0.3
					\box "Chorus"
					"יום שישי את יודעת..."
					\vspace #0.3
					\box "Verse"
					"כשעובר יום שבת והזמן זז לאט"
					"אני שוב מיובש, עוד שבוע חדש"
					"בעיות, עניינים, חדשות, עיתונים"
					"והכל שגרתי, שיעמום אמיתי"
					"אז עכשיו אני כאן, מעביר את הזמן"
					"אין לי דרך לברוח, לא יודע לאן"
					\vspace #0.3
					\box "Chorus"
					"יום שישי את יודעת..."
				}
				\hspace #3
				\right-column {
					\box "Verse"
					"השבוע מתחיל מאוחר כרגיל"
					"אין לי כח לקום אין לי חשק לכלום"
					"יום ראשון דיכאון יום שני עצבני"
					"יום שלישי לא ניגמר רביעי מיותר"
					"וביום חמישי מצב רוח חופשי"
					"זה כבר סוף השבוע"
					"ומחר יום שישי"
					\vspace #0.3
					\box "Chorus"
					"יום שישי את יודעת"
					"יש בעיר מסיבה"
					"נשארים כל הלילה"
					"עד הבוקר הבא"
					"יום שישי את יודעת"
					"והיום במיוחד"
					"אם תירצי כל הלילה"
					"הוא שלנו לבד"
				}
			}
		}
	}
}
% endif
