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
	TODO:
% endif

<%def name="chords()">
	\chordmode {
		\startChords
		\mark "Intro"
		\startPart
		\time 3/8 b8*3:m | b8*3:9 | \time 2/8 b8:9 b:m |
		\time 3/8 g8*3:maj7 | g8*3:6 | \time 2/8 g8*2:6 |
		\endPart
		\mark "Verse"
		\startPart
		\endPart
		\endChords
	}
</%def>

% if part=='Own':

\storePredefinedDiagram #default-fret-table \chordmode {b:m} #guitar-tuning #"x;2-1-(;4-3;4-4;3-2);x;"
\storePredefinedDiagram #default-fret-table \chordmode {b:9} #guitar-tuning #"x;2-1-(;4-3;4-4;2-1-);x;"

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
