<%page args="part"/>
% if part=='Vars':
<%
	attributes['doGuitar']=True
	attributes['doOwn']=True

	attributes['title']="I Am Beautiful"
	attributes['composer']=""
	attributes['poet']=""
	attributes['style']="Rock"
	attributes['piece']=""

	attributes['completion']="5"
	attributes['uuid']="94c2657c-2726-11e1-b716-0019d11e5a41"

	attributes['idyoutube']="eAfyFTzZDMM"
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
Don't look at me

Everyday is so wonderful
Then suddenly
It's hard to breathe
Now and then I get insecure
From all the pain
I'm so ashamed

I am beautiful
No matter what they say
Words can't bring me down
I am beautiful
In every single way
Yes words can't bring me down
Oh no
So don't you bring me down today

To all your friends you're delirious
So consumed
In all your doom, ooh
Trying hard to fill the emptiness
The pieces gone
Left the puzzle undone
Ain't that the way it is

You're beautiful
No matter what they say
Words can't bring you down
Oh no
You're beautiful
In every single way
Yes words can't bring you down
Oh no
So don't you bring me down today

No matter what we do
(No matter what we do)
No matter what we say
(No matter what we say)
We're the song inside the tune
(Yeah, oh yeah)
Full of beautiful mistakes

And everywhere we go
(And everywhere we go)
The sun will always shine
(The sun will always, always, shine)
And tomorrow we might awake
On the other side

We're beautiful
No matter what they say
Yes words won't bring us down
Oh no
We are beautiful
In every single way
Yes words can't bring us down
Oh no
So don't you bring me down today

Oh, oh
Don't you bring me down today
Don't you bring me down, ooh
Today
	DONE:
	TODO:
% endif

% if part=='Own':
PartChords=\chordmode {
	\startChords
	\startSong
	\mark "Verse"
	\startPart
	\endPart
	\mark "Chorus"
	\startPart
	\endPart
	\endSong
	\endChords
}
PartFrets=\new FretBoards {
	\PartChords
}
\score {
	<<
		\PartFrets
		\new ChordNames="Chords"
		%% this adds a bar engraver which does not always come with chords
		%% I didn'f find a way to put this with the chords themselves...
		\with {
			\override BarLine #'bar-size = #4
			\consists "Bar_engraver"
		}
		\PartChords
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
				\null
				\null
				\null
			}
			\null
			\column {
				\null
				\null
				\null
			}
		}
	}
}
% endif
