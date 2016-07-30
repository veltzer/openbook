<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']='(I\'m Afraid) The Masquerade Is Over'
	attributes['style']='Jazz'
	attributes['composer']='Allie Wrubel'
	attributes['poet']='Herb Magidson'
	attributes['piece']='Moderately Slow'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='a213452e-da80-11e3-82b2-1f2053bf55c9'
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

	\myMark "A"
	\startPart
	\repeat volta 2 {
		ees1 | g2:7/d g:7 | c2.:m c4:m7 | bes2:m7 ees:7 | \myEndLine
		aes1 | c2:7/g c:7 | f1:7 | f2:m7.5-/bes bes:7 | \myEndLine
		ees1 | ees:7 | aes | aes:m6 | \myEndLine
	} \alternative {
		{
			ees:maj7 | c:7.9- | f:m7 | bes:7 | \myEndLineVoltaNotLast
		}
		{
			ees | f2:m7 bes:7.9- | ees1 | ees | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	f2:m7 bes:7 | ees4:maj9 ees2.:6 | f2:m7 bes:7 | ees2:maj9 ees:6 | \myEndLine
	a:m7 d:7 | g:maj7 g:6 | f1:m7 | b2:7.5- bes4:7 bes:7.5+ | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees1 | g2:7/d g:7 | c2.:m c4:m7 | bes2:m7 ees:7 | \myEndLine
	aes1 | c2:7/g c:7 | f1:7 | f2:m7.5-/bes bes:7 | \myEndLine
	ees1 | ees2.:7 ees4:7.5+ | aes1 | aes | \myEndLine
	f:9 | f2.:m7 f4:m7.5-/bes | ees1*2:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Presto" 4 = 196
	\time 4/4
	\key ees \major

	\partial 4 bes4 |

	%% part "A"
	\repeat volta 2 {
		g'2. g4 | g2~ \tuplet 3/2 { g4 bes aes } | g2. g4 | f2 r4 d8 ees |
		c'2. c4 | bes2~ \tuplet 3/2 { bes4 c bes } | a2. f4 | aes2 r4 g8 aes |
		bes2~ bes8 g f ees | ees'2. c4 | bes2 aes | r4 ees4 f ees |
	} \alternative {
		{
			bes'1~ | bes4 g c4. g8 | bes1~ | bes2 r4 aes |
		}
		{
			bes1~ | bes4 ees, g g | ees1~ | ees2 r4 ees |
		}
	}

	%% part "B"
	f8 f f g aes4 g | bes bes2 ees,4 | f8 f f g aes4 g | bes2 r4 g |
	a4 b c b8 a | d4 d2 d4 | f2~ \tuplet 3/2 { f4 ees c } | f,2 r4 <bes, \parenthesize fis'> |

	%% part "A"
	g'2. g4 | g2~ \tuplet 3/2 { g4 bes aes } | g2. g4 | f2 r4 d8 ees |
	c'2. c4 | bes2~ \tuplet 3/2 { bes4 c bes } | a2. f4 | aes?2 r4 g8 aes |
	bes2~ bes8 g f ees | ees'2. ees4 | ees2 f, | r4 f g aes |
	c1~ | c4 aes c ees | ees1~ | ees\fermata |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	Your eyes don't shine __ like they used to shine. And the thrill is
	gone __ when your lips meet mine. I'm A -- fraid __ The Mas -- que -- rade Is
	O -- ver And so is love, __ and so is love. __
	Your love, __ and so is love. __ I
	guess I'll have to play Pag -- liac -- ci and get my self a clown's dis -- guise, and
	learn to laugh like Pag -- liac -- ci with tears __ in my eyes. You look the
	same, __ you're a lot the same, but my heart says, "\"No," __ no, you're
	not the "same.\"" I'm A -- fraid __ The Mas -- que -- rade Is O -- ver
	and so is love, __ and so is love. __
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {
	_ words don't mean __ what they used to mean. They were once in --
	spired, __ now they're juse rou -- tine.
}
% endif
