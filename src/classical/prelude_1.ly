\include "src/include/common.lyi"
\header {
	title="Prelude in C major"
	subtitle="Prelude number 1"
	composer="Johann Sebastian Bach"
	copyright="Public Domain"
	style="Classical"
	remark="Taken from Shlomo Gronichs book"

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
	- how do I make the speed indication (which is at the midi part) appear in the formatted output (pdf,ps) as well ? Can I share them so that I only need to change at one place ?
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
}
piano={
	\set PianoStaff.instrumentName = #"Piano"
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Andante" 4 = 88
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
