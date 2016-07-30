<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	# Sorry for all the slashes. They have to be escaped by mako and then
	# still escaped for Lilypond
	attributes['title']='Take the \'A\' Train'
	attributes['style']='Jazz'
	# this is from the fake book
	attributes['composer']='Billy Strayhorn, The Delta Rhythm Boys'
	# this is from wikipedia
	attributes['poet']='Joya Sherrill'
	# this is from the fake book
	attributes['piece']='Easy Swing'
	# this is from the fake book
	attributes['copyright']='1941 and 1943 by Tempo Music, Inc. Copyright Renewed 1969'
	# this is from the fake book
	attributes['copyrightextra']='International Copyright Secured Made in U.S.A. All Rights Reserved'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='8e4bc138-da80-11e3-a96b-032e06c074f3'
	attributes['structure']='AABA'
	attributes['location']='jfb:379'

	attributes['idyoutuberemark1']='Original version by Duke'
	attributes['idyoutube1']='cb2w2m1JmCY'
	attributes['idyoutuberemark2']='Mingus and Dolphy together?!?'
	attributes['idyoutube2']='YuCbQCnoIzI'
	attributes['lyricsurl']='http://www.metrolyrics.com/take-the-a-train-lyrics-ella-fitzgerald.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the fake book.
	- put in the tunes structure
	- added the meta data from the fake book.
	- put in the chords (fakebook).
	- put in the lyrics (fakebook).
	- put in the tune (fakebook).
	- check the chords (fakebook).
	- check the tune (fakebook).
	- check the lyrics (fakebook).
	- heard the tune to check that it is right and adjust the tempo.
	- added lyrics url.
	- added youtube performances.
	TODO:
	- how do I add the small notes at the last bar?
	- add another version of this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		c1*2:6 | d:7.5- | \myEndLine
		d1:m7 | g:7 | c |
	} \alternative {
		{
			c | \myEndLineVoltaNotLast
		}
		{
			c | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	f1*4:maj7 | \myEndLine
	d1*2:7 | d2:m9 g:9 | g:9 des:9 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c1*2:6 | d:7.5- | \myEndLine
	d1:m7 | g:7 | c8 c:7/e f4 aes2:7/ges | c4/g g:9 c:6 c:maj7.9 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 168
	\time 4/4
	\key c \major

	%% part "A"
	\repeat volta 2 {
		g'1~ | g8 e'4. g,4 c | e8 aes,~ aes2.~ | aes1 |
		a! | a8 bes b e g, fis f cis' | c! e,~ e2.~ |
	} \alternative {
		{
			e1 |
		}
		{
			e2\repeatTie r |
		}
	}

	%% part "B"
	a8 c~ c2. | e8 f,4. a4 c | e8 a,4.~ a2~ | a1 |
	a8 c~ c2. | e4 fis, a c | e8 a,~ a2.~ | a2 aes |

	%% part "A"
	g1~ | g8 e'4. g,4 c | e8 aes,~ aes2.~ | aes1 |
	a! | a8 bes b e g, fis f cis' | c! e,~ e2.~ | e2 r2 |
	%% These small cue notes were in the fake book, but splitting the voices
	%% breaks the tie from the previous measure. Maybe some can find a fix?
	%%<< { \teeny g8 a_\markup { \italic "(Instrumental)" } b c~ c4 c, } \\ { \normalsize e2 r2 } >> |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	You __ must take the "\"A\"" Train __ To go to Sug -- ar Hill way up in Har -- lem. __
	_

	%% part "B"
	Hur -- ry, __ get on now it's com -- ing. __ Lis -- ten __ to those rails a --
	thrum -- ming. __ All

	%% part "A"
	'board! __ Get on the "\"A\"" Train, __ soon
	you will be on Sug -- ar Hill in Har -- lem. __
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {

	%% part "A"
	If __ you miss the "\"A\"" Train, __ You'll find you've missed the quick -- est way to Har -- lem. __
}
% endif
