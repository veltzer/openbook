<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['render']="Real"

	attributes['title']="Green Dolphin Street"
	attributes['composer']="Kaper/Washington"
	attributes['style']="Jazz"
	# this is from the real book
	attributes['piece']="Latin/Swing"
	attributes['copyright']=""

	attributes['structure']="ABAC"

	attributes['completion']="0"
	attributes['uuid']="b93bdc7e-0207-11e1-9e68-0019d11e5a41"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- added the chords.
	- added the notes.
	- added youtube performances.
	- added the tunes structure.
	- checked the speed of the tune.
	- added epdfs for real book and new real book.
	- filled in the copyright
	- do the rythm markings on the second bar of the real book version.
	- enter the new real book version.
	- in the real book version how do I put the last two chords (the turn-around chords)
		in parenthesis?
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\mark "A"
	\startPart
	\repeat volta 2 {
	  	c1*2:maj7 | c:m7 | \myEndLine
		d1:7/c | d2:7/c des/c | c1*2:maj7 | \myEndLine
	}
	\endPart
	\alternative {
		{
			\mark "B"
			\startPart
			d1:m7 | g:7 | c1*2:maj7 | \myEndLine
			f1:m7 | bes:7 | e1:maj7 | e2:maj7 g:7 | \myEndLine
			\endPart
		}
		{
			\mark "C"
			\startPart
			d2:m7 d:m/c | b:m7.5- e:7.9- | a:m7 a:m/g | fis:m7.5- b:7 | \myEndLine
			e:m7 a:7 | d:m7 g:7 | c1:maj7 | d:m7 g:7 | \myEndLine
			\endPart
		}
	}

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 160
	\time 4/4
	\key c \major

	%% part "A"
	\repeat volta 2 {
	  c2 c~ | c \times 2/3 { b4 g e } | bes1~ | bes |
	  a2 a~ | a \times 2/3 { bes4 f des } | g1~ | g |
	}
	\alternative {
		{
			%% part "B"
			r8 g4. d4 e | f g aes bes | g1~  g |
			r8 bes4. f4 g | aes bes ces des | bes1~ | bes2 b |
		}
		{
			%% part "C"
			r8 g4. d4 e | f g gis e' | d4. c8~ c2 | c,4 d dis b' |
			a4. g8~ g2 | r8 g4. g4 g | g1~ | g |
		}
	}
}
% endif
