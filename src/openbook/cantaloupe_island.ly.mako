<%page args='part'/>
% if part=='Vars':
<%
	from scripts import attr
	version=attr.Version()
	version['doOwn']=True
	attributes.addVersion('Own', version)
	attributes.setDefaultVersionName('Own')

	attributes['title']='Cantaloupe Island'
	attributes['style']='Jazz-Rock'
	attributes['subtitle']='Herbie Hancock'
	attributes['composer']='Herbie Hancock'
	attributes['piece']='Jazz-Rock'
	attributes['copyright']='1975 By Hancock Music CO., New York, N.Y.'

	attributes['typesetter']='Michael Dienert <mdienert@t-online.de>'
	attributes['completion']='1'
	attributes['uuid']='6cc287b2-56b0-11e8-877d-9ba5ce5f84df'
	attributes['remark']='Not to be found in the Real Books'

	attributes['idyoutube1']='8B1oIXGX0Io'
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

	\myMark "Intro"

	\startPart
	   \repeat volta 2{
	      f1:m7 | f1:m7 | f1:m7 | f1:m7 |
	   }
	\endPart      

	\myMark "A"

	\startPart
	   \repeat volta 2{
	      f1:m7  | f1:m7  | f1:m7 | f1:m7 |
	      des1:7 | des1:7 |des1:7 |des1:7 |
	      d1:m7  | d1:m7  |d1:m7  |d1:m7  |
	      f1:m7  | f1:m7  | f1:m7 | f1:m7 |	      
	   }
	\endPart      

	\endSong

	\endChords
}
\parallelMusic #'(melodie akkorde bass) {
	%% Bar 1
	r1 |
	r8  <as c>8 <bes d>4 <c es>4 <bes d>8 <as c>8|
	f4. c'8 ~ c4 es8 f8|

	%% Bar 2
	r1 |
	r8  <as c>8 <bes d>4 <c es>4 <bes d>8 <as c>8|
	f,4. c'8 ~ c4 es8 f8|

	%% Bar 3
	r1 |
	r8  <as c>8 <bes d>4 <c es>4 <bes d>8 <as c>8|
	f,4. c'8 ~ c4 es8 f8|

	%% Bar 4
	r2 r4 f8 f8 |
	r8  <as c>8 <bes d>4 <c es>4 <bes d>8 <as c>8|
	f,4. c'8 ~ c4 es8 f8|





}
PartPiano={
	%% This is the instrument name that will appear before the staff.
	%% it has nothing to do with the midi instrument that will be used to
	%% render this voice in midi format...
	\set PianoStaff.instrumentName = #"Piano"
	\tempo "Moderato" 4 = 110
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
					\melodie
				}
				%%\\
				%%\relative c' {
				%%	\voiceB
				%%}
			>>
		}
                \new Staff  {
                        \clef bass
                        <<
                           \relative c'  \akkorde
			   \\\
                           \relative c,  \bass
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
