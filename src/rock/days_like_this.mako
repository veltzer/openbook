<%page args="part"/>
% if part=='Vars':
<%
	attributes['doGuitar']=True
	attributes['doOwn']=True

	attributes['title']="Days Like This"
	attributes['composer']="Van Morrison"
	attributes['album']="Days Like This/1995"
	attributes['poet']="Van Morrison"
	attributes['style']="Rock"
	attributes['piece']="Med. Ballad"
	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"

	attributes['completion']="5"
	attributes['uuid']="6437a34a-3bd4-11e2-9e13-9f845e169c9b"

	attributes['remark']="This is the right scale"

	attributes['idyoutuberemark']="Original video clip"
	attributes['idyoutube']="BteIwbKU_iQ"
	attributes['lyricsurl']="http://www.lyricsfreak.com/v/van+morrison/days+like+this_20142994.html"
	attributes['wiki']="Days_Like_This_(song)"
%>
% endif

% if part=='Doc':
	Song progression:
	opening
	verse1
	intelude
	verse2
	interlude
	verse3
	interlude
	solo sax on verse
	interlude
	verse4
	interlude
	verse5
	interlude
	ending (first part with humming the tune and second part with lyrics)
	DONE:
	- filled in the meta data for this tune
	TODO:
% endif

<%namespace name="defs" file="/src/include/defs.makoi"/>

<%def name="chords()">
	\chordmode {
		\startChords
		\startSong

		\mark "Opening"
		\startPart
		aes2 ees | aes2 ees | aes2 ees | aes2 ees |
		\endPart

		\mark "Verse"
		\startPart
		ees2 c:m | aes ees | ees2 c:m | aes ees |
		aes bes:7 | ees4 ees/e c2:m | aes bes:7 | aes ees |
		\endPart

		\mark "Interlude"
		\startPart
		aes2 ees |
		\endPart

		\mark "Ending"
		\startPart
		ees c:m | aes ees | ees c:m | aes ees |
		aes bes:7 | ees4 ees/e c2:m | aes bes:7 | aes ees |
		aes bes:7 | aes ees | aes bes:7 | aes ees | aes bes:7 | aes ees |
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
				%% verse1
				"When its not always raining therell be days like this"
				"When theres no one complaining therell be days like this"
				"When everything falls into place like the flick of a switch"
				"Well my mama told me therell be days like this"
				\null
				%% verse2
				"When you dont need to worry therell be days like this"
				"When no ones in a hurry therell be days like this"
				"When all the parts of the puzzle start to look like they fit"
				"Then I must remember therell be days like this"
				\null
				%% verse3
				"When you dont need an answer therell be days like this"
				"When you dont meet a chancer therell be days like this"
				"When you dont get betrayed by that old judas kiss"
				"Then I must remember therell be days like this"
			}
			\null
			\column {
				%% verse4
				"When everyone is up front and theyre not playing tricks"
				"When you dont have no freeloaders out to get their kicks"
				"When its nobodys business the way that you wanna live"
				"Well my mama told me therell be days like this"
				\null
				%% verse5
				"When no one steps on my dreams therell be days like this"
				"When people understand what I mean therell be days like this"
				"When you ring out the changes about how everything is"
				"Well my mama told me therell be days like this"
				\null
				%% ending
				"Well my mama told me Therell be days like this"
				"Well my mama told me Therell be days like this"
				"Well my mama told me Therell be days like this"
				"Oh my mama told me (she said) Therell be days like this"
			}
		}
	}
}
% endif
