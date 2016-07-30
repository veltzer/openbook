<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	# from the fake book
	attributes['title']='Blue In Green'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Miles Davis, Bill Evans'
	# My own
	attributes['piece']='Slowly'
	# from the fake book
	attributes['copyright']='1959 JAZZ HORN MUSIC CORP. & WARNER-TAMERLANE PUBLISHING CORP.'
	# from the fake book
	attributes['copyrightextra']='WARNER-TAMERLANE PUBLISHING CORP. administers on behalf of itself and JAZZ HORN MUSIC CORP.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='c73decf2-e30c-11e3-b12b-dbe41a94d84d'
	attributes['structure']='A'
	attributes['location']='jfb:64'

	attributes['idyoutuberemark1']='Original from Kind of Blue'
	attributes['idyoutube1']='PoPL7BExSQU'
	attributes['idyoutuberemark2']='Bill Evans in a piano version'
	attributes['idyoutube2']='mW_7gRH7ASE'
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the fake book.
	- put in the tunes structure
	- added the meta data from the fake book.
	- put in the chords (fakebook).
	- put in the tune (fakebook).
	- check the chords (fakebook).
	- check the tune (fakebook).
	- heard the tune to check that it is right and adjust the tempo.
	- added youtube performances.
	TODO:
	- add another version of this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	bes1:maj7.11+ | a:7.9+ | d2.:m9 des4:7 | c2:m9 f:7.9- |
	bes1:maj7 | a:7.5+.9+ | \myEndLine
	d:m6.9 | e:7.5+.9+ | a:m9 | d:m9 |
	bes:maj7.11+ | a2.:7.9+ a4:7.9- | d1:m6.9 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

	%% part "A"
	e'2. d4 | c2. bes4 | a2. g4 | f d'2. |
	e,4. d8 cis d f a | c2. a4 |
	g2. f4 | c'2. gis4 | b2. a4 | f'2. cis4 |
	e2. d4 | c2. bes4 | a1\fermata |
}
% endif
