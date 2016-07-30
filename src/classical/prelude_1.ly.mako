<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doOwn']=True
	attributes.addVersion('Own', version)
	attributes.setDefaultVersionName('Own')

	attributes['title']='Prelude and Fugue No. 1 in C major'
	attributes['style']='Classical'
	attributes['subtitle']='Well-Tempered Clavier, Book 1'
	attributes['composer']='Johann Sebastian Bach (1685-1750)'
	attributes['piece']='BWV 846'
	attributes['copyright']='Public Domain'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='562ae904-a664-11df-9e85-0019d11e5a41'
	attributes['remark']='Taken from Shlomo Gronichs book'

	attributes['idyoutube1']='0KQW2YnCUrE'
%>
% endif

% if part=='Doc':
	NOTES:
		- this tune is an example of how to create different outputs for midi and
		printing. This could be required for several reasons:
		- you may want chord names to appear in the print but not be heard in the midi.
		- you may want the midi to unfold the voltas (play them correctly that is) while
		in the print the voltas should appear unfolded to keep the print small and
		comprehensible.
	DONE:
	TODO:
% endif

% if part=='Own':
PartChords=\chordmode {
	\startChords

	\startSong

	%% there is no need to worry about which instrument plays the chords
	%% since they will not be heard...

	c1 | d:m7/c | g:7/b | c |
	a:m/c | d:7/c | g/b | c:maj7/b |
	a:m7 | d:7 | g | c:dim7/g |
	d:m/f | b:dim/f | c/e | f:maj7/e |
	d:m7 | g:7 | c | c:7 |
	f:maj7 | fis:dim | b:dim/aes | g:7 |
	c/g | g:sus4.7 | g:7 | a:dim/g |
	c/g | g:sus4.7 | g:7 | c:7 |
	f/c | g:7/c | c |

	\endSong

	\endChords
}
\parallelMusic #'(voiceA voiceB voiceC) {
	%% Bar 1
	r8 g'16 c e g, c e r8 g,16 c e g, c e |
	r16 e8.~ e4 r16 e8.~ e4 |
	c2 c |
	%% Bar 2
	r8 a,16 d f a, d f r8 a,16 d f a, d f |
	r16 d8.~ d4 r16 d8.~ d4 |
	c2 c |
	%% Bar 3
	r8 g,16 d' f g, d' f r8 g,16 d' f g, d' f |
	r16 d8.~ d4 r16 d8.~ d4 |
	b2 b |
	%% Bar 4
	r8 g,16 c e g, c e r8 g,16 c e g, c e |
	r16 e8.~ e4 r16 e8.~ e4 |
	c2 c |
	%% Bar 5
	r8 a,16 e' a a, e' a r8 a,16 e' a a, e' a |
	r16 e8.~ e4 r16 e8.~ e4 |
	c2 c |
	%% Bar 6
	r8 fis,16 a d fis, a d r8 fis,16 a d fis, a d |
	r16 d8.~ d4 r16 d8.~ d4 |
	c2 c |
	%% Bar 7
	r8 g,16 d' g g, d' g r8 g,16 d' g g, d' g |
	r16 d8.~ d4 r16 d8.~ d4 |
	b2 b |
	%% Bar 8
	r8 e,16 g c e, g c r8 e,16 g c e, g c |
	r16 c8.~ c4 r16 c8.~ c4 |
	b2 b |
	%% Bar 9
	r8 e,16 g c e, g c r8 e,16 g c e, g c |
	r16 c8.~ c4 r16 c8.~ c4 |
	a2 a |
	%% Bar 10
	r8 d,16 fis c' d, fis c' r8 d,16 fis c' d, fis c' |
	r16 a8.~ a4 r16 a8.~ a4 |
	d,2 d |
	%% Bar 11
	r8 d,16 g b d, g b r8 d,16 g b d, g b |
	r16 b8.~ b4 r16 b8.~ b4 |
	g2 g |
	%% Bar 12
	r8 e,16 g cis e, g cis r8 e,16 g cis e, g cis |
	r16 bes8.~ bes4 r16 bes8.~ bes4 |
	g2 g |
	%% Bar 13
	r8 d,16 a' d d, a' d r8 d,16 a' d d, a' d |
	r16 a8.~ a4 r16 a8.~ a4 |
	f2 f |
	%% Bar 14
	r8 d,16 f b d, f b r8 d,16 f b d, f b |
	r16 aes8.~ aes4 r16 aes8.~ aes4 |
	f2 f |
	%% Bar 15
	r8 c,16 g' c c, g' c r8 c,16 g' c c, g' c |
	r16 g8.~ g4 r16 g8.~ g4 |
	e2 e |
	%% Bar 16
	r8 a,16 c f a, c f r8 a,16 c f a, c f |
	r16 f8.~ f4 r16 f8.~ f4 |
	e2 e |
	%% Bar 17
	r8 a,16 c f a, c f r8 a,16 c f a, c f |
	r16 f8.~ f4 r16 f8.~ f4 |
	d2 d |
	%% Bar 18
	r8 g,16 b f' g, b f' r8 g,16 b f' g, b f' |
	r16 d8.~ d4 r16 d8.~ d4 |
	g,2 g |
	%% Bar 19
	r8 g,16 c e g, c e r8 g,16 c e g, c e |
	r16 e8.~ e4 r16 e8.~ e4 |
	c2 c |
	%% Bar 20
	r8 bes16 c e bes c e r8 bes16 c e bes c e |
	r16 g8.~ g4 r16 g8.~ g4 |
	c2 c |
	%% Bar 21
	r8 a,16 c e a, c e r8 a,16 c e a, c e |
	r16 f8.~ f4 r16 f8.~ f4 |
	f,2 f |
	%% Bar 22
	r8 a,16 c ees a, c ees r8 a,16 c ees a, c ees |
	r16 c8.~ c4 r16 c8.~ c4 |
	fis2 fis |
	%% Bar 23
	r8 b16 c d b c d r8 b16 c d b c d |
	r16 f8.~ f4 r16 f8.~ f4 |
	aes2 aes |
	%% Bar 24
	r8 g,16 b d g, b d r8 g,16 b d g, b d |
	r16 f8.~ f4 r16 f8.~ f4 |
	g2 g |
	%% Bar 25
	r8 g,16 c e g, c e r8 g,16 c e g, c e |
	r16 e8.~ e4 r16 e8.~ e4 |
	g2 g |
	%% Bar 26
	r8 g,16 c f g, c f r8 g,16 c f g, c f |
	r16 d8.~ d4 r16 d8.~ d4 |
	g2 g |
	%% Bar 27
	r8 g,16 b f' g, b f' r8 g,16 b f' g, b f' |
	r16 d8.~ d4 r16 d8.~ d4 |
	g2 g |
	%% Bar 28
	r8 a,16 c fis a, c fis r8 a,16 c fis a, c fis |
	r16 ees8.~ ees4 r16 ees8.~ ees4 |
	g2 g |
	%% Bar 29
	r8 g,16 c g' g, c g' r8 g,16 c g' g, c g' |
	r16 e!8.~ e4 r16 e8.~ e4 |
	g2 g |
	%% Bar 30
	r8 g,16 c f g, c f r8 g,16 c f g, c f |
	r16 d8.~ d4 r16 d8.~ d4 |
	g2 g |
	%% Bar 31
	r8 g,16 b f' g, b f' r8 g,16 b f' g, b f' |
	r16 d8.~ d4 r16 d8.~ d4 |
	g2 g |
	%% Bar 32
	r8 g,16 bes e g, bes e r8 g,16 bes e g, bes e |
	r16 c8.~ c4 r16 c8.~ c4 |
	c,2 c |
	%% Bar 33
	\clef bass r8 f,16 a c f c a c a f a f d f d |
	r16 c8.~ c4~ c2 |
	c1 |
	%% Bar 34
	\mark \markup { \italic { ritenuto } } \clef treble r8\sustainOn g'16 b d f d b d b g b d, f e d \sustainOff |
	r16 b8.~ b4~ b2 |
	c1 |
	%% Bar 35
	<e g c>1\fermata |
	c1\fermata |
	c1\fermata |
}
PartPiano={
	%% This is the instrument name that will appear before the staff.
	%% it has nothing to do with the midi instrument that will be used to
	%% render this voice in midi format...
	\set PianoStaff.instrumentName = #"Piano"
	\tempo "Andante" 4 = 72
	\time 4/4
	\key c \major
	%% The instrument that will be used to render this voice in midi
	%% list of instruments can be found at
	%% http://lilypond.org/doc/v2.11/Documentation/user/lilypond/MIDI-instruments#MIDI-instruments
	\set PianoStaff.midiInstrument = #"acoustic grand"
	<<
		%% you can move voiceB from below to the treble clef if you prefer
		%% the notation not to match the hands but rather the music...
		\new Staff="up" {
			\clef treble
			<<
				\relative c' {
					\voiceA
				}
				%%\\
				%%\relative c' {
				%%	\voiceB
				%%}
			>>
		}
		\new Staff="down" {
			\clef bass
			<<
				\relative c' {
					\voiceB
				}
				\\\
				\relative c' {
					\voiceC
				}
			>>
		}
	>>
}
%% score for printing
\score {
	<<
		\new ChordNames="chords" \PartChords
		\new PianoStaff="piano" \PartPiano
	>>
	\layout {
	}
}
%% score for midi
\score {
	<<
		\new PianoStaff="piano" \PartPiano
	>>
	\midi {
	}
}
% endif
