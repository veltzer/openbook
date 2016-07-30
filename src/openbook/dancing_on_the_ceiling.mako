<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	# from the real book
	attributes['title']='Dancing on the Ceiling'
	attributes['style']='Jazz'
	# from the real book
	attributes['composer']='Richard Rodgers'
	# from the real book
	attributes['poet']='Lorenz Hart'
	# my own
	attributes['piece']='Swing'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='2f047dae-e00d-11e3-98f7-03db92494d62'
	attributes['structure']='AABA'
	attributes['location']='rbk1:102'

	attributes['idyoutuberemark1']='Frank in a cannonical version'
	attributes['idyoutube1']='C406rXlRT6c'
	attributes['idyoutuberemark2']='Ella in a great version'
	attributes['idyoutube2']='qzBld5uHTiw'
	attributes['lyricsurl']='http://www.lorenzhart.org/ceilingsng.htm'
%>
% endif

% if part=='Doc':
	DONE:
	- added an epdf for the real book.
	- added the meta data from the real book.
	- added the lyrics url.
	- added the tunes structure.
	- put in the real book chords.
	- put in the real book tune.
	- put in the real book lyrics.
	- made sure the real book chords are good.
	- made sure the real book melody is right.
	- made sure the real book lyrics are good
	- made sure the real book version sounds fine.
	- add youtube performances.
	TODO:
	- add copyright notice.
	- add another version of this tune.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f1:maj7 | f:7.5+ | bes2:maj7 b:dim | a:m7 aes:dim | \myEndLine
		g:m7 c:7 | a:m7.5- d:7.9- | g:m7 c:7 | f1:6 | \myEndLine
	}
	\endPart

	\myMark "B"
	\startPart
	g:m7 | c:7 | f:maj7 | a2:m7.5- d:7 | \myEndLine
	g1:m7 | c:7 | a2:m7.5- d:7 | g:m7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1:maj7 | f:7.5+ | bes2:maj7 b:dim | a:m7 aes:dim | \myEndLine
	g1:m7 | c:7 | f | \mark \markup { \italic { Fine } } \LPC g2:m7 \RPC c:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

	%% part "A"
	\repeat volta 2 {
		r4 c d e | f g a2 | g4. f8 e4 d | c' c b!2 |
		bes!2. c4 | a1 | g2. a4 | f1 |
	}

	%% part "B"
	r4 g g g | g8 g g a f4 g | a r c c~ | c1 |
	r4 g g g | g8 g a a f4 g | a r c c~ | c1 |

	%% part "A"
	r4 c, d e | f g a2 | g4. f8 e4 d | c' c b!2 |
	bes!2 d~ | d e, | f1~ | f4 r r2 |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

	%% part "A"
	He dan -- ces o -- ver -- head
	on the ceil -- ing near my bed
	in my sight
	through the night

	%% part "B"
	I whis -- per "\"go" a -- way my lo -- ver it's not "fair\"" __
	but I'm so grate -- ful to dis -- co -- ver he's till there __

	%% part "A"
	lo -- ve my ceil -- ing more
	since it is a dan -- cing floor
	just for __ my love __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	I tried to hide in vain
	un -- der -- neath my coun -- ter -- pane
	there's my love up a -- bove
}
% endif
