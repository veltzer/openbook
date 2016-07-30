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

	attributes['title']='Come Rain Or Come Shine'
	attributes['style']='Jazz'
	attributes['composer']='Harold Arlen'
	attributes['poet']='Johnny Mercer'
	attributes['piece']='Moderately'
	attributes['copyright']='1946, by A-M Music Corp. Copyright Renewed, all rights controlled by Chappell & Co., Inc.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='b109cd80-a26e-11df-8c11-0019d11e5a41'
	attributes['structure']='AB'
	attributes['location']='rbk2:63,jfb:86-87'
	attributes['remark']='the my set of chords is from Amit Golan'

	attributes['idyoutube1']='XqECFy_qzkM'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- mark whats been done with this tune...
	- do the __ at the end of sentences thing.
	- add a youtube performance.
	- document the current you tube performance.
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f1:maj7 | e2:m7.5- a2:7.9- | d1:m6 | d1:m6 | \myEndLine
	g1:7.9 | g2:m7 c2:7 | f1:maj7 | c2:m7 f2:7 | \myEndLine

	bes1:m6 | f1:m6 | bes2:m7 bes2:m7/aes | g2:m7 c2:7.5+ | \myEndLine
	d2:m7.5- g2:7.9- | c2:m7 c2:m7/bes | a2:m7.5- d2:7.9- | g2:m7 c2:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	f1:maj7 | e2:m7.5- a2:7.9- | d1:m6 | d1:m6 | \myEndLine
	b1:m7.5- | e:7 | a1:7 | bes2:7 a2:7 | \myEndLine

	d2:7 ees2:maj7 | d1:7 | g2:7 aes2:7.9 | g2.:7.9 a4:7 | \myEndLine
	d2:m6 b2:m7.5- | e2:m7.5- a2:7.9- | d1:m6 | g2:m7 c2:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f2:maj7 b:m7.5- | e:m7.5- a:7.9- | d1:m7 | g:7.9 | \myEndLine
	g1:7.9 | g2:m7 c:7 | f1:7 | c2:m7 f:7 | \myEndLine
	bes1:m7 | f:m | bes2:m g:m7.5- | c:7.5- c4:7.5 c:7.5+ | \myEndLine
	d2:m7.5- g:7.9- | c1:m | c4:m7 f:7 bes:m7 ees:m7 | a2:m7 g4:m7 c:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	f2:maj7 b:m7.5- | e:m7.5- a:7.9- | d1:m7 | g:7.9 | \myEndLine
	cis:m7.5- | fis2:m7 b:7 | a1:7 | bes2:7 a:7 | \myEndLine
	d2:7 ees:maj7 | d1:7 | g2:7 aes:7.9 | g2.:7.9 a4:7 | \myEndLine
	d2:m7 g4:7 g:7/f | e2:m7.5- a:7.9- | d1:m7 | g2:m7 c:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Moderato" 4 = 100
	\time 4/4
	\key f \major

	%% part "A"
	a'4 a8 a a a4 a8 | a4 a8 a a a4 a8 | a f f f~ f2~ | f1 |
	a4 a8 a a a4 a8 | c4 a8 a a a4 a8 | a f f f~ f2~ | f1 |
	bes2 bes4 aes8 bes | c4 f,2 f8 f | bes2 bes4 aes8 bes | c1 |
	d2 d4 c8 d | ees4 c2 c8 d | ees c d4 c bes8 g | a4 g2. |

	%% part "B"
	a4 a8 a a a4 a8 | a4 a8 a a a4 a8 | a f f f~ f2~ | f1 |
	b4 b8 b b b4 b8 | b4 b8 b b b4 b8 | cis a a a~ a2~ | a1 |
	d4 d8 d d d4 d8 | d4 d,2 d4 | d' d8 d d d4 d8 | d4 d,2 e4 |
	a a8 bes b d4. | e4 e8 d e d e4 | d1~ | d2 r |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	I'm gon -- na love you like no -- bod -- y's loved you,
	Come Rain Or Come Shine.
	High as a moun -- tain and deep as a riv -- er,
	Come Rain Or Come Shine.

	I guess when you met me
	It was just one of those things.
	But don't ev -- er bet me,
	'Cause I'm gon -- na be true if you let me.

	%% part "B"
	You're gon -- na love me like no -- bod -- y's loved me,
	Come Rain Or Come Shine.
	Hap -- py to -- geth -- er, un -- hap -- py to -- geth -- er
	And won't it be fine.

	Days may be cloud -- y or sun -- ny,
	We're in or we're out of the mon -- ey.
	But I'm with you al -- ways,
	I'm with you rain _ or shine!
}
% endif
