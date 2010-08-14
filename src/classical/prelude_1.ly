\include "src/include/common.lyi"
\header {
	title="Prelude and Fugue No. 1 in C major"
	subtitle="Well-Tempered Clavier, Book 1"
	composer="Johann Sebastian Bach (1685–1750)"
	copyright="Public Domain"
	style="Classical"
	piece="BWV 846"
	remark="Taken from Shlomo Gronichs book"
	poet=""

	completion="4"
	uuid="562ae904-a664-11df-9e85-0019d11e5a41"
}
%{
	NOTES:
		- this tune is an example of how to create different outputs for midi and
		printing. This is required here since I want the chord names to appear in the
		print but not be heard in the midi. In order situations you want to the midi
		to play the voltas correclty and so need to unfold the music but in the print
		version you want the voltas.
	TODO:
%}

myChords=\chordmode {
	\set chordChanges = ##t
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
}
\parallelMusic #'(voiceA voiceB voiceC) {
	% Bar 1
	r8 g16 c e g, c e r8 g,16 c e g, c e |
	r16 e8.~ e4 r16 e8.~ e4 |
	c2 c |
	% Bar 2
	r8 a,16 d f a, d f r8 a,16 d f a, d f |
	r16 d8.~ d4 r16 d8.~ d4 |
	c2 c |
	% Bar 3
	r8 g,16 d' f g, d' f r8 g,16 d' f g, d' f |
	r16 d8.~ d4 r16 d8.~ d4 |
	b2 b |
	% Bar 4
	r8 g,16 c e g, c e r8 g,16 c e g, c e |
	r16 e8.~ e4 r16 e8.~ e4 |
	c2 c |
	% Bar 5
	r8 a,16 e' a a, e' a r8 a,16 e' a a, e' a |
	r16 e8.~ e4 r16 e8.~ e4 |
	c2 c |
	% Bar 6
	r8 fis,16 a d fis, a d r8 fis,16 a d fis, a d |
	r16 d8.~ d4 r16 d8.~ d4 |
	c2 c |
	% Bar 7
	r8 g,16 d' g g, d' g r8 g,16 d' g g, d' g |
	r16 d8.~ d4 r16 d8.~ d4 |
	b2 b |
	% Bar 8
	r8 e,16 g c e, g c r8 e,16 g c e, g c |
	r16 c8.~ c4 r16 c8.~ c4 |
	b2 b |
	% Bar 9
	r8 e,16 g c e, g c r8 e,16 g c e, g c |
	r16 c8.~ c4 r16 c8.~ c4 |
	a2 a |
	% Bar 10
	r8 d,16 fis c' d, fis c' r8 d,16 fis c' d, fis c' |
	r16 a8.~ a4 r16 a8.~ a4 |
	d,2 d |
	% Bar 11
	r8 d,16 g b d, g b r8 d,16 g b d, g b |
	r16 b8.~ b4 r16 b8.~ b4 |
	g2 g |
	% Bar 12
	r8 e,16 g cis e, g cis r8 e,16 g cis e, g cis |
	r16 bes8.~ bes4 r16 bes8.~ bes4 |
	g2 g |
	% Bar 13
	r8 d,16 a' d d, a' d r8 d,16 a' d d, a' d |
	r16 a8.~ a4 r16 a8.~ a4 |
	f2 f |
	% Bar 14
	r8 d,16 f b d, f b r8 d,16 f b d, f b |
	r16 aes8.~ aes4 r16 aes8.~ aes4 |
	f2 f |
	% Bar 15
	r8 c,16 g' c c, g' c r8 c,16 g' c c, g' c |
	r16 g8.~ g4 r16 g8.~ g4 |
	e2 e |
	% Bar 16
	r8 a,16 c f a, c f r8 a,16 c f a, c f |
	r16 f8.~ f4 r16 f8.~ f4 |
	e2 e |
}
piano={
	%% This is the instrument name that will appear before the staff.
	%% it has nothing to do with the midi instrument that will be used to
	%% render this voice in midi format...
	\set PianoStaff.instrumentName = #"Piano"
	%% The tempo of the tune
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Andante" 4 = 88
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
				\relative c''
				\voiceA
				%%\\
				%%\relative c'
				%%\voiceB
			>>
		}
		\new Staff="down" {
			\clef bass
			<<
				\relative c'
				\voiceB
				\\
				\relative c'
				\voiceC
			>>
		}
	>>
}
%% score for printing
\score {
	<<
		\new ChordNames="chords" \myChords
		\new PianoStaff = "piano" \piano
	>>
	\layout {
	}
}
%% score for midi
\score {
	<<
		\new PianoStaff = "piano" \piano
	>>
	\midi {
	}
}
