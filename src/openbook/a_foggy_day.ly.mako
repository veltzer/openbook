<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Fake', version)
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']='A Foggy Day'
	attributes['style']='Jazz'
	# this is from the fake book
	attributes['subtitle']='From \'A Damsel In Distress\''
	# this is from the fake book
	attributes['composer']='George Gershwin'
	# this is from the fake book
	attributes['poet']='Ira Gershwin'
	# this is from the real book
	#attributes['piece']='Med. Swing'
	# this is from the fake book
	attributes['piece']='Medium Swing'
	# this is from the fake book
	attributes['copyright']='1937, Gershwin Publishing Corporation'
	attributes['copyrightextra']='Copyright Renewed, Assigned to Chappell & Co, Inc.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='87da6ece-a26e-11df-95d7-0019d11e5a41'
	attributes['structure']='AB'
	attributes['structureremark']='this tunes structure can also be categorised as ABAC since the first 8 bars of both the first and second part are the same.'
	attributes['location']='rbk1:6,jfb:120-121'

	attributes['idyoutuberemark1']='Wynton Marsalis Quartet'
	attributes['idyoutube1']='-P2xoeGoWMs'
	attributes['idyoutuberemark2']='Mel Torme (one of the greatest vocal versions)'
	attributes['idyoutube2']='tVCDZaApwV8'
	attributes['lyricsurl']='http://www.sing365.com/music/lyric.nsf/A-Foggy-Day-lyrics-Frank-Sinatra/0F2EB16090A785424825692000077664'
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- brought in the fake book epdf.
	- put in you tube performances with documentation.
	- put in the tunes structure.
	- put in a lyrics url.
	- filled in the meta data.
	- put in the fake book chords.
	- put in the fake book tune.
	- put in the fake book lyrics.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- played the fake book version to hear that it sounds well.
	- put in the real book chords.
	- put in the real book tune.
	- put in the real book lyrics.
	- checked the real book chords.
	- checked the real book tune.
	- checked the real book lyrics.
	- played the real book version to hear that it sounds well.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f1:maj7 | a2:m7.5- d:7.9- | g1:m7 | c:7 | \myEndLine
	f:6 | d:m7.5- | g:7 | g2:m7 c:7 | \myEndLine
	f1:maj7 | c2:m7 f:7 | bes1:6 | bes:m6 | \myEndLine
	f:maj7 | a2:m7 d:7 | g1:7 | g2:m7 c:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	f1:maj7 | aes:m7 | g:m7 | c:7 | \myEndLine
	f:6 | d:m7.5- | g:7 | g2:m7 c:7 | \myEndLine
	c1:m7 | f:7 | bes:6 | ees:7 | \myEndLine
	f2:6 g:m7 | a:m7 bes:m6 | a:m7 d:m7 | g:m7 c:7 | f1:6 | \LPC g2:m7 \RPC c:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

	%% part "A"
	r4 c c c | ees2. ees4 | d d2. | a'1 |
	r4 f f f | aes2. aes4 | g2. g4 | d'1 |
	r4 e e e | c c2. | a a4 | f1 |
	r4 a a a | c c2 c4 | a2. a4 | d,1 |

	%% part "B"
	r4 c c c | ees2. ees4 | d2. d4 | a'1 |
	r4 f f f | aes2. aes4 | g2. g4 | d'1 |
	f2 f4 f | d2. d4 | c2 c | a a4 bes |
	c f, g bes | a f g bes | a2 f' | f, g | f1~ | f2. r4 |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

	%% part "A"
	A Fog -- gy Day in Lon -- don town had __ _ me low and had me down.
	I viewed the morn -- ing with a -- larm, the Brit -- ish Mu -- seum had lost its charm.

	%% part "B"
	How long I wondered could this thing last? But_the age of mira -- cles had -- n't passed,
	for sud -- den -- ly I saw you there and through fog -- gy Lon -- don town the sun was shin -- ing ev -- 'ry where. __
}
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		f1:maj7 | a2:m7.5- d:7.9- | g1:m7 | c:7 | \myEndLine
		f2. d4:m7.5- | d1:m7.5- | g:7 | g2:m7 c:7 | \myEndLine
		f1:maj7 | c2:m7 f:7 | bes1:maj7 | bes:m6 | \myEndLine
		f:maj7 | a2:m7 d:7 | g1:7.9 | g2:m7 c:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		f1:maj7 | a2:m7.5- d:7.9- | g1:m7 | c:7 | \myEndLine
		f2. d4:m7.5- | d1:m7.5- | g:7 | g2:m7 c:7 | \myEndLine
		c1:m7 | f:7 | bes:maj7 | ees:7 | \myEndLine
		f2 g:m7 | a:m7 bes:m6 | a:m7 d:m7 | g:m7 c:7 | \myEndLine
	} \alternative {
		{
			f1 | g2:m7 c:7 | \myEndLineVoltaNotLast
		}
		{
			f1 | bes2:7 bes:m6 | f1:maj7 | \myEndLineVoltaLast
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
	\time 4/4
	\key f \major

	\partial 4 c4 |

	\repeat volta 2 {

	%% part "A"
	c c2 ees4~ | ees2. ees4 | d d2 a'4~ | a1 |
	f2 f4 aes~ | aes2. aes4 | g2 g4 d'~ | d1 |
	r4 e e e | c c2. | a2 a4 f~ | f2. f4 |
	a a a c~ | c c2 c4 | a2 a4 d,~ | d2. c4 |

	%% part "B"
	c2 c4 ees~ | ees ees2 ees4 | d2 d4 a'~ | a2 a4 a |
	f2 f4 aes~ | aes bes aes2 | g g4 d'~ | d2. d4 |
	f2 f4 d~ | d2. d4 | c2 c4 a~ | a2 a4 bes |
	c f, g bes | a f g bes | a2 f' | f, g |

	} \alternative {
		{
			f1 | r2 r4 c |
		}
		{
			f1~ | f~ | f |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	A Fog -- gy Day __ in Lon -- don town __ had me low __ and had me down. __
	I viewed the morn -- ing with a -- larm, __ the Brit -- ish Mu -- se -- um had lost its charm. __

	%% part "B"
	How long I won -- dered could this thing last? __ But the age of mir -- a -- cles had -- n't passed, __
	for sud -- den -- ly, __ I saw you there __ and through fog -- gy Lon -- don town the sun was shin -- ing ev -- 'ry where.

	%% part "Volta"
	A where. __
}
% endif
