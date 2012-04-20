<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['render']="My"

	attributes['title']="Symphony 2"
	attributes['subtitle']="Allegretto"
	attributes['composer']="Ludwig van Beethoven"
	attributes['copyright']="Public Domain"
	attributes['style']="Classical"
	attributes['remark']="Extracted by ear as a training exercise"

	attributes['completion']="5"
	attributes['uuid']="d5e32c7a-854b-11e1-96fa-2b2b01073991"
	attributes['idyoutube']=""
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\startPart
	a2:m e:7 | e:7 a:m | a:m c | g:7 c |
	\repeat volta 2 {
		c b:7 | d a | a:m e:7 | e:7 a:m |
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceMy':
\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Adagio" 4 = 70
	\time 4/4
	\key a \minor

	c2 b | b16 c d4 c16 b b4 c | c4 c8 d dis e e4 | d16 e f4 e16 d d8 e e4 |
	\repeat volta 2 {
		g4 g8 a b4 b | fis fis8 gis a4 a | e e8 e e4 e | e fis8 gis a2 |
	}
}
% endif
