<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	attributes['title']='Misty'
	attributes['style']='Jazz'
	# this is from the fake book
	attributes['composer']='Errol Garner'
	# this is from the fake book
	attributes['poet']='Johnny Burke'
	# this is from the fake book
	#attributes['piece']='Slowly, with a smooth swing'
	# this is from the real book
	attributes['piece']='Ballad'
	# this is from the fake book
	attributes['copyright']='1955. Renewed 1983 Marke Music, Limerick Music, Reganesque'
	attributes['copyrightextra']='Music and Time-Co Music'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='bb21d126-f210-11e0-9b64-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='rbk1:296,jfb:252'

	attributes['idyoutuberemark1']='great version by Ella Fitzgerald'
	attributes['idyoutube1']='mQouJdvB80U'
	attributes['idyoutuberemark2']='Garner himself! what an amazing piano...'
	attributes['idyoutube2']='nAaZzQWk8V4'
	attributes['lyricsurl']='http://www.lyrics007.com/Ella%20Fitzgerald%20Lyrics/Misty%20Lyrics.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added real book epdf.
	- added fake book epdf.
	- added the real book chords.
	- added the real book tune.
	- added the real book lyrics.
	- checked the real book chords.
	- checked the real book tune.
	- checked the real book lyrics.
	- heard it to see if it's ok.
	- adjusted speed for the tune.
	- added youtube performances.
	- added lyrics url.
	TODO:
	- add the fake book version (the epdf is already there).
	- how do I put the last two chord in the real book version in braces (they are part of the turn around)...
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		ees1:maj7 | bes2:m7 ees:7 | aes1:maj7 | aes2:m7 des:7 | \myEndLine
		ees:maj7 c:m7 | f:m7 bes:7 |
	} \alternative {
		{
			g:m7 c:7 | f:m7 bes:7 | \myEndLineVoltaNotLast
		}
		{
			ees1*2:6 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	bes1:m7 | ees:7.9- | aes1*2:maj7 | \myEndLine
	a1:m7 | d2:7 f:7 | g2:m7.5- c:7.9- | f:m7 bes:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees1:maj7 | bes2:m7 ees:7 | aes1:maj7 | aes2:m7 des:7 | \myEndLine
	ees:maj7 c:m7 | f:m7 bes:7 | ees1:6 | f2:m7 bes:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Andante" 4 = 88
	\time 4/4
	\key ees \major

	\partial 4 bes'8 g |

	%% part "A"
	\repeat volta 2 {
		d2. bes8 c | des c' c c c bes g ees | c2 \tuplet 3/2 { r8 g aes c ees g } | bes bes bes aes bes4 aes8 bes |
		g4~ \tuplet 3/2 { g8 aes bes } ees,4~ \tuplet 3/2 { ees8 f g } | aes8 c,4 c8 \tuplet 3/2 { d4 ees f } |
	} \alternative {
		{ g1~ | g2. bes8 g | }
		{ ees1 | \tuplet 3/2 { r4 ees f } \tuplet 3/2 { g bes c } | }
	}

	%% part "B"
	des8 des des des~ des2~ | des4 des8 ees \tuplet 3/2 { fes4 ees des } | c8 c c c~ c2 | \tuplet 3/2 { r4 ees, f aes bes c } |
	d8 d d c d2~ | d8 d d c \tuplet 3/2 { f4 d c } | bes1~ | bes2. bes8 g |

	%% part "A"
	d2. bes8 c | des c' c c c bes g ees | c2 \tuplet 3/2 { r8 g aes c ees g } | bes bes bes aes bes4 aes8 bes |
	g4~ \tuplet 3/2 { g8 aes bes } ees,4~ \tuplet 3/2 { ees8 f g } | aes8 c,4 c8 \tuplet 3/2 { d4 ees f } | ees1 | r |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
	Look at me,
	I'm as help -- les as a kit -- ten up a tree
	and I feel like I'm cling -- ing to a cloud,
	I ca -- n't __ un -- der -- stand, __
	I get Mist -- y just hold -- ing your hand. __

	Walk my
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	Walk my way and a thou -- sand vi -- o -- lins be -- gin to play,
	or it might be the sound of your hel -- lo,
	th -- at mu -- sic I hear, __
	I get Mist -- y the mo -- ment you're _ _ _ near.

	You can say that you're lead -- ing me on, __
	but it's just what I want you to do. __
	Don't you no -- tice how hope -- less -- ly I'm lost, __
	that's why I'm fol -- low -- ing you. __

	On my own, would I wan -- der through this won -- der -- land a -- lone,
	nev -- er know -- ing my right foot from my left,
	my _ hat __ from my glove, __
	I'm too Mist -- y and too much in Love.
}
% endif
