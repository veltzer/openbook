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
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Real', version)

	attributes['title']='How High The Moon'
	attributes['style']='Jazz'
	# this is from the real book and fake book
	attributes['composer']='Morgan Lewis'
	# this is from the fake book
	attributes['poet']='Nancy Hamilton'
	# this is from the fake book
	attributes['piece']='Moderately'
	# this is from the fake book
	attributes['copyright']='1940 by Chappell & Co., Inc. Copyright Renewed.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='7d17fd1c-15fe-11e1-b205-0019d11e5a41'
	attributes['structure']='AB'
	attributes['structureremark']='this tunes structure can also be categorised as ABAC if you take the AB as A and the AC as B. Under the AB interpretation the first part of A (first 8 bars) is the same as the first part of B.'
	attributes['location']='rbk1:202,jfb:149'

	attributes['idyoutuberemark1']='Ella!'
	attributes['idyoutube1']='2d-l7_TGnIE'
	attributes['idyoutuberemark2']='Grappelli in a nice emotional version with McCoy Tyner at the Piano'
	attributes['idyoutube2']='S4kf5aU1Wtg'
	attributes['lyricsurl']='http://www.lyricsfreak.com/e/ella+fitzgerald/how+high+the+moon_20045644.html'
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the fake book epdf.
	- filled in the meta data from the real book.
	- filled in the meta data from the fake book.
	- put in the tunes structure.
	- put in the fake book chords.
	- put in the fake book tune.
	- put in the fake book lyrics.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- played the fake book version to hear that it sounds well.
	- put in you tube performances with documentation.
	- put in a lyrics url.
	- brought in the real book epdf.
	- put in the real book chords.
	- put in the real book tune.
	- put in the real book lyrics.
	- check the real book chords.
	- check the real book tune.
	- heard the real book version.
	- check the real book lyrics.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 2. s2. |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		g1*2:maj7 | g1:m7 | c:7 | \myEndLine
		f1*2:maj7 | f1:m7 | bes:7 | \myEndLine
		ees:maj7 | a2:m7.5- d:7 | g1:m7 | a2:m7.5- d:7 | \myEndLine
		g1:maj7.9 | a2:m d:7 | b:m7 bes:7 | a:m7 a4:m7/d d:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		g1*2:maj7 | g1:m7 | c:7 | \myEndLine
		f1*2:maj7 | f1:m7 | bes:7 | \myEndLine
		ees:maj7 | a2:m7.5- d:7 | g1:maj7 | a2:m7 d:7.9- | \myEndLine
		b:m7 bes:7 | a:m7 a4:m7/d d:7.9- |
	} \alternative {
		{
			g1:6 | d2:7 a4:m7/d d:7 | \myEndLineVoltaNotLast
		}
		{
			g1*2 | \myEndLineVoltaLast
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
	\key g \major

	\partial 2. d4 g a |

	\repeat volta 2 {

		%% part "A"
		a2 b~ | b4 d, g a | bes1~ | bes4 c, f g |
		g2 a~ | a4 c, f g | aes1~ | aes4 d, ees f |
		g g g g | g g8 a~ a g a4 | bes1~ | bes4. a8~ a g a4 |
		b!1~ | b4 a b c | d d d d | d d, g a |

		%% part "B"
		a2 b~ | b4 d, g a | bes1~ | bes4 c, f g |
		g2 a~ | a4 c, f g | aes1~ | aes4 d, ees f |
		g g g g | g g8 a~ a g a4 | b1~ | b4 a b c |
		d d d d | d d, g a |
	} \alternative {
		{
			g1 | r4 d g a |
		}
		{
			g1~ | g2. r4 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Some -- where there's mu -- sic, __
	how faint the tune! __
	Some -- where there's heav -- en, __
	How High The Moon! __
	There is no moon a -- bove when love is far __ a -- way too, __
	'till __ it comes true __
	that you love me as I love you.

	%% part "B"
	Some -- where there's mu -- sic, __
	it's where you are. __
	Some -- where there's heav -- en, __
	how near, how far! __
	The dark -- est night would shine if you would come __ to me soon. __
	Un -- til you will, how still my heart,
	How High The Moon!
	%% Volta
	Some -- where there's
	Moon! __
}
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 2. s2. |

	\myMark "A"
	\startPart
	g1*2:maj7 | g1:m7 | c:7 | \myEndLine
	f1*2:maj7 | f1:m7 | bes:7 | \myEndLine
	ees:maj7 | a2:m7 d:7 | g1:m7 | a2:m7.5- d:7.9- | \myEndLine
	g1:maj7 | a2:m7 d:7 | b:m7 bes:7 | a:m7 d:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	g1*2:maj7 | g1:m7 | c:7 | \myEndLine
	f1*2:maj7 | f1:m7 | bes:7 | \myEndLine
	ees:maj7 | a2:m7 d:7 | g1:maj7 | a2:m7 d:7.9- | \myEndLine
	b:m7 bes:7 | a:m7 d:7 | g1:6 | \LPC a2:m7 \RPC d:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key g \major

	\partial 2. d4 g a |

	%% part "A"
	a2 b~ | b4 d, g a | bes1~ | bes4 c, f! g |
	g2 a~ | a4 c, f! g | aes1~ | aes4 d, ees! f! |
	g g g g | g g8 a~ a g a4 | bes1~ | bes4. a8~ a g a4 |
	b!1~ | b4 a b c | d d d d | d8 r d,4 g a |

	%% part "B"
	a2 b~ | b4 d, g a | bes1~ | bes4 c, f! g |
	g2 a~ | a4 c, f! g | aes1~ | aes4 d, ees! f! |
	g g g g | g g8 a~ a g a4 | b1~ | b4 a b c |
	d d d d | d d, g a | g1~ | g |
}
% endif

% if part=='LyricsReal':
\lyricmode {

	%% part "A"
	Some -- where there's mu -- sic, __
	how faint the tune! __
	Some -- where there's heav -- en, __
	How High The Moon! __
	There is no moon a -- bove when love is far __ a -- way too, __
	'till __ it comes true __
	that you love me as I love you.

	%% part "B"
	Some -- where there's mu -- sic, __
	it's where you are. __
	Some -- where there's heav -- en, __
	how near, how far! __
	The dark -- est night would shine if you would come __ to me soon. __
	Un -- til you will, how still my heart,
	How High The Moon! __
}
% endif
