<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']='Doxy'
	attributes['style']='Jazz'
	attributes['composer']='Sonny Rollins'
	# this is from the fake book
	attributes['piece']='Medium Groove'
	# this is from the fake book
	attributes['copyright']='1963 Prestige Music Co, Inc.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='c921579e-a26e-11df-9a5c-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='rbk2:79,jfb:105'

	attributes['idyoutuberemark1']='Miles Davis!'
	attributes['idyoutube1']='ZcPxCQhJ2n4'
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book pdf.
	- filled in the tunes meta data from the fake book.
	- added the fake book epdf.
	- wrote down the fake book chords.
	- wrote down the fake book tune.
	- bring in the fake book pdf.
	- check the fake book chords.
	- check the fake book tune.
	- heard the tune to make sure it sounds right.
	- document the youtube performance.
	- added the tunes structure.
	- marked the part markings in the fake book version.
	TODO:
	- add the real book chords and tune.
	- how about adding the Aebersold version too?
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		bes2:7 aes:7 | aes:7 g:7 |
	} \alternative {
		{
			c:7 f:7 | bes1:7 | \myEndLineVoltaNotLast
		}
		{
			c:7 | f:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	bes1*2:7 | ees1:7 | e:dim7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	bes2 aes:7 | aes:7 g:7 | c:7 f:7 | bes1 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key bes \major

	\partial 8 f8 |

	%% part "A"
	\repeat volta 2 {
		bes8 d bes f bes4 r8 f | bes8 f bes des r g,4 f8 |
	} \alternative {
		{
			e8 g bes des \tuplet 3/2 { c8 des c } g8 bes | r2 r4 r8 f |
		}
		{
			e8 g bes des \tuplet 3/2 { c8 des c } g8 a | r1 |
		}
	}

	%% part "B"
	g'4 r8 f~ f r des4~ | des4. g,8 r c4 g8 | des'4 des8 des g,4 c | r2 r4 r8 f, |

	%% part "A"
	bes d bes f bes4 r8 f | bes f bes des r g,4 f8 | e g bes des \tuplet 3/2 { c8 des c } g8 bes | r1 |
}
% endif
