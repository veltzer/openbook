<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="Nice Work If You Can Get It"
	attributes['title']="(From \\\"A Damsel In Distress\\\")"
	attributes['style']="Jazz"
	attributes['composer']="George Gershwin"
	attributes['poet']="Ira Gershwin"
	attributes['piece']="Moderately"
	attributes['copyright']="1937 Gershwin Publishing Corp."
	attributes['copyrightextra']="Copyright Renewed, Assigned to Chappell & Co. Inc."
	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"

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
	\startSong
	\startChords

	\myMark "A"
	\startPart
	b2:7 e:7 | a:7 d:7 | g:7 c:7 | a:7 a:7.9- | g1/d |
	a2:m g/b | c4:6 g/b bes:dim7 a:m7 | g1 |
	\endPart
	\myMark "A"
	\startPart
	b2:7 e:7 | a:7 d:7 | g:7 c:7 | a:7 a:7.9- | g1/d |
	a2:m g/b | c4:6 g/b bes:dim7 a:m7 | g1 |
	\endPart
	\myMark "B"
	\startPart
	e1:m | c:9 | e:m7 | a:7 |
	d2:m d:m/f | a:7/e a:7 | a1:m7 d2:7.5+ d:7.5+/c |
	\endPart
	\myMark "A"
	\startPart
	b2:7 e:7 | a:7 d:7 | g:7 c:7 | a:7 a:7.9- | g1/d |
	a2:m g/b | f:7 e:7 | a:m7 a4:m/d d:7.5+ | g2 ees4:7 d:7 | g1:6 |
	\endPart
	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	%% \tempo "Andante Moderato" 4 = 88
	\time 2/2
	\key g \major
	b4 c c b | a b2. | g4 a a g | fis1 | d4. e8~ e8. d16 e8. g16 |
	a8 b4. r8. d,16 e8. g16 | a8 b4. g4 g8 g~ | g2. r4 |

	b4 c c b | a b2. | g4 a \times 2/3 { a4 gis g } | fis1 | d4. e8~ e8. d16 e8. g16 |
	a8 b4. r8. d,16 e8. g16 | a8 b4. g4 g8 g~ | g1 |

	r8 b4 g8 b4 g | ais4. g8~ g2 | b8. b16 b,8. b16 e8 g4. | fis1 |
	r8 a4 fis8 a4 fis | a4. a8~ a4 a8. b16 | d4 d d8. e16 b4 | ais1 |

	b4 c c b | a b2. | g4 a \times 2/3 { a4 gis g } | fis1 | d4. e8~ e8. d16 e8. g16 |
	a8 b4. r8. d,16 e8. g16 | a8 b4.~ b2 | d4 b g e | g1~ | g2. r4 |

}
% endif

% if part=='LyricsFake':
\lyricmode {
	Hold -- ing hands at mid -- night 'neath a star -- y sky. Nice Work __ If You Can
	Get it, and you can get it if you try. __ Stroll -- ing with the one girl,
	sigh -- ing sigh aft -- er sign, Nice Work __ If You Can Get It, and you can ge tit if you try. __
	Just im -- ag -- ine some -- one __ wait -- ing at the cot -- tage door,
	where two hearts be -- come one. __ Who could ask for an -- y thing more? Lov -- ing one who
	loves you, and then tak -- ing that vow, Nice Work __ If You Can Get It, and if you
	get it, __ won't you tell me how? __
}
% endif
