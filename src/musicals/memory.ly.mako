<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doOwn']=True
	attributes.addVersion('Own', version)
	attributes.setDefaultVersionName('Own')

	attributes['title']='Memory'
	attributes['style']='Musical'
	attributes['composer']='Andrew Lloyd Webber'
	attributes['poet']='Trevor Nunn after T.S. Eliot'
	attributes['piece']='Musical'
	attributes['copyright']='Copyright 1981 by the Really Useful Group plc. and Faber Music Ltd.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='1'
	attributes['uuid']='cc3c46c7-908d-4b3e-b90f-1e01a942ef27'
	attributes['remark']='Taken from Scribd url http://www.scribd.com/doc/9491593/Sheet-Music-Cats-Memory'
%>
% endif

% if part=='Doc':
	NOTES:
		- this tune is an example of how to create different outputs for midi and
		printing. This is required here since I want the chord names to appear in the
		print but not be heard in the midi. In order situations you want to the midi
		to play the voltas correclty and so need to unfold the music but in the print
		version you want the voltas.
	TODO:
		- I don't want to see the vocal staff in the opening.
		- rests for entire bars (like in the begining) are not centered (should they be ?).
		- reduce the size of the 'GRIZABELLA' headline.
		- what's the deal with setting the key per voice? - do I have to do that ?
			check it out in the documentation, fix if need be and document this.
		- in the bass notes the bass of the chord should be held for the entire bar
			(how do I do this in lilypond ?).
		- too much space between the systems on the page.
		- add a macro that says 'Music by' and then the composer and the same for the lyrics to be preceeded by 'Text by'.
% endif

% if part=='Own':
PartChords=\chordmode {
	\startChords

	\startSong

	\myMark "Intro"
	\startPart

	bes1. | bes |

	\endPart

	\startPart

	bes | g:m | ees | d:m |
	c8*10:m | g1.:m | f8*9 ees8*3/f | \time 6/8 bes2. |
	\time 12/8 f8*9 ees8*3/f | \time 6/8 bes2. |

	\endPart

	\endSong

	\endChords
}

voiceVocal=\relative c' {
	\clef treble
	\time 12/8
	\key bes \major

	r1. | r |
	\repeat volta 2 {
		\mark "GRIZABELLA"
		bes'4. bes~ bes8 a bes c bes g | bes4. bes~ bes8 a bes c bes f |
		g4. g~ g8 ees f g f ees | d2.~ d4. d4 f8 |
		\time 10/8
		f4. c4 d8 ees[ f g a] |
		\time 12/8
		bes a g f4.~ f d4 bes8 |
	} \alternative {
		{
			f'2.~ f4 g,8 g4 bes8 |
			\time 6/8
			bes2.
		}
		{
			\time 12/8
			f'2.~ f4 g,8 g4 bes8 |
			\time 6/8
			bes2.
		}
	}
}
voiceTreble=\relative c' {
	\clef treble
	\key bes \major
	r1. | r |
	\repeat volta 2 {
		bes'4. bes~ bes8 a bes c bes g | bes4. bes~ bes8 a bes c bes f |
		g4. g~ g8 ees f g f ees | d2.~ d4. d4 f8 |
		f4. c4 d8 ees[ f g a] |
		bes a g f4.~ f d4 bes8 |
	} \alternative {
		{
			f'2.~ f4 g,8 g4 bes8 |
			\time 6/8
			bes2.
		}
		{
			\time 12/8
			f'2.~ f4 g,8 g4 bes8 |
			\time 6/8
			bes2.
		}
	}
}
voiceBass=\relative c' {
	\clef bass
	\key bes \major

	bes,8 f' d'~ d f, d' bes, f' d'~ d f, d' |
	bes, f' d'~ d f, d' bes, f' d'~ d f, d' |
	\repeat volta 2 {
		bes, f' d'~ d f, d' bes, f' d'~ d f, d' |
		g,, d' g~ g d g g, d' g~ g d g |
		ees, bes' g'~ g bes, g' ees, bes' g'~ g bes, g' |
		d, a' d~ d a d d, a' d a' f d |
		c,[ g' c] ees[ g c] c,[ g' c g] |
		g, d' g bes d f g,, d' g f' d bes |
	} \alternative {
		{
			f, c' f a c f f,, c' f bes g ees |
			\time 6/8
			bes f' d'~ d f, d' |
		}
		{
			\time 12/8
			f,, c' f a c f f,, c' f bes g ees |
			\time 6/8
			bes f' bes~ bes f bes, |
		}
	}
}
pianoMain={
	%% This is the instrument name that will appear before the staff.
	%% it has nothing to do with the midi instrument that will be used to
	%% render this voice in midi format...
	%%\set PianoStaff.instrumentName=#Piano
	%% The instrument that will be used to render this voice in midi
	%% list of instruments can be found at
	%% http://lilypond.org/doc/v2.11/Documentation/user/lilypond/MIDI-instruments#MIDI-instruments
	\set PianoStaff.midiInstrument=#"acoustic grand"
	\tempo "Freely" 4.=50
	\time 12/8
	\key bes \major
	<<
		%% you can move voiceB from below to the treble clef if you prefer
		%% the notation not to match the hands but rather the music...
		\new Staff=up {
			\clef treble
			<<
				\voiceTreble
			>>
		}
		\new Staff=down {
			\clef bass
			<<
				\voiceBass
			>>
		}
	>>
}
%% lyrics
PartLyrics=\lyricmode {
%%	The next verse not a part of the song but rather some intro before the song...

%%	Daylight
%%	See the dew on the sunflower
%%	And a rose that is fading
%%	Roses whither away
%%	Like the sunflower
%%	I yearn to turn my face to the dawn
%%	I am waiting for the day...

	Mid -- night.
	Not a sound from the pave -- ment.
	Has the moon lost her me -- mory?
	She is smil -- ing a -- lone.
	In the lamp -- light,
	The wi -- thered leaves col -- lect at my feet.
	And the wind be -- gins to moan.

%%	up to till point it is done...

	Memory
	All alone in the moonlight
	I can smile at the old days
	I was beautiful then
	I remember the time I knew what happiness was
	Let the memory live again

	Every streetlamp
	Seems to beat a fatalistic warning
	Someone mutters
	And the streetlamp gutters
	And soon it will be morning

	Daylight
	I must wait for the sunrise
	I must think of a new life
	And I musn't give in
	When the dawn comes
	Tonight will be a memory too
	And a new day will begin

	Burnt out ends of smoky days
	The stale cold smell of morning
	The streetlamp dies, another night is over
	Another day is dawning

	Touch me
	It's so easy to leave me
	All alone with the memory
	Of my days in the sun
	If you touch me
	You'll understand what happiness is

	Look
	A new day has begun
}
%% score for printing
\score {
	<<
		\new Voice="voice" \voiceVocal
		\new Lyrics \lyricsto "voice" \PartLyrics
		\new PianoStaff="piano" \pianoMain
		\new ChordNames="chords" \PartChords
	>>
	\layout {
		\context { \RemoveEmptyStaffContext }
	}
}
%% score for midi
\score {
	\unfoldRepeats
	<<
		\new Voice="voice" \voiceVocal
		\new PianoStaff="piano" \pianoMain
	>>
	\midi {
	}
}
% endif
