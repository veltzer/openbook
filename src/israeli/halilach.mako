<%page args="part"/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('My', version)
	attributes.setDefaultVersionName('My')

	attributes['heb']=True

	attributes['title']=u"כמה יפה פורח הלילך"
	attributes['style']="Israeli"
	attributes['piece']=u"בלדה מתונה"
	attributes['typesetter']=u"מרק ולצר <mark.veltzer@gmail.com>"

	attributes['completion']="2"
	attributes['uuid']="4ae1d01a-a26f-11df-8e51-0019d11e5a41"
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
	a1:m7 | d1:m7 | a1:m7 | e1 | \myEndLine
	a1:m7 | d2:m7 g2:7 | c2:maj7 d4:m7 g4:7 | c1:maj7 | \myEndLine
	\endPart

	\mark "chorus"
	\startPart
	f1:maj7 | e1:m7 | d2:m7 e2:7 | a1:m7 | \myEndLine
	d2:7 e2:m7 | f2:maj7 d4:m7 g4:7 | c2:maj7 d4:m7 e4:7 | a1:m7 | \myEndLine
	\endPart

	\endSong

	\endChords
}
% endif

% if part=='VoiceMy':
\relative {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
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
