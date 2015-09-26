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

	attributes['title']=u'כמה יפה פורח הלילך'
	attributes['style']='Israeli'
	attributes['piece']=u'בלדה מתונה'
	attributes['typesetter']=u'מרק ולצר <mark.veltzer@gmail.com>'

	attributes['completion']='2'
	attributes['uuid']='4ae1d01a-a26f-11df-8e51-0019d11e5a41'
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

	\mark "verse"
	\startPart
	a1:m7 | d:m7 | a:m7 | e | \myEndLine
	a:m7 | d2:m7 g:7 | c:maj7 d4:m7 g:7 | c1:maj7 | \myEndLine
	\endPart

	\mark "chorus"
	\startPart
	f:maj7 | e:m7 | d2:m7 e:7 | a1:m7 | \myEndLine
	d2:7 e:m7 | f:maj7 d4:m7 g:7 | c2:maj7 d4:m7 e:7 | a1:m7 | \myEndLine
	\endPart

	\endSong

	\endChords
}
% endif

% if part=='VoiceMy':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key a \minor

	a'1
}
% endif

% if part=='LyricsMy':
\lyricmode {
	שלום
}
% endif
