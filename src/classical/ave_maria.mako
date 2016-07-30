<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('My', version)
	attributes.setDefaultVersionName('My')

	attributes['title']='Ave Maria'
	attributes['style']='Classical'
	attributes['subtitle']='Meditation on Prelude in C by J.S. Bach'
	attributes['composer']='Charles Gounod'
	attributes['copyright']='Public Domain'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='626a30f8-da81-11e3-a291-2f021049e3c1'
	attributes['structure']='A'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- mark what has been done to this tune.
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\startPart
	f1 |
	g:m/f |
	c:7/e |
	f |
	d:m/f | %% 5
	g/f |
	c/e |
	f/e |
	d:m7 |
	g:7 | %% 10
	c |
	c:dim7 |
	g:m/bes |
	bes:dim7 |
	f/a | %% 15
	bes/a |
	g:m7 |
	c:7 |
	f |
	f:7 | %% 20
	bes:maj7 |
	b:dim7 |
	f:m/c |
	bes:m6/des |
	c:7 |
	f/c |
	c:7sus4 |
	c:7 |
	f:dim7/c |
	f/c |
	c:7sus4 |
	c:7 |
	f:7 |
	bes/f |
	g:m7/f |
	c1:7sus4/f |
	f |
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceMy':
{
	\tempo "Reverently" %%4 = 130
	\time 4/4
	\key c \major

	%% part "A"
	a'1 |
	bes2. bes4 |
	c2.( g4) |
	a1 |
	d2( d8 d,8) e8 f8 |
	g4.( a8) g2 |
	c2(c8 c,8) d8 e8 |
	f4.( g8) f2 |
	%% Second System
	f'2( f8 f,8) g8( a8) |
	b4.( a8 g4) d4 |
	e2 r4 g4 |
	a2( a8) a8( bes8 c8) |
	d4. d,8 d2 |
	g2( g8) g8 a8( bes8) |
	c4.( c,8) c2 |
	%% Third System
	f2( f8) f8( g8 a8) |
	bes2( bes8) bes8( c8 d8) |
	e4. d8 c4( g4) |
	a2. r4 |
	c2 a4( a8.) a16 |
	d2 d,4 r4 |
	d'2 f,4( d'8.) d16 |
	%% Fourth System
	f2 aes,4~ aes8. f'16 |
	f2 g,4 r4 |
	g2~ g8 g8( f8) e8 |
	c'4.( a8) f2 |
	bes2( bes8) bes8 a8 g8 |
	g'4. e8 c4 r |
	d2( d8) d8 e8( f8) |
	%% Fifth System
	a2( a8 f8) c8 a8 |
	g2( g8 d'8) e8( d8) |
	c8( g'8) e8( c8) bes8( g8) e8( c8) |
	f1 |
	f2 r |
	c'1 |
	c1 |
}
% endif

% if part=='LyricsMy':
\lyricmode {
	A -- ve, Ma -- ri -- a! Gra -- ti -- a ple -- na. Do -- mi -- nus Te -- cum
	be -- ne -- dic -- ta tu in mu -- li -- e -- ri -- bus et be -- ne dic -- tus
	fruc -- tus ven tris tu -- i Je -- sus. Sanc -- ta Ma -- ri -- a. Sanc -- ta Ma --
	ri -- a Ma -- ri -- a, O -- ra -- pro no -- bis no -- bis pec -- ca -- to -- ri -- bus nuc et in
	Ho -- ra, in ho -- ra mor -- tis nos -- trae. A -- men. A -- men.
}
% endif
