<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	attributes.addVersion('Aebersold', version)
	attributes.setDefaultVersionName('Aebersold')

	attributes['title']='Watermelon Man'
	attributes['style']='Jazz'
	attributes['composer']='Herbie Hancock'
	attributes['piece']='16-Bar Blues'
	attributes['copyright']='1962, 1963 & 1965 By Hancock Music Co., New York, NY'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='359f7428-a26f-11df-ad8c-0019d11e5a41'
	attributes['structure']='16 bar Blues'
	attributes['location']='rbk3:334'

	attributes['idyoutube1']='4z8Rt4nvd-I'
%>
% endif

% if part=='Doc':
	DONE:
	- added 'structure' field to the meta data.
	TODO:
	- bring in the aebersold pdf this tune is based on as it is not in the epdf folder.
	- document what has been done.
	- document the youtube performance.
	- add the piano accompaniment for this song (rythm pattern with some notes - ripp
	it off the album).
	- do the real book III version of this tune too (it is already in the epdf).
% endif

% if part=='ChordsAebersold':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f1*4:7 | \myEndLine
	bes1*2:7 | f:7 | \myEndLine
	c1:7 | bes:7 | c:7 | bes:7 | \myEndLine
	c:7 | bes:7 | f1*2:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceAebersold':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

	%% part "A"
	ees'1\p\<~ | ees4\! f,8 f <aes c> ( <bes d>4-. ) f8~ | f1~ | f2 r |
	f'1\p\<~ | f4\! f,8 f <aes c> ( <bes d>4-. ) f8~ | f1~ | f2 r |
	r4 c'8 ( c g'4 a | aes8 g f d f4 g-. ) |
	r c,8 ( c g'4 a | aes8 g f d c4 d-. ) |
	r c8 ( c g'4 aes | \mark \markup { \italic { break } } f-. ) f,8 f <aes c> ( <bes d>4-. ) f8~ | f1 | r |
}
% endif
