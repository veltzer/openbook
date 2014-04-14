<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="Red Sails In The Sunset"
	attributes['style']="Jazz"
	attributes['composer']="Hugh Williams"
	attributes['poet']="Jimmy Kennedy"
	attributes['piece']="Slowly"
	# this is from the fake book
	attributes['copyright']="1935 The Peter Maurice Music Co. Ltd, London England"
	attributes['copyrightextra']="United Sates Copyright Renewed andAssigned to Sharpiro Bernstein & Co., Inc."
	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"
	attributes['location']=""

	attributes['completion']="5"
	attributes['uuid']=""
	attributes['structure']=""

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {
		\myMark "A"
		\startPart
		g1 | g1 | c2 c:m6 | g1 | g2 gis:dim7 | a2:m7 d:7 |
		a:m7 d:7 | g1 |
		\endPart
		\myMark "A"
		\startPart
		g1 | g1 | c2 c:m6 | g1 | g2 gis:dim7 | a2:m7 d:7 |
		a:m7 d:7 | g1 |
		\endPart
		\myMark "B"
		\startPart
		c2 c:m6 | g1 |
		d:7 | g | c2 c:m6 | g1 | a:7 | a2:m7 d:7 |
		\endPart
		\myMark "A"
		\startPart
		g1 | g1 | c2 c:m6 | g1 | g2 gis:dim7 |
		a2:m7 d:7 | a:m7 d:7 |
		\endPart
	} \alternative {
		{
			g2 a4:m7 d:7 |
		}
		{
			g1 |
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c'' {
	\time 2/2
	\key g \major
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	%% \tempo "Moderato" 4 = 100

	\repeat volta 2 {
		%% A part
		r4 b \times 2/3 { b c b } | d d2. | r4 g, \times 2/3 { g a g } | b1 | r4 d, \times 2/3 { d e d } | a' a2. |
		r4 a \times 2/3 { a g fis } | g1 |
		%% A part
		r4 b \times 2/3 { b c b } | d d2. | r4 g, \times 2/3 { g a g } | b1 | r4 d, \times 2/3 { d e d } | a' a2. |
		r4 a \times 2/3 { a g fis } | g1 |
		%% B part
		a2 \times 2/3 { g4 a g } | e d2. |
		r4 a' \times 2/3 { a g e } | g1 | a2 \times 2/3 { g4 a g } | e d2. | r8 b' b b b a4 g8 | a1 |
		%% A part
		r4 b \times 2/3 { b c b } | d d2. | r4 g, \times 2/3 { g a g } | b1 | r4 d, \times 2/3 { d e d } | a' a2. |
		r4 a \times 2/3 { a g fis } |
	} \alternative {
		{
			g2 r |
		}
		{
			g1 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% A part
	Red Sails In The Sun -- set way out on the sea. oh! ca -- ry my loved one
	home safe -- ly to me.


	%% A part
	He sailed at the dawn -- ing. all day I've been blue.
	Red Sails In The Sun -- set I'm trust -- ing in you.
	%% B part
	Swift wings you must bor -- row, make stright for the shore.
	We mar -- ry to -- mor -- row and he goes sail -- ing no more.

	%% A part
	Red Sails In The Sun -- set way out on the sea, oh! car -- ry my loved one home safe -- ly to me.

	me.
}
% endif
