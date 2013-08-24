<%page args="part"/>
% if part=='Vars':
<%
	attributes['doGuitar']=True
	attributes['doOwn']=True

	attributes['title']="The Final Countdown"
	attributes['composer']="Europe"
	attributes['poet']="Europe"
	attributes['style']="Rock"
	attributes['piece']="Upbeat"
	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"

	attributes['completion']="5"
	attributes['uuid']="7f247a70-c8f3-11e0-bb35-0019d11e5a41"

	attributes['remark']="same scale (fis:m) as the original version"

	attributes['idyoutuberemark']="Original version by Europe"
	attributes['idyoutube']="9jK-NcRmVcw"
	attributes['lyricsurl']="http://www.elyrics.net/read/e/europe-lyrics/the-final-countdown-lyrics.html"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- mark what has been done to this tune.
	- some of the frets are way off (e/gis is hilarious!)
	- the special bar lines are not demarcated correctly. This is a lilypond issue. Check it out.
	- document the youtube performance.
% endif

<%namespace name="defs" file="/src/include/defs.makoi"/>

<%def name="chords()">
	\chordmode {
		\mark "Opening"
		\startRepeat
		%% the remarked part is from the song but it is repeated so I just
		%% put it once...
		%%\repeat volta 4 {
		%%	fis1:m | d | b:m | e2 e/fis |
		%%}
		%%\repeat volta 2 {
		%%	fis:m e | a d | cis1*2:7 |
		%%}
		\repeat volta 2 {
			fis1:m | d | b:m | e2 e/fis |
		}
		\repeat volta 2 {
			fis:m e | a d | cis1*2:7 |
		}
		\endRepeat
		\mark "Interlude"
		\startBar
		fis1*4:m |
		\myEndLine
		\endBar
		\mark "Verse"
		\startBar
		fis1*3:m | d1 |
		fis1*2:m | fis2:m e | a1 |
		d | e | a2 e/gis | fis:m e |
		d1 | cis:m | e1*2 |
		\myEndLine
		\endBar
		\mark "Chorus"
		\startRepeat
		\repeat volta 2 {
			fis1:m | d | b:m | e2 e/fis |
		}
		\mark "Interlude"
		\startBar
		fis1*2:m |
		\myEndLine
		\endBar
		\mark "Solo"
		\startRepeat
		\repeat volta 2 {
			b:m | a | d | g g/fis |
			e:m | a |
		} \alternative {
			{ b:m | fis | }
			{ b:m | cis | }
		}
		\endBar
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
	\small { %% \teeny \tiny \small \normalsize \large \huge
		\fill-line {
			\column {
				"We're leaving together"
				"But still it's farewell"
				"And maybe we'll come back"
				"To earth, who can tell?"
				"I guess there is no one to blame"
				"We're leaving ground"
				"Will things ever be the same again?"
				\null
				"It's the final countdown"
				"The final countdown"
				\null
				"Ohh"
				"We're heading for Venus and still we stand tall"
				"'Cause maybe they've seen us and welcome us all, yea"
				"With so many light years to go and things to be found"
				"(To be found)"
				"I'm sure that we'll all miss her so"
			}
			\null
			\column {
				"It's the final countdown"
				"The final countdown"
				"The final countdown"
				"(The final countdown)"
				"Ohh ho ohh"
				\null
				"The final countdown, oh ho"
				"It's the final countdown"
				"The final countdown"
				"The final countdown"
				"(The final countdown)"
				\null
				"Ohh"
				"It's the final countdown"
				"We're leaving together"
				"The final countdown"
				"We'll all miss her so"
				"It's the final countdown"
				"(The final countdown)"
				"Ohh, it's the final countdown"
				"Yea"
			}
		}
	}
}
% endif
