<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Real"

	attributes['title']="The Man I Love"
	attributes['style']="Jazz"
	# from the real book
	attributes['composer']="George Gershwin"
	# from the internet
	attributes['poet']="Ira Gershwin"
	# from the real book
	attributes['piece']="Slowly"
	attributes['copyright']=""
	attributes['copyrightextra']=""
	attributes['structure']="AABA"

	attributes['completion']="4"
	attributes['uuid']="e8ff288e-2233-11e1-9b9f-0019d11e5a41"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- filled in meta data from the real book.
	- filled in the tunes structure.
	TODO:
	- add you tube performances.
	- add a lyrics url.
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
\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key ees \major
}
% endif

% if part=='LyricsReal':
\lyricmode {
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
}
% endif
