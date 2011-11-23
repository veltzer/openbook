<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Real"

	attributes['title']="How Insensitive"
	# this is from the real book
	attributes['composer']="A.C. Jobim"
	attributes['style']="Jazz"
	# this is from the real book
	attributes['piece']="Bossa"

	attributes['completion']="4"
	attributes['uuid']="ee9c0d62-15fd-11e1-bd56-0019d11e5a41"

	attributes['structure']="AB"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- filled in the meta data from the real book.
	TODO:
	- brought in the fake book epdf.
	- put in you tube performances with documentation.
	- put in the tunes structure.
	- put in a lyrics url.
	- filled in the meta data.
	- put in the fake book chords.
	- put in the fake book tune.
	- put in the fake book lyrics.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- played the fake book version to hear that it sounds well.
	- put in the real book chords.
	- put in the real book tune.
	- put in the real book lyrics.
	- checked the real book chords.
	- checked the real book tune.
	- checked the real book lyrics.
	- played the real book version to hear that it sounds well.
	- how do I put the last two chords in the real book version in parenthesis? (the turn around chords).
	REMARKS:
	- this tunes structure can also be categorised as "ABAC" since the first 8 bars of both the first and second part are the same.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

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

% if part=='VoiceReal':
\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key d \minor

	%% part "A"

	%% part "B"
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
	%% part "A"
	%% part "B"
}
% endif
