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

	attributes['title']='I Can\'t Give You Anything But Love'
	attributes['style']='Jazz'
	attributes['composer']='Jimmy McHugh'
	attributes['poet']='Dorothy Fields'
	# this is from the fake book
	attributes['piece']='Dreamily'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='2501ad54-da81-11e3-ba1a-2b982dfcfb4e'
	attributes['structure']='ABA\''
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
	g1 | g2/b bes:dim7 | a1:m7 | d:7 | \myEndLine
	g | g2 e:m7 | a1:m7 | d:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	g:7 | g:7 | c:maj7 | c4:maj7 c:7 b:7 bes:7 | \myEndLine
	a1:7 | a:7 | d:7 | d:7 | \myEndLine
	\endPart

	\myMark "A'"
	\startPart
	g | g2/b bes:dim7 | a1:m7 | d:7 | \myEndLine
	d:m7 | g:7 | c:maj7 | c:maj7 | \myEndLine
	c:maj7 | cis:dim7 | g:maj9/d | e:7 | \myEndLine
	a:m7 | a2:7 d:7 | g4 g/b c c:m | g/d d:7 g2:6 | \myEndLine
	\endPart

	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
{
	\tempo "Andante Moderato" 4 = 88
	\time 4/4
	\key g \major

	%% part "A"
	g'4 fis e g | fis e g e | a1 | a8 ais b2. |
	g4 fis e g | fis e g b | d1 | b8 bes a2. |

	%% part "B"
	g8 gis a2. | a8 ais b2. | d4 c b a~ | a1 |
	a8 ais b2. | b8 c cis2. | e4 d c b | d c e, fis |

	%% part "A"
	g fis e g | fis e g e | a1 | a8 ais b2. |
	d4 c b d | c b d c | b1 | a4 g2. |
	e4 fis g fis | a g fis g | d'1 | fis,4 e2. |
	dis4 e d' c | e e b b | g1~ | g2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	I can't give you an -- y thing but love Ba -- _ by; that's the on -- ly thing I've plen -- ty of,
	Ba -- _ by. Dream a -- while, scheme a -- while we're sure to find __ hap -- pi -- ness and, I guess,
	all those things you've al -- ways pined for. Gee, I'd love to see you look -- ing swell, Ba -- _ by;
	Dia -- mond brace -- lets Wool -- worth does -- n't sell, Ba -- by. 'till that luck -- y day, you know damed
	well, Ba -- by I can't give you an -- y -- thing but love. __
}
% endif
