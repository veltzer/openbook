<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('My', version)
	attributes.setDefaultVersionName('My')

	attributes['title']='Moon River'
	attributes['style']='Ballad'
	attributes['composer']='Henri Mancini'
	attributes['poet']='Johnny Mercer'
	attributes['piece']='Ballad'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='11542882-e65c-11e2-9030-4311f6fc08c2'
	attributes['structure']='ABAC'

	attributes['idyoutuberemark1']='Rita Hayworth version'
	attributes['idyoutube1']='SQ8keKFByh8'
	attributes['lyricsurl']='http://www.sing365.com/music/lyric.nsf/Moon-River-lyrics-Frank-Sinatra/B08DDFF369E15C874825691F000CAC36'
%>
% endif

% if part=='Doc':
	DONE:
	- put in the chords
	- put in the tune
	- put in the lyrics
	- head the tune (sounds good).
	- put it one version of youtube.
	- put in the lyrics url.
	- checked that the lyrics fit the chords and tune.
	- put in all the meta data.
	- put in the tunes structure.
	TODO:
	- add another youtube performance.
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f2. | d:m7 | bes:maj7 | f | \myEndLine
	bes:maj7 | f | e:m7.5- | a:7.9- | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	d:m | f:7/c | bes:maj7 | bes:m | \myEndLine
	d:m | b4:m7.5- e2:7 | a4:m7 d2:7 | g4:m7 c2:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f2. | d:m7 | bes:maj7 | f | \myEndLine
	bes:maj7 | f | e:m7.5- | a:7.9- | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	d:m | d:m/c | b:m7.5- | bes:m | \myEndLine
	f | bes:maj7 | f | bes:maj7 | \myEndLine
	f | d:m | g:m7 | c:7 | \myEndLine
	bes:maj7 | bes:m | f | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceMy':
{
	\tempo "Allegro" 4 = 130
	\time 3/4
	\key f \major

	\clef treble

	%% A part
	c'2. | g'8 f8~ f2 | e4. d8 c bes | c2 f,4 |
	e'4. d8 c bes | c2 f,4 | g2.~ | g2 a4 |

	%% B part
	f2. | c'8 a4. g4 | f2. | c'8 a4. g4 |
	f a c | f e4. d8 | e4 d4. c8 | d2. |

	%% A part
	c2. | g'8 f8~ f2 | e4. d8 c bes | c2 f,4 |
	e'4. d8 c bes | c2 f,4 | g2.~ | g2 a4 |

	%% C part
	f2. | a2 c4 | f2.~ | f4 g f |
	c2.~ | c4 e8 d c bes | c2.~ | c8 f, e'8 d c bes |
	c2. | f, | bes4 g2~ | g2 a4 | f2.~ | f~ | f |
}
% endif

% if part=='LyricsMy':
\lyricmode {
	%% A part
	Moon Ri -- ver __ wi -- der than a mile
	I'm cros -- sing you in style some -- day __
	%% B part
	Oh dream ma -- ker, you heart -- brea -- ker
	Wher -- e -- ver you're go -- ing I'm go -- ing your way
	%% A part
	Two drif -- ters __ off to see the world
	There's such a lot of world to see __

	We're af -- ter the same __ rain -- bow's end __
	Wai -- ting round the bend __
	My hu -- ckle -- ber -- ry friend, Moon Ri -- ver __
	And me __
}
% endif
