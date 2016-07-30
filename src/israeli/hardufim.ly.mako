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

	attributes['title']=u'הרדופים ליד החוף'
	attributes['style']='Israeli'
	attributes['composer']=u'שלמה ארצי'
	attributes['poet']=u'נתן יונתן'
	attributes['piece']=u'שירי ארץ ישראל'
	attributes['singer']=u'שלמה ארצי'
	attributes['typesetter']=u'מרק ולצר <mark.veltzer@gmail.com>'

	attributes['completion']='5'
	attributes['uuid']='95e9e525-ef27-4e45-bba0-9ba1391723c1'
	attributes['remark']='The D minor is the original key from the Shlomo Artzi album'

	attributes['idyoutube1']='jl5uOClGcWQ'
	attributes['lyricsurl']='http://www.mp3music.co.il/lyrics/579.html'

%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- the basics are here. Duplicate the A and B parts again (in chords and melody) and plug
	the A part again. There are some minor chord changes. Check vs the you tube performance.
	Then adjust the lyrics and you are done.
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		d1:m | g2:m7 c:7 | f1:maj7 | g:m | \myEndLine
		g:m7 | bes:maj7 | d2:dim7 a:7 |
	} \alternative {
		{ d1:m | }
		{ d:m | }
	} \myEndLine
	\endPart

	\myMark "B"
	\startPart
	\repeat volta 2 {
		a2 a2:7 | d1:m | g2:m7/c c:7 | f1:maj7 | \myEndLine
	} \alternative {
		{
			bes2:maj7 a:7 | ees1:maj7 | e2:m7.5- ees:maj7 | d1:m | \myEndLine
		}
		{
			bes2:maj7 a:7 | d1:m/f | d2:dim7 a:7 | d1:m | \myEndLine
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceMy':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key d \minor

	\set Staff.midiInstrument = #"flute"

	\partial 4 f8 e |

	%% part "A"
	\repeat volta 2 {
		d4. d'8 c4 bes8 a | g2. f8 g | a4. c,8 f4 a8 g | d2. e8 f |
		g4. f8 e4 d8 d' | bes2 a4 g | f4. f8 e4. e8 |
	} \alternative {
		{ d2. f8 e | }
		{ d2. cis8 d | }
	}

	%% part "B"
	\repeat volta 2 {
		e4. a,8 d4. e8 | f4 f2 e8 f | g4. c,8 f4. g8 | a4 a2 bes8 c |
	} \alternative {
		{ d4. cis8 f4. e8 | d4 d2 c8 bes | a4. a8 bes c bes4 | a2. cis,8 d | }
		{ d'4. cis8 f4. e8 | d4 d2 bes8 c | d4. cis8 f4. e8 | d2. f,8 e | }
	}
}
% endif

% if part=='LyricsMy':
\lyricmode {
	לא נפ -- רח כבר פ -- ע -- מ -- יים, ו -- ה -- רו -- ח על ה -- מ -- ים,
	י -- פ -- זר דמ -- מה צו -- נ -- נת על פ -- ני -- נו ה -- חיוו -- רות

	ש -- מה _

	בלי תו -- גה, כפו -- פי צ -- מ -- רת, בלו -- ר -- יות שי -- בה נב -- ד -- רת
	ב -- א -- שר י -- פות ה -- תו -- אר, בין שרי -- קות ה -- ע -- _ ד -- רים.

	תפ -- נו
}
% endif

% if part=='LyricsmoreMy':
\lyricmode {
	_ _ בין אי -- בי ה -- נ -- חל, ב -- ש -- עה א -- חת נש -- כ -- חת,
	זכ -- רו -- נות א -- זוב ש -- ל -- נו מת -- רפ -- קים על ה -- קי -- _ _ _ רות.

	_ _ קי ג -- וון יר -- טי -- טו, ב -- לכ -- תן לר -- חוץ ב -- ז -- רם
	נכ -- ל _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ מים נש -- פיל עי -- נ -- נו, אל ה -- מ -- ים ה -- קרי -- רים.

	לא נו
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
					"הרדופים שלי, כמוני, וכמוך שכל ימייך,"
					"את פרחי האור שלנו את פיזרת לכל רועה."
					"לא עופות מרום אנחנו, ואל גובה השמיים,"
					"גם אתם, גם אנוכי - לא נגיע כנראה."
					\vspace #0.3

					\box "A"
					"רק בהר על קו הרכס מישהו מוסיף ללכת,"
					"מן הואדי והאבן, לרכסים, אל הרוחות."
					"עד אשר בכסות הערב, יחזור נוגה אלייך,"
					"עם פכפוך פלגים, עם רחש הרדופים ליד החוף."
				}
				\hspace #3
				\right-column {

					\box "A"
					"לא נפרח כבר פעמיים, והרוח על המים,"
					"יפזר דממה צוננת על פנינו החיוורות"
					"שמה בין איבי הנחל, בשעה אחת נשכחת,"
					"זכרונות אזוב שלנו מתרפקים על הקירות."
					\vspace #0.3

					\box "B"
					"בלי תוגה, כפופי צמרת, בלוריות שיבה נבדרת"
					"באשר יפות התואר, בין שריקות העדרים."
					"תפנוקי גוון ירטיטו, בלכתן לרחוץ בזרם"
					"נכלמים נשפיל עיננו, אל המים הקרירים."
					\vspace #0.3

					\box "A"
					"לא נוסיפה עוד לנוע, משתאים נביט ברוח"
					"איך הוא יחד עם המים, מפרקים את הסלעים."
					"תאנה חנטה פגיה, והנשר היגע -"
					"אל קינו חזר בחושך מדרכי האלוהים."

				}
			}
		}
	}
}
% endif
