<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Fake"

	# Sorry for all the slashes. They have to be escaped by mako and then
	# still escaped for Lilypond
	attributes['title']="Take the \\\"A\\\" Train"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['composer']="Billy Strayhorn, The Delta Rhythm Boys"
	attributes['poet']=""
	# this is from the fake book
	attributes['piece']="Easy Swing"
	# this is from the fake book
	attributes['copyright']="1941 and 1943 Tempo Music. Inc. Renewed 1969"
	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"
	attributes['copyrightextra']=""

	attributes['completion']="5"
	attributes['uuid']=""
	attributes['structure']="AABA"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
	c1:6 | c:6 | d:7.5- | d:7.5- | d:m7 | g:7 | c |
	} \alternative {
		{
			c |
		}
		{
			c |
		}
	}
	\endPart

	\myMark "B"
	\startPart
	f1:maj7 | f:maj7 | f:maj7 | f:maj7 | d:7 | d:7 |
	d2:m9 g:9 | g:9 des:9 |
	\endPart

	\myMark "A"
	\startPart
	c1:6 | c:6 | d:7.5- | d:7.5- | d:m7 | g:7 | c8 c:7/e f4 aes2:7/g | c4/g g:9 c:6 c:maj7.9
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	%%\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

	%% A part
	\repeat volta 2 {
		g1~ | g8 e'4. g,4 c | e8 aes,~ aes2.~ | aes1 | a? | a8 bes b e g, fis f cis' | c? e,~ e2.~ |
	} \alternative {
		{
			e1
		}
		{
			e2\repeatTie r |
		}
	}
	%% B part
	a8 c~ c2. | e8 f,4. a4 c e8 a,4.~ a2~ | a1 | a8 c~ c2. | e4 fis, a c |
	e8 a,~ a2.~ | a2 aes |

	%% A part
	g1~ | g8 e'4. g,4 c | e8 aes,~ aes2.~ | aes1 | a? |
	a8 bes b e g, fis f cis' | c? e,~ e2.~ |
	e2 r2 |
	%% These small cue notes were in the fake book, but splitting the voices
	%% breaks the tie from the previous measure. Maybe some can find a fix?
	%%<< { \teeny g8 a_\markup { \italic "(Instrumental)" } b c~ c4 c, } \\ { \normalsize e2 r2 } >> |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% part "A"
	%% Volta
	You __ must take the "\"A\"" Train, __ To go to Sug -- ar Hill way up in Har -- lem. __
	_
	%% part "B"
	Hur -- ry, get on now it's com -- ing. __ Lis -- ten __ to those rails a --
	thrum -- ming. __ All
	%% part "A"
	'board! __ Get on the "\"A\"" Train, __ soon
	you will be on Sug -- ar Hill in Har -- lem. __

}
% endif

% if part=='LyricsmoreFake':
\lyricmode {
	If you __ miss the "\"A\"" Train, __ You'll find you've missed the quick -- est way to Har -- lem. __
}
% endif
