<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="Here's That Rainy Day"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['composer']="James Van Heusen"
	# this is from the fake book
	attributes['poet']="Johnny Burke"
	# this is from the fake book
	attributes['piece']="Slowly"
	# this is from the fake book
	attributes['copyright']="1953 by BOURCE CO. and DORSEY BROS. MUSIC, INC. Copyright Renewed."

	attributes['completion']="1"
	attributes['uuid']="4c69df80-cd7f-11e1-8c91-4b6b0349580b"

	attributes['structure']="ABAC"
	attributes['structureremark']="You can also think of this as AB"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the meta data from the fake book.
	- put in the tunes structure.
	TODO:
	- brought in the fake book epdf.
	- put in the fake book chords.
	- put in the fake book tune.
	- put in the fake book lyrics.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- played the fake book version to hear that it sounds well.
	- put in you tube performances with documentation.
	- put in a lyrics url.
	REMARKS:
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 2. s2. |

	\repeat volta 2 {
		\mark "A"
		\startPart
		g1*2:maj7 | g1:m7 | c:7 | \myEndLine
		f1*2:maj7 | f1:m7 | bes:7 | \myEndLine
		ees:maj7 | a2:m7.5- d:7 | g1:m7 | a2:m7.5- d:7 | \myEndLine
		g1:maj7.9 | a2:m d:7 | b:m7 bes:7 | a:m7 a4:m7/d d:7 | \myEndLine
		\endPart

		\mark "B"
		\startPart
		g1*2:maj7 | g1:m7 | c:7 | \myEndLine
		f1*2:maj7 | f1:m7 | bes:7 | \myEndLine
		ees:maj7 | a2:m7.5- d:7 | g1:maj7 | a2:m7 d:7.9- | \myEndLine
		b:m7 bes:7 | a:m7 a4:m7/d d:7.9- |
	} \alternative {
		{
			g1:6 | d2:7 a4:m7/d d:7 | %%\myEndLine
		}
		{
			g1*2 | \myEndLine
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key g \major
	\partial 2. d4 g a |
	\repeat volta 2 {
		%% part "A"
		a2 b~ | b4 d, g a | bes1~ | bes4 c, f g |
		g2 a~ | a4 c, f g | aes1~ | aes4 d, ees f |
		g g g g | g g8 a~ a g a4 | bes1~ | bes4. a8~ a g a4 |
		b!1~ | b4 a b c | d d d d | d d, g a |
		%% part "B"
		a2 b~ | b4 d, g a | bes1~ | bes4 c, f g |
		g2 a~ | a4 c, f g | aes1~ | aes4 d, ees f |
		g g g g | g g8 a~ a g a4 | b1~ | b4 a b c |
		d d d d | d d, g a |
	} \alternative {
		{
			g1 | r4 d g a |
		}
		{
			g1~ | g2. r4 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% part "A"
	Some -- where there's mu -- sic, __
	how faint the tune! __
	Some -- where there's heav -- en, __
	How High The Moon! __
	There is no moon a -- bove when love is far __ a -- way too, __
	'till __ it comes true __
	that you love me as I love you.
	%% part "B"
	Some -- where there's mu -- sic, __
	it's where you are. __
	Some -- where there's heav -- en, __
	how near, how far! __
	The dark -- est night would shine if you would come __ to me soon. __
	Un -- til you will, how still my heart,
	How High The Moon!
	%% Volta
	Some -- where there's
	Moon! __
}
% endif
