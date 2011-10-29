<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['render']="Fake"

	attributes['title']="Have you met Miss Jones?"
	attributes['composer']="Richard Rodgers"
	attributes['poet']="Lorenz Hart"
	attributes['style']="Jazz"
	# this is from the real book
	attributes['piece']="Med."
	# this is from the fake book
	attributes['piece']="Medum Swing"
	attributes['copyright']="1937, by Chappell & Co., Inc. Copyright Renewed"

	attributes['structure']="AABA"

	attributes['completion']="5"
	attributes['uuid']="fe106f6c-a26e-11df-abb3-0019d11e5a41"
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the structure for this tune.
	- added the real book epdf.
	- added the fake book epdf.
	- fill in the meta data for this tune.
	TODO:
	- put in the chords for the fake book version.
	- put in the tune for the fake book version.
	- put in the lyrics for the fake book version.
	- check the chords for the fake book version.
	- check the tune for the fake book version.
	- check the lyrics for the fake book version.
	- play the fake book tune to hear that it's ok.
	- add you tube performances.
	- add a lyrics url.
	- add the real book version.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\mark "A"
	\startPart
	f1:maj7 | d:7.9- | g:m7 | c:7 | \myEndLine
	a:m7 | d:m7 | g:m7 | c:7 | \myEndLine
	\endPart

	\mark "A"
	\startPart
	f1:maj7 | d:7.9- | g:m7 | c:7 | \myEndLine
	a:m7 | d:m7 | c:m7 | f:7 | \myEndLine
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

% if part=='VoiceFake':
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
