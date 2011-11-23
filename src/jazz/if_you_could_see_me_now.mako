<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Real"

	attributes['title']="If You Could See Me Now"
	attributes['composer']="Tadd Dameron"
	attributes['copyright']=""
	attributes['copyrightextra']=""
	attributes['style']="Jazz"
	attributes['piece']=""
	attributes['poet']=""

	attributes['structure']="AABA"

	attributes['completion']="5"
	attributes['uuid']="e259226a-11ac-11e1-90cb-0019d11e5a41"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']="http://www.metrolyrics.com/if-you-could-see-me-now-lyrics-natalie-cole.html"

%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- bring in the real book (vol II) epdf.
	- write the real book chords.
	- write the real book tune.
	- write the real book lyrics.
	- check the real book chords.
	- check the real book tune.
	- check the real book lyrics.
	- hear the real book tune to make sure the tempo and tune is right.
	- put in you tube performances.
	- put in lyrics urls.
	- fill in the metadata.
	- add another version of this tune? (from where?!?)
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\mark "A"
	\startPart
	\repeat volta 2 {
		ees1:maj7 | aes:7 | ees:maj7 | aes:7 | \myEndLine
		aes:7 | g2:m7 ges4:m7 b:7 | f2:m7 bes:7 | \myEndLine
	} \alternative {
		{
			g:m7 c:7 | f:m7 bes:7 |
		}
		{
			a:m7.5-
		}
	}
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

% if part=='VoiceReal':
\relative a {
	\time 4/4
	\key ees \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Adagio" 4 = 76

	%% A part
	d8 ees g bes d c bes g |

	%% A part

	%% B part

	%% A part
}
% endif

% if part=='LyricsReal':
\lyricmode {
	%% A part

	%% A part

	%% B part

	%% B part
}
% endif
