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

	attributes['title']='Isn\'t It Romantic'
	attributes['style']='Jazz'
	# from the Hal Leonard book
	attributes['subtitle']='From the Paramount Picture \'Love Me Tonight\''
	# from the Hal Leonard book
	attributes['composer']='Richard Rodgers'
	# from the Hal Leonard book
	attributes['poet']='Lorenz Hart'
	# from the Hal Leonard book
	attributes['piece']='Easy Swing'
	# from the Hal Leonard book
	attributes['copyright']='1932 (Renewed 1959) by Famous Music Corporation'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='dedcc73c-1ead-11e1-8007-0019d11e5a41'
	attributes['structure']='ABAC'
	attributes['location']='rbk1:238,hlrjb:181'

	attributes['idyoutuberemark1']='Cool Jazz by Chet Baker...'
	attributes['idyoutube1']='c8C6i3kpsQU'
	attributes['idyoutuberemark2']='Swinging Bill Evans...'
	attributes['idyoutube2']='10ZYoSryrcI'
	attributes['lyricsurl']='http://www.stlyrics.com/lyrics/onefineday/isntitromantic.htm'
%>
% endif

% if part=='Doc':
	DONE:
	- added the real book epdf.
	- added the Hal Leonard epdf.
	- filled in the meta data from the Hal Leonard book.
	- filled in the meta data from the real book.
	- filled in the tunes structure.
	- put in the real book chords.
	- put in the real book lyrics.
	- put in the real book notes.
	- check in the real book chords.
	- check in the real book notes.
	- check in the real book lyrics.
	- heard the real book version and make sure it sounds right.
	- added youtube performances.
	- added a lyrics url.
	TODO:
	- add the Hal Leonard version of this tune (epdf is already here).
	REMARK:
	- this tunes structure could also be interpreted as 'AB' where A is AB and B is AC in the ABAC interpretation.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong
	\partial 2 \OPC bes2:7 |
	\repeat volta 2 {

		\myMark "A"
		\startPart
		ees:6 c:m7 | f:m7 bes:7 | ees:maj7 e:dim7 | f:m7 bes:7 | \myEndLine
		ees:6/g c:7 | f:m7 bes:7 | ees1:maj7 | bes2:m7 ees:7 | \myEndLine
		\endPart
	} \alternative {
		{

			\myMark "B"
			\startPart
			aes1:maj7 | bes2:7 g:7 | c:m g:7/b | bes:m7 ees:7 | \myEndLine
			aes:maj7 c:7/g | f:m d4:m7.5- g:7 | c2:m f:7.9 | bes:7.3-.5-.9-.11-.13- bes:7 | \myEndLineVolta
			\endPart
		}
		{

			\myMark "C"
			\startPart
			f2:m f:m/ees | d:m7.5- g:7 | c:m c:m/bes | c:m/a aes:6 | \myEndLine
			g:m7 ges:7 | f:m7 bes:7 | ees aes:6 | ees \OPC bes:7 | \myEndLineVolta
			\endPart
		}
	}
	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Andante" 4 = 108
	\time 4/4
	\key ees \major

	\partial 2 d8 ees c d |

	\repeat volta 2 {

		%% part "A"
		ees4 ees2. | d8 ees c d ees4 f | g4. g8 bes4. bes8 | g2 d8 ees c d |
		ees4 ees2. | d8 ees c d ees4 f | g4. g8 bes4. bes8 | des1 |
	} \alternative {
		{

			%% part "B"
			c | d8 c bes aes g4 f | ees4. ees8 g4. g8 | ees1 |
			c' | d8 c bes aes g4 f | ees4. ees8 c'4. c8 | des,2 d8 ees c d |
		}
		{

			%% part "C"
			c'1 | d8 c bes aes g4 f | ees4. ees8 g4. g8 | c4. c8 ees4. ees8 |
			f4 ees bes2~ | bes d8 ees c d | ees1~ | ees2 \mark \markup { \italic { Fine } } <\parenthesize d,>8 <\parenthesize ees> <\parenthesize c> <\parenthesize d> |
		}
	}
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the Hal Leonard book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

	%% part "A"
	Is -- n't It Ro -- man -- tic? Mu -- sic in the night, a dream that can be heard.
	Is -- n't It Ro -- man -- tic? Mov -- ing shad -- ows write the old -- est mag -- ic word.

	%% part "B"
	I hear the breez -- es play -- ing in the trees a -- bove.
	While all the world is say -- ing you were meant for love.

	%% part "Forward"
	Is -- n't It Ro --

	%% part "C"
	Sweet sym -- bols in the moon -- light
	Do you mean that I will fall in love per -- chance? __ Is -- n't it ro -- mance? __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	Is -- n't It Ro -- man -- tic? Mere -- ly to be young on such a night as this?
	Is -- n't It Ro -- man -- tic? Ev -- 'ry note that's sung is like a lov -- er's kiss.
}
% endif
