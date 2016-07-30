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

	attributes['title']='How Deep Is the Ocean'
	attributes['style']='Jazz'
	attributes['subtitle']='How High Is the Sky'
	# this is from the fake book
	attributes['composer']='Irving Berlin'
	# this is from the fake book
	attributes['poet']='Irving Berlin'
	# this is from the fake book
	attributes['piece']='Slowly'
	attributes['copyright']='1932 Irving Berling (Renewed)'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='1f41adf6-da81-11e3-a9b9-277d2c72c477'
	attributes['structure']='ABAC'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- mark what has been done to this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startSong
	\startChords

	\myMark "A"
	\startPart
	c1:m7 | d2:m7.5- g:7 | c1:m7 | a2:m7.5- d:7 | \myEndLine
	g1:m7 | a2:m7.5- d:7 | g:m7 c:7 | f:m7 bes:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	ees1:maj7 | bes2:m7 ees:7 | aes1:7 | aes:7 | \myEndLine
	c:m7.5- | f:7 | bes:7 | d2:m7.5- g:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c1:m7 | d2:m7.5- g:7 | c1:m7 | a2:m7.5- d:7 | \myEndLine
	g1:m7 | a2:m7.5- d:7 | g:m7 c:7 | f:m7 bes:7 | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	ees1:7 | g2:m7.5- c:7 | f1:m7 | aes2:m7 des:7 | \myEndLine
	ees1:maj7 | f:7 | f2:m7 bes:7 | ees1:maj7 | \myEndLine
	\endPart

	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
{
	\tempo "Andante" 4 = 88
	\time 4/4
	\key ees \major

	%% part "A"
	r4 ees \tuplet 3/2 { ees d ees } | g4 g2. | r4 ees \tuplet 3/2 { ees d ees } | g2. r4 |
	r4 bes \tuplet 3/2 { bes a bes } | c4 c2. | r4 bes \tuplet 3/2 { bes a bes } | c1 |

	%% part "B"
	r4 ees ees ees | ees8 bes4 bes8~ bes4 bes4 | bes ges ges ges~ | ges1 |
	ges4 ees ees ees~ | ees d2 ees4 | ges f f f~ | f2 r |

	%% part "A"
	r4 ees \tuplet 3/2 { ees d ees } | g4 g2. | r4 ees \tuplet 3/2 { ees d ees } | g2. r4 |
	r4 bes \tuplet 3/2 { bes a bes } | c4 c2. | r4 bes \tuplet 3/2 { bes a bes } | c1 |

	%% part "C"
	r4 ees ees des | des c c bes | r aes \tuplet 3/2 { aes g f } | aes1 |
	r4 g \tuplet 3/2 { g f ees } | g4 g2. | r4 f \tuplet 3/2 { f ees d } | ees2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	How much do I love you? I'll tell you no lie.
	How Deep Is The O -- cean, how high is the sky?

	%% part "B"
	How man -- y times a day __ do I think of you? __
	How man -- y ros -- es are sprink -- led with dew? __

	%% part "A"
	How far would I trav -- el to be whre you are?
	How far is the jour -- ney for here to a star?

	%% part "C"
	And if I ev -- er lost you, how much would I cry?
	How Deep Is The O -- cean, how high is the sky?
}
% endif
