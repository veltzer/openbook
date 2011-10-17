<%inherit file="/src/include/common.makoi"/>
<%def name="vars()">
<%
	attributes['jazzTune']=True
	attributes['guitar']=True
	attributes['type']="own"
	attributes['render']="Own"

	attributes['title']="Talkin' Bout A Revolution"
	attributes['composer']="Tracy Chapman"
	attributes['poet']="Tracy Chapman"
	attributes['style']="Rock"
	attributes['piece']="upbeat"

	attributes['completion']="5"
	attributes['uuid']="e9155cee-c554-11e0-b407-0019d11e5a41"

	attributes['idyoutube']="SKYWOwWAguk"
	attributes['lyricsurl']="http://www.lyrics007.com/Tracy%20Chapman%20Lyrics/Talkin'%20Bout%20A%20Revolution%20Lyrics.html"
%>
</%def>

<%doc>
	DONE:
	TODO:
	- are the g:sus4 and d:sus4 chords really sus4 chords? They 4 note
	in them is just an embelishment. How do I annotate this correctly?
	- the g:sus4 and d:sus4 chords look (in guitar tabs) just like regular
	g and d chords. How can also annotate the extra note to be added and the
	finger with which to add it with?
</%doc>

<%def name="myOwn()">
\storePredefinedDiagram \chordmode {g:sus4} #guitar-tuning #"3-3;2-2;o;o;o;3-4;"
\storePredefinedDiagram \chordmode {c:5.9} #guitar-tuning #"x;3-2;2-1;o;3-3;3-4;"
\storePredefinedDiagram \chordmode {e:m7} #guitar-tuning #"o;2-1;2-2;o;3-3;3-4;"
\storePredefinedDiagram \chordmode {d:sus4} #guitar-tuning #"x;x;o;2-1;3-3;2-2;"

myChords=\chordmode {
	\startChords
	\startRepeat
	g2:sus4 c:5.9 | e:m7 d:sus4 |
	\endRepeat
	\endChords
}
myFrets=\new FretBoards {
	\myChords
}
\score {
	<<
		\myFrets
		\new ChordNames="Chords"
		%% this adds a bar engraver which does not always come with chords
		%% I didn'f find a way to put this with the chords themselves...
		\with {
			\override BarLine #'bar-size = #4
			\consists "Bar_engraver"
		}
		\myChords
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
			"Don't you know you're talking about a revolution"
			"It sounds like a whisper"
			"Don't you know they're talking about a revolution"
			"It sounds like a whisper"
			\null
			"While they're standing in the welfare lines"
			"Crying at the doorsteps of those armies of salvation"
			"Wasting time in unemployment lines"
			"Sitting around waiting for a promotion"
			\null
			"Don't you know you're talking about a revolution"
			"It sounds like a whisper"
		}
		\null
		\column {
			"Poor people are gonna rise up"
			"And get their share"
			"Poor people are gonna rise up "
			"And take what's theirs"
			\null
			"Don't you know you better run, run, run, run, run,"
			"run, run, run, run, run, run, run, run"
			"Oh I said you better run, run, run, run, run, run,"
			"run, run, run, run, run, run, run"
			\null
			"Finally the tables are starting to turn"
			"Talking about a revolution "
			"Finally the tables are starting to turn"
			"Talking about a revolution oh no"
			"Talking about a revolution oh no"
		}
		\null
		\column {
			"While they're standing in the welfare lines"
			"Crying at the doorsteps of those armies of salvation"
			"Wasting time in unemployment lines"
			"Sitting around waiting for a promotion"
			\null
			"Don't you know you're talking about a revolution"
			"It sounds like a whisper"
			\null
			"And finally the tables are starting to turn"
			"Talking about a revolution"
			"Finally the tables are starting to turn"
			"Talking about a revolution oh no"
			"Talking about a revolution oh no"
			"Talking about a revolution oh no"
		}
		}
	}
}
</%def>
