<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="Prelude To A Kiss"
	attributes['style']="Jazz"
	attributes['composer']="Duke Ellington"
	attributes['poet']="Irving Gordon and Irving Mills"
	attributes['piece']="Slowly"
	attributes['copyright']=""
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

	\myMark "A"
	\startPart
	d2:9 g:7.5+ | c:9 f:maj7 | b:7 e:7 | a:7 d:m |
	d:m7 g:7 | c d:7 d:m7 g:7.9- | c a:7 |
	\endPart
	\myMark "A"
	\startPart
	d2:9 g:7.5+ | c:9 f:maj7 | b:7 e:7 | a:7 d:m |
	d:m7 g:7 | c d:7 d:m7 g:7.9- | c1 |
	\endPart
	\myMark "B"
	\startPart
	e2 cis:m | fis:m7 b:7 | e2 cis:m | fis:m7 b:7 | e2 cis:m |
	fis:m7 b:7 | e4. a:7 d4:9 |
	d:m7 dis:m7 e:m7 a:7.9- |
	\endPart
	\myMark "A"
	d2:9 g:7.5+ | c:9 f:maj7 | b:7 e:7 | a:7 d:m |
	d:m7 g:7 | c d:7 d:m7 g:7.9- | c1 |
	\endPart
	\startPart
	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	%% \tempo "Andante Moderato" 4 = 88
	\time 4/4
	\key c \major
	%% part "A"
	b4 bes a gis | g a8 e~ \times 2/3 { e4 f g } | gis4 g fis f | e f8 d~ d2 |
	\times 2/3 { g4 g g } \times 2/3 { g gis a } | c,4 d'8 b~ b2 | d,8 e f gis~ gis4 gis8 a~ | a2. r4 |
	%% part "A"
	b4 bes a gis | g a8 e~ \times 2/3 { e4 f g } | gis4 g fis f | e f8 d~ d2 |
	\times 2/3 { g4 g g } \times 2/3 { g gis a } | c,4 d'8 b~ b2 | d,8 e f gis~ gis4 a8 c,~ | c2. r4 |
	%% part "B"
	r4 ais'8 b dis, e dis' cis | b a c,2 cis4 | r fis8 fis fis4 e |
	r4 a8 a a2 | r4 ais8 b dis, e dis' cis | b a c,2 cis4 | e8 e4 e8~ e4 e8 e |
	g4 gis a ais |
	%% part "A"
	b4 bes a gis | g a8 e~ \times 2/3 { e4 f g } | gis4 g fis f | e f8 d~ d4 d |
	\times 2/3 { g4 g g } \times 2/3 { g gis a } | c,4 d'8 b~ b2 | d,8 e f gis~ gis4 a8 c,~ | c1 |

}
% endif

% if part=='LyricsFake':
\lyricmode {
	If you hear a song in blue __ like a flow -- er cry -- ing for the dew __
	that was my heart ser -- e -- nad -- ing you __ my Pre -- lude To A Kiss. __ If you hear a
	song that grows from my ten -- der sen -- ti -- men -- tal woes __ That was my heart try -- ing to com -- pose __
	a Pre -- lude To A Kiss. __ Though it's just a sim -- ple mel -- o -- dy with noth -- ing fan -- cy,
	noth -- ing much you could turn it to a sym -- pho -- ny a Schu -- bert tune __ with a
	Gersh -- win touch. Oh! How my love song gen -- tly cries __ for the ten -- der -- ness with --
	in your eyes __ my love is a pre -- lude that nev -- er dies __ a Pre -- lude To A Kiss. __
}
% endif
