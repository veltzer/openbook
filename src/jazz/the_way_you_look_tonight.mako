<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Newreal"

	attributes['title']="The Way You Look Tonight"
	attributes['style']="Jazz"
	# from the fake book
	attributes['composer']=""
	# from the fake book
	attributes['poet']=""
	# from the fake book
	attributes['piece']=""
	# from the fake book
	attributes['copyright']=""
	# from the fake book
	attributes['copyrightextra']=""
	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"

	attributes['completion']="4"
	attributes['uuid']="30fc7894-d8f8-11e3-84a6-77203dda2123"
	attributes['structure']="AABC"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the epdf from the new real book
	TODO:
	- added a lyrics url.
	- added the fake book epdf.
	- wrote down the fake book chords.
	- wrote down the fake book tune.
	- wrote down the fake book lyrics.
	- filled in the meta data from the fake book.
	- check the fake book chords.
	- check the fake book tune.
	- check the fake book lyrics.
	- played the midi to hear that it sounds right.
	- added youtube performances.
% endif

% if part=='ChordsNewreal':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		\endPart

		\myMark "A'"
		\myMark "B"
		\endPart

		\myMark "A''"
		\startPart
		g2 e:m | a:m7 d:7 | b:7 e:7 | a1:7 | \myEndLine
		g2 e:7 | a:m7 d:7 |

	} \alternative {
		{
			g e:7.9+ | a:7.9- d:7.9- | \myEndLine
		}
		{
			ees1 | bes2/d d:7/c | g/b e:7 | a:m7 d:7 | g1*2 | \myEndLine
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceNewreal':
\relative c' {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key g \major
}
% endif

% if part=='LyricsNewreal':
\lyricmode {
	%% part "A"
	%% part "A"
	%% part "B"
	%% part "A"
	%% Second volta
}
% endif

% if part=='LyricsmoreNewreal':
\lyricmode {
	%% part "A"
	%% part "A"
	%% part "B"
	%% part "A"
}
% endif
