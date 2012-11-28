<%page args="part"/>
% if part=='Vars':
<%
	attributes['doGuitar']=True
	attributes['doOwn']=True

	attributes['title']="Iris"
	attributes['composer']="Goo Goo Dolls"
	attributes['poet']="Goo Goo Dolls"
	attributes['album']="Dizzy Up The Girls"
	attributes['style']="Rock"
	attributes['piece']="Med. Ballad"

	attributes['completion']="5"
	attributes['uuid']="2596358c-3929-11e2-a2c3-6beac8f09e25"

	attributes['remark']="This is the right scale"

	attributes['idyoutuberemark']="The original video clip from youtube"
	attributes['idyoutube']="NdYWuo9OFAw"
	attributes['lyricsurl']="http://tabs.ultimate-guitar.com/g/goo_goo_dolls/iris_ver5_crd.htm"
%>
% endif

% if part=='Doc':
	DONE:
	- put in the meta data for this song
	- put the chords for this song
	- put in the lyrics for this song
	- put in special chord diagrams for this song
	TODO:
	- how do I put time change markings in the chord changes? I need for the intro which is a little
	bit more complicated than the rest of the song.
	- how do I annotate the number of repeats that each part needs to be repeated? for instance,
	the intro should be repeated twice.

	Chord progression:
	Intro
	Verse
	Verse
	Chorus
	Intro
	Verse
	Chorus
	Interlude
	Chorus

	In the end the bass line is ascending and then decending (twice):
	b4 cis d2 b4 a g2
% endif

<%def name="chords()">
	\chordmode {
		\time 4/4
		\startChords
		\mark "Intro"
		\startPart
		b8*3:m b8*3:9 b8:9 b:m | g8*3:maj7 g8*3:6 g8*2:6 |
		\endPart
		\mark "Verse"
		\startPart
		d4 e:m g2 | b4:m a g2 |
		d4 e:m g2 | b4:m a g2 |
		\endPart
		\mark "Chorus"
		\startPart
		b4:m a g2 | b4:m a g2 |
		b4:m a g2 | b4:m a g2 |
		\endPart
		\mark "Interlude"
		\startPart
		b8*3:m b8*3:9 b8:9 b:m | g8*3:maj7 g8*3:6 g8*2:6 |
		b8*3:m b8*3:9 b8:9 b:m |
		g2 fis:m | g b:m |
		g fis:m | b1:m |
		g fis:m | b1:m |
		b8*3:m b8*3:9 b8:9 b:m | g8*3:maj7 g8*3:6 g8*2:6 |
		b8*3:m b8*3:9 b8:9 b:m | g8*3:maj7 g8*3:6 g8*2:6 |
		\endPart
		\endChords
	}
</%def>

% if part=='Own':

\storePredefinedDiagram #default-fret-table \chordmode {b:m} #guitar-tuning #"x;2-1-(;4-3;4-4;3-2);x;"
\storePredefinedDiagram #default-fret-table \chordmode {b:9} #guitar-tuning #"x;2-1-(;4-3;4-4;2-1-);x;"
\storePredefinedDiagram #default-fret-table \chordmode {g:maj7} #guitar-tuning #"3-3;2-1;o;o;o;2-2;"
\storePredefinedDiagram #default-fret-table \chordmode {g:6} #guitar-tuning #"3-3;2-1;o;o;o;o;"

\score {
	<<
		\new FretBoards {
			${chords()}
		}
		\new ChordNames="Chords"
		%% this adds a bar engraver which does not always come with chords
		%% I didn'f find a way to put this with the chords themselves...
		\with {
			%% for lilypond 2.12
			%%\override BarLine #'bar-size = #4
			\override BarLine #'bar-extent = #'(-2 . 2)
			\consists "Bar_engraver"
		}
		${chords()}
	>>
	\midi {}
	\layout {}
}

%% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small { %% \teeny \tiny \small \normalsize \large \huge
		\fill-line {
			\column {
				%% verse
				"And I'd give up forever to touch you"
				"'Cause I know that you feel me somehow"
				"You're the closest to heaven that I'll ever be"
				"And I don't want to go home right now"
				\null
				%% verse
				"And all I can taste is this moment"
				"And all I can breathe is your life"
				"And sooner or later it's over"
				"I just don't want to miss you tonight"
				\null
				%% chorus
				"And I don't want the world to see me"
				"'Cause I don't think that they'd understand"
				"When everything's made to be broken"
				"I just want you to know who I am"
				\null
				%% verse
				"And you can't fight the tears that ain't coming"
				"Or the moment of truth in your lies"
				"When everything feels like the movies"
				"Yeah, you bleed just to know you're alive"
			} \column {
				%% chorus
				"And I don't want the world to see me"
				"'Cause I don't think that they'd understand"
				"When everything's made to be broken"
				"I just want you to know who I am"
				\null
				%% chorus
				"And I don't want the world to see me"
				"'Cause I don't think that they'd understand"
				"When everything's made to be broken"
				"I just want you to know who I am"
				\null
				%% chorus
				"I just want you to know who I am"
				"I just want you to know who I am"
				"I just want you to know who I am"
			}
		}
	}
}
% endif
