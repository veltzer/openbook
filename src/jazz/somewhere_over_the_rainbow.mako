<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Ccb"

	# from the ccb book
	attributes['title']="Somewhere, Over The Rainbow"
	attributes['style']="Jazz"
	# from the ccb book
	attributes['composer']="Harold Arlen"
	# from wikipedia
	attributes['poet']="Edgar Yipsel 'Yip' Harburg"
	# from the fake book
	attributes['piece']="Ballad"

	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"
	attributes['completion']="5"
	attributes['uuid']="f046f51c-ed4d-11e3-9d71-67b6b025e741"
	attributes['structure']="AABA"

	attributes['idyoutuberemark1']="Keith Jarret solo"
	attributes['idyoutube1']="eq0EWNuR1H8"
	attributes['idyoutuberemark2']="Original Judy Garland version"
	attributes['idyoutube2']="PSZxmZmBfnU"
	attributes['lyricsurl']="http://www.stlyrics.com/lyrics/thewizardofoz/somewhereovertherainbow.htm"
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the ccb.
	- put in the tunes structure
	- added the meta data from the ccb.
	- added lyrics url.
	- added youtube performances.
	- put in the chords (ccb).
	- put in the tune (ccb).
	- put in the lyrics (ccb).
	- check the lyrics (ccb).
	- check the chords (ccb).
	- check the tune (ccb).
	- heard the tune to check that it is right and adjust the tempo.
	TODO:
	- add another version of this tune.
% endif

% if part=='ChordsCcb':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		a2:m7.5- d:7.9- | g2.:m7 a4:7.5- | aes2:maj7 a4:m7.5- d:7.9- | g2:m7 c:7.9- | \myEndLine
		f:m7 aes:m7 | g:m7 c:7.9- | f:m7 bes:7.9- |
	} \alternative {
		{
			ees:maj7 f4:m7 bes:7.9- | \myEndLineVoltaNotLast
		}
		{
			ees2:maj7 f4:m7 bes:7.9- | \myEndLine
		}
	}
	\endPart

	\myMark "B"
	\startPart
	ees1:maj7 | f2:m7 bes:7.9- | g:m7 c:7.9- | f:m7 bes:7.9- | \myEndLine
	ees1:maj7 | a2:m7.5- d:7.9- | g:m7 c:9 | f:m7 bes:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	a:m7.5- d:7.9- | g2.:m7 a4:7.5- | aes2:maj7 a4:m7.5- d:7.9- | g2:m7 c:7.9- | \myEndLine
	f:m7 aes:m7 | g:m7 c:7.9- | f:m7 bes:7.9- | ees:maj7 f4:m7 bes:7.9- | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceCcb':
\relative {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Andante" 4 = 80
	\time 4/4
	\key ees \major

	%% part "A"
	\repeat volta 2 {
		ees2 ees' | d4 bes8 c d4 ees | ees,2 c' | bes1 | \myEndLine
		c,2 aes' | g4 ees8 f g4 aes | f d8 ees f4 g |
	} \alternative {
		{
			ees2 r | \myEndLineVoltaNotLast
		}
		{
			ees2. bes'4 | \myEndLine
		}
	}
	%% part "B"
	g8 bes g bes g bes g bes | aes bes aes bes aes bes aes bes | c2 c~ | c r4 bes | \myEndLine
	g8 bes g bes g bes g bes | a c a c a c a c | d2 d | f c | \myEndLine
	%% part "A"
	ees,2 ees' | d4 bes8 c d4 ees | ees,2 c' | bes1 | \myEndLine
	c,2 aes' | g4 ees8 f g4 aes | f d8 ees f4 g | ees2 r | \myEndLine
}
% endif

% if part=='LyricsCcb':
\lyricmode {
	%% part "A"
	Some -- where o -- ver the rain -- bow
	Way up high,
	There's a land that I heard of
	Once in a lu -- lla -- by.
	%% part "B"
	_ Some -- day I'll wish u -- pon a star
	And wake up where the clouds are far
	Be -- hind me.
	Where trou -- bles melt like le -- mon drops
	A -- way a -- bove the chim -- ney tops
	That's where you'll find me.
	%% part "A"
	Some -- where o -- ver the rain -- bow
	Blue -- birds fly.
	Birds fly o -- ver the rain -- bow.
	Why then, oh why can't I?
}
% endif

% if part=='LyricsmoreCcb':
\lyricmode {
	%% part "A"
	Some -- where o -- ver the rain -- bow
	Skies are blue,
	And the dreams that you dare to dream
	Real -- ly do come _ true.
}
% endif
