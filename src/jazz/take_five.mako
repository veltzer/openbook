<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=False
	attributes['render']="Fake"

	attributes['title']="Take Five"
	attributes['style']="Jazz"
	attributes['composer']="Paul Desmond"
	attributes['poet']=""
	attributes['piece']="Moderately"
	attributes['copyright']="1960 (Renewed) Desmond Music Company (U.S.A.) and Derry Music Company (Canada)"
	attributes['copyrightextra']=""
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

	\partial 2
	s2
	\myMark "A"
	\startPart
	d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 |
	d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 |
	\endPart
	\myMark "B"
	\startPart
	bes2. c2:7 | a2.:m7 d2:m | g2.:m7 c2:7 | f2. f2:7 |
	bes2. c2:7 | a2.:m7 d2:m | g2.:m7 c2:7 | e2.:m7 a2:7 |
	\endPart
	\myMark "A"
	\startPart
	d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 |
	d2.:m a2:m7 | d2.:m a2:m7 | d2.:m a2:m7 | d2.:m d2:m |
	\endPart
	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	%% \tempo "Andante Moderato" 4 = 88
	\time 5/4
	\key d \minor
	\partial 2
	a,8 d f g |
	%% part "A"
	gis a gis g f4 a, c | d2. \times 2/3 { e16 f e } d8 c4 | d2. \times 2/3 { c16 d c } a8 g4 | a2.~ a8 d f g |
	gis a gis g f4 a, c | d2. \times 2/3 { e16 f e } d8 c4 | d2. \times 2/3 { c16 d c } a8 g4 | a2.~ a2 |
	%% part "B"
	d'8 f4 d8 bes4 g8 a bes b | c e4 c8 a4 f8 g gis a | bes8 d4 bes8 g4 e8 f g gis | a gis a bes c4 c8 b c cis |
	d8 f4 d8 bes4 g8 a bes b | c e4 c8 a4 f8 g gis a | bes8 d4 bes8 g4 e8 g c bes | a2. a,8 d f g |
	%% part "A"
	gis a gis g f4 a, c | d2. \times 2/3 { e16 f e } d8 c4 | d2. \times 2/3 { c16 d c } a8 g4 | a2.~ a8 d f g |
	gis a gis g f4 a, c | d2. \times 2/3 { c16 d c } a8 g4 | a2. \times 2/3 { e'16 f e } d8 c4 | d2.~ d2 |

}
% endif
