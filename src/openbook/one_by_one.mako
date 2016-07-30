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
	attributes['title']='One By One'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Wayne Shorter'
	# from the fake book
	attributes['piece']='Shuffle'
	# from the fake book
	attributes['copyright']='1963 Miyako Music'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='654dc682-0e83-11e4-8688-1f470b65356e'
	attributes['structure']='AABA'
	attributes['structureremark']='The second half of the B part is the same as the second half of the A part. Didn\'t see this a lot.'
	attributes['location']='jfb:292'

	attributes['idyoutuberemark1']='Blakey with the kids'
	attributes['idyoutube1']='Hmu57-USSs0'
	attributes['idyoutuberemark2']='Wyntons version (he learned it from Blakey...:)'
	attributes['idyoutube2']='-phKoexy_E0'
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the fake book.
	- added the meta data from the fake book.
	- put in the tunes structure
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
	\repeat volta 2 {
		a4:m7.5- d:7.5+.9+ aes2:7 | g:m7 f4:m7 bes:7 | ees:maj7.9 c:m11 f2:7.9 | bes1:maj7.9 | \myEndLine
		a2:m7.5- aes:7 | g:m7 bes:7/f | e:m7.5- d:7.5+.9+ | g1:m11 | \myEndLine
	}
	\endPart

	\myMark "B"
	\startPart
		e2:7.9+ a:7.5+.9+ | d:m7 b:m7.5- | e:m7.5- a:7.5+.9+ | d1:m7 | \myEndLine
		a2:m7.5- aes:7 | g:m7 bes:7/f | e:m7.5- d:7.5+.9+ | g1:m11 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	a4:m7.5- d:7.5+.9+ aes2:7 | g:m7 f4:m7 bes:7 | ees:maj7.9 c:m11 f2:7.9 | bes1:maj7.9 | \myEndLine
	a2:m7.5- aes:7 | g:m7 bes:7/f | e:m7.5- d:7.5+.9+ | g1:m11 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 128
	\time 4/4
	\key g \minor

	%% part "A"
	\repeat volta 2 {
		d4 f r8 d4 bes8~ | bes2 d4 f | a f r8 d c d~ | d1 |
		r8 des' c g bes bes c f, | g4 bes8 g bes bes c bes | d4 c8 g bes bes c g~ | g1 |
	}

	%% part "B"
	r8 aes' g d f f g d~ | d1~ | d~ | d2. f4 |
	r8 des c g bes bes c f, | g4 bes8 g bes bes c bes | d4 c8 g bes bes c g~ | g1 |

	%% part "A"
	d4 f r8 d4 bes8~ | bes2 d4 f | a f r8 d c d~ | d1 |
	r8 des' c g bes bes c f, | g4 bes8 g bes bes c bes | d4 c8 g bes bes c g~ | g1 |
}
% endif
