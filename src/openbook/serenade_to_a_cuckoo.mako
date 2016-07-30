<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	attributes['title']='Serenade To A Cuckoo'
	attributes['style']='Jazz'
	# from the real book
	attributes['composer']='Roland Kirk'
	# from the real book
	attributes['piece']='Med'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='7f78edea-47a9-11e2-8d61-0f0bb7c14483'
	attributes['structure']='AB'
	attributes['location']='rbk1:377'

	attributes['idyoutuberemark1']='Jethro Tull doing it ?!?'
	attributes['idyoutube1']='Zh4GZJlQCfY'
	attributes['idyoutuberemark2']='Another one from Jethro'
	attributes['idyoutube2']='wHw4N_lZl10'
	attributes['idyoutuberemark3']='The original Roland Kirk!'
	attributes['idyoutube3']='_q8Ye58uL5o'
%>
% endif

% if part=='Doc':
	DONE:
	- put in the meta data from the real book.
	- filled in the tunes structure.
	- put in the chords (real book).
	- put in the tune (real book).
	- checked that the tune sounds well.
	- checked the chords from the real book.
	- checked the tune from the real book.
	- added the epdf from the real book.
	- added youtube performances.
	TODO:
	- add this tune from other sources.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		f2:m f:m/ees | f:m/des f:m/c | f2:m f:m/ees | f:m/des f:m/c | \myEndLine
		f2:m f:m/ees | f:m/des f:m/c | f2:m f:m/ees | f:m/des f:m/c | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		bes:m7 ees:7 | aes:maj7 des:maj7 | g:m7.5- c:7 | f:m f:7 | \myEndLine
		bes:m7 ees:7 | aes:maj7 des:maj7 | g:m7.5- c:7 | f1:m | \myEndLine
		\endPart
	}

	\myMark "Ending"
	\startPart
	g2:m7.5- c:7 | f1:m | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \minor

	\repeat volta 2 {

		%% part "A"
		r8 c'4 f,8 c'4. f,8 | c' c bes bes aes f4 ees8 | f4 f8 f aes aes4 c8~ | c1 |
		r8 c4 f,8 c'4. f,8 | c' c bes bes aes f4 ees8 | f4 f8 f aes f ees f~ | f1 |

		%% part "B"
		r8 f'4-^ r8 bes,2 | r8 ees4-^ r8 aes,2 | r8 des4-^ r8 g,2 | g8 aes bes c~ c2 |
		r8 f4-^ r8 bes,2 | r8 ees4-^ r8 aes,2 | r8 des4-^ r8 g,2 | g8 aes g f~ f2 |
	}

	%% part "Ending"
	c'8 c c ees-^ r des4.-> | c4-> r r2 |
}
% endif
