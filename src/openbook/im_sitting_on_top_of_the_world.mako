<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']='I\'m Sitting On Top Of The World'
	attributes['style']='Jazz'
	attributes['composer']='Ray Handerson'
	attributes['poet']='Sam M. Lewis and Joel Young'
	attributes['piece']='Moderately'
	attributes['copyright']='1925 Leo Feist, INC.'
	attributes['copyrightextra']='Renewed 1953 Warock Corp.'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='8c31fdb4-da7f-11e3-ad9a-d3417ee0a02e'
	attributes['structure']='AABA'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- mark what has been done to this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		f2 f4:maj7 f:7 | bes1 | f | f | \myEndLine
		g:7 | c:7 | f2 g4:m f/a | g2:m7 c:7.5+ | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		f f4:maj7 f:7 | bes1 | f | f | \myEndLine
		g:7 | c:7 | f | f:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		bes | e:7 | f | f | \myEndLine
		d2:m d:m7+ | d:m7 d:m6 | g1:7 | c2.:7 c4:7.5+ | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		f2 f4:maj7 f:7 | bes1 | f2 c:9.5+ | f1 | \myEndLine
		g2:7 g:7.5-/des | c1:7 |
	} \alternative {
		{
			f2 des:7 | g:7 c:7.5+ | \myEndLineVoltaNotLast
		}
		{
			f bes | f1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key f \major

	\partial 4 c'4 |

	%% part "A"
	\repeat volta 2 {
		c a r c | d bes r d | c1~ | c4 c,8 c~ c d f4 | g1~ | g4 g8 g~ g a g4 | f1~ |
		f2. c'4 |

		c a r c | d bes r d | c1~ | c4 c,8 c~ c d f4 | g1~ | g4 g8 g~ g a g4 | f1~ |
		f4 f8 g a bes c cis | d4 bes d4. bes8 | d4 e2 d4 | c c8 c~ c b c4 | a1 | a4 f a f | a d2. |
		r4 a8 a~ a d a4 | g2. c4 |

		c a r c | d bes r d | c1~ | c4 c,8 c~ c d f4 | g1~ | g4 c8 c~ c g a4 |
	} \alternative {
		{
			f1~ | f2. c'4 |
		}
		{
			f,1~ | f2. r4 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	I'm Sit -- ting On Top Of The World, __ just roll -- ing a -- long, __ just roll -- ing a -- long. __

	I'm quit -- ing the blues of the world, __ just sing -- ing a song, __ just sing -- ing a song. __

	"\"Glor" -- y Hal -- el -- lu -- "jah,\"" I just phoned the Par -- son, "\"Hey," Par get read -- y to "call.\"" Just like Hump -- ty Dump -- ty,
	I'm go -- ing to fall, I'm Sit -- ting On Top Of The World, __ just roll -- ing a long, __
	just roll -- ing a long. __ I'm
	long. __
}
% endif
