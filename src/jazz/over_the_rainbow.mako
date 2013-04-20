<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Wikifonia"

	attributes['title']="Over The Rainbow"
	# this is from wikifonia and wikipedia
	attributes['subtitle']="Somewhere Over The Rainbow"
	attributes['style']="Jazz"
	attributes['composer']="Harold Arlen"
	attributes['copyright']="Musi©opy"
	attributes['piece']="Slowly, with expression"
	attributes['poet']="Edgar Yipsel Harburg"

	attributes['completion']="5"
	attributes['uuid']="c6992350-a9da-11e2-8a7f-97606039682f"
	attributes['structure']="AABA"

	attributes['idyoutube']=""
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the wikifonia version.
	- filled in the meta data from wikifonia and wikipedia.
	- put in the lyrics from wikifonia.
	TODO:
	- find you tube performances.
	- put the copyright right (with the copyright symbol).
% endif

% if part=='ChordsWikifonia':
\chordmode {
	\startChords
	\startSong

	\mark "A"
	\startPart
	\endPart

	\mark "A"
	\startPart
	\endPart

	\mark "B"
	\startPart
	\endPart

	\mark "A"
	\startPart
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceWikifonia':
\relative a {
	\time 4/4
	\key ees \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Adagio" 4 = 76

	%% A part

	%% A part

	%% B part

	%% A part
}
% endif

% if part=='LyricsWikifonia':
\lyricmode {
	%% A part
	Some -- where O -- ver The Rain -- bow, way up high,
	there's a land that I heard of once in a lull -- a -- by

	%% A part
	Some -- where O -- ver The Rain -- bow, skies are blue,
	and the dreams that you dare to dream real -- ly do come true

	%% B part
	Some day I'll wish up -- on a star and wake up where the clouds are far be -- hind me.
	Where trou -- bles melt like le -- mon drops a -- way a -- bove the chim -- ney tops that's where you'll find me

	%% B part
	Some -- where O -- ver The Rain -- bow, blue -- birds fly.
	Birds fly o -- ver the rain -- bow, why then, oh why can't I?
}
% endif
