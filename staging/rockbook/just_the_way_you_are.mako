<%page args='part'/>
% if part=='Vars':
<%
	# vim: set filetype=lilypond :
	import attr
	version=attr.Version()
	version['doGuitar']=True
	version['doOwn']=True
	attributes.addVersion('DontMatter', version)
	attributes.setDefaultVersionName('DontMatter')

	attributes['title']='Just The Way You Are'
	attributes['style']='Pop'
	attributes['composer']='Billy Joel'
	attributes['poet']='Billy Joel'
	attributes['piece']='Moderately'
	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'

	attributes['completion']='4'
	attributes['uuid']='ca1dfd9e-7033-11e0-a987-0019d11e5a41'
	attributes['location']='file:just_the_way_you_are.pdf'

	attributes['idyoutube1']='QPiK_yGG8ag'
	attributes['idyoutube2']='YiOYsnET6Iw'
	attributes['idyoutube3']='ounJsqomcv8'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- document what was done on this tune.
	- document the you tube performances.
	- first line ender with extra lines - why ?!?
	- bring back the guitar fretboards after I manage to put them at the top of everything
		(currently they reside above the lyrics which is weird).
% endif

<%namespace name="defs" file="/include/defs.ly.mako"/>

% if part=='Own':
%% all of the parts are taken from the notes I have of Bill Joel
PartChords=\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	d1 | b:m6 | g:maj7 | b2:m d:7 |
	g1:maj7 | g:m | d/fis | a2:m7 d:7 |
	g1:maj7 | g:m | d/fis | b:m7 |
	b:m7/e | e:9 | g1*2/a |
	\endPart
	\myMark "B"
	\endPart

	\endSong
	\endChords
}

PartFrets=\new FretBoards {
	\PartChords
}

PartUpperIntro=\relative c' {
	\clef treble

	\tempo "Moderato" 4 = 112
	\time 4/4
	\key d \major

	\mark "Intro"
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
%%\score {
%%	\unfoldRepeats
%%	{
%%		\new PianoStaff="Melody" <<
%%			\new Staff="upper" \PartUpperIntro
%%			\new Staff="lower" \PartLowerIntro
%%		>>
%%		<<
%%			%%\new ChordNames="Chords" \PartChords
%%			%%\new Frets="Frets" \PartFrets
%%			\new Voice = "melody" { \autoBeamOff \PartMelody }
%%			\new Lyrics="Lyrics" \lyricsto "melody" \PartLyrics
%%			\new PianoStaff="Melody" <<
%%				\new Staff="uppervoice" \PartUpperVoice
%%				\new Staff="lowervoice" \PartLowerVoice
%%			>>
%%		>>
%%	}
%%	\midi {
%%	}
%%}
% endif
