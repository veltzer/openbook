<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']='Now\'s The Time'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Charlie Parker'
	# from the fake book
	attributes['piece']='Fast Blues'
	# from the fake book
	attributes['copyright']='1945, Atlantic Music Corp.'
	attributes['copyrightextra']='Renewed and assigned 1973, Atlantic Music Corp.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='cd56a8d8-da1d-11e3-a6ca-c3a55777c28e'
	attributes['structure']='Blues'
	attributes['location']='jfb:279'

	attributes['idyoutuberemark1']='The great Charlie Parker'
	attributes['idyoutube1']='ryNtmkfeJk4'
	attributes['idyoutuberemark2']='A much more modern version by Blakey and the Messengers'
	attributes['idyoutube2']='qq7xDN1G3Bc'
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the meta data from the fake book
	- write the fake book chords.
	- write the fake book tune.
	- got the fake book epdf.
	- add you tube performances.
	- check the fake book chords.
	- check the fake book tune.
	- adjusted the tunes speed.
	- checked that the midi version sounds well.
	TODO:
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f1*4:7 | \myEndLine
		bes1:7 | bes2:7 b:dim7 | f1*2:7 | \myEndLine
		g1:m7 | c:7 | f:7 | g2:m7 c:7 | \myEndLine
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Presto" 4 = 190
	\time 4/4
	\key f \major

	\partial 8 c8 |

	\repeat volta 2 {
		f f g c, f4 r8 c | f f g c, f4 r8 c | f f g c, f f g c, | f f g c, f4 r8 c |
		f f g c, f bes,4. | f'8 f g c, f b,!4. | f'8 f g c, f f g c, | f f g c, f4 r8 aes~ |
		\tuplet 3/2 { aes16 bes aes } f8 d b! d4 r | r8 g4. f8 g f ees | r c r c4 r8 r4 | r1 |
	}
}
% endif
