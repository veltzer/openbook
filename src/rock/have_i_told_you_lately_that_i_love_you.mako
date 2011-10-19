<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="My"

	attributes['title']="Have I told you lately that I love you"
	attributes['singer']="Van Morrison"
	attributes['style']="Pop"
	attributes['piece']="Med. Ballad"

	attributes['completion']="0"
	attributes['uuid']="d86922f4-a26e-11df-b237-0019d11e5a41"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- finish this.
	- document what was done in this song.
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords

	\startSong

	\repeat volta 2 {
		f2:maj7 a:m7 | bes:maj7 c:7 |
	}
	bes1:maj7 | a:m7 | g2:m7 c:7 | f:maj7 r4 c:7 |

	\endSong

	\endChords
}
% endif

% if part=='VoiceMy':
\relative c {
	a b c d
}
% endif

% if part=='LyricsMy':
\lyricmode {
	Have I told you lately that I love you.
	Have I told you that there's no one but you.
	You give me so much gladness.
	Take away all the sadness.
	Take my troubles that's what you do.
}
% endif
