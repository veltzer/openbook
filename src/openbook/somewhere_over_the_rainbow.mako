<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Ccb', version)
	attributes.setDefaultVersionName('Ccb')
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Wikifonia', version)

	# from the ccb book
	attributes['title']='Somewhere, Over The Rainbow'
	attributes['style']='Jazz'
	# from the ccb book
	attributes['composer']='Harold Arlen'
	# from wikipedia
	attributes['poet']='Edgar Yipsel \'Yip\' Harburg'
	# from the fake book
	attributes['piece']='Ballad'
	# my own
	#attributes['piece']='Slowly, with expression'
	# from wikifonia
	attributes['copyright']='Musicopy'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='f046f51c-ed4d-11e3-9d71-67b6b025e741'
	attributes['structure']='AABA'
	attributes['location']='cc:209,file:over_the_rainbow.pdf,nrbk3:287-288'

	attributes['idyoutuberemark1']='Keith Jarret solo'
	attributes['idyoutube1']='eq0EWNuR1H8'
	attributes['idyoutuberemark2']='Original Judy Garland version'
	attributes['idyoutube2']='PSZxmZmBfnU'
	attributes['idyoutuberemark3']='Keith Jarret kills them'
	attributes['idyoutube3']='u3eH6VW6Chc'
	attributes['idyoutuberemark4']='The original Judy Garland version'
	attributes['idyoutube4']='1HRa4X07jdE'
	attributes['lyricsurl']='http://www.stlyrics.com/lyrics/thewizardofoz/somewhereovertherainbow.htm'
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the ccb.
	- put in the tunes structure
	- added the meta data from the ccb.
	- added lyrics url.
	- added youtube performances.
	- put in the chords (ccb).
	- put in the tune (ccb).
	- put in the lyrics (ccb).
	- check the lyrics (ccb).
	- check the chords (ccb).
	- check the tune (ccb).
	- heard the tune to check that it is right and adjust the tempo.
	- brought in the wikifonia version.
	- filled in the meta data from wikifonia and wikipedia.
	- put in the lyrics from wikifonia.
	- put in the chords from wikifonia.
	- put in the tune from wikifonia.
	- checked the wikifonia melody sounds fine.
	- checked the wikifonia chords.
	- checked the wikifonia lyrics.
	- checked the wikifonia melody.
	TODO:
	- put the copyright right in the wikifonia copyright statement (with the copyright symbol).
% endif

% if part=='ChordsCcb':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		a2:m7.5- d:7.9- | g2.:m7 a4:7.5- | aes2:maj7 a4:m7.5- d:7.9- | g2:m7 c:7.9- | \myEndLine
		f:m7 aes:m7 | g:m7 c:7.9- | f:m7 bes:7.9- |
	} \alternative {
		{
			ees:maj7 f4:m7 bes:7.9- | \myEndLineVoltaNotLast
		}
		{
			ees2:maj7 f4:m7 bes:7.9- | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	ees1:maj7 | f2:m7 bes:7.9- | g:m7 c:7.9- | f:m7 bes:7.9- | \myEndLine
	ees1:maj7 | a2:m7.5- d:7.9- | g:m7 c:9 | f:m7 bes:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	a:m7.5- d:7.9- | g2.:m7 a4:7.5- | aes2:maj7 a4:m7.5- d:7.9- | g2:m7 c:7.9- | \myEndLine
	f:m7 aes:m7 | g:m7 c:7.9- | f:m7 bes:7.9- | ees:maj7 f4:m7 bes:7.9- | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceCcb':
{
	\tempo "Andante" 4 = 80
	\time 4/4
	\key ees \major

	%% part "A"
	\repeat volta 2 {
		ees2 ees' | d4 bes8 c d4 ees | ees,2 c' | bes1 |
		c,2 aes' | g4 ees8 f g4 aes | f d8 ees f4 g |
	} \alternative {
		{
			ees2 r |
		}
		{
			ees2. bes'4 |
		}
	}

	%% part "B"
	g8 bes g bes g bes g bes | aes bes aes bes aes bes aes bes | c2 c~ | c r4 bes |
	g8 bes g bes g bes g bes | a c a c a c a c | d2 d | f c |

	%% part "A"
	ees,2 ees' | d4 bes8 c d4 ees | ees,2 c' | bes1 |
	c,2 aes' | g4 ees8 f g4 aes | f d8 ees f4 g | ees2 r |
}
% endif

% if part=='LyricsCcb':
\lyricmode {

	%% part "A"
	Some -- where o -- ver the rain -- bow
	Way up high,
	There's a land that I heard of
	Once in a lu -- lla -- by.

	%% part "B"
	_ Some -- day I'll wish u -- pon a star
	And wake up where the clouds are far
	Be -- hind me.
	Where trou -- bles melt like le -- mon drops
	A -- way a -- bove the chim -- ney tops
	That's where you'll find me.

	%% part "A"
	Some -- where o -- ver the rain -- bow
	Blue -- birds fly.
	Birds fly o -- ver the rain -- bow.
	Why then, oh why can't I?
}
% endif

% if part=='LyricsmoreCcb':
\lyricmode {

	%% part "A"
	Some -- where o -- ver the rain -- bow
	Skies are blue,
	And the dreams that you dare to dream
	Real -- ly do come _ true.
}
% endif

% if part=='ChordsWikifonia':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		ees2:maj7 c:m7 | g2.:m7 ees4:7 | aes2:maj7 d:7 | g:m7 c:7 | \myEndLine
		f:m7 des:7 | ees:maj7 g4:m7 c:7 | f2:m7 bes:7 |
	} \alternative {
		{
			ees:maj7 f4:m7 bes:7 | \myEndLineVoltaNotLast
		}
		{
			ees1:maj7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	ees1:maj7 | f2:m7 bes:7 | g:m7 c:7 | f:m7 bes:7 | \myEndLine
	ees1:maj7 | a2:m7.5- d:7.9- | g:m7 c:7 | f:m7 bes:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees2:maj7 c:m7 | g2.:m7 ees4:7 | aes2:maj7 d:7 | g:m7 c:7 | \myEndLine
	f:m7 des:7 | ees:maj7 g4:m7 c:7 | f2:m7 bes:7 | ees1:maj7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceWikifonia':
{
	\tempo "Adagio" 4 = 76
	\time 4/4
	\key ees \major

	%% part "A"
	\repeat volta 2 {
		ees2 ees' | d4 bes8 c d4 ees | ees,2 c' | bes1 |
		c,2 aes' | g4 ees8 f g4 aes | f d8 ees f4 g |
	} \alternative {
		{
			ees1 |
		}
		{
			ees2. r8 bes' |
		}
	}

	%% part "B"
	g8 bes g bes g bes g bes | aes bes aes bes aes bes aes bes | c2 c~ | c2. r8 bes |
	g8 bes g bes g bes g bes | a c a c a c a c | d2 d | f c |

	%% part "A"
	ees,2 ees' | d4 bes8 c d4 ees | ees,2 c' | bes1 |
	c,2 aes' | g4 ees8 f g4 aes | f d8 ees f4 g | ees1 |
}
% endif

% if part=='LyricsWikifonia':
\lyricmode {

	%% part "A"
	Some -- where O -- ver The Rain -- bow, way up high,
	there's a land that I heard of once in a lull -- a -- by

	%% part "B"
	true
	Some day I'll wish up -- on a star and wake up where the clouds are far be -- hind me. __
	Where trou -- bles melt like le -- mon drops a -- way a -- bove the chim -- ney tops that's where you'll find me

	%% part "A"
	Some -- where O -- ver The Rain -- bow, blue -- birds fly.
	Birds fly o -- ver the rain -- bow, why then, oh why can't I?
}
% endif

% if part=='LyricsmoreWikifonia':
\lyricmode {

	%% part "A"
	Some -- where O -- ver The Rain -- bow, skies are blue,
	and the dreams that you dare to dream real -- ly do come
}
% endif
