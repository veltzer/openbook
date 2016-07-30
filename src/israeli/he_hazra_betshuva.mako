<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Epdf0', version)
	attributes.setDefaultVersionName('Epdf0')

	attributes['heb']=True

	attributes['title']=u'היא חזרה בתשובה'
	attributes['style']='Israeli'
	attributes['composer']=u'מתי כספי'
	attributes['poet']=u'יעקב רוטבליט'
	attributes['piece']=u'בוסה נובה'
	attributes['singer']=u'מתי כספי'
	attributes['typesetter']=u'מרק ולצר <mark.veltzer@gmail.com>'

	attributes['completion']='5'
	attributes['uuid']='24815072-2a71-11e1-a41f-0019d11e5a41'

	attributes['idyoutube1']='1GI5Vst5a-o'

%>
% endif

% if part=='Doc':
	DONE:
	TODO:
% endif

% if part=='ChordsEpdf0':
\chordmode {
	\startChords
	\startSong

	\partial 2. s2. |

	\myMark "A"
	\startPart
	c1*2:m | g:7/b | c:7/bes | f1:m9/a | f1:m | \myEndLine
	g:m7.5- | c:7 | f1*2:m |
	\endPart

	\myMark "B"
	\startPart
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceEpdf0':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \minor
}
% endif

% if part=='LyricsEpdf0':
\lyricmode {
}
% endif
