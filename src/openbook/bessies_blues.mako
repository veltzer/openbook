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
	attributes['title']='Bessies\'s Blues'
	attributes['style']='Jazz'
	# from the real book
	attributes['composer']='John Coltrane'
	# my own
	attributes['piece']='Blues'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='46708476-aa13-11e4-bb67-3860779cb560'
	attributes['structure']='Blues'
	attributes['location']='rbk1:42'

	attributes['idyoutuberemark1']='John Coltrane in the classic version'
	attributes['idyoutube1']='XMC2bvHk0Bo'
	attributes['idyoutuberemark2']='Chick Corea in a modern take'
	attributes['idyoutube2']='XyR4MrpkRjY'
%>
% endif

% if part=='Doc':
	DONE:
	- brought epdfs from the real book.
	- filled in the tunes meta data from the real book
	- filled in the chords from the real book
	- filled in the tune from the real book
	- checked the chords from the real book
	- checked the tune from the real book
	- heard the tune to make sure the midi is right and the rythms is right.
	- add youtube performances.
	TODO:
	- add another version from some other book.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	ees1:7 | aes:7 | ees1*2:7 | \myEndLine
	aes:7 | ees:7 | \myEndLine
	bes1:7 | aes:7 | ees:7 | bes:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Presto" 4 = 200
	\time 4/4
	\key c \major

	%% part "A"
	g'4 ees8 des~ des2 | c'4 aes8 ges~ ges4. ees8 | g ees g4 g8 ees!4 g8~ | g ees d des~ des2 |
	r8 c'4 bes8 c aes r4 | c4. aes8 r ges4 ees8 | g ees g4 g8 g4 g8~ | g ees d des r g4 ges8 |
	f4 d bes d8 f | ees c aes4 c8 ees!4. | r8 f ees c r2 | r f8 g aes bes |
}
% endif
