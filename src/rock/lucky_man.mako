<%def name="vars()">
<%
	attributes['jazzTune']=True
	attributes['guitar']=True
	attributes['type']="own"
	attributes['render']="Own"

	attributes['title']="Lucky Man"
	attributes['composer']="Greg Lake"
	attributes['poet']="Greg Lake"
	attributes['style']="Rock"
	attributes['piece']="Med. Ballad"

	attributes['completion']="5"
	attributes['uuid']="a68bcbbc-c8ae-11e0-8fa9-0019d11e5a41"

	attributes['remark']="The D scale is the one used in the original version (Mark Veltzer,17/8/11)"

	attributes['idyoutube']="5x6uQ6yZsOY"
	attributes['lyricsurl']="http://www.sing365.com/music/lyric.nsf/Lucky-Man-lyrics-Emerson-Lake-Palmer/13302F99F6B11DEC48256AB8002432F8"
%>
</%def>

<%doc>
	remarks:
	\key d \major
	Some people play "a | g | d | d |" at the chorus but this is wrong if you bother
	to hear the original.
	Song progression:
		opening
		verse 1
		chorus 1
		verse 2
		chorus 2
		verse (solo)
		chorus (solo)
		verse 3
		chorus 3
		verse 4
		chorus 4
		ending (2.5 choruses with a solo keyboard and a long D at the end)

	DONE:
	TODO:
</%doc>

<%def name="myOwn()">
myChords=\chordmode {
	\startChords
	\startSong

	\mark "Verse"
	\startPart
	g1 | d | g | d | \myEndLine
	g | d | g | d | \myEndLine
	\endPart

	\mark "Chorus"
	\startPart
	a:m | e:m | d1*2 | \myEndLine
	a1:m | e:m | d1*2 | \myEndLine
	\endPart

	\endSong
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
				"He had white Horses"
				"And ladies by the score"
				"All dressed in satin"
				"And waiting by the door"
				\null
				"Ooooh, what a lucky man he was"
				"Ooooh, what a lucky man he was"
				\null
				"White lace and feathers"
				"They made up his bed"
				"A gold covered mattress"
				"On which he was led"
				\null
				"Ooooh, what a lucky man he was"
				"Ooooh, what a lucky man he was"
			}
			\null
			\column {
				"He went to fight wars"
				"For his country and his king"
				"Of his honor and his glory"
				"The people would sing"
				\null
				"Ooooh, what a lucky man he was"
				"Ooooh, what a lucky man he was"
				\null
				"A bullet had found him"
				"His blood ran as he cried"
				"No money could save him"
				"So he laid down and he died"
				\null
				"Ooooh, what a lucky man he was"
				"Ooooh, what a lucky man he was"
			}
		}
	}
}
</%def>
