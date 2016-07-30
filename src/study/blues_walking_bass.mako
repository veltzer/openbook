<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	attributes.addVersion('My', version)
	attributes.setDefaultVersionName('My')

	attributes['title']='Jazz Bass line for Blues in F'
	attributes['style']='Jazz'
	attributes['piece']='Upbeat Jazz Blues'
	attributes['copyright']=gattr['copyrightvalstudy']

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='84a886b8-a26f-11df-9034-0019d11e5a41'
	attributes['remark']='Taken from Ofer Portugali\'s exercises at Rimon'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f1:7 | bes1:7 | f1:7 | c2:m7 f2:7 | \myEndLine
	bes1:7 | bes1:7 | f1:7 | d1:7 | \myEndLine
	g1:7 | c1:7 | f2:7 d2:7 | g2:7 c2:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	f1:7 | bes1:7 | f1:7 | c2:m7 f2:7 | \myEndLine
	bes1:7 | bes1:7 | f1:7 | a2:m7 d2:7 | \myEndLine
	g1:m7 | c1:7 | f2:7 d2:7 | g2:m7 c2:7 | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	f1:7 | bes1:7 | c1:m7 | f1:7 | \myEndLine
	bes1:7 | bes1:7 | f1:7 | d1:7 | \myEndLine
	g2:7 g:m7 | c1:7 | f2:7 d2:7 | g2:7 c2:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceMy':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

	\clef bass

	%% A part
	f,,4 a c b | bes d, dis e | f a d des | c e, f a |
	bes f' d c | bes b c e | f a, c cis | d fis, a aes |
	g a ais b | c cis d e | f a, d fis, | g b c e |

	%% B part
	f f ees ees | d d des des | c d g, c | f, fis g a |
	bes b c b8 f-> | bes f aes4 g ges | f c' b bes | a ees' d8 a fis4 |
	g bes d des | c bes a g | f ees' d aes | g des' c bes |

	%% C part
	a c f ees | d ees d des | c d ees g, | c bes a f' |
	bes, f c' f | bes,8 f'-> b,4 c bes | a bes a g | fis a d8 a fis4 |
	g8 g-> a4 bes b | c d dis e8 f-> | r a,4.-> d4 c | b g c8 e,4.-> |
}
% endif
