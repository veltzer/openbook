<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	attributes.addVersion('Unknown', version)
	attributes.setDefaultVersionName('Unknown')

	attributes['title']='Take Five'
	attributes['style']='Jazz'
	attributes['composer']='Paul Desmond'
	attributes['piece']='Moderately'
	attributes['copyright']='1960 (Renewed) Desmond Music Company (U.S.A.) and Derry Music Company (Canada)'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='86e17438-da80-11e3-9f6f-832caca8efee'
	attributes['structure']='ABA'
	attributes['location']='rbk1:420'
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book location.
	TODO:
	- mark what has been done with this tune.
% endif

% if part=='ChordsUnknown':
\chordmode {
	\startSong
	\startChords

	\partial 2 s2 |

	\myMark "A"
	\startPart
	d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | \myEndLine
	d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	bes2. c2:7 | a2.:m7 d2:m | g2.:m7 c2:7 | f2. f2:7 | \myEndLine
	bes2. c2:7 | a2.:m7 d2:m | g2.:m7 c2:7 | e2.:m7 a2:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | \myEndLine
	d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | d2.:m d2:m | \myEndLine
	\endPart

	\endChords
	\endSong
}
% endif

% if part=='VoiceUnknown':
{
	\tempo "Andante Moderato" 4 = 88
	\time 5/4
	\key d \minor

	\partial 2 a8 d f g |

	%% part "A"
	gis a gis g f4 a, c | d2. \tuplet 3/2 { e16 f e } d8 c4 | d2. \tuplet 3/2 { c16 d c } a8 g4 | a2.~ a8 d f g |
	gis a gis g f4 a, c | d2. \tuplet 3/2 { e16 f e } d8 c4 | d2. \tuplet 3/2 { c16 d c } a8 g4 | a2.~ a2 |

	%% part "B"
	d'8 f4 d8 bes4 g8 a bes b | c e4 c8 a4 f8 g gis a | bes8 d4 bes8 g4 e8 f g gis | a gis a bes c4 c8 b c cis |
	d8 f4 d8 bes4 g8 a bes b | c e4 c8 a4 f8 g gis a | bes8 d4 bes8 g4 e8 g c bes | a2. a,8 d f g |

	%% part "A"
	gis a gis g f4 a, c | d2. \tuplet 3/2 { e16 f e } d8 c4 | d2. \tuplet 3/2 { c16 d c } a8 g4 | a2.~ a8 d f g |
	gis a gis g f4 a, c | d2. \tuplet 3/2 { c16 d c } a8 g4 | a2. \tuplet 3/2 { e'16 f e } d8 c4 | d2.~ d2 |
}
% endif
