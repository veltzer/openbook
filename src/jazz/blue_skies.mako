<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="Blue Skies"
	attributes['subtitle']=""
	attributes['style']="Jazz"
	attributes['composer']="Irving Berlin"
	attributes['poet']="Irving Berlin"
	attributes['piece']=""
	attributes['copyright']=""
	attributes['copyrightextra']=""
	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"

	attributes['completion']="5"
	attributes['uuid']=""
	attributes['structure']="ABAC"

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
	\startSong
	\startChords

	\myMark "A"
	\startPart
	a1:m | a:m/gis | a:m7/g | a:m/fis |
	c2:7 a:7.9- | d:m7 g:7 | c1:6 | b2:m7.5- e:7.9-.13- |
	\endPart
	\myMark "A"
	\startPart
	a1:m | a:m/gis | a:m7/g | a:m/fis |
	c2:7 a:7.9- | d:m7 g:7 | c1:6 | c:6 |
	\endPart
	\myMark "B"
	\startPart
	c1:6 | g2:sus7.9- c:6 | g2:sus7.9- c:6 | g2:7 c:6 |
	\endPart
	\myMark "B"
	\startPart
	c1:6 | g2:sus7.9- c:6 | g2:sus7.9- c:6 | g2:7 c:6 |
	\endPart
	\myMark "A"
	\startPart
	a1:m | a:m/gis | a:m7/g | a:m/fis |
	c2:7 a:7.9- | d:m7 g:7 | c1:6 | b2:m7.5- e:7.9-.13- |
	\endPart
	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	%%\tempo "Andante" 4 = 88
	\time 4/4
	\key a \minor

	a,2 e' | r d8 c d4 | e1 | r2 \times 2/3 { d4 c d } |
	e2 g, | r g8 a4. | c1~ | c |

	a2 e' | r d8 c d4 | e1 | r2 \times 2/3 { d4 c d } |
	e2 g, | r g8 a4. | c1~ | c |

	c8 d e f g2 | aes8 g f4 g2 | f8 e d4 e2 | d8 c b4 c2 |
	c8 d e f g2 | aes8 g f4 g2 | f8 e d4 e2 | \times 2/3 { d4 c b } c2 |

	a2 e' | r d8 c d4 | e1 | r2 \times 2/3 { d4 c d } |
	e2 g, | r g4 a4 | c1~ | c |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	Blue Skies smil -- ing at me, noth -- ing but blue skies do I see.
	Blue -- birds sing -- ing a song, noth -- ing but blue -- birds all day long.

	Nev -- er saw the sun shin -- ing so bright, nev -- er saw things go -- ing so right.
	Not -- ic -- ing the days hur -- ry -- ing by, when you're in love, my how they fly.

	Blue days all of them gone, noth -- ing but blue skies from now on.
}
% endif
