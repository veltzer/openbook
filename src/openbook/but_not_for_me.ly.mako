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

	attributes['title']='But Not For Me'
	attributes['style']='Jazz'
	# this is from the real book
	attributes['composer']='George Gershwin'
	# this is from the internet
	attributes['poet']='Ira Gershwin'
	# this is from the me (although I like it faster)
	attributes['piece']='Moderately'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='c05b953a-3034-11e5-b197-3860779cb560'
	attributes['structure']='ABAC'
	attributes['structureremark']='This is almost an A tune since the B and C in the ABAC interpretation are almost the same'

	attributes['location']='rbk2:50'

	attributes['idyoutuberemark1']='A great version by Miles Davis and Sonny Rollins'
	attributes['idyoutube1']='r98HGV9M7SY'
	attributes['idyoutuberemark2']='A classic version of Ella Fitzgerald'
	attributes['idyoutube2']='FnfUN6bBAg4'
	attributes['lyricsurl']='http://www.azlyrics.com/lyrics/ellafitzgerald/butnotforme.html'
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the this tunes structure.
	- filled in the meta data for this tune from the real book.
	- added the real book epdf.
	- add a lyrics url.
	- added youtube performances and their documentation.
	- added the real book chords.
	- added the real book tune.
	- added the real book lyrics.
	- check the real book chords.
	- check the real book tune.
	- check the real book lyrics.
	- heard the real book version to make sure it sounds ok.
	TODO:
	- bring in another version of this tune.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 2. s2. |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		g1:7 | g2:m7 c:7 | f1:maj7 | d:m7 | \myEndLine
		g:7 | g2:m7 c:7 | f1:maj7 | c2:m7 f:7 | \myEndLine
		\endPart
	} \alternative {
		{

			\myMark "B"
			\startPart
			bes1:maj7 | bes2:m7 ees:7 | f1*2:maj7 | \myEndLine
			d1:m7 | g:7 | g:m7 | c:7 | \myEndLineVolta
			\endPart
		}
		{

			\myMark "C"
			\startPart
			bes1:maj7 | bes2:m7 ees:7 | f1:maj7 | d:m7 | \myEndLine
			g:m7 | c:7 | f1*2:maj7 | \myEndLineVolta
			\endPart
		}
	}

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Moderato" 4 = 116
	\time 4/4
	\key f \major

	\partial 2. g'4 a g |

	\repeat volta 2 {

		%% part "A"
		a2 g4 f~ | f g a g | a1 | r4 g a g |
		a2 g4 f~ | f g a g | a1 | r4 a bes c |
	} \alternative {
		{

			%% part "B"
			cis2 d4 f | r g, a bes | b!2 c4 f | r f, g a |
			a2 bes4 f' | r f d bes | g1 | r4 g a g |
		}
		{

			%% part "C"
			cis2 d4 f | r g, a bes | b!2 c4 g' | r f d bes |
			a1 | g | f~ | f2. r4 |
		}
	}
}
% endif

% if part=='LyricsReal':
\lyricmode {

	%% part "A"
	They're wri -- ting songs of love, __
	But not for me
	A luc -- ky stars a -- bove, __
	But not for me!

	%% part "B"
	With love to lead the way,
	I've found more clouds of gray
	Than a -- ny Rus -- sian play
	Could gua -- ran -- tee

	I was a

	%% part "C"
	can't dis -- miss
	the me -- mory of his kiss,
	I guess he's not for me __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	_ _ _ fool to fall, __
	And get that way
	Hi- -- Ho a -- las
	and al -- __ so lack a day

	Al -- though I
}
% endif
