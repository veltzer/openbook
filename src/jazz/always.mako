<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="Always"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['composer']="Irving Berlin"
	# this is from the fake book
	attributes['poet']="Irving Berlin"
	# this is from the fake book
	attributes['piece']="Valse Moderato"
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
	\repeat volta 2 {
		f2. | f | f | f | c:7 | c:7 | f | f \myEndLine
		| f | f2 f4:7 | a2. | a | e:7 | e:7 | \myEndLine
		a | c:7 | f | f | f:7 | f:7 | d:7 | d:7 \myEndLine
		| c4:m g2:m | g2.:m | g:m | bes:m | f | \myEndLine
		g:9 | c:7 | c:7 |
	} \alternative {
		{
			f | c:7 |
		}
		{
			f | f |
		}
	}
	\endPart

	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Andante" 4 = 88
	\time 3/4
	\key f \major

	\repeat volta 2 {
		%% part "A"
		c,4. d8 f g | a2. | c4 a2~ | a2. | c,4. d8 e f | g2. |
		a4 f2~ | f2. | c4. d8 f g | a2. | e4. fis8 a b | cis2. | e,4. fis8 gis b |
		d2. | cis4 a2 | a4 g2 | c,4. d8 f g | a2. | c4 a2~ | a2. |
		d,4. e8 fis a | d2. | es4 d2~ | d2. | bes4. a8 g a | bes2. | a4. g8 f g |
		a2. | g4. f8 e f | g2 c,4 |
	} \alternative {
		{
			a'4 f2~ | f4 r r |
		}
		{
			a4 f2~ | f2. |
		}
	}

}
% endif

% if part=='LyricsFake':
\lyricmode {
	I'll be lov -- ing you, al -- ways __ with a love that's true,
	al -- ways __ When the things you've planned Need a help -- ing hand, I will un -- der --
	stand, al -- ways, al -- ways. Days may not be fair, al -- ways __
	That's when I'll be there, al -- ways. __ Not for just and hour, not for just a
	day, Not for just a year, But

	al -- ways. __

	al -- ways. __
}
% endif
