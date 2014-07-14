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

	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"
	attributes['completion']="5"
	attributes['uuid']="a9ca1752-53d6-11e2-a687-1bd4487b8eae"
	attributes['structure']="AB"
	attributes['structureremark']="This could be thought of as ABAC although the two A's are not the same so AB is more accurate"

	attributes['idyoutuberemark']="Very fast Wynton Marsalis version"
	attributes['idyoutube']="QdD6XE9DtAE"
	attributes['idyoutuberemark']="The original Parker, Davis, Bud Powell version"
	attributes['idyoutube']="hANODMX9c5g"
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book pdf.
	- filled in the meta data from the real book
	- added my own remarks about the tunes structure.
	- filled in the real book chords.
	- filled in the real book tune.
	- checked the real book chords.
	- checked the real book tune.
	- heard the real book tune to make sure it sounds right.
	- documented the youtube performance.
	- upgraded the tune to level 5.
	TODO:
	- fill in the copyright from somewhere.
	- get another version from somewhere (aebersold?!? he's got a solo too, I think...).
	- fill in the reset of the fingerings from Ofer Portugali (in my own private real "real book")
	REMARK:
	- the fingering in the notes are from Ofer Portugali.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	aes1 | f:7 | bes1*2:7 | \myEndLine
	bes1:m7 | ees:7 | aes | ees2:m7 d:7 | \myEndLine
	des1 | des:m7 | aes | f:7 | \myEndLine
	bes1*2:7 | bes1:m7 | ees:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	aes1 | f:7 | bes1*2:7 | \myEndLine
	c:7 | f1:m | c:7.9+ | \myEndLine
	f:m | c:7 | f:m | aes:dim | \myEndLine
	aes2 f:7 | bes:m7 ees:7 | aes1 | bes2:m7 ees:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative {
	\time 4/4
	\key aes \major
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130

	%% part "A"
	r2 \times 2/3 { g''8 aes g } f e | ees! des c bes-4 a-3 c,-1 ees f |
	\times 2/3 { ges aes ges } f-1 ees d f aes c | g! f r4 r e!8 d! |
	ees! a, bes des! f aes c ees | des e, f c' b g-1 ees-3 des-2 |
	c-1 ees g bes! aes4 ees8-2 f-1 | ges-2 bes-3 des-4 f-5 e-4 c-1 r4 |
	ees2~ ees8 des c bes | ees des r4 ges8 fes ees des |
	c c des d ees des c bes | a c ees f \times 2/3 { ges aes ges } f ees |
	d c b a bes aes r d,16 f | \times 2/3 { g8 ges f } e4 r2 |
	ees'!8 des f, aes c bes aes f | g bes des ees \times 2/3 { e fis e } ees des |
	%% part "B"
	c4 r \times 2/3 { g'8 aes g } f e | ees! des c bes-4 a-3 c,-1 ees f |
	\times 2/3 { ges aes ges } f-1 ees d f aes c | g! f r4 r g8 f |
	e f g aes bes aes g f | \times 2/3 { des' ees des } c bes \times 2/3 { aes bes aes } g e |
	f4 r r2 | r r4 r8 b |
	c b c des d cis d ees | e dis e dis d des c bes |
	\times 2/3 { aes bes aes } g aes bes aes g f | b, d f aes b g' f e |
	ees! des c bes a ges f ees | des f aes c bes aes g ees |
	aes4 r r2 | r1 |
}
% endif
