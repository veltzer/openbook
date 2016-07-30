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

	attributes['title']='Like Someone In Love'
	attributes['style']='Jazz'
	attributes['composer']='Johnny Burke, Jimmy Van Heusen'
	# from the fake book
	attributes['poet']='Johnny Burke, Jimmy Van Heusen'
	# from the fake book
	attributes['piece']='Moderately'
	# from the fake book
	attributes['copyright']='1944 Bourne Co. and Dorsey Bros. Music, Inc. Division of Music Sales Corporation'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='a2084076-da7f-11e3-86db-a7e6565c22fc'
	attributes['structure']='ABAB\''
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
		c2:maj7 c/b | c:6/a c/g | d:7/fis g:7/f | e:m7 ees:7 | \myEndLine
		d1:m7 | g2.:7 g4:9.5+ | c1:maj7 | g4:m7 c2:9 c4:9.5+ | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		f2.:6 f4:5+ | b2:m7 e:7 | a1:maj7 | a:6 | \myEndLine
		a:m7 | d:7 | d1:7 | g:7.5+ | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		c2:maj7 c/b | c:6/a c/g | d:7/fis g:7/f | e:m7 ees:7 | \myEndLine
		d1:m7 | g2.:7 g4:9.5+ | c1:maj7 | g4:m7 c2:9 c4:9.5+ | \myEndLine
		\endPart

		\myMark "B'"
		\startPart
		f2.:6 f4:5+ | b2:m7 e:7 | a1:maj7 | d2.:9 dis4:dim | \myEndLine
		e2:m7 a:7 | d:m7 g:7.9- |
	} \alternative {
		{
			c a:m7 | d:9 g:7 | \myEndLineVoltaNotLast
		}
		{
			c f:m6 | c1 | \myEndLineVoltaLast
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
	\key c \major

	\repeat volta 2 {

		%% part "A"
		e4 e2 e4 | e4 a g e | d d2 b'4 | g1 |
		f4 f2 c'4 | b2. a4 | g4 g2 e'4 | d1 |

		%% part "B"
		d4 d2 cis4 | e d cis b | e,2 e~ | e1 |
		c'4 c2 b4 | d c b a | d,1 | dis |

		%% part "A"
		e4 e2 e4 | e a g e | d d2 b'4 | g1 |
		f4 f2 c'4 | b2. a4 | g4 g2 e'4 | d1 |

		%% part "B"
		d4 d2 cis4 | e d cis b | e, e2 e4 | fis2. fis4 |
		g4 g2 g4 | f d'2 b4 |
	} \alternative {
		{
			c1 | R |
		}
		{
			c1~ | c |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Late -- ly I find my -- self out gaz -- ing at stars,
	hear -- ing gui -- tars Like Some -- one In Love.

	%% part "B"
	Some -- times the things I do a -- stound me,
	__ most -- ly when -- ev -- er you're a -- round me.

	%% part "A"
	Late -- ly I seem to walk as though I had wings,
	bump in -- to things Like Some -- one In Love.

	%% part "B"
	Each time I look at you I'm linmp as a glove
	and feel -- ing Like Some -- one In Love.

	%% part "Volta"
	Love. __
}
% endif
