\include "src/include/common.lyi"
\header {
	title="Prelude in C major"
	subtitle="Prelude number 1"
	composer="Johann Sebastian Bach"
	copyright=""
	style="Classical"
	remark=""

	uuid="562ae904-a664-11df-9e85-0019d11e5a41"
}
%{
	Taken from Shlomo Gronichs book
%}

\score {
<<
	\chords {
		\set chordChanges = ##t
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
		r8 g16 c e g, c e r8 g,16 c e g, c e  |
		r16 e8.~ e4       r16 e8.~  e4        |
		c2                c                   |

		% Bar 2
		r8 a,16 d f a, d f r8 a,16 d f a, d f |
		r16 d8.~  d4       r16 d8.~  d4       |
		c2                 c                  |
	}
	\new PianoStaff <<
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
>>
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 88 4)
		}
	}
	\layout {}
}
