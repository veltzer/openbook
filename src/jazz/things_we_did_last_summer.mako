<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Real"

	attributes['title']="Things We Did Last Summer"
	attributes['style']=""
	attributes['composer']=""
	attributes['poet']=""
	attributes['piece']=""
	attributes['copyright']=""
	attributes['copyrightextra']=""

	attributes['structure']=""

	attributes['completion']="1"
	attributes['uuid']="31587e4e-ab0c-11e1-9dc8-3765c038b685"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	Everything
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative aes {
	\time 4/4
	\key aes \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Andante" 4 = 92

}
% endif

% if part=='LyricsReal':
%% lyrics from the internet adjusted for the real book
\lyricmode {
}
% endif
