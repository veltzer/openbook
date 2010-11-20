\include "src/include/common.lyi"
\header {
	title="Memory"
	subtitle=""
	composer="Andrew Lloyd Webber"
	copyright=""
	style="Musical"
	piece=""
	remark="Taken from Scribd url http://www.scribd.com/doc/9491593/Sheet-Music-Cats-Memory"
	poet="Trevor Nunn after T.S. Eliot"

	completion="1"
	uuid="cc3c46c7-908d-4b3e-b90f-1e01a942ef27"

}
%{
	NOTES:
		- this tune is an example of how to create different outputs for midi and
		printing. This is required here since I want the chord names to appear in the
		print but not be heard in the midi. In order situations you want to the midi
		to play the voltas correclty and so need to unfold the music but in the print
		version you want the voltas.
	TODO:
		- I don't want to see the vocal staff in the opening.
		- rests for entire bars (like in the begining) are not centered.
		- what's the deal with setting the key per voice?
%}

chordsIntro=\chordmode {
	\startIntro

	bes1 | bes1 |

	\endIntro
}

chordsMain=\chordmode {
	\startChords

	\startSong
	
	\startIntro

	bes1 | bes1 |

	\startPart

	bes1 | g:m | ees | d:m |
	c:m | g:m | f8*9 ees8*3/f | bes1 |

	\endPart

	\endSong

	\endChords
}
\parallelMusic #'(voiceIntroTreble voiceIntroBass) {
	\time 12/8
	\key bes \major
	% Bar 1
	r1. |
	\key bes \major
	bes,8 f'8 d'8~ d8 f,8 d'8 bes,8 f'8 d'8~ d8 f,8 d'8 |
	% Bar 2
	r1. |
	bes,8 f'8 d'8~ d8 f,8 d'8 bes,8 f'8 d'8~ d8 f,8 d'8 |
}
\parallelMusic #'(voiceVocal voiceTreble voiceBass) {
	\time 12/8
	% Bar 1
	\key bes \major
	r1. |
	\key bes \major
	r1. |
	\key bes \major
	bes,8 f'8 d'8~ d8 f,8 d'8 bes,8 f'8 d'8~ d8 f,8 d'8 |
	% Bar 2
	r1. |
	r1. |
	bes,8 f'8 d'8~ d8 f,8 d'8 bes,8 f'8 d'8~ d8 f,8 d'8 |
}
voiceMain={
		\new Staff="voice" {
			\clef treble
			<<
				\relative c''
				\voiceVocal
			>>
		}
}
pianoIntro={
	<<
		\new Staff="treble" {
			\clef treble
			<<
				\relative c'
				\voiceIntroTreble
			>>
		}
		\new Staff="bass" {
			\clef bass
			<<
				\relative c'
				\voiceIntroBass
			>>
		}
	>>
}
pianoMain={
	%% This is the instrument name that will appear before the staff.
	%% it has nothing to do with the midi instrument that will be used to
	%% render this voice in midi format...
	%%\set PianoStaff.instrumentName=#"Piano"
	%% The instrument that will be used to render this voice in midi
	%% list of instruments can be found at
	%% http://lilypond.org/doc/v2.11/Documentation/user/lilypond/MIDI-instruments#MIDI-instruments
	\set PianoStaff.midiInstrument=#"acoustic grand"
	%% The tempo of the tune
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Freely" 4.=50
	<<
		%% you can move voiceB from below to the treble clef if you prefer
		%% the notation not to match the hands but rather the music...
		\new Staff="up" {
			\clef treble
			<<
				\relative c'
				\voiceTreble
			>>
		}
		\new Staff="down" {
			\clef bass
			<<
				\relative c'
				\voiceBass
			>>
		}
	>>
}
%% score for printing
\score {
	<<
		\new VoiceStaff="voice" \voiceMain
		\new PianoStaff="piano" \pianoMain
		\new ChordNames="chords" \chordsMain
	>>
	\layout {
		\context { \RemoveEmptyStaffContext }
	}
}
%% score for midi
\score {
	<<
		\new VoiceStaff="voice" \voiceMain
		\new PianoStaff="piano" \pianoMain
	>>
	\midi {
	}
}
