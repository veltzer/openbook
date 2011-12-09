<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Real"

	attributes['title']="The Man I Love"
	attributes['style']="Jazz"
	# from the real book
	attributes['composer']="George Gershwin"
	# from the internet
	attributes['poet']="Ira Gershwin"
	# from the real book
	attributes['piece']="Slowly"
	attributes['copyright']=""
	attributes['copyrightextra']=""
	attributes['structure']="AABA"

	attributes['completion']="5"
	attributes['uuid']="e8ff288e-2233-11e1-9b9f-0019d11e5a41"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- filled in meta data from the real book.
	- filled in the tunes structure.
	TODO:
	- add you tube performances.
	- add a lyrics url.
% endif

% if part=='ChordsUltimate':
\chordmode {
	\startChords
	\startSong

	\endSong
	\endChords
}
% endif

% if part=='VoiceUltimate':
\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key ees \major
}
% endif

% if part=='LyricsUltimate':
\lyricmode {
	They All Laughed at Chris -- to -- pher Co -- lum -- bus
	When he said the world was round. __
	They All Laughed when Ed -- i -- son re -- cord -- ed sound. __

	They All Laughed at Wil -- bur and his bro -- ther,
	When they said that man could fly. __
	They told Mar -- co -- ni wire -- less was a pho -- ny;
	It's the same old cry.

	They laughed at me __ want -- ing you, __
	Said I was reach -- ing for the moon.
	But oh, __ you came through __
	Now they'll have to change their tune.

	They all said we nev -- er could be hap -- py,
	They laughed at us and how!
	But "\"ho," ho, "ho!\""
	Who's got the last laugh now? __

	"\"Hee," hee, "hee!\""
	Let's at the past laugh,
	"\"Ha," ha, "ha!\""
	Who's got the last laugh now? __
}
% endif

% if part=='LyricsmoreUltimate':
\lyricmode {
	They All Laughed at Rock -- e -- fel -- ler Cen -- ter,
	Now they're fight -- ing to get in. __
	They all laughed at Whit -- ney and his cot -- ton gin. __

	They all laughed at Ful -- ton and his steam -- boat,
	Her -- shey and his choc' -- late bar. __
	Ford and his Liz -- zie Kept the laugh -- ers bus -- y;
	That's how peo -- ple are.

	They laughed at me __ want -- ing you, __
	Said it would be "\"Hel" -- lo, Good -- "bye.\""
	And oh, __ you came through __
	Now they're eat -- ing hum -- ble pie.

	They all said we'd nev -- er get to -- geth -- er;
	Dar -- ling, let's take a bow.
	For "\"ho," ho, "ho!\""
	Who's got the last laugh
}
% endif
