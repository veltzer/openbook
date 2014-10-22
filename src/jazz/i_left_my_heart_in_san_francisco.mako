<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']='I Left My Heart In San Francisco'
	attributes['style']='Jazz'
	attributes['composer']='Geroge Cory'
	attributes['poet']='Douglass Cross'
	attributes['piece']='Slowly'
	attributes['copyright']='1954 General Music Publishing Co., Inc.'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='5a23cc08-da7f-11e3-8c45-c30fe9a88e5b'
	attributes['structure']='ABA\'C'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- mark what has been done to this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startSong
	\startChords

	\partial 2. s2. |

	\myMark "A"
	\startPart
	bes1 | d2:m7 cis:dim7 | c1:m7 | c:m7 |
	c:m7 | c2:m7/f f:7.5+ | bes1 |
	\endPart

	\myMark "B"
	\startPart
	bes2 c4:m7 cis:dim7 | bes1 | d2:m7 cis:dim7 | d1:m7 | d2:m7 d:7.9- |
	g1:m7 | c2:9 c:7.9- | f:9 b:dim7 | c:m7 f:7 |
	\endPart

	\myMark "A'"
	\startPart
	bes1 | d2:m7 cis:dim7 | c1:m7 |
	c:m7 | f:9 | f2:9 ees:9 | d1:7 |
	\endPart

	\myMark "C"
	\startPart
	d:7 | g2.:7.5+ g4:9 | g1:9 |
	c2. g4:m7 | c1:9 | c:m7 | c2:m7/f f:7.9- | bes2:6 aes4:6.9 a:6.9 | bes1:6.9 |
	\endPart

	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
\relative {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Andante Moderato" 4 = 88
	\time 4/4
	\key bes \major

	d4 ees g | f1 | r4 g a4. bes8 | g c,4.~ c4 r | r c b c | g'1 | r4 bes a4. f8 |
	d2 r | r4 d ees e | f8 ees4 d16 ees f2~ | f4 r r g | a8 g4 f16 g a2~ | a4 a gis4. a8 |
	bes1~ | bes4 c a4. c,8 | f2 r4 g8 f | ees4 r8 d ees4 g | f1 | r4 g a bes | g8 c,4.~ c4 r |
	r c b c | a'1~ | a4 a bes c | d1 | r4 d cis4. d8 | ees2. d4 | b2 c4 d |
	c g2. | r4 g fis g | ees'2. g,4 | d'2 d | bes1~ | bes4 r r2 |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	I Left My Heart In San Fran -- cis -- co, __ high on a hill, it calls to
	me. To be where lit -- tle ca -- ble cars __ climb half -- way to the stars! __ to morn -- ing
	fog __ may chill the air I don't care! My love waits there in San Fran -- cis -- co, __
	a -- bove the blue __ and wind -- y sea. When I come home to you San Fran -- cis-- co your gold -- en sun will sine for me. __
}
% endif
