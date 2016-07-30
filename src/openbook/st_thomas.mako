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
	attributes['title']='St. Thomas'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Sonny Rollins'
	# from the fake book
	attributes['piece']='Latin/Calypso'
	# from the fake book
	attributes['copyright']='1963, Prestigve Music'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='ef0827e0-f690-11e0-ba56-0019d11e5a41'
	attributes['structure']='AABC'
	attributes['structureremark']='The tune is so short and fast that some see it as just A'
	attributes['location']='jfb:357'

	attributes['idyoutuberemark1']='The classic version from Saxophone Colossus'
	attributes['idyoutube1']='UA2XIWZxMKM'
	attributes['idyoutuberemark2']='Kenny Drew on Piano'
	attributes['idyoutube2']='Ed8UuEH41XQ'
%>
% endif

% if part=='Doc':
	DONE:
	- brought epdfs from the fake book.
	- filled in the tunes meta data from the fake book
	- filled in the chords from the fake book
	- filled in the tune from the fake book
	- checked the chords from the fake book
	- checked the tune from the fake book
	- heard the tune to make sure the midi is right and the rythms is right.
	- add youtube performances.
	TODO:
	- add another version from some other book.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		c1 | a:7 | d2:m7 g4:7 c~ | c2 g:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		c1 | a:7 | d2:m7 g4:7 c~ | c1 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		e1:m7.5- | a:7 | d:m7 | g:7 | \myEndLine
		\endPart

		\myMark "C"
		\startPart
		c:7 | f2 fis:dim7 | c/g g4:7 c~ | c1 | \myEndLine
		\endPart
	}

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Presto" 4 = 200
	\time 4/4
	\key c \major

	\repeat volta 2 {

		%% part "A"
		r4 g'8 c r b r a | g4 a e f | g c b c | r1 |

		%% part "A"
		r4 g8 c r b r a | g4 a e f | g c b c | r1 |

		%% part "B"
		e2 f4. g8 | r1 | f2 e4. d8 | r1 |

		%% part "C"
		e2 d | c a | g4 c b c | r1 |
	}
}
% endif
