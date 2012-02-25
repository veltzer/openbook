<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="My"
	attributes['heb']=True

	attributes['title']=u"הרדופים ליד החוף"
	attributes['style']="Israeli"
	attributes['composer']=u"שלמה ארצי"
	attributes['poet']=u"נתן יונתן"
	attributes['singer']=u"שלמה ראצי"
	attributes['piece']=u"שירי ארץ ישראל"

	attributes['completion']="5"
	attributes['uuid']="95e9e525-ef27-4e45-bba0-9ba1391723c1"

	attributes['idyoutube']="jl5uOClGcWQ"
	attributes['lyricsurl']="http://www.mp3music.co.il/lyrics/579.html"
	attributes['remark']="The D minor is the original key from the Shlomo Artzi album"

%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- everything
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\partial 4 r4 |
	\mark "A"
	\startPart
	\repeat volta 2 {
		d1:m | g2:m7 c:7 | f1:maj7 | g:m7 | \myEndLine
		bes:maj7 | g:m7 | bes2:maj7 a:7 |
	} \alternative {
		{ d1:m | }
		{ d1:m | }
	} \myEndLine
	\endPart

	\mark "B"
	\startPart
	\repeat volta 2 {
		a1:7 | d:m | c:7 | f:maj7 | \myEndLine
	} \alternative {
		{
			bes2:maj7 a:7 | bes1:maj7 | d2:m g:m7 | d1:m | \myEndLine
		}
		{
			bes2:maj7 a:7 | bes1:maj7 | bes2:maj7 a:7 | d1:m | \myEndLine
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceMy':
\relative f' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\set Staff.midiInstrument = #"flute"
	\time 4/4
	\key d \minor
	\partial 4 f8 e |
	%% part A
	\repeat volta 2 {
		d4. d'8 c4 bes8 a | g2. f8 g | a4. c,8 f4 a8 g | d2. e8 f |
		g4. f8 e4 d8 d' | bes2 a4 g | f4. f8 e4. e8 |
	} \alternative {
		{ d2. f8 e | }
		{ d2. cis8 d | }
	}
	%% part B
	\repeat volta 2 {
		e4. a,8 d4. e8 | f4 f2 e8 f | g4. c,8 f4. g8 | a4 a2 bes8 c |
	} \alternative {
		{ d4. cis8 f4. e8 | d4 d2 c8 bes | a4. a8 bes8 c bes4 | a2. cis,8 d | } 
		{ d'4. cis8 f4. e8 | d4 d2 bes8 c | d4. cis8 f4. e8 | d2. f,8 e | } 
	}
}
% endif

% if part=='LyricsMy':
\lyricmode {
לא נפ -- רח כבר פ -- ע -- מ -- יים, והרוח על המים,
יפזר דממה צוננת על פנינו החיוורות
שמה בין איבי הנחל, בשעה אחת נשכחת,
זכרונות אזוב שלנו מתרפקים על הקירות.

בלי תוגה, כפופי צמרת, בלוריות שיבה נבדרת
באשר יפות התואר, בין שריקות העדרים.
תפנוקי גוון ירטיטו, בלכתן לרחוץ בזרם
נכלמים נשפיל עיננו, אל המים הקרירים.

לא נוסיפה עוד לנוע, משתאים נביט ברוח
איך הוא יחד עם המים, מפרקים את הסלעים.
תאנה חנטה פגיה, והנשר היגע -
אל קינו חזר בחושך מדרכי האלוהים.

הרדופים שלי, כמוני, וכמוך שכל ימייך,
את פרחי האור שלנו את פיזרת לכל רועה.
לא עופות מרום אנחנו, ואל גובה השמיים,
גם אתם, גם אנוכי - לא נגיע כנראה.

רק בהר על קו הרכס מישהו מוסיף ללכת,
מן הואדי והאבן, לרכסים, אל הרוחות.
עד אשר בכסות הערב, יחזור נוגה אלייך,
עם פכפוך פלגים, עם רחש הרדופים ליד החוף.
}
% endif
