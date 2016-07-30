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

	# from the fake book
	attributes['title']='Moonlight in Vermont'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Karl Suessdorf'
	# from the fake book
	attributes['poet']='John Blackburn'
	# from the fake book
	attributes['piece']='Freely'
	# from the fake book
	attributes['copyright']='1944-1945 by MICHAEL H GOLDSEN, INC.'
	# from the fake book
	attributes['copyrightextra']='Renewed 1972-1973 MICHAEL H GOLDSEN, INC.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='557b082e-e0d8-11e3-a037-b365e6166d43'
	attributes['structure']='AABA'
	attributes['location']='jfb:256'

	attributes['idyoutuberemark1']='Louis and Ella'
	attributes['idyoutube1']='Rg0hg5YD7sE'
	attributes['idyoutuberemark2']='Franks version'
	attributes['idyoutube2']='_CiizL8Vfu8'
	attributes['lyricsurl']='http://www.azlyrics.com/lyrics/franksinatra/moonlightinvermont.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the fake book.
	- put in the tunes structure
	- added the meta data from the fake book.
	- put in the chords (fakebook).
	- put in the lyrics (fakebook).
	- put in the tune (fakebook).
	- check the chords (fakebook).
	- check the tune (fakebook).
	- check the lyrics (fakebook).
	- heard the tune to check that it is right and adjust the tempo.
	- added lyrics url.
	- added youtube performances.
	TODO:
	- the 'aes:9.11+' chord appears as 7.11+ in the pdf. how do I fix this?
	- add another version of this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	ees2:6 c:m7 | f:m7 e:7.9+ | ees:6 c:m7 | des1:9 | f2:m7 bes:7.11 | ees f4:m7 bes:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees2:6 c:m7 | f:m7 e:7.9+ | ees:6 c:m7 | des1:9 | f2:m7 bes:7.11 | ees1 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	a2:m11 d:7 | g:maj7 gis:dim7 | a:m11 aes:9.11+ | g:maj7 g:6 | \myEndLine
	bes:m11 ees:7 | aes:maj7 a:dim7 | bes:m11 ees:9 | aes bes:7.5+.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees2:6 c:m7 | f:m7 e:7.9+ | ees:6 c:m7 | des1:9 | f2:m7 bes:7.11 | ees1 | \myEndLine
	c2:m7 f4:9 e:9 | ees1:maj9 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key ees \major

	%% part "A"
	c'4 bes g f | g1 | c4 bes g4. ees8 | f g ces,2. | g'4 f ees c! | ees1 |

	%% part "A"
	c'4 bes g f | g1 | c4 bes g4. ees8 | f g ces,2. | g'4 f ees c! | ees1 |

	%% part "B"
	d8 d d d~ d d4 d8 | d d4 d8 d d4 d8 | d d d d'~ d4 c8 d | b!1 |
	ees,8 ees ees ees~ ees ees4 ees8 | ees ees4 ees8 ees ees4 ees8 | ees ees ees ees'~ ees4 des8 ees | c2 ces |

	%% part "A"
	c!4 bes g f | g1 | c4 bes g4. ees8 | f g ces,2. | g'4 f ees c! | ees1 |
	b!8 c ees g c d b! cis! | bes!1 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Pen -- nies in a stream, fall -- ing leaves, a sy -- ca -- more, Moon -- light In Ver -- mont.

	%% part "A"
	I -- cy fin -- ger -- waves, ski trails on a moun -- tain -- side, snow -- light in Ver -- mont.

	%% part "B"
	Tel -- e -- graph ca -- __ bles, they sing down the high -- way and tra -- vel each bend __ in the road,
	peo -- ple who meet __ in this ro -- man -- tic set -- ting are so hyp -- no -- tized __ by the love -- ly

	%% part "A"
	ev' -- ning sum -- mer breeze, warb -- ling of a mea -- dow -- lark, Moon -- light In Ver -- mont,
	you and I and Moon -- light In Ver -- mont.
}
% endif
