<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Unknown"

	attributes['title']="Corcovado"
	attributes['style']="Jazz"
	attributes['subtitle']="quiet nights of quiet stars"
	attributes['composer']="Antonio Carlos Jobim"
	attributes['copyright']="1959, Editora Musical Arapua, Sao Paulo, Brazil"
	attributes['piece']="Med Swing"

	attributes['completion']="0"
	attributes['uuid']="b847fc02-a26e-11df-92ce-0019d11e5a41"
	attributes['structure']="????"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- turn this tune relative.
	- where is this from?
	- add the intro chords (they are not currently shown
	- mark whats been done to this tune.
	- add youtube performances.
% endif

% if part=='ChordsUnknown':
\chordmode {
	\startChords
	\startSong

	\mark "Intro"
	r1 | r1 | a:m6 | aes:dim7 |
	g:m7 | c2:11 c2:13 | f1:maj7 | f:m6 |
	e:m7 | a:m7 | d:7 | aes:dim7 |

	\mark "A"
	%% 1
	d1:9 | r1 | aes1:dim7 | r1 | g1:m7 | c:9 | f:maj7 | f:6 |
	%% 9
	f:m7 | f:m6 | e:m7 | a:7.5+.9- | d1:9 | r1 | d1:m9 | g:7 |
	%% 17
	d1:9 | r1 | aes1:dim7 | r1 | g1:m7 | c:9 | f:maj7 | f:6 |
	f:m7 | bes:9 | e:m7 | a:m7 | d:m7 | g:7 | e:m7 | a:7.5+.9- |
	d:m7 | g:7 |

	\endSong
	\endChords
}
% endif

% if part=='VoiceUnknown':
\relative c' {
	\time 4/4
	\key c \major
	\clef treble

	r1 | r1 | r1 | r1 | r1 | r1 |
	r1 | r1 | r1 | r1 | r1 | r1 |

	%% 1
	r4 e8 d~ d e4 d8 |
	e d e2. |
	r4 e8 d~ d e4 d8 |
	e d4 e8~ e2 |
	%% 5
	r d8 c4 d8~ |
	d c d4~ d8 c4 e8 |
	e e4.~ e8 d4.~ |
	d2. r4 |
	%% 9
	r g8 f~ f g4 f8 |
	g f4 g8~ g2 |
	r4 f8 e~ e f4 e8 |
	f e f2 r4 |
	%% 13
	r e8 d~ d e4 d8 |
	e4 d8 e~ e d4 f8~ |
	f4 e f8 e4 f8~ |
	f e4 d8~ d c4. |
	%% 17
	r4 e8 d~ d e4 d8 |
	e4 d8 e~ e2 |
	r4 e8 d e4. d8 |
	e d e4~ e r |
	%% 21
	r g d~ d8 c |
	d c d c~ c f4 e8 |
	e2~ e8 d4.~ |
	d4 r r2 |
	%% 25
	r4 c8 bes~ bes aes4 g8 |
	f4 e8 d~ d2~ |
	d4 b8 a~ a g f e |
	d4 c2. |
	%% 29
	r4 a8 g f e4 d8 |
	c2 b8 c4 d8 |
	g2. r4 |
	r1 |
	%% 33
	r4 a8 g~ g f e d |
	c b4 c8~ c d4 c8~ |
}
% endif

% if part=='LyricsUnknown':
\lyricmode {
	Qui -- et __ nights of qui -- et stars,
	qui -- et __ chords from my gui -- tar __
	float -- ing on __ the si __ -- lence that sur -- rounds __ us __

	Qui -- et __ thoughts and qui -- et dreams __
	qui -- et __ walks by qui -- et streams,
	and a __ win -- dow look -- ing on __ the mount __ -- tains and the sea. __
	How love __ -- ly!

	This is __ where I want to be, __
	here with you so close to me, __
	un -- til __ the fina -- al flick -- er __ of life's em __ -- ber. __

	I who __ was lost and lone -- ly, __ __
%% there is a warning on the next line from lilypond...
%%	be -- liev __ -- ing life was on -- ly
%%	a bit -- ter tra -- gic joke have found with you
%%	the mean __ -- ing of ex -- is -- tence, oh, __ my love. __
}
% endif
