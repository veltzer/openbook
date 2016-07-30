<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doGuitar']=True
	version['doOwn']=True
	attributes.addVersion('DontMatter', version)
	attributes.setDefaultVersionName('DontMatter')

	attributes['title']='Days Like This'
	attributes['style']='Rock'
	attributes['composer']='Van Morrison'
	attributes['poet']='Van Morrison'
	attributes['piece']='Med. Ballad'
	attributes['album']='Days Like This/1995'
	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'

	attributes['completion']='5'
	attributes['uuid']='6437a34a-3bd4-11e2-9e13-9f845e169c9b'

	attributes['remark']='This is the right scale'

	attributes['idyoutuberemark1']='Original video clip'
	attributes['idyoutube1']='BteIwbKU_iQ'
	attributes['lyricsurl']='http://www.lyricsfreak.com/v/van+morrison/days+like+this_20142994.html'
	attributes['wiki']='Days_Like_This_(song)'
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

<%namespace name="defs" file="/include/defs.ly.mako"/>

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
				\box "Verse"
				"When its not always raining therell be days like this"
				"When theres no one complaining therell be days like this"
				"When everything falls into place like the flick of a switch"
				"Well my mama told me therell be days like this"
				\vspace #0.3
				\box "Verse"
				"When you dont need to worry therell be days like this"
				"When no ones in a hurry therell be days like this"
				"When all the parts of the puzzle start to look like they fit"
				"Then I must remember therell be days like this"
				\vspace #0.3
				\box "Verse"
				"When you dont need an answer therell be days like this"
				"When you dont meet a chancer therell be days like this"
				"When you dont get betrayed by that old judas kiss"
				"Then I must remember therell be days like this"
			}
			\hspace #3
			\column {
				\box "Verse"
				"When everyone is up front and theyre not playing tricks"
				"When you dont have no freeloaders out to get their kicks"
				"When its nobodys business the way that you wanna live"
				"Well my mama told me therell be days like this"
				\vspace #0.3
				\box "Verse"
				"When no one steps on my dreams therell be days like this"
				"When people understand what I mean therell be days like this"
				"When you ring out the changes about how everything is"
				"Well my mama told me therell be days like this"
				\vspace #0.3
				\box "Ending"
				"Well my mama told me Therell be days like this"
				"Well my mama told me Therell be days like this"
				"Well my mama told me Therell be days like this"
				"Oh my mama told me (she said) Therell be days like this"
			}
		}
	}
}
% endif
