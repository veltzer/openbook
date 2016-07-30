<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	attributes['title']='Could It Be You'
	attributes['style']='Jazz'
	# this is from the real book
	attributes['composer']='Cole Porter'
	# this is from the real book
	attributes['piece']='Ballad'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='952831ac-74cc-11e5-b102-3860779cb560'
	attributes['structure']='ABAC'
	attributes['location']='rbk1:96'

	attributes['idyoutuberemark1']='Classic Jazz Balad feel'
	attributes['idyoutube1']='c6ohlv16V-g'
	attributes['idyoutuberemark2']='A cafe performance'
	attributes['idyoutube2']='fDxb7zdkewA'
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the real book.
	- added the tunes structure.
	- added the meta data from the real book.
	- put in the real book chords.
	- put in the real book melody.
	- check the real book chords.
	- check the real book melody.
	- check that the tune sounds right.
	- put in youtube performances.
	TODO:
	- add another version of this tune from somewhere.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		bes1:maj7 | c2:m7 f:7 | bes1:maj7 | g4:m7 ges:m7 f:m7 bes:7 | \myEndLine
		ees1:maj7 | f2:m7 bes:7 | ees1:maj7 | g2:m7 c:7 | \myEndLine
		\endPart
	} \alternative {
		{

			\myMark "B"
			\startPart
			f1:maj7 | a:7.9- | d2:m7 g:7 | a:m7.5- d:7.9- | \myEndLine
			g:m g:m7 | c1:7 | f:7 | c2:9 c4:m7 f:7 | \myEndLineVoltaLast
			\endPart
		}
		{

			\myMark "C"
			\startPart
			bes1:maj7 | d:7 | ees2:maj7 c4:7 g:7 | ees2:m7 aes:7 | \myEndLine
			bes1:maj7 | c2:9 c4:m7 f:7 | bes1:6 | \LPC c2:m7 \RPC f:7 | \myEndLineVoltaLast
			\endPart
		}
	}

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 168
	\time 4/4
	\key bes \major

	\repeat volta 2 {

		%% part "A"
		r4 d f d | g1 | r4 d f d | g4 ges8 f~ f2 |
		r4 g! bes g | c1 | r4 g bes g | c4 ces8 bes~ bes2 |
	} \alternative {
		{

			%% part "B"
			r4 a c!4. a8 | g fis g bes~ bes4. g8 | f! e! f a~ a f e4 | ees!2. r4 |
			r d8 d~ d cis d4 | a'2 g | r4 f8 f~ f e! f4 | d'2 c |
		}
		{

			%% part "C"
			r4 bes d4. bes8 | a gis a c~ c4. a8 | g! fis g bes~ bes f! g4 | ees1 |
			r4 f g d' | d2 c8 bes c4 | bes1_\markup { \italic { Fine } } | r |
		}
	}
}
% endif
