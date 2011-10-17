<%def name="vars()">
<%
	attributes['jazzTune']=True
	attributes['guitar']=True
	attributes['type']="own"
	attributes['render']="Own"

	attributes['title']="Baby One More Time"
	attributes['composer']="Max Martin"
	attributes['poet']="Max Martin"
	attributes['style']="Pop"
	attributes['piece']="Pop"

	attributes['completion']="5"
	attributes['uuid']="8a728316-ee02-11e0-b7c5-0019d11e5a41"

	attributes['idyoutuberemark']="the original Britney Spears clip"
	attributes['idyoutube']="C-u5WLJ9Yk4"
	attributes['idyoutuberemark']="a cover by Travis"
	attributes['idyoutube']="acULghgYUg0"
	attributes['lyricsurl']="http://www.elyrics.net/read/b/britney-spears-lyrics/baby-one-more-time-lyrics.html"
%>
</%def>

<%doc>
	DONE:
	TODO:
</%doc>

<%def name="myOwn()">
myChords=\chordmode {
	\mark "Verse"
	\startRepeat
	b1:m | fis:7 | d | e2:m fis:7 |
	\endRepeat
	\mark "Special fill"
	g1 | a | g | e2:m fis:7 |
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
				"Oh baby, baby"
				"How was I supposed to know"
				"That somethin' wasn't right?"
				\null
				"Oh baby, baby"
				"I shouldn't have let you go"
				"And now you're outta sight"
				\null
				"Show me how you want it to be"
				"Tell me baby 'cause I need to know now"
				"Oh because"
				\null
				"My loneliness is killin' me"
				"I must confess I still believe"
				"When I'm not with you I lose my mind"
				"Give me a sign, hit me baby one more time"
				\null
				"Oh baby, baby"
				"The reason I breathe is you"
				"Now, boy you got me blinded"
				\null
				"I bet you baby"
				"There's nothing that I would not do, no"
				"It's not the way I planned it"
				\null
				"Show me how you want it to be"
				"Tell me baby 'cause I need to know now"
				"Oh because"
			}
			\null
			\column {
				"My loneliness is killin' me"
				"I must confess I still believe"
				"When I'm not with you I lose my mind"
				"Give me a sign, hit me baby one more time"
				\null
				"Oh baby baby, oh baby baby"
				"Oh baby, baby"
				"How was I supposed to know"
				"Oh baby, baby"
				"I shouldn't have let you go"
				\null
				"I must confess that my lonliness is killing me now"
				"Don't you know I still believe?"
				"That you will be here and give me a sign"
				"Hit me baby one more time"
				\null
				"My loneliness is killin' me"
				"I must confess I still believe"
				"When I'm not with you I lose my mind"
				"Give me a sign, hit me baby one more time"
				\null
				"I must confess that my lonliness is killing me now"
				"Don't you know I still believe?"
				"That you will be here and give me a sign"
				"Hit me baby one more time"
			}
		}
	}
}
</%def>
