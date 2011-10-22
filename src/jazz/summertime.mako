<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['render']="Aebersold"

	attributes['title']="Summertime"
	attributes['composer']="George Gershwin"
	attributes['style']="Jazz"
	attributes['piece']="Med Swing"
	attributes['poet']="DuBose Heyward"
	attributes['copyright']="1935, Gershwin Publishing Corporation"

	attributes['completion']="4"
	attributes['uuid']="2615b7ec-a26f-11df-b010-0019d11e5a41"
%>
% endif

% if part=='Doc':
	DONE:
	- brought in epdfs for this tune.
	TODO:
	- get the aebersold sheet imported as epdf (scan it).
	- find out where is this from?
	- add lyrics
	- discrepency between tune and melody at the end
% endif

% if part=='ChordsAebersold':
\chordmode {
	\startChords
	\startSong

	\partial 4 r4 |

	\repeat volta 2 {
		d1:m7 | d:m7 | d:m7 | d:m7 | \myEndLine
		g:m7 | g:m7 | e:m7.5- | a:7.9+ | \myEndLine
		d:m7 | d:m7 | d:m7 | d:m7 | \myEndLine
		g2:m7 c:7 | f1:maj7 | e2:m7.5- a:7.9+ | d1:m7 | a:7.9+ | \myEndLine
	}
	\endSong
	\endChords
}
% endif

% if part=='VoiceAebersold':
\relative c''' {
	\time 4/4
	\key d \minor

	\partial 4 a8. f16 |
	\repeat volta 2 {
		a1 | r4 g8. f16 g8. a16 f4 | d2 a~ | a4 r a' f |
		g8 g~ g2. | r4 f8. d16 f8. d16 f4 | e1~ | e2 r4 a8. f16 |
		a1 | r4 g8. f16 g8. a16 f4 | d2 a~ | a2 r4 a |
		c a8 c d f~ f4 | a8 g~ g4 f2 | d1~ | d4 r r a'8. f16 |
	}
}
% endif
