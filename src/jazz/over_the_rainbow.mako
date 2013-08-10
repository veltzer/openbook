<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Wikifonia"

	# from wikifonia
	attributes['title']="Over The Rainbow"
	# this is from wikifonia and wikipedia
	attributes['subtitle']="Somewhere Over The Rainbow"
	# my own
	attributes['style']="Jazz"
	# from wikifonia
	attributes['composer']="Harold Arlen"
	# from wikifonia
	attributes['copyright']="Musicopy"
	# my own
	attributes['piece']="Slowly, with expression"
	# from wikifonia and wikipedia
	attributes['poet']="Edgar Yipsel Harburg"

	attributes['completion']="5"
	attributes['uuid']="c6992350-a9da-11e2-8a7f-97606039682f"
	attributes['structure']="AABA"

	attributes['idyoutuberemark']="The original Judy Garland version"
	attributes['idyoutube']="1HRa4X07jdE"
	attributes['idyoutuberemark']="Keith Jarret kills them"
	attributes['idyoutube']="u3eH6VW6Chc"
	attributes['lyricsurl']="http://www.stlyrics.com/lyrics/thewizardofoz/somewhereovertherainbow.htm"
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the wikifonia version.
	- filled in the meta data from wikifonia and wikipedia.
	- put in the lyrics from wikifonia.
	- put in the chords from wikifonia.
	- put in the tune from wikifonia.
	- checked the wikifonia melody sounds fine.
	- checked the wikifonia chords.
	- checked the wikifonia lyrics.
	- checked the wikifonia melody.
	- find youtube performances.
	- put a link to the lyrics.
	TODO:
	- put the copyright right (with the copyright symbol).
	- put the link to the tune on the web: http://www.wikifonia.org/node/1072#/C/0/1
	- get another version of this tune in here.
% endif

% if part=='ChordsWikifonia':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		ees2:maj7 c:m7 | g2.:m7 ees4:7 | aes2:maj7 d:7 | g:m7 c:7 | \myEndLine
		f:m7 des:7 | ees:maj7 g4:m7 c:7 | f2:m7 bes:7 |
	} \alternative {
		{
			%% TODO: myEndLine emitted in next line in order not to force break
			ees:maj7 f4:m7 bes:7 |
		}
		{
			ees1:maj7 | \myEndLine
		}
	}
	\endPart

	\myMark "B"
	\startPart
	ees1:maj7 | f2:m7 bes:7 | g:m7 c:7 | f:m7 bes:7 | \myEndLine
	ees1:maj7 | a2:m7.5- d:7.9- | g:m7 c:7 | f:m7 bes:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees2:maj7 c:m7 | g2.:m7 ees4:7 | aes2:maj7 d:7 | g:m7 c:7 | \myEndLine
	f:m7 des:7 | ees:maj7 g4:m7 c:7 | f2:m7 bes:7 | ees1:maj7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceWikifonia':
\relative a' {
	\time 4/4
	\key ees \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Adagio" 4 = 76

	%% A part
	\repeat volta 2 {
		ees2 ees' | d4 bes8 c d4 ees | ees,2 c' | bes1 |
		c,2 aes' | g4 ees8 f g4 aes | f d8 ees f4 g |
	} \alternative {
		{
			ees1 |
		}
		{
			ees2. r8 bes' |
		}
	}

	%% B part
	g8 bes g bes g bes g bes | aes bes aes bes aes bes aes bes | c2 c~ | c2. r8 bes |
	g8 bes g bes g bes g bes | a c a c a c a c | d2 d | f c |

	%% A part
	ees,2 ees' | d4 bes8 c d4 ees | ees,2 c' | bes1 |
	c,2 aes' | g4 ees8 f g4 aes | f d8 ees f4 g | ees1 |
}
% endif

% if part=='LyricsWikifonia':
\lyricmode {
	%% A part
	Some -- where O -- ver The Rain -- bow, way up high,
	there's a land that I heard of once in a lull -- a -- by

	%% B part
	true
	Some day I'll wish up -- on a star and wake up where the clouds are far be -- hind me.
	Where trou -- bles melt like le -- mon drops a -- way a -- bove the chim -- ney tops that's where you'll find me

	%% B part
	Some -- where O -- ver The Rain -- bow, blue -- birds fly.
	Birds fly o -- ver the rain -- bow, why then, oh why can't I?
}
% endif

% if part=='LyricsmoreWikifonia':
\lyricmode {
	%% A part
	Some -- where O -- ver The Rain -- bow, skies are blue,
	and the dreams that you dare to dream real -- ly do come
}
% endif
