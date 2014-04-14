<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="My"
	attributes['heb']=True

	attributes['title']=u"אלוהים שלי"
	attributes['style']="Israeli"
	attributes['composer']=u"עוזי חיטמן"
	attributes['poet']=u"עוזי חיטמן"
	attributes['singer']=u"עוזי חיטמן"
	attributes['piece']=u"בלדה מתונה"
	attributes['arranger']=u"יאיר רוזנבלום"
	attributes['typesetter']=u"מרק ולצר <mark.veltzer@gmail.com>"

	attributes['completion']="2"
	attributes['uuid']="467b2af8-a26f-11df-b03d-0019d11e5a41"

	attributes['idyoutube']="fTZb0abU4Rw"

%>
% endif

% if part=='Doc':
	DONE:
	TODO:
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords

	\startSong

	g2:m | d2:7 | g2:m ~ | g4:m d4:7 |
	g2:m | d2:7 | g2:m ~ | g4:m d4:7 | \myEndLine
	g2:m | g2:m | c2:m | c2:m |
	g2:m/ees | d2:7 | g2:m | g4:m d4:7 | \myEndLine

	g2:m | d2:7 | g2:m ~ | g4:m d4:7 |
	g2:m | d2:7 | g2:m ~ | g4:m d4:7 | \myEndLine
	g2:m | g2:m | c2:m | c2:m |
	ees2:maj | f2:7 | bes2:maj | bes2:maj | \myEndLine

	\endSong

	\endChords
}
% endif

% if part=='VoiceMy':
\relative f' {
	\time 2/4
	\key g \minor
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 128

	bes'4 bes'4 | a'4 a'4 | g'2 ~ | g'4 a'4 |
	bes'4 bes'4 | a'4 a'4 | g'2 ~ | g'4 d'4 |
	g'2 | a'4 bes'4 | d''2 | c''4 a'4 |
	bes'4 bes'4 | a'4 a'4 | g'2 ~ | g'2 |

	bes'2 | a'4 d''4 | g'2 ~ | g'4 a'4 |
	bes'2 | a'4 d''4 | g'2 ~ | g'2 |
	g'4 g'4 | a'4 bes'4 | d''4 c''4 | c''2 |
	bes'4 bes'4 | c''4 c''4 | d''2 |
}
% endif

% if part=='LyricsMy':
\lyricmode {
	א -- לו -- הים ש -- לי, ר -- צי -- תי ש -- ת -- דע
	ח -- לום ש -- ח -- למ -- תי ב -- לי -- לה ב -- מי -- טה
	ו -- ב -- ח -- לום ר -- אי -- תי מל -- אך
	מ -- ש -- מי -- ים בא א -- לי ו -- א -- מ -- ר לי כך

	באתי משמיים, עברתי נדודים
	לשאת ברכת שלום לכל הילדים
	לשאת ברכת שלום לכל הילדים

	וכשהתעוררתי נזכרתי בחלום
	ויצאתי לחפש מעט שלום
	ולא היה מלאך ולא היה שלום
	הוא מזמן הלך ואני עם החלום

	אלוהים שלי, רצית שתדע
	חלום שחלמתי בלילה במיטה
	ובחלום ראיתי מלח
	ממצולות הים עלה ואמר לי כך
	באתי מן המים, ממצולות הים
	לשאת ברכת שלום לילדי כל העולם
	לשאת ברכת שלום לילדי כל העולם

	וכשהתעוררתי נזכרתי בחלום
	ויצאתי לחפש מעט שלום
	ולא היה מלח ולא היה שלום
	הוא את הבשורה לקח ואני עם החלום

	אלוהים שלי, רציתי שתדע
	שהחלום הזה נשאר לי כחידה
	אלוהים שלי, רציתי שתדע
	על החלום שלי רציתי שתדע
	אלוהים שלי, רק רציתי שתדע
}
% endif
