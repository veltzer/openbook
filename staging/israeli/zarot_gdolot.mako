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

	attributes['title']=u'צרות טובות'
	attributes['style']='Israeli'
	attributes['composer']=u'שלום חנוך'
	attributes['poet']=u'שמרית אור'
	attributes['piece']=u'בלדה מתונה'
	attributes['singer']=u'שלום חנוך'
	attributes['typesetter']=u'מרק ולצר <mark.veltzer@gmail.com>'

	attributes['completion']='0'
	attributes['uuid']='5a9b270e-a26f-11df-a792-0019d11e5a41'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- add you tube performances.
	- document what has been done to this tune.
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords

	\startSong

	\myWordMark "Verse"
	\startPart
	\repeat volta 2 {
		c2 b:m7.5- | a2:m7 d:m7 | g:7 c:maj7 | d:m7 g:7 | \myEndLine
	}
	\endPart

	\myWordMark "Chorus"
	\startPart
	a2:m7 g:7 | f1:maj7 | a2:m7 d:m7 | g1:7 | \myEndLine
	c2 b:m7.5- | a:m7 g:7 | f:maj7 g:7 | c g:7 | \myEndLine
	\endPart

	\endSong

	\endChords
}
% endif

% if part=='VoiceMy':
{
	a b c d e f
}
% endif

% if part=='LyricsMy':
\lyricmode {
	בעירי היו שתי עלמות
	שתי עלמות יפות ותאומות.
	הן היו תמיד כל כך דומות,
	כל כך דומות היו העלמות.

	ואהבתי את שתיהן, אלי,
	זאת שלי היתה וזאת שלי,
	ככה באו לי צרות טובות
	שתים הן ולא יודעות
	זאת על זו, וזו על זאת.

	האחת נשאתי להרים
	כדי לראות בזרח החמה
	ואת השניה ליערים
	לראות כיצד השמש נעלמה.

	ואהבתי את שתיהן אלי
	זו שלי הייתה וזו, שלי..
	ככה באו לי צרות טובות
	שתיים הן ולא יודעות
	זו על זו וזו על זו..

	איך שהימים חולפים מהר
	ואיך הליל הולך ומתקצר,
	והמלאכים רומזים לי כבר -
	מה אעשה, במי מהן אבחר?

	ואהבתי את שתיהן אלי
	זו שלי הייתה וזו, שלי..
	ככה באו לי צרות טובות
	שתיים הן ולא יודעות
	זו על זו וזו על זו..
}
% endif
