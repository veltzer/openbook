<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	attributes['title']='Gloria\'s Step'
	attributes['style']='Jazz'
	attributes['composer']='Scott LaFaro'
	attributes['piece']='Swing'
	attributes['copyright']='1962, Orpheum Music.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='892e5552-f2ad-11e0-8c10-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='rbk1:172,nrbk1:118'

	attributes['idyoutuberemark1']='Bill Evans, not the orignal Sunday at the Village version...'
	attributes['idyoutube1']='C84KmJwtPeI'
	attributes['idyoutuberemark2']='the original Sunday at the Village version (take 2)...'
	attributes['idyoutube2']='Aib_RL_x7PA'
%>
% endif

% if part=='Doc':
	DONE:
	- added the chords.
	- added the notes.
	- added youtube performances.
	- added the tunes structure.
	- checked the speed of the tune.
	- added epdfs for real book and new real book.
	- filled in the copyright
	TODO:
	- do the rythm markings on the second bar of the real book version.
	- enter the new real book version.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f1:maj7 | ees2:maj7 d:maj | des1:maj7 | c:7.9+ | f:m7 | \myEndLine
	}
	%% this is remarked ON PURPOSE to keep the repetition sign in the chart...
	%%\endPart

	\myMark "B"
	\startPart
	e1:m7 | f:maj1 | a:m7.5- | e:m7.5- | g:m7.5- |
	d:m7.5- | g:7.9+ | c:7.9+ | ees1*2:7.9+ | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1:maj7 | ees2:maj7 d:maj | des1:maj7 | c:7.9+ | f:m7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 160
	\time 4/4
	\key c \major

	%% part "A"
	\repeat volta 2 {
		r8 g'4 c8 \tuplet 3/2 { b c a } \tuplet 3/2 { r a e } | g1 | r8 f g f~ f ees c ees~ | ees2 r8 c bes c~ | c1 |
	}

	%% part "B"
	g'4 a8 b~ b2 | r8 a4. b4 c8 d~ | d2 r8 c g bes~ | bes2. a4 | c2 r8 bes f aes~ |
	aes2. g4 | bes2 r8 aes16 bes aes8 des, | ees'2 r8 des16 ees des8 aes | ges'1~ | ges |

	%% part "A"
	r8 g,4 c8 \tuplet 3/2 { b c a } \tuplet 3/2 { r a e } | g1 | r8 f g f~ f ees c ees~ | ees2 r8 c bes c~ | c1 |
}
% endif
