<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	# from the real book
	attributes['title']='Epistrophy'
	attributes['style']='Jazz'
	# this is from the real book
	attributes['composer']='Thelonius Monk'
	# this is from the real book
	attributes['piece']='Bop'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='736a8ed2-ea4b-11e3-8549-ff0ac7b12d0d'
	attributes['structure']='ABCB'
	attributes['location']='rbk1:138'

	attributes['idyoutuberemark1']='Monk live!'
	attributes['idyoutube1']='dZ9El7k4mNo'
	attributes['idyoutuberemark2']='Monk and Coltrane'
	attributes['idyoutube2']='K_h1geOaLvY'
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- filled in meta data from the real book.
	- filled in the tunes structure.
	- put in the real book chords.
	- put in the real book tune.
	- checked the real book chords.
	- checked the real book tune.
	- played the real book version to hear that it sounds well.
	- put in you tube performances.
	TODO:
	- how do I do the reapeat marks for chords?
		https://lists.gnu.org/archive/html/lilypond-user/2009-03/msg00605.html
	- bring another version of this tune.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	cis2:7 d:7 | cis:7 d:7 | cis:7 d:7 | cis:7 d:7 | \myEndLine
	dis:7 e:7 | dis:7 e:7 | dis:7 e:7 | dis:7 e:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	dis:7 e:7 | dis:7 e:7 | dis:7 e:7 | dis:7 e:7 | \myEndLine
	cis:7 d:7 | cis:7 d:7 | cis:7 d:7 | cis:7 d:7 | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	fis1*4:m | \myEndLine
	b1*2:7 | des1:7 | d:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	dis2:7 e:7 | dis:7 e:7 | dis:7 e:7 | dis:7 e:7 | \myEndLine
	cis:7 d:7 | cis:7 d:7 | cis:7 d:7 | \mark \markup { \musicglyph #"scripts.coda" } cis:7 d:7 | \myEndLine
	\endPart

	%%\myMark "Coda"
	\mark \markup { \musicglyph #"scripts.coda" }
	\startPart
	cis:7 d:7 | ges1:7.11+ | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

	%% part "A"
	r4 cis8 d ais' b4. | cis,8 d ais' b~ b4 r | r cis,8 d bes' e,4. | cis8 d bes' e,~ e4 r |
	r4 dis8 e c' cis4. | dis,8 e c'! cis~ cis4 r | r dis,8 e c'! fis,!4. | dis8 e c' fis,~ fis4 r |

	%% part "B"
	r4 dis8 e c' cis4. | dis,8 e c'! cis~ cis4 r | r dis,8 e c'! fis,!4. | dis8 e c' fis,~ fis4 r |
	r4 cis8 d ais' b4. | cis,8 d ais' b~ b4 r | r cis,8 d bes' e,4. | cis8 d bes' e,~ e4 r |

	%% part "C"
	fis,4-> fis-> cis'8 dis fis gis | a4 gis8 a fis4 dis | fis,-> fis-> cis'8 dis fis a | r a4 gis8 fis4 dis |
	b-> b-> cis8 dis fis gis | b4 a8 b a4 fis | f!8 aes ces ees~ ees ces4. | fis,8 a c! e~ e c4. |

	%% part "B"
	r4 dis,8 e c' cis4. | dis,8 e c'! cis~ cis4 r | r dis,8 e c'! fis,!4. | dis8 e c' fis,~ fis4 r |
	r4 cis8 d ais' b4. | cis,8 d ais' b~ b4 r | r cis,8 d bes' e,4. | cis8 d bes' e,~ e4 r |

	%% part "Coda"
	cis8 d ais' b~ b4 a!8 c~ | c1\fermata |
}
% endif
