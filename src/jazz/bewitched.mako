<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="Bewitched"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['composer']="Richard Rodgers"
	# this is from the fake book
	attributes['poet']="Lorenz Hart"
	# this is from the fake book
	attributes['piece']="Modeartely Slow"
	# this is from the fake book
	attributes['copyright']="1941, by Chappell & Co., Inc. Copyright Renewed"

	attributes['structure']="????"

	attributes['completion']="5"
	attributes['uuid']="dd1624e6-2567-11e1-9444-0019d11e5a41"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']="Benny Goodman in the 1980's"
	attributes['idyoutube']="rv8G78Cw2mc"
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- brought in the fake book epdf.
	- filled in this tunes meta data from the fake book.
	TODO:
	- filled in the fake book chords.
	- filled in the fake book tune.
	- filled in the fake book lyrics.
	- filled in this tunes structure.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- heard that the fake book tune sounds well.
	- document the youtube performance.
	- add a lyrics url.
	- add the real book version.
	REMARKS:
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong
	\partial 4 s4
	\mark "A"
	\startPart
	\endPart
	\mark "B"
	\startPart
	\endPart
	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c' {
	\time 4/4
	\key c \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Moderato" 4 = 100
	\partial 4 e8 f |
	%% A part
	%% B part
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% A part
	%% B part
}
% endif
