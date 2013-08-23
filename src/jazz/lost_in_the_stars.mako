<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="Lost In The Stars"
	attributes['style']="Jazz"
	attributes['composer']="Kurt Weill"
	attributes['poet']="Maxwell Anderson"
	attributes['piece']="Moderately"
	attributes['copyright']="1946 Chappell & Co., Inc"
	attributes['copyrightextra']="Renewed Chappell & Co., Inc. & TRO-Hampshire House"
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

	\partial 8
	s8
	\myMark "A"
	\startPart
	g2. bes:dim7 | d:7/a d:7 | g e:7.5+ | a:m7 d:7.9- |
	g c:maj7 | g1 | g2:/b bes:dim7 | a:m7 d:7 |

	g2. bes:dim7 | d:7/a d:7 | g e:7.5+ | a:m7 d:7.9- |
	g c:maj7 | g e:7 | a:7 d:7 | g1 |
	c:m7 f:7 | bes g:m7 | g:m7.5- f:7 | bes g:m7 |
	c:m7 f:7 | bes g:m7 | g:m7.5- f4:7 f:7.5+ | e:7 ees2:7 d4:7 |

	g2 bes:dim7 | d:7/a d:7 | g e:7.5+ | a2. c:m6 |
	g1 | c:m6 | g | c:m6 |
	d2:7 a4:m7 d:7 | g1 | e2:m7 ees:7 | g bes:dim7 |
	d:7/a a4:m7 d:7 | g1 | e2:m7 ees:7 | g bes:dim7 |
	d:7/a d;7 | g ees:7 | g1:6 |
	\endPart
	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Andante Moderato" 4 = 88
	\time 4/4
	\key g \minor
	\partial 8
	cis8 | e4 d g cis,8 cis | e4 d8 d a'4 r8 cis, | e4 d8 d c'4 b8 c | b4 a8 gis a4 b8 c |
	d8 b8 g e d'4 c8 | c4 b b r8 d, | e4 e8 e e4 fis8 g | a2. cis,8 cis |
	e4 d g8 g cis, cis | e4 d a' r8 cis,16 cis | e8 e d4 c' b8 c | b4 a8 gis a4 b8 c |
	d4 b8 g e d'4 c8 | c4 b8. ais16 b4 r8 d,16 b | e8 e e4 a4. g8 | g2. g8 g |
	bes4 bes bes a8 g | f4. d8 bes4 c8 d | ees4 ees ees bes8 c | d4. d8 d4 r8 g |
	bes4 bes8 bes a4 g | f8. f16 f8 d bes4 c8 d | ees4 ees8 ees d4 cis | d2.

}
% endif

% if part=='LyricsFake':
\lyricmode {

}
% endif
