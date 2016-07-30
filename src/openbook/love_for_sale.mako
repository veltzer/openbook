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

	attributes['title']='Love For Sale'
	attributes['style']='Jazz'
	attributes['composer']='Cole Porter'
	attributes['poet']='Cole Porter'
	attributes['piece']='With Swinging Rhythm'
	attributes['copyright']='1930 (Renewed) Warner Bros. Inc.'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='ae7a1f0a-da7f-11e3-83ac-9776cf1b3075'
	attributes['structure']='AABA\''
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

	\repeat volta 2 {

		\myMark "A"
		\startPart
		ees1:7 | ees:7 | bes:m | bes:m | \myEndLine
		ees:7 | ees:7 | bes:m | bes:m | \myEndLine
		ees:m7 | aes:7 | des:7 | ges:7 | \myEndLine
		c:m7.5- | f:7.5+ | bes:m | bes:m | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		ees1:7 | ees:7 | bes:m | bes:m | \myEndLine
		ees:7 | ees:7 | bes:m | bes:m | \myEndLine
		ees:m7 | aes:7 | des:7 | ges:7 | \myEndLine
		c:m7.5- | f:7.5+ | bes:m | bes:m7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		ees:m7 | aes:7 | des:maj7 | f2:m7.5- bes:7 | \myEndLine
		ees1:m7 | aes:7 | des:maj7 | bes:m7 | \myEndLine
		bes:7 | bes:7 | ees:m | ees:m | \myEndLine
		g:m7.5- | c:7 | f:m7.5- | bes:7.9- | \myEndLine
		\endPart

		\myMark "A'"
		\startPart
		ees:7 | ees:7 | bes:m | bes:m | \myEndLine
		ees:7 | ees:7 | bes:m | bes:m | \myEndLine
		ees:m7 | aes:7 | des:7 | ges:7 | \myEndLine
		c:m7.5- | f:7.5+ | bes:m | bes:m7/aes | \myEndLine
		g2:m7.5- g:m7.5-/f | ees1:7 | ees2:m7 ees:m7/des | c1:m7.5- | \myEndLine
		bes:m | ees:7 |
	} \alternative {
		{
			bes | bes | \myEndLineVoltaNotLast
		}
		{
			bes | bes | \myEndLineVoltaLast
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
	\key bes \major

	\repeat volta 2 {

		%% part "A"
		bes'1~ | bes2. g4 | f1~ | f |
		r4 bes8 bes bes4 bes | bes bes2 g4 | f1~ | f2. r4 |
		r4 bes8 bes bes4 bes | bes c c2 | r4 aes8 aes aes4 aes | aes ges ges2 |
		f1~ | f2. des4 | bes1~ | bes2. r4 |

		%% part "A"
		bes'1~ | bes2. g4 | f1~ | f |
		r4 bes8 bes bes4 bes | ees c bes g | f1~ | f2. r4 |
		r4 bes8 bes bes4 bes | bes c c2 | r4 des8 des des4 des | des ges, ges2 |
		f1~ | f2. des4 | bes1~ | bes2. r4 |

		%% part "B"
		r4 bes8 c des4 ees | f4 ees ees2 | r4 c8 des ees4 f | aes1 |
		r4 bes,8 c des4 ees | f4 ees ees2 | r4 c8 des ees4 f | bes1 |
		r4 bes,8 c d4 f | ges f f2 | r4 d \tuplet 3/2 { ees4 f ges } | c4 bes bes2 |
		des c | des c | r4 b8 b b4 b | b2 bes |

		%% part "A"
		bes1~ | bes2. g4 | f1~ | f2. r4 |
		r4 bes8 bes bes4 bes | bes bes2 g4 | f1~ | f2. r4 |
		r4 bes8 bes bes4 bes | bes c c2 | r4 des8 des des4 des | des ees ees2 |
		f1~ | f2. des4 | bes1~ | bes2. r4 |
		f'1~ | f2 f8 des bes g | bes c des ees f4 f | f2. des4 |
		bes1~ | bes~ |
	} \alternative {
		{
			bes~ | bes4 r r2 |
		}
		{
			bes1~\repeatTie | bes4 r r2 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	Love __ For Sale, Ap -- pe -- tiz -- ing young Love For Sale
	Love that's fresh and still un -- spoiled, love that's on -- ly slight -- ly soiled, Love __ For Sale. __

	Who __ will buy? __ Who would like to sam -- ple my sup -- ply? __
	Who's pre -- pared to pay the price, for a trip to par -- a -- dise? Love __ For Sale. __
	Let the po -- ets pipe of love in their child -- ish way. I know ev -- ery type of love
	bet -- ter far than they. If you want the thrill of love, I've been thru the mill of love; Old love,
	new love, Ev -- 'ry love but true love. Love __ For Sale, __ Ap -- pe -- tiz -- ing young Love For
	Sale. __ If you want to buy my wares, Fol -- low me and climb the stairs, Love __ For
	Sale. __ Love __ _ _ _ _ _ _ _ _ _ _ _ For
	Sale.
}
% endif
