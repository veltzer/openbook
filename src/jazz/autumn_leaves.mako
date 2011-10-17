<%page args="part"/>
% if part=='Vars':
<%
	attributes['type']="harmony_tune_lyricsmore"
	attributes['render']="Real"

	attributes['title']="Autumn Leaves"
	attributes['subtitle']="Les Feuilles Mortes"
	attributes['composer']="Joseph Kosma"
	attributes['copyright']="1947, 1950, 1987 Enoch Et Cie. Renewed 1975, 1978 Enoch Et Cie"
	attributes['copyrightextra']="Sole Selling Agent for U.S.A (including it's territories and possessions) and Dominion of Canada: Morley Music Co., by arrangement with Enoch Et Cie. International Copyright Secured. All Rights Reserved."
	attributes['poet']="Jacques Prevert, Johnny Mercer"
	attributes['style']="Jazz"
	attributes['piece']="Medium Swing"

	attributes['completion']="5"
	attributes['uuid']="8c35acf6-a7c1-11df-9040-0019d11e5a41"
	attributes['idyoutube']="mRhVI7cpcS4"
	attributes['idyoutube']="io1o1Hwpo8Y"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- I remarked the \myEndLine at the first finish of the volta to save
	lines. Should we have a more general mechanism for this?
	- document the youtube performances.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords

	\startSong

	\partial 2. r2. |

	\mark "A"
	\startPart
	\repeat volta 2 {
		a1:m7 | d:7 | g:maj7 | c:maj7 | \myEndLine
		fis:m7.5- |
	} \alternative {
		{
			b:7 | e:m | e:m | %%\myEndLine
		}
		{
			b:7 | e:m | e:m | \myEndLine
		}
	}
	\endPart

	\mark "B"
	\startPart
	fis:m7.5- | b:7.9- | e:m | e:m | \myEndLine
	a:m7 | d:7 | g:maj7 | g:maj7 | \myEndLine
	fis:m7.5- | b:7.9- | e2:m7 ees:7 | d:m7 des:7 | \myEndLine
	c1:maj7 | b:7.9- | e:m | e:m | \myEndLine
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
	The fall -- ing leaves __ drift by the win -- dow, __
	The Au -- tumn Leaves, __ of red and gold.
	I see your

	_ I used to hold.

	Since you went a -- way __ the days grow long, __
	And soon I'll hear __ old win -- ter's song. __
	But I miss you most of all my dar -- ling, __
	When Au -- tumn Leaves start to fall.

	The fall -- ing
}
% endif

% if part=='LyricsRealmore':
\lyricmode {
	_ _ _ lips, __ the sum -- mer kiss -- es,
	The sun -- burned hands __
}
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords

	\startSong

	\partial 2. r2. |

	\mark "A"
	\startPart
	a1:m7 | d:7 | g:maj7 | c:maj7 | \myEndLine
	fis:m7.5- | b:7 | e:m | e:m | \myEndLine
	a1:m7 | d:7 | g:maj7 | c:maj7 | \myEndLine
	fis:m7.5- | b:7 | e2:m a:m | e1:m | \myEndLine
	\endPart

	\mark "B"
	\startPart
	fis:m7.5- | b:7 | e:m | e:m | \myEndLine
	a:m7 | d:7 | g:maj7 | e:7.9- | \myEndLine
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

	%% bar 1
	c1~ | c4 d, e fis | b2 b~ | b4 c, d e |
	a1~ | a4 b, cis dis | g1 | r4 e fis g |
	c1~ | c4 d, e fis | b2 b~ | b4 c, d e |
	a1~ | a4 fis a g | e1~ | e4 r dis e |

	%% bar 17
	fis b, fis'2~ | fis4 fis e fis | g1~ | g4 g fis g |
	a1~ | a4 d, d'4. c8 | b1~ | b4 r ais b |
	c c a a | fis2. c'4 | b2 b~ | b e, |
	a2. g4 | fis2 g4 b, | e1~ | e4 r r2 |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	The fall -- ing leaves __ drift by the win -- dow, __
	The Au -- tumn Leaves, __ of red and gold.
	I see your lips, __ the sum -- mer kiss -- es,
	The sun -- burned hands __ I used to hold.

	Since you went a -- way __ the days grow long, __
	And soon I'll hear __ old win -- ter's song. __
	But I miss you most of all my dar -- ling, __
	When Au -- tumn Leaves start to fall. __
}
% endif
