<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=False
	attributes['render']="Aebersold"

	attributes['title']="Summertime"
	attributes['composer']="George Gershwin"
	attributes['style']="Jazz"
	attributes['piece']="Med Swing"
	attributes['poet']="DuBose Heyward"
	# the next one is from Aebersold...
	attributes['copyright']="1936, Gershwin Publishing Corp., copyright renewed"

	attributes['completion']="5"
	attributes['uuid']="2615b7ec-a26f-11df-b010-0019d11e5a41"
	attributes['structure']="AB"
	attributes['idyoutuberemark']="Janis!"
	attributes['idyoutube']="mzNEgcqWDG4"
	attributes['idyoutuberemark']="Ella Fitzgerald with Louis"
	attributes['idyoutube']="MIDOEsQL7lA"
	attributes['lyricsurl']="http://www.stlyrics.com/songs/g/georgegershwin8836/summertime299720.html"
%>
% endif

% if part=='Doc':
	DONE:
	- brought in 3 epdfs for this tune.
	- put in the aebersold chords.
	- put in the aebersold tune.
	- checked the aebersold chords.
	- checked the aebersold tune.
	- heard the aebersold version to make sure it's ok.
	- added parenthesis on the turn around notes.
	- in the aebersold version added phrases.
	- added youtube and lyrics url.
	TODO:
	- add lyrics from somewhere to the aebersold tune.
	- add real book version.
	- add fake book version.
% endif

% if part=='ChordsAebersold':
\chordmode {
	\startChords
	\startSong

	\partial 4 r4 |

	\repeat volta 2 {

	\mark "A"
	\startPart
	d1*3:m | d2:m d:7.9+ | \myEndLine
	g1*2:m | e1:m7.5- | a:7.9+ | \myEndLine
	\endPart

	\mark "B"
	\startPart
	d1*3:m | g2:m c:7 | \myEndLine
	f1:maj7 | e2:m7.5- a:7.9+ | d1:m | a:7.9+ | \myEndLine
	%% so I would see the repeat marks
	%%\endPart

	}

	%% so I would see the repeat marks
	%%\endSong
	\endChords
}
% endif

% if part=='VoiceAebersold':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Moderato" 4 = 108
	\time 4/4
	\key d \minor

	\partial 4 a8. ( f16 |

	\repeat volta 2 {
	a1~ | a8 ) r g8. ( f16 g8. a16 f4 | d2 a~ | a4 ) r a' ( f |
	g8 g~ g2. ) | r4 f8. ( d16 f8. d16 f4 | e1~ | e2 ) r8 a4 ( f8 |
	a8 a~ a2. ) | r4 g8. ( f16 g8. a16 f4 | d2 a~ | a ) r4 a ( |
	c a8 c d f~ f4 ) | a8 ( g~ g4 f2 | d1~ | d4 ) r r <\parenthesize a'>8. ( <\parenthesize f>16 ) |
	}
}
% endif
