<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doGuitar']=True
	version['doOwn']=True
	attributes.addVersion('DontMatter', version)
	attributes.setDefaultVersionName('DontMatter')

	attributes['title']='I Am Beautiful'
	attributes['style']='Rock'
	# from wikipedia
	attributes['composer']='Linda Perry'
	# from wikipedia
	attributes['poet']='Linda Perry'
	attributes['piece']='Ballad'
	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'

	attributes['completion']='5'
	attributes['uuid']='94c2657c-2726-11e1-b716-0019d11e5a41'

	attributes['idyoutuberemark1']='The original Christina Aguilera video clip'
	attributes['idyoutube1']='eAfyFTzZDMM'
	attributes['lyricsurl']='http://www.lyrics007.com/Christina%20Aguilera%20Lyrics/Beautiful%20Lyrics.html'
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the meta data from the internet.
	- added youtube performance.
	- added lyrics url.
	- added lyrics (from the internet).
	- added chords (found them myself).
	TODO:
	REMARKS:
% endif

<%namespace name="defs" file="/include/defs.ly.mako"/>

<%def name="chords()">
	\chordmode {
		\startChords
		\startSong

		\mark "Opening"
		\startPart
		ees1 | des | c:m | ces |
		ees | des | c:m | ces |
		\endPart

		\mark "Verse"
		\startPart
		ees | des | c:m | ces |
		ees | des | c:m | ces |
		\endPart

		\mark "Chorus"
		\startPart
		aes | f:m | ees2 des | c1:m |
		aes | f:m | ees2 des | c1:m |
		f:m |
		\endPart

		\mark "Transition"
		\startPart
		ees | des | c:m | ces |
		\endPart

		\mark "Special part"
		\startPart
		ees | des | c:m | ces |
		ees | des | c:m | ces |
		\endPart

		\endSong
		\endChords
	}
</%def>

% if part=='Own':
\score {
	<<
		\new FretBoards {
			${chords()}
		}
		${defs.chordDefs()}
		${chords()}
	>>
	%%\midi {}
	\layout {}
}

%% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\concat {
			\column {
				\box "Opening"
				"Don't look at me"
				\vspace #0.3
				\box "Verse"
				"Everyday is so wonderful"
				"Then suddenly"
				"It's hard to breathe"
				"Now and then I get insecure"
				"From all the pain"
				"I'm so ashamed"
				\vspace #0.3
				\box "Chorus"
				"I am beautiful"
				"No matter what they say"
				"Words can't bring me down"
				"I am beautiful"
				"In every single way"
				"Yes words can't bring me down"
				"Oh no"
				"So don't you bring me down today"
				\vspace #0.3
				\box "Verse"
				"To all your friends you're delirious"
				"So consumed"
				"In all your doom, ooh"
				"Trying hard to fill the emptiness"
				"The pieces gone"
				"Left the puzzle undone"
				"Ain't that the way it is"
			}
			\hspace #3
			\column {
				\box "Chorus"
				"You're beautiful"
				"No matter what they say"
				"Words can't bring you down"
				"Oh no"
				"You're beautiful"
				"In every single way"
				"Yes words can't bring you down"
				"Oh no"
				"So don't you bring me down today"
				\box "Chorus"
				"No matter what we do"
				"(No matter what we do)"
				"No matter what we say"
				"(No matter what we say)"
				"We're the song inside the tune"
				"(Yeah, oh yeah)"
				"Full of beautiful mistakes"
				\vspace #0.3
				\box "Chorus"
				"And everywhere we go"
				"(And everywhere we go)"
				"The sun will always shine"
				"(The sun will always, always, shine)"
				"And tomorrow we might awake"
				"On the other side"
			}
			\hspace #3
			\column {
				\box "Chorus"
				"We're beautiful"
				"No matter what they say"
				"Yes words won't bring us down"
				"Oh no"
				"We are beautiful"
				"In every single way"
				"Yes words can't bring us down"
				"Oh no"
				"So don't you bring me down today"
				\vspace #0.3
				\box "Chorus"
				"Oh, oh"
				"Don't you bring me down today"
				"Don't you bring me down, ooh"
				"Today"
			}
		}
	}
}
% endif
