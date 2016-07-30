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
	attributes['title']='Blue Trane'
	# my own
	attributes['style']='Jazz'
	# from the real book
	attributes['composer']='John Coltrane'
	# My own
	attributes['piece']='Fiercly'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='b303b0a6-95e4-11e4-acdf-3860779cb560'
	attributes['structure']='Minor Blues'
	attributes['location']='rbk1:58'

	attributes['idyoutuberemark1']='John Coltrane in the original tune'
	attributes['idyoutube1']='S1GrP6thz-k'
	attributes['idyoutuberemark2']='Bireli Lagrene & John McLaughlin Blue Train'
	attributes['idyoutube2']='xe2jVU4WixY'
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

	\partial 8*5 s8 bes2:7 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		c1:m | f2:m7 bes:7 | c1:m | bes2:m7 ees:7 | \myEndLine
		f1:m | f2:m7 bes:7 | c1:m | a2:m7 d:7 | \myEndLine
		g1:m | f2:m7 bes:7 |
	} \alternative {
		{
			c1:m | f2:m7 bes:7 | \myEndLineVoltaNotLast
		}
		{
			c1:m7.5- | c1:m | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \minor

	\partial 8*5 g'8 bes d bes c~ |

	%% part "A"
	\repeat volta 2 {
		c1~ | c4-^ r8 g bes d bes c~ | c1~ | c4-^ r8 c ees g ees f~ |
		f1~ | f4-^ r8 g, bes d bes c~ | c1~ | c4-^ r8 g c d c bes~ |
		bes1~ | bes4-^ r8 g bes d bes c~ |
	} \alternative {
		{
			c1~ | c4-^ r8 g bes d bes c~ |
		}
		{
			c1~ | c4-^_\markup { \italic { Fine } } r4 r2 |
		}
	}
}
% endif
