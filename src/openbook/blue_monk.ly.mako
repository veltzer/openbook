<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	# from the reak book
	attributes['title']='Blue Monk'
	attributes['style']='Jazz'
	# from the real book
	attributes['composer']='Thelonius Monk'
	# My own
	attributes['piece']='Blues'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='4cc04ec0-e8b6-11e3-a334-5bb66fd360f0'
	attributes['structure']='A'
	attributes['location']='rbk1:54'

	attributes['idyoutuberemark1']='Classic Monk...'
	attributes['idyoutube1']='FRUWtrgTpcs'
	attributes['idyoutuberemark2']='Bobby McFerrin and Chick Corea'
	attributes['idyoutube2']='u0LDlgOsp_k'
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the real book.
	- added the meta data from the real book.
	- put in the tunes structure
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
	bes1 | ees:7 | bes2 f:7 | bes bes:7 | \myEndLine
	ees1 | e:dim7 | bes2 f:7 | bes1 | \myEndLine
	f1*2:7 | bes1. \OPC f2:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key bes \major

	%% part "A"
	d8 ees e f~ f2 | g8 gis a bes~ bes2 | f8 g! f e! ees f, cis' d~ | d des4 c8~ c2 |
	g'8 gis a bes~ bes2 | bes8 b c des~ des2 | f,8 g f e! ees f, cis' d~ | d2. \tuplet 3/2 { f8 f f } |
	f f,4.~ f2 | f'8 g f e ees f, cis' d~ | d4 f8 g f e ees f, | cis' d4.~ d2 |
}
% endif
