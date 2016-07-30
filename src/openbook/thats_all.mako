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

	# from the fake book
	attributes['title']='That\'s All'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Alan Brandt, Bob Haymes'
	# from the fake book
	attributes['poet']='Alan Brandt, Bob Haymes'
	# from the fake book
	attributes['piece']='Slowly, with expression'
	# from the fake book
	attributes['copyright']='1952 Renewed 1982 Mixed Bag Music, Inc.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='b0685520-db92-11e3-a96d-4fe96cfbc3fb'
	attributes['structure']='AABA'
	attributes['location']='jfb:380-381'

	attributes['idyoutuberemark1']='Nat King Cole cannonical version'
	attributes['idyoutube1']='sooSaQpGnMM'
	attributes['idyoutuberemark2']='Frank Sinatra cannonical version'
	attributes['idyoutube2']='SINfqtCq0lY'
	attributes['lyricsurl']='http://www.metrolyrics.com/thats-all-lyrics-nat-king-cole.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the fake book.
	- put in the tunes structure
	- added the meta data from the fake book.
	- put in the chords (fakebook).
	- put in the lyrics (fakebook).
	- put in the tune (fakebook).
	- check the chords (fakebook).
	- check the tune (fakebook).
	- check the lyrics (fakebook).
	- heard the tune to check that it is right and adjust the tempo.
	- added lyrics url.
	- added youtube performances.
	TODO:
	- add another version of this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		c2 d:m7 | e:m7 f4:m7 g:7 | e2:m7 a:9 | d:m7 g:7 | \myEndLine
		fis:m7.5- f:m7 | e:m7 ees:dim7 |
	} \alternative {
		{
			e:m7 a:7.9- | d:7.5- g:7 | \myEndLineVoltaNotLast
		}
		{
			e4:m7 a:7.9- d:m7 g:7.9- | c1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	g2:m7 c:9 | f:maj7.9 d:9 | g:m7 c:9 | f:maj7 f:6 | \myEndLine
	a:m7 d:9 | g:maj7.9 e:9 | a:m7 d:9 | d:m7 g:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c2 d:m7 | e:m7 f4:m7 g:7 | e2:m7 a:9 | d:m7 g:7 | \myEndLine
	fis:m7.5- f:m7 | e:m7 ees:dim7 | e4:m7 a:7.9- d:m7 g:7.9- | c1 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Andante" 4 = 90
	\time 2/2
	\key c \major

	\partial 4 e8 f |

	%% part "A"
	\repeat volta 2 {
		g b g e g b g e | g g~ g2 e8 f | g b g e g b g e | g2. a8 b |
		c e c a c4. a8 | c e c a c4. a8 |
	} \alternative {
		{
			g2. e4 | d2. e8 f |
		}
		{
			g2. e4 | c2. c8 c' |
		}
	}

	%% part "B"
	a4 c,8 c' a4 c,8 c' | a4 a2 c,8 c' | a4 c,8 c' a4 c,8 c' | a2. d,8 d' |
	b4 d,8 d' b4 d,8 d' | b4 b2 d,8 d' | b4 d,8 d' b4 d,8 b' | g2. e8 f |

	%% part "A"
	g b g e g b g e | g g~ g2 e8 f | g b g e g b g e | g2. a8 b |
	c e c a c4. a8 | c e c a c4. a8 | g2. e4 | c1 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	I can on -- ly give you love that lasts for -- ev -- er, __
	and the prom -- ise to be near each time you call;
	and the on -- ly heart I own, for you and you a -- lone, That's All, That's All. I can
	_ _ _ _ _
	%%All, That's All.

	%% part "B"
	those I am sure who have told you
	they would give you the world for a toy.
	All I have are these arms to en -- fold you
	and a love time can nev -- er de -- stroy.

	%% part "A"
	If you're won -- d'ring what I'm ask -- ing in re -- turn dear, __
	you'll be glad to know that my de -- mands are small:
	say it's me that you'll a -- dore,
	for now and ev -- er -- more,
	That's All, That's All.
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {

	%% part "A"
	_ _
	on -ly give you coun -- try walks in spring -- time, __
	and a hand to hold when leaves be -- gin to fall;
	and a love whose burn -- ing light,
	will warm the win -- ter night,
	That's
	_ _ _ _ _
	All, That's All. There are
}
% endif
