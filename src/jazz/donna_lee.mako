<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['render']="Real"

	attributes['title']="Donna Lee"
	attributes['style']="Jazz"
	# this is from the real book
	attributes['composer']="Charlie Parker"
	# this is from the real book
	attributes['piece']="Up Tempo"
	#attributes['copyright']=""

	attributes['completion']="4"
	attributes['uuid']="a9ca1752-53d6-11e2-a687-1bd4487b8eae"
	attributes['structure']="AB"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the meta data from the real book
	TODO:
	- fill in the real book chords.
	- fill in the real book tune.

	- brought in the real book pdf.
	- filled in the tunes meta data from the fake book.
	- added the fake book epdf.
	- wrote down the fake book chords.
	- wrote down the fake book tune.
	- bring in the fake book pdf.
	- check the fake book chords.
	- check the fake book tune.
	- heard the tune to make sure it sounds right.
	- document the youtube performance.
	- added the tunes structure.
	- add the real book chords and tune.
	- how about adding the Aebersold version too?
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\mark "A"
	\startPart
	aes1 | f:7 | bes1*2:7 | \myEndLine
	bes1:m7 | ees:7 | aes | ees2:m7 d:7 | \myEndLine
	des1 | des:m7 | aes | f:7 | \myEndLine
	bes1*2:7 | bes1:m7 | ees:7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	aes1 | f:7 | bes1*2:7 | \myEndLine
	c:7 | f1:m | c:7.9+ | \myEndLine
	f:m | c:7 | f:m | aes:dim | \myEndLine
	aes2 f:7 | bes:m7 ees:7 | aes:1 | bes2:m7 ees:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative f'' {
	\time 4/4
	\key aes \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130

	%% A part
	r2 \times 2/3 { g8 aes g } f e | ees! des c bes-4 a-3 c,-1 ees f |
	\times 2/3 { ges aes ges } f-1 ees d f aes c | g! f r4 r e!8 d! |
	ees! a, bes des! f aes c ees | des e, f c' b g-1 ees-3 des-2 |
	c-1 ees g bes! aes4 ees8-2 f-1 | ges-2 bes-3 des-4 f-5 e-4 c-1 r4 |
	%% B part
}
% endif
