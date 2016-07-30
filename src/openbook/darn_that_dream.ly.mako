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

	attributes['title']='Darn That Dream'
	attributes['style']='Jazz'
	attributes['composer']='Jimmy Van Heusen'
	attributes['poet']='Eddie DeLange'
	attributes['piece']='Slowly'
	attributes['copyright']='1939 Bregman, Vocco and Conn, Inc. New York'
	attributes['copyrightextra']='Copyright Renewed, Assigned and Copyright 1968 by Scarsdale Music. Corporation and Van Heusen Music Corp., New York'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='f0a5804c-eb83-11e0-aeb1-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='rbk1:103,jfb:94'

	attributes['idyoutuberemark1']='Theloneous Monk...:)'
	attributes['idyoutube1']='GsI4oNKGJPg'
	attributes['idyoutuberemark2']='Dexter Gordon, one of the great performances of this song...'
	attributes['idyoutube2']='upZ00qxXrBg'
	attributes['lyricsurl']='http://www.lyricsfreak.com/b/billie+holiday/darn+that+dream_20018018.html'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- mark what's been done with this tune.
	- add the real book version.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	g2 bes4:m7 ees:7 | a2:m7 b:7.5- | e4:m7 e:m/d cis:m7 c:maj7 | b2:m7.5- e:7.9- | \myEndLine
	a:m7 f:7 | b:m7 bes:dim7 | a:m7 d:7 | b4:m7 e:7 a:m7 d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2 bes4:m7 ees:7 | a2:m7 b:7.5- | e4:m7 e:m/d cis:m7 c:maj7 | b2:m7.5- e:7.9- | \myEndLine
	a:m7 f:7 | b:m7 bes:dim7 | a:m7 d:7.9- | g2 bes:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	ees2:6 c:m7 | f:m7 bes:7 | ees:maj7 c:7.9- | f:m7 bes4:7.9 bes:7.9- | \myEndLine
	ees2:6 c:m7 | g4:m7 g:m7/f e2:m7.5- | a:m7 d:7 | ees:7.9 d:7.9 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2 bes4:m7 ees:7 | a2:m7 b:7.5- | e4:m7 e:m/d cis:m7 c:maj7 | b2:m7.5- e:7.9- | \myEndLine
	a:m7 f:7 | b:m7 bes:dim7 | a:m7 d:7.9- | g1 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Adagio" 4 = 72
	\time 4/4
	\key g \major

	%% part "A"
	d4 g ees4. ees8 | e4 a f4. fis8 | g4 b gis8 a b c | d4 e b2 |
	b4 d c8 b a g | fis4 a e ees | d2 fis | d r |

	%% part "A"
	d4 g ees4. ees8 | e4 a f4. fis8 | g4 b gis8 a b c | d4 e b2 |
	b4 d c8 b a g | fis4 a e ees | d2 b' | g2. r4 |

	%% part "B"
	r8 g4 g8 f4 ees | c' c8 bes~ bes4. c8 | d ees d des~ des4 ces | bes aes8 f~ f2 |
	r8 g4 g8 f4 ees | g a8 bes~ bes4. c8 | d d d d~ d4 d, | bes'2 b |

	%% part "A"
	d,4 g ees4. ees8 | e4 a f4. fis8 | g4 b gis8 a b c | d4 e b2 |
	b4 d c8 b a g | fis4 a e ees | d2 b' | g2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Darn That Dream I dream each night,
	You say you love me and you hold me tight,
	but when I a -- wake you're out of sight.
	Oh, Darn That Dream.

	%% part "A"
	Darn your lips and darn your eyes,
	they lift me high a -- bove the moon -- lit skies,
	then I tum -- ble out of Par -- a -- dise.
	Oh, Darn That Dream.

	%% part "B"
	Darn that one- -- track mind of mine, __
	it can't un -- der -- stand __ that you don't care. __
	Just to change the mood I'm in, __
	I'd wel -- come a nice __ old night -- mare.

	%% part "A"
	Darn That Dream and bless it too,
	with -- out that dream I nev -- er would have you.
	But it haunts me and it won't come true,
	Oh, Darn That Dream.
}
% endif
