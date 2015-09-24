<%page args='part'/>
% if part=='Vars':
<%
	# vim: set filetype=lilypond :
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']='Have you met Miss Jones?'
	attributes['style']='Jazz'
	attributes['composer']='Richard Rodgers'
	attributes['poet']='Lorenz Hart'
	# this is from the real book
	#attributes['piece']='Med.'
	# this is from the fake book
	attributes['piece']='Medum Swing'
	attributes['copyright']='1937, by Chappell & Co., Inc. Copyright Renewed'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='fe106f6c-a26e-11df-abb3-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='rbk1:186,jfb:143'

	attributes['idyoutuberemark1']='Frank!'
	attributes['idyoutube1']='wZIVgszUs7c'
	attributes['idyoutuberemark2']='Art Tatum on piano solo'
	attributes['idyoutube2']='h3YNBVpxOcQ'
	attributes['lyricsurl']='http://www.lyrics007.com/Ella%20Fitzgerald%20Lyrics/Have%20You%20Met%20Miss%20Jones%20Lyrics.html'
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the structure for this tune.
	- added the real book epdf.
	- added the fake book epdf.
	- fill in the meta data for this tune.
	- put in the chords for the fake book version.
	- put in the tune for the fake book version.
	- put in the lyrics for the fake book version.
	- check the chords for the fake book version.
	- check the tune for the fake book version.
	- check the lyrics for the fake book version.
	- played the fake book tune to hear that it's ok and adjusted it's speed.
	- add you tube performances.
	- add a lyrics url.
	TODO:
	- add the real book version.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f1:maj7 | fis:dim7 | g:m7 | c:7 | \myEndLine
	a:m7 | d:m7 | g:m7 | c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f:maj7 | fis:dim7 | g:m7 | c:7 | \myEndLine
	a:m7 | d:m7 | c:m7 | f:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	bes:maj7 | aes2:m7 des:7 | ges1:maj7 | e2:m7 a:7 | \myEndLine
	d1:maj7 | aes2:m7 des:7 | ges1:maj7 | g2:m7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f1:maj7 | fis:dim7 | g:m7 | c2:7 bes:7 | \myEndLine
		a:m7 d:7.9- | g:m7 c:7 |
	} \alternative {
		{
			f d:m7 | g:m7 c:7 | \myEndLineVoltaNotLast
		}
		{
			f1*2 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 160
	\time 4/4
	\key f \major

	%% part "A"
	\repeat unfold 2 {
		a'4 d, c d | c2. r4 | d e f g | a bes c2 |
		d4 g, f g | f2. a4 |
	} \alternative {
		{ bes1~ | bes2. r4 |}
		{ c1~ | c4 d d d | }
	}

	%% part "B"
	c4 bes f g | aes aes aes aes | aes ges des ees | e! e e e |
	e d fis a | des2 des | bes1~ | bes2. r4 |

	%% part "A"
	\repeat volta 2 {
		a4 d, c d | c2. r4 | d e f g | a bes c d |
		e1~ | e4 d a g |
	} \alternative {
		{
			f1 | r |
		}
		{
			f1~ | f2. r4 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	"\"Have" You Met Miss "Jones?\"" Some one said as we shook hands.
	She was just Miss Jones to me. __

	%% part "A"
	Then I said "\"Miss" Jones, You're a girl who un -- der -- stands,
	I'm a man who must be "free.\"" __

	%% part "B"
	And all at once I lost my breath,
	and all at once was scared to death,
	and all at once I owned the earth and sky! __

	%% part "A"
	Now I've met Miss Jones, and we'll keep on meet -- ing till we die, __
	Miss Jones and I.

	I. __
}
% endif
