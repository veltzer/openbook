<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('My', version)
	attributes.setDefaultVersionName('My')

	attributes['title']='Have I told you lately that I love you'
	attributes['style']='Pop'
	attributes['piece']='Med. Ballad'
	attributes['singer']='Van Morrison'
	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'

	attributes['completion']='0'
	attributes['uuid']='d86922f4-a26e-11df-b237-0019d11e5a41'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- finish this.
	- document what was done in this song.
% endif

<%namespace name="defs" file="/include/defs.ly.mako"/>

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
{
	a
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
