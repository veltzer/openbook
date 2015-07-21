<%page args='part'/>
% if part=='Vars':
<%
	# vim: set filetype=lilypond :
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('My', version)
	attributes.setDefaultVersionName('My')

	attributes['heb']=True

	attributes['title']=u'אלוהים שלי'
	attributes['style']='Israeli'
	attributes['composer']=u'עוזי חיטמן'
	attributes['poet']=u'עוזי חיטמן'
	attributes['piece']=u'בלדה מתונה'
	attributes['singer']=u'עוזי חיטמן'
	attributes['arranger']=u'יאיר רוזנבלום'
	attributes['typesetter']=u'מרק ולצר <mark.veltzer@gmail.com>'

	attributes['completion']='2'
	attributes['uuid']='467b2af8-a26f-11df-b03d-0019d11e5a41'

	attributes['idyoutube1']='fTZb0abU4Rw'

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

	\myMark "A"
	\startPart
	g2:m | d:7 | g:m~ | g4:m d:7 |
	g2:m | d:7 | g:m~ | g4:m d:7 | \myEndLine
	g2*2:m | c:m |
	g2:m/ees | d:7 | g:m | g4:m d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2:m | d:7 | g:m~ | g4:m d:7 |
	g2:m | d:7 | g:m~ | g4:m d:7 | \myEndLine
	g2*2:m | c:m |
	ees2:maj | f:7 | bes1*2:maj | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceMy':
{
	\tempo "Allegro" 4 = 128
	\time 2/4
	\key g \minor

	%% part "A"
	bes'4 bes | a a | g2~ | g4 a |
	bes4 bes | a a | g2~ | g4 d |
	g2 | a4 bes | d2 | c4 a |
	bes bes | a a | g2~ | g |

	%% part "A"
	bes | a4 d | g,2~ | g4 a |
	bes2 | a4 d4 | g,2~ | g |
	g4 g | a bes | d c | c2 |
	bes4 bes | c c | d2~ | d2 |
}
% endif

% if part=='LyricsMy':
\lyricmode {

	%% part "A"
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
