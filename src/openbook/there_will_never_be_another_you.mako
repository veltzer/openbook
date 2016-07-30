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
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Real', version)

	attributes['title']='There Will Never Be Another You'
	attributes['style']='Jazz'
	attributes['composer']='Harry Warren'
	attributes['poet']='Mack Gordon'
	attributes['piece']='Easy Swing'
	attributes['copyright']='1942, 1987 Twentieth Century Music Corporation'
	attributes['copyrightextra']='Renewed 1970 Twentieth Century Music Corporation. All Rights Controlled by Morley Music Co. International Copyright Secured. All Rights Reserved.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='e30e1074-eaf3-11e0-a377-0019d11e5a41'
	attributes['structure']='AB'
	attributes['structureremark']='the structure of this tune could also be thought of ABAC since in the AB interpretation the first 8 bars of the A and B part are identical.'
	attributes['location']='jfb:384,rbk1:426'

	attributes['idyoutube1']='kh_NnsbIqNQ'
	attributes['idyoutube2']='Til3lV_ItZE'
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- brought in the fake book epdf.
	TODO:
	- mark what has been done with this tune.
	- document the youtube performances.
	- add a lyrics url.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	ees1*2:maj7 | d1:m7.5- | g:7.9- | \myEndLine
	c1*2:m7 | bes1:m7 | ees:7 | \myEndLine
	aes:maj7 | f2:m7.5- bes:7 | ees1:maj7 | c:m7 | \myEndLine
	f:7 | \LPC c2:m7 \RPC f:7 | f1:m7 | bes:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	ees1*2:maj7 | d1:m7.5- | g:7.9- | \myEndLine
	c1*2:m7 | bes1:m7 | ees:7 | \myEndLine
	aes:maj7 | f2:m7.5- bes:7 | ees1:maj7 | g2:m7 c:7 | \myEndLine
	ees:maj7 d:7 | g:7 c:7 | f:m7 bes:7 | ees:maj7 \OPC bes:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key ees \major

	\partial 4 bes4 |

	%% part "A"
	c d ees f | g bes f ees | f1~ | f2 r8 g4. |
	ees4 f g bes | c ees c4. bes8 | c1~ | c2. bes4 |
	ees c bes aes | g f g aes | bes g f ees | f ees8 f~ f4 ees |
	d' c bes a | g f g f | aes1~ | aes2. bes,4 |

	%% part "B"
	c d ees f | g bes f ees | f1~ | f2 r8 g4. |
	ees4 f g bes | c ees c4. bes8 | c1~ | c2. bes4 |
	ees c bes aes | g f g aes | bes g f ees8 d'~ | d2 r8 c4. |
	bes4 ees d c | bes ees, bes' aes | f2 g | ees1_\markup { \italic { Fine } } |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

	%% part "A"
	There will be man -- y oth -- er nights like this, __
	and I'll be stand -- ing here with some -- one new, __
	There will be oth -- er songs to sing, an -- oth -- er fall, an -- oth -- er spring,
	but There Will Nev -- er Be An -- oth -- er You. __

	%% part "B"
	There will be oth -- er lips that I may kiss, __
	but they won't thrill me like yours used to do. __
	Yes, I may dream a mil -- lion dreams, but how can they come true,
	if there will nev -- er ev -- er be an -- oth -- er you?
}
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	ees1:maj7 | aes:maj7 | d1:m7.5- | g:7.9- | \myEndLine
	c1*2:m7 | bes1:m7 | ees:7 | \myEndLine
	aes:maj7 | des:7.9 | ees:6 | c:m7 | \myEndLine
	f1*2:7 | f1:m7/bes | bes:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	ees1:maj7 | aes:maj7 | d1:m7.5- | g:7.9- | \myEndLine
	c1*2:m7 | bes1:m7 | ees:7 | \myEndLine
	aes:maj7 | des:7.9 | g2:m7 c:7 | fis1:dim7 | \myEndLine
	ees2:6 d:7.9- | g:7.5+ c:7.9- | f:m7 bes:7.9 | ees1:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key ees \major

	\partial 4 bes4 |

	%% part "A"
	c d ees f | g bes f4. ees8 | f1~ | f2. g4 |
	ees f g bes | c ees c4. bes8 | c1~ | c2. bes4 |
	ees c bes aes | g f g4. aes8 | bes4 g f ees | f ees f4. ees8 |
	d'4 c bes a | g f g f | aes1~ | aes2. bes,4 |

	%% part "B"
	c d ees f | g bes f4. ees8 | f1~ | f2. g4 |
	ees f g bes | c ees c4. bes8 | c1~ | c2. bes4 |
	ees4 c bes aes | g f g4. aes8 | bes4 g f ees | d'2. c4 |
	bes ees d c | bes ees, bes' aes | f2 g | ees2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	There will be man -- y oth -- er nights like this, __
	and I'll be stand -- ing here with some -- one new, __
	There will be oth -- er songs to sing, an -- oth -- er fall, an -- oth -- er spring,
	but There Will Nev -- er Be An -- oth -- er You. __

	%% part "B"
	There will be oth -- er lips that I may kiss, __
	but they won't thrill me like yours used to do. __
	Yes, I may dream a mil -- lion dreams, but how can they come true,
	if there will nev -- er ev -- er be an -- oth -- er you?
}
% endif
