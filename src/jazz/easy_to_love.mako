<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Real"

	attributes['title']="Easy To Love"
	# this is from the real book
	attributes['composer']="Cole Porter"
	attributes['poet']=""
	attributes['style']="Jazz"
	# this is from the real book
	attributes['piece']="Ballad"
	attributes['copyright']=""
	attributes['copyrightextra']=""

	attributes['completion']="1"
	attributes['uuid']="ac74c90e-0d62-11e1-816c-0019d11e5a41"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- add the missing parts of the real book version and check it.
	- add an epdf of the real book.
	- In the lyrics where it says "His" a boy should sing "Her". We should have
	alternate lyrics here. See how they did it in the fake book.
	- mark whats been done with this tune.
	- document the youtube performances.
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
	\tempo "Moderato" 4 = 108
	\key c \major
	\time 4/4
}
% endif

% if part=='LyricsReal':
\lyricmode {
}
% endif
