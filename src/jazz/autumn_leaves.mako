<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Real"

	attributes['title']="Autumn Leaves"
	attributes['style']="Jazz"
	attributes['subtitle']="Les Feuilles Mortes"
	attributes['composer']="Joseph Kosma"
	attributes['copyright']="1947, 1950, 1987 Enoch Et Cie. Renewed 1975, 1978 Enoch Et Cie"
	attributes['copyrightextra']="Sole Selling Agent for U.S.A (including its territories and possessions) and Dominion of Canada: Morley Music Co., by arrangement with Enoch Et Cie. International Copyright Secured. All Rights Reserved."
	attributes['poet']="Jacques Prevert, Johnny Mercer"
	# this is from the fake book.
	attributes['piece']="Medium Swing"
	# this is from the real book
	attributes['piece']="Med. Jazz"

	attributes['completion']="5"
	attributes['uuid']="8c35acf6-a7c1-11df-9040-0019d11e5a41"
	attributes['structure']="AAB"

	attributes['idyoutuberemark']="The great Bill Evans..."
	attributes['idyoutube']="mRhVI7cpcS4"
	attributes['idyoutuberemark']="Keith Jarret in a great performance"
	attributes['idyoutube']="io1o1Hwpo8Y"
	attributes['lyricsurl']="http://www.bluesforpeace.com/lyrics/autumn-leaves.htm"
%>
% endif

% if part=='Doc':
	DONE:
	- brought in epdf from the real book.
	- checked the chords in the real book version.
	- brought in epdf from the fake book.
	- put in the meta data.
	- checked the tune in the real book version.
	- checked the lyrics in the real book version.
	- heard the tune to make sure the rythm is right.
	- document the youtube performances.
	- add a lyrics url.
	TODO:
	- check the entire fake book version.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 2. s2. |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		a1:m7 | d:7 | g:maj7 | c:maj7 | \myEndLine
		fis:m7.5- |
	} \alternative {
		{
			b:7 | e1*2:m |
		}
		{
			b1:7 | e1*2:m | \myEndLine
		}
	}
	\endPart

	\myMark "B"
	\startPart
	fis1:m7.5- | b:7.9- | e1*2:m | \myEndLine
	a1:m7 | d:7 | g1*2:maj7 | \myEndLine
	fis1:m7.5- | b:7.9- | e2:m7 ees:7 | d:m7 des:7 | \myEndLine
	c1:maj7 | b:7.9- | e1*2:m | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative e' {
	\time 4/4
	\key e \minor
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130

	\partial 2. e4 fis g |
	%% part A
	\repeat volta 2 {
		c1~ | c4 d, e fis | b2 b~ | b4 c, d e |
		a1~ |
	} \alternative {
		{
			a4 b, cis dis | g1 | r4 e fis g |
		}
		{
			a4 fis a g | e1~ | e4 r dis e |
		}
	}

	%% part B
	fis b, fis'2~ | fis4 fis e fis | g1~ | g4 g fis g |
	a1~ | a4 d, d' c | b1~ | b4 r ais b |
	c c a a | fis2. c'4 | b2 b~ | b2. e,4 |
	a2. g4 | fis2 g4 b, | e1 | r4 <\parenthesize e> <\parenthesize fis> <\parenthesize g> |
}
% endif

% if part=='LyricsReal':
%% lyrics are taken from the fake book and adjusted for the real one
\lyricmode {
	%% A part
	The fall -- ing leaves __ drift by the win -- dow, __
	The Au -- tumn Leaves, __ of red and gold.
	I see your

	_ I used to hold.

	%% B part
	Since you went a -- way __ the days grow long, __
	And soon I'll hear __ old win -- ter's song. __
	But I miss you most of all my dar -- ling, __
	When Au -- tumn Leaves start to fall.

	The fall -- ing
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	%% A part
	_ _ _ lips, __ the sum -- mer kiss -- es, __
	The sun -- burned hands __
}
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 2. s2. |

	\myMark "A"
	\startPart
	a1:m7 | d:7 | g:maj7 | c:maj7 | \myEndLine
	fis:m7.5- | b:7 | e1*2:m | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	a1:m7 | d:7 | g:maj7 | c:maj7 | \myEndLine
	fis:m7.5- | b:7 | e2:m a:m | e1:m | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	fis:m7.5- | b:7 | e1*2:m | \myEndLine
	a1:m7 | d:7 | g:maj7 | e:7.9- | \myEndLine
	fis:m7.5- | b:7.9- | e2:m e:m/d | cis:m7.5- c:maj7 | \myEndLine
	fis1:m7.5- | b:7.9- | e2:m a:m | e1:m | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative e' {
	\time 4/4
	\key e \minor
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130

	\partial 2. e4 fis g |

	%% part "A"
	c1~ | c4 d, e fis | b2 b~ | b4 c, d e |
	a1~ | a4 b, cis dis | g1 | r4 e fis g |
	c1~ | c4 d, e fis | b2 b~ | b4 c, d e |
	a1~ | a4 fis a g | e1~ | e4 r dis e |

	%% part "B"
	fis b, fis'2~ | fis4 fis e fis | g1~ | g4 g fis g |
	a1~ | a4 d, d'4. c8 | b1~ | b4 r ais b |
	c c a a | fis2. c'4 | b2 b~ | b e, |
	a2. g4 | fis2 g4 b, | e1~ | e4 r r2 |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% A part
	The fall -- ing leaves __ drift by the win -- dow, __
	The Au -- tumn Leaves, __ of red and gold.
	%% A part
	I see your lips, __ the sum -- mer kiss -- es,
	The sun -- burned hands __ I used to hold.

	%% B part
	Since you went a -- way __ the days grow long, __
	And soon I'll hear __ old win -- ter's song. __
	But I miss you most of all my dar -- ling, __
	When Au -- tumn Leaves start to fall. __
}
% endif
