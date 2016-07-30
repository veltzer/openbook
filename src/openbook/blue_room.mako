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

	# from the reak book
	attributes['title']='Blue Room'
	attributes['style']='Jazz'
	# from the real book
	attributes['composer']='Richard Rodgers'
	# from the real book
	attributes['poet']='Lorenz Hart'
	# My own
	attributes['piece']='Jazz'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='f5edb3c8-9452-11e4-8279-3860779cb560'
	attributes['structure']='AABA'
	attributes['location']='rbk1:55'

	attributes['idyoutuberemark1']='Chet Baker in a slow sensitive version'
	attributes['idyoutube1']='DOBCOVEeX2A'
	attributes['idyoutuberemark2']='Benny Goodman big band classic'
	attributes['idyoutube2']='DRo129k55fg'
	attributes['lyricsurl']='http://www.lorenzhart.org/broom.htm'
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the real book.
	- added the meta data from the real book.
	- added the tunes structure.
	- put in the tunes structure
	- put in the chords (realbook).
	- put in the tune (realbook).
	- put in the lyrics (realbook).
	- checked the chords (realbook).
	- checked the tune (realbook).
	- checked the lyrics (realbook).
	- heard the tune to check that it is right and adjust the tempo.
	- added youtube performances.
	- added lyrics url.
	TODO:
	- add another version of this tune.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f2:6 d:m7 | g:m7 c:7 | f:maj7 d:m7 | g:m7 c:7 | \myEndLine
		f2.:maj7 f4:7 | bes2:maj7 g:m7 |
	} \alternative {
		{
			f:6 g:7 | g:m7 c:7 | \myEndLineVoltaNotLast
		}
		{
			f g4:m7 c:7 | f1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	c1*2:7 | f:maj7 | \myEndLine
	c1:7 | g2:m7 c:7 | d:m7 g:7 | g:m7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1:6 | c:7 | f2:maj7 d:m7 | g:m7 c:7 | \myEndLine
	f2.:maj7 f4:7 | bes2:maj7 g:m7 | f g4:m7 c:7 | f1 | \myEndLine
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
	\repeat volta 2 {
		c4 f2 d4 | c g'2 d4 | c a'2 d,4 | c bes'2 d,4 |
		c c' c c | c8 d bes2 g4 |
	} \alternative {
		{
			f f f8 g a4 | c,2. r4 |
		}
		{
			f f f8 g a g | f2. r4 |
		}
	}

	%% part "B"
	e f g a | bes c d e | r f f8 e d4 | c2 d |
	r4 e e8 d c4 | bes2 c | r4 a a8 g f4 | c2. r4 |

	%% part "A"
	c f2 d4 | c g'2 d4 | c a'2 d,4 | c bes'2 d,4 |
	c c' c c | c8 f bes,2 a8 g | f4 f f8 g a g | f1 |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the internet adjusted for the real book.
\lyricmode {

	%% part "A"
	We'll have a blue room,
	A new room,
	For two room,
	Where ev' -- ry day's a ho -- li -- day
	Be -- cause you're mar -- ried to me.

	_ _ _ _ _ _ _

	%% part "B"
	We will thrive on,
	Keep a -- live on,
	Just not -- hing but kis -- ses,
	With Mis -- ter and Mis -- sus
	On lit -- tle blue chairs.

	%% part "A"
	You sew your trous -- seau,
	And Ro -- bin -- son Cru -- soe
	Is not so far from world -- ly cares
	As our blue room far a -- way up -- stairs.
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	Not like a ball -- room,
	A small room,
	A hall room,
	Where I can smoke my pipe a -- way
	With _ _ _ _ _ _ your wee head u -- pon my knee.
}
% endif
