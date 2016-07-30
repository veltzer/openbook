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

	attributes['title']='Alone Together'
	attributes['style']='Jazz'
	# this is from the internet
	attributes['composer']='Arthur Schwartz'
	# this is from the internet
	attributes['poet']='Howard Dietz'
	# this is from the real book
	attributes['piece']='Ballad'
	attributes['copyright']='1932 (Renewed) Warner Bros. Inc.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='b647880a-0b68-11e1-b491-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['structureremark']='this tunes structure can also be categorised as ABAC since the first 8 bars of both the first and second part are the same.'
	attributes['location']='rbk1:19'

	attributes['idyoutuberemark1']='The great trumpet version of Chet Baker'
	attributes['idyoutube1']='zdDhinO58ss'
	attributes['idyoutuberemark2']='Dexter in a soprano sax version'
	attributes['idyoutube2']='mmu6kgQtl-k'
	attributes['lyricsurl']='http://www.hotlyrics.net/lyrics/E/Ella_Fitzgerald/Alone_Together.html'
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- filled in meta data from somewhere.
	- filled in the tunes structure.
	- put in the real book chords.
	- put in the real book tune.
	- put in the real book lyrics.
	- checked the real book chords.
	- checked the real book tune.
	- checked the real book lyrics.
	- played the real book version to hear that it sounds well.
	- put in a lyrics url.
	- put in you tube performances with documentation.
	TODO:
	- put in another version of this tune.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		d1:m | e2:m7.5- a:7.9- | d1:m | e2:m7.5- a:7.9- | \myEndLine
		d1:m | a2:m7.5- d:7.9- | g1:m | g:m7 | \myEndLine
		b2:m7 e:7 | g:m7 c:7 | f f:7 | e:m7.5- a:7 | \myEndLine
	} \alternative {
		{
			d1:maj7 | e2:m7.5- a:7 | \myEndLineVoltaNotLast
		}
		{
			d1*2:maj7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	a1:m7.5- | d:7.9- | g1*2:m | \myEndLine
	g1:m7.5- | c:7.9- | f2 f:7 | e:m7.5- a:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	d1:m | e2:m7.5- a:7.9- | d1:m | e2:m7.5- a:7.9- | \myEndLine
	d1:m | bes2:7 a:7 | d1:m | \LPC e2:m7.5- \RPC a:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key d \minor

	\partial 8 d8 |

	%% part "A"
	\repeat volta 2 {
		f2.. d8 | e e4.~ e2~ | e4 r8 d e4. f8 | a1~ |
		a4 r8 d, e4. f8 | a1~ | a4 r8 g a4. bes8 | d2.. d8 |
		e2.. d8 | c c4.~ c bes8 | a4. g8 a4. g8 | a2.. g8 |
	} \alternative {
		{ fis fis4.~ fis2~ | fis2. r8 d | }
		{ fis fis4.~ fis2~ | fis2. d4 | }
	}

	%% part "B"
	c'1~ | \tuplet 3/2 { c4 a bes } \tuplet 3/2 { c ees d } | bes1~ | bes2. d,4 |
	bes'1~ | \tuplet 3/2 { bes4 g a } \tuplet 3/2 { bes des c } | a2.. f8 | g2.. d8 |

	%% part "A"
	f2.. d8 | e e4.~ e2~ | e4 r8 d e4. f8 | a1~ |
	a4 r8 a b4. d8 | f2.. cis8 | d d4.~ d2~ | d2 r4 r8 <\parenthesize d,>8 |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

	%% part "A"
	A -- lone To -- geth -- er; __
	be -- yond the crowd. __
	a -- bove the world, __
	we're not too proud
	to cling to -- geth -- er. __
	Were strong
	As long as we're to -- geth -- er __

	A
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	A -- lone To -- geth -- er; __
	the blind -- ing rain __
	The star -- less night, __
	we're not in vain;
	For we're to -- geth -- er, and what is there
	to fear to -- _ _ _ geth -- er. __

	%% part "B"
	Our love __ is as deep as the sea, __
	Our love __ is as great as a love can be,

	%% part "A"
	And we can wea -- ther __
	the great un -- known, __
	If we're A -- lone To -- geth -- er. __

	A
}
% endif
