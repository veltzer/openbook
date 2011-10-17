<%def name="vars()">
<%
	attributes['doGuitar']=True
	attributes['doOwn']=True

	attributes['title']="Just The Way You Are"
	attributes['composer']="Billy Joel"
	attributes['poet']="Billy Joel"
	attributes['style']="Pop"
	attributes['piece']="Moderately"

	attributes['structure']="????"

	attributes['completion']="4"
	attributes['uuid']="ca1dfd9e-7033-11e0-a987-0019d11e5a41"

	attributes['idyoutube']="QPiK_yGG8ag"
	attributes['idyoutube']="YiOYsnET6Iw"
	attributes['idyoutube']="ounJsqomcv8"
%>
</%def>

<%doc>
	DONE:
	TODO:
	- document what was done on this tune.
	- document the you tube performances.
	- first line ender with extra lines - why ?!?
	- bring back the guitar fretboards after I manage to put them at the top of everything
		(currently they reside above the lyrics which is weird).
</%doc>

<%def name="Own()">
%% all of the parts are taken from the notes I have of Bill Joel
PartChords=\chordmode {
	\startChords

	\startSong

	\mark "A"
	\startPart
	d1 | b:m6 | g:maj7 | b2:m d:7 |
	g1:maj7 | g:m | d/fis | a2:m7 d:7 |
	g1:maj7 | g:m | d/fis | b:m7 |
	b:m7/e | e:9 | g/a | g/a |
	\endPart
	\mark "B"
	\endPart

	\endSong

	\endChords
}

PartFrets=\new FretBoards {
	\PartChords
}

PartUpperIntro=\relative c' {
	\clef treble
	\time 4/4
	\key d \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\mark "Intro"
	\tempo "Moderato" 4 = 112
	r8 a d <bes e g>~ <bes e g>2 | r8 a d <d g b>~ <d g b> <d a'>4. |
	r8 a d <bes e g>~ <bes e g>2 | r8 a d <d g b>~ <d g b> <d a'>4 fis16 e | \myEndLine
	\endBar
}
PartLowerIntro=\relative c' {
	\clef bass
	\key d \major
	<< { d,2~ d8 d4 d8 } \\ { d,1 } >> |
	<< { d'2~ d8 d4 d8 } \\ { d,1 } >> |
	<< { d'2~ d8 d4 d8 } \\ { d,1 } >> |
	<< { d'2~ d8 d4 d8 } \\ { d,1 } >> |
}

PartUpperVoice=\relative c' {
	\clef treble
	\key d \major
	<< { r2 d'8 fis4. } \\ { fis,4. fis8~ <fis d'>2 } >>
	<< { d'8 b4.~ b2 } \\ { <d, fis>2~ <d fis>8 <d fis>4. } >>
}
PartLowerVoice=\relative c' {
	\clef bass
	\key d \major
	<d, a'>1 | << { gis2~ gis8 gis4. } \\ { b1 } >> |
}

PartMelody=\relative c' {
	\clef treble
	\key d \major
	r2 d'8 fis4. | d8 b4.~ b2 | r4 r8 fis8 b8 d4. | b8 fis4.~ fis2 |
}
PartLyrics=\lyricmode {
	Don't go chang -- ing__
}

%% score for printing
\score {
	{
		\new PianoStaff="Melody" <<
			\new Staff="upper" \PartUpperIntro
			\new Staff="lower" \PartLowerIntro
		>>
		<<
			\new ChordNames="Chords" \PartChords
			\new Frets="Frets" \PartFrets
			\new Voice = "melody" { \autoBeamOff \PartMelody }
			\new Lyrics="Lyrics" \lyricsto "melody" \PartLyrics
			\new PianoStaff="Melody" <<
				\new Staff="uppervoice" \PartUpperVoice
				\new Staff="lowervoice" \PartLowerVoice
			>>
		>>
	}
	\layout {
	}
}
%% score for midi
\score {
	\unfoldRepeats
	{
		\new PianoStaff="Melody" <<
			\new Staff="upper" \PartUpperIntro
			\new Staff="lower" \PartLowerIntro
		>>
		<<
			%%\new ChordNames="Chords" \PartChords
			%%\new Frets="Frets" \PartFrets
			\new Voice = "melody" { \autoBeamOff \PartMelody }
			\new Lyrics="Lyrics" \lyricsto "melody" \PartLyrics
			\new PianoStaff="Melody" <<
				\new Staff="uppervoice" \PartUpperVoice
				\new Staff="lowervoice" \PartLowerVoice
			>>
		>>
	}
	\midi {
	}
}
</%def>
