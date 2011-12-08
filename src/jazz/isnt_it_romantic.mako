<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Real"

	attributes['title']="Isn't It Romantic"
	# from the Hal Leonard book
	attributes['subtitle']="From the Paramount Picture 'Love Me Tonight'"
	attributes['style']="Jazz"
	# from the Hal Leonard book
	attributes['composer']="Richard Rodgers"
	# from the Hal Leonard book
	attributes['poet']="Lorenz Hart"
	# from the Hal Leonard book
	attributes['piece']="Easy Swing"
	# from the Hal Leonard book
	attributes['copyright']="1932 (Renewed 1959) by Famous Music Corporation"

	attributes['completion']="4"
	attributes['uuid']="dedcc73c-1ead-11e1-8007-0019d11e5a41"

	attributes['idyoutubedesc']=""
	attributes['idyoutube']=""

	attributes['structure']="ABAC"
%>
% endif

% if part=='Doc':
	DONE:
	- added the real book epdf.
	- added the Hal Leonard epdf.
	- filled in the meta data from the Hal Leonard book.
	- filled in the meta data from the real book.
	- fill in the tunes structure.
	TODO:
	- put in the real book chords.
	- put in the real book notes.
	- put in the real book lyrics.
	- check in the real book chords.
	- check in the real book notes.
	- check in the real book lyrics.
	- play the real book version and make sure it sounds right. 
	- add youtube performances.
	- add a lyrics url.
	- add the Hal Leonard version of this tune (epdf is already here).
	REMARK:
	- this tunes structure could also be interpreted as "AB" where A is AB and B is AC in the ABAC interpretation.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong
	\partial 2 bes2:7 |
	\repeat volta 2 {
		\mark "A"
		\startPart
		ees:6 c:m7 | f:m7 bes:7 | ees:maj7 e:dim7 | f:m7 bes:7 | \myEndLine
		ees:6/g c:7 | f:m7 bes:7 | ees1:maj7 | bes2:m7 ees:7 | \myEndLine
		\endPart
	} \alternative {
		{
			\mark "B"
			\startPart
			aes1:maj7 | bes2:7 g:7 | c:m g:7/b | bes:m7 ees:7 | \myEndLine
			aes:maj7 c:7/g | f:m d4:m7.5- g:7 | c2:m f:7.9 | bes:7
			\endPart
		}
		{
			\mark "C"
			\startPart
			\endPart
		}
	}
	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 168
	\time 4/4
	\key g \major

	%% partial
	\partial 4 b4 |

	%% part "A"

	%% part "B"
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
	%% part "A"
	Is -- n't It Ro -- man -- tic? Mu -- sic in the night, a dream that can be heard.
	Is -- n't It Ro -- man -- tic? Mov -- ing shad -- ows write the old -- est mag -- ic word.
	%% Part "B"
	I hear the breez -- es play -- ing in the trees a -- bove.
	Whilte all the world is say -- ing you were meant for love.
	%% Forward
	Is -- n't It Ro --
	%% part "C"
	Sweet sym -- bols in the moon -- light
	Do you mean that I will fall in love per -- chance? __ Isn't it ro -- mance? __

}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	%% part "A"
	Is -- n't It Ro -- man -- tic? Mere -- ly to be young on such a night as this?
	Is -- n't It Ro -- man -- tic? Ev -- 'ry note that's sung is like a lov -- er's kiss.
}
% endif
