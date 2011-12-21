<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Epdf0"
	attributes['heb']=True

	attributes['title']=u"היא חזרה בתשובה"
	attributes['style']="Israeli"
	attributes['composer']=u"מתי כספי"
	attributes['poet']=u"יעקב רוטבליט"
	attributes['singer']=u"מתי כספי"
	attributes['piece']=u"בוסה נובה"

	attributes['completion']="5"
	attributes['uuid']="24815072-2a71-11e1-a41f-0019d11e5a41"

	attributes['idyoutube']="1GI5Vst5a-o"

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
	\partial s1 |
	\mark "A"
	\startPart
	c1*2:m | g:7/b | c:7/bes | f1:m9/a | f1:m | \myEndLine
	g:m7.5- | c:7 | f1*2:m | 
	\endPart
	\mark "B"
	\startPart
	\endPart
	\endSong
	\endChords
}
% endif

% if part=='VoiceEpdf0':
\relative c'{
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \minor
}
% endif

% if part=='LyricsEpdf0':
\lyricmode {
}
% endif
