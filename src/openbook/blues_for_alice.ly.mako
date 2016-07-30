<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	# from the real book
	attributes['title']='Blues For Alice'
	# from the real book
	attributes['style']='Jazz'
	# from the real book
	attributes['composer']='Charlie Parker'
	# from the real book
	attributes['piece']='Jazz'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='9bd9980c-9628-11e4-80e9-3860779cb560'
	attributes['structure']='Blues'
	attributes['location']='rbk1:57'

	attributes['idyoutuberemark1']='The Charlie Parker original'
	attributes['idyoutube1']='4s5FZBisaf8'
	attributes['idyoutuberemark2']='Roland Kirk in a good be-bop version'
	attributes['idyoutube2']='d2yQAfOqTf4'
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the real book.
	- put in the tunes structure
	- added the meta data from the real book.
	- put in the chords (realbook).
	- put in the tune (realbook).
	- check the chords (realbook).
	- check the tune (realbook).
	- heard the tune to check that it is right and adjust the tempo.
	- added youtube performances.
	TODO:
	- add another version of this tune.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f1:maj7 | e2:m7.5- a:7.9- | d:m7 g:7 | c:m7 f:7 | \myEndLine
	bes1:7 | bes2:m7 ees:7 | a:m7 d:7 | aes:m7 des:7 | \myEndLine
	g1:m7 | c:7 | f2 d:m7 | g:m7 c:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

	%% part "A"
	f'4 c8 a e'4 c8 a | d e b c cis bes g gis | a4 f8 d g a f e | \tuplet 3/2 { ees g bes } d des r f, \tuplet 3/2 { f g f } |
	c'4 bes8 f aes bes, r g' | ees' des aes f c' f, g a~ | a4 e8 c d4 r8 des'~ | des4 ces8 ges bes4 r8 aes |
	\tuplet 3/2 { g4 f' f } f8 d bes g | a g c bes ees4 r8 c~ | c4 a8 f g4 r8 d'~ | d4 bes8 f a4 r |
}
% endif
