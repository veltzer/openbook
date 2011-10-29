<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['render']="Unknown"

	attributes['title']="Have you met Miss Jones"
	attributes['composer']="Richard Rogers"
	attributes['poet']="Lorenz Hart"
	attributes['style']="Jazz"
	attributes['piece']="Med Swing"
	attributes['structure']="ABA"

	attributes['completion']="0"
	attributes['uuid']="fe106f6c-a26e-11df-abb3-0019d11e5a41"
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the structure for this tune.
	TODO:
	- bring in epdfs for this tune.
	- fill in the meta data for this tune.
	- where is this tune from ?
	- add lyrics
% endif

% if part=='ChordsUnknown':
\chordmode {
	\startChords

	\startSong

	\mark "A"
	\startPart
	f1:maj7 | d:7.9- | g:m7 | c:7 | a:m7 | d:m7 | g:m7 | c:7 | \myEndLine
	\endPart

	\mark "A"
	\startPart
	f1:maj7 | d:7.9- | g:m7 | c:7 | a:m7 | d:m7 | c:m7 | f:7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	bes1:maj7 | aes2:m7 des:7 | ges1:maj7 | e2:m7 a:7 | \myEndLine
	d1:maj7 | aes2:m7 des:7 | ges1:maj7 | g2:m7 c:7 | \myEndLine
	\endPart

	\mark "A"
	\startPart
	f1:maj7 | d:7.9- | g:m7 | c:7 | \myEndLine
	a2:m7 d:7 | g:m7 c:7 | f1:maj7 | g2:m7 c:7 | \myEndLine
	\endPart

	\endSong

	\endChords
}
% endif

% if part=='VoiceUnknown':
\relative a' {
	\time 4/4
	\key f \major

	\repeat "unfold" 2 {
	a4 d, c d | c2. r4 | d e f g | a bes c2 | d4 g, f g | f2. a4 | }
	\alternative { { bes1~ | bes2. r4 |} {c1~ | c4 d d d | } }
	c4 bes f g | aes aes aes aes | aes ges des ees | e! e e e | e d fis a |
	des2 des | bes1~ | bes2. r4 |
	a4 d, c d | c2. r4 | d e f g | a bes c d | e1~ | e4 d a g | f1 | r |
}
% endif
