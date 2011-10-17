<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['render']="Unknown"

	attributes['title']="My Favorite Things"
	attributes['composer']="Richard Rodgers"
	attributes['poet']="Oscar Hammerstein"
	attributes['style']="Jazz"
	attributes['piece']="Med Swing"

	attributes['completion']="0"
	attributes['uuid']="02c22208-a26f-11df-98fd-0019d11e5a41"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- where is this sheet from.
	- mark what has been done for this tune.
	- bring in the epdf for this one.
	- add lyrics.
	- check this whole sheet again.
	- add length to all notes.
% endif

% if part=='ChordsUnknown':
\chordmode {
	\mark "Intro"
	\repeat volta 4 { e2.:m7 | f2.:maj7.4+ }

	\mark "A"
	\repeat volta 2 {
		e2.:m7 | r2. | r2. | r2. |
		c2.:maj7 | r2. | r2. | r2. |
		a2.:m7 | d2.:7 | g2.:maj7 | c2.:maj7 | g2.:maj7 | c2.:maj7 | fis2.:m7.5- | b2.:7.9- |
	}
	\endPart

	\mark "B"
	e2.:m7 | r2. | r2. | r2. |
	a2.:maj7 | r2. | r2. | r2. |
	a2.:m7 | d2.:7 | g2.:maj7 | c2.:maj7 | g2.:maj7 | c2.:maj7 | fis2.:m7.5- | b2.:7.9- |
	\endPart

	\mark "C"
	e2.:m7 | r2. | fis2.:m7.5- | b2.:7.9- | e2.:m7 | e2.:m7/d | c2.:maj7 | r2. |
	c2.:maj7 | r2. | a2.:7 | r2. | g2.:maj7 | c2.:maj7 | a2.:m7 | d2.:7 |
	g2.:maj6 | c2.:maj7 | g2.:maj6 | r2. |
	\endPart

	\endSong
}
% endif

% if part=='VoiceUnknown':
\relative e' {
	\time 3/4
	\key g \major

	\repeat volta 4 { r2. | r }

	\repeat volta 2 {
		\repeat unfold 2
			{ e4 b' b | fis e e | b e e | fis e2 | }
		e4 b' a | e fis d | d a' g | c,2. |
		b4 c d | e fis g | a b a | dis,2. |
	}

	\repeat unfold 2 { e4 b' b | fis e e | b e e | fis e2 | }
	e4 b' a | e fis d | d a' g | c,2. |
	b4 c d | e fis g | a ais b | c2. |

	r4 b b | b2 e,4 | r a a | a2 dis,4 |
	r g g | g2 b,4 | e2.~ | e2 e4 |
	e fis e | fis e fis | g a g |
	a2 g4 | b c b | c2.~ | c | b |
	g~ | g~ | g~ | g4 r2 |
}
% endif
