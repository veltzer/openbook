<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']='A Night In Tunisia'
	attributes['style']='Jazz'
	# Sorry for all the slashes. They have to be escaped by mako and then
	# still escaped for Lilypond
	attributes['composer']='John \'Dizzy\' Gillespie, Frank Paparelli'
	# this is from the fake book
	attributes['piece']='Bright Swing'
	# this is from the fake book
	attributes['copyright']='1944 by MCA Music Publishing, A division of MCA Inc, New York, NY'
	# this is from the fake book
	attributes['copyrightextra']='Copyright Renewed'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='ea02cd50-da80-11e3-999d-eb3f2153c941'
	attributes['structure']='ABA'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- mark what has been done to this tune.
	- add lyrics to this one.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		ees1:7 | d:m6 | ees:7 | d:m6 | \myEndLine
		ees:7 | d:m6 | ees2:m7.5- a4.:7.5-.9- d8:m6 |
	} \alternative {
		{
			d1:m6 | \myEndLineVoltaNotLast
		}
		{
			d1:m6 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	a:m7.5- | d:7.9- | g2:m6 d:7.9- | g1:m6 | \myEndLine
	g1:m7.5- | c:7.9- | f:maj | e2:m7.5- a:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees1:7 | d:m6 | ees:7 | d:m6 | \myEndLine
	ees:7 | d:m6 | e2:m7.5- a:7.5- | d1:m7+ | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

	%% part "A"
	\partial 8 a8 |

	\repeat volta 2 {
		\tuplet 3/2 { bes des f } c'2 bes8 f | gis a4. r4 r8 a, | \tuplet 3/2 { bes des f } c' c~ c4 bes8 f | a2. r8 a, | \tuplet 3/2 { bes des f } c'2 bes8 f | gis a4. r2 |
		a8 bes \tuplet 3/2 { a16 bes a } g8 ees4 cis8 d~ |
	} \alternative {
		{
			d4 r r r8 a |
		}
		{
			d4\repeatTie r r r8 a' |
		}
	}

	%% part "B"
	c4. a8~ a4. g8 | ges4 ees'8 cis d c4 a8 |
	bes g4 fis8~ fis4 a8 fis | g a e4 r r8 \grace a8 bes8~ | bes \grace a8 bes4 r8 r4 \tuplet 3/2 { g16 aes g } f8 | e4 \tuplet 3/2 { des'16 ees des } b8 c bes4 gis8 | a4. f8 \tuplet 3/2 { g?16 aes g } f8 \tuplet 3/2 { g16 aes g } f8 |
	e2. r8 a, |

	%% part "A"
	\tuplet 3/2 { bes des f } c'2 bes8 f | gis a4. r4 r8 a, | \tuplet 3/2 { bes des f } c' c~ c4 bes8 f | a2. r8 a, | \tuplet 3/2 { bes des f } c'2 bes8 f | gis a4. r2 | a8 bes \tuplet 3/2 { a16 bes a } g8 ees4 cis8 d~ | d4 r r2 |
}
% endif
