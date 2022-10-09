<%page args='part'/>
% if part=='Vars':
<%
	from scripts import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.add_version('Fake', version)
	attributes.set_default_version_name('Fake')

	attributes['title']='Quiet Nights Of Quiet Stars'
	attributes['style']='Jazz'
	# from the fake book
	attributes['subtitle']='Corcovado'
	# from the fake book
	attributes['composer']='Antonio Carlos Jobim'
	# from the fake book
	attributes['poet']='Antonio Carlos Jobim, Gene Lees'
	# from the fake book
	attributes['piece']='Moderately Slow'
	# from the fake book
	attributes['copyright']='1962, 1964 by Antonio Carlos Jobim, Brazil'
	# from the fake book
	attributes['copyrightextra']='Sole Selling Agent DUCHESS MUSIC CORPORATION (MCA), New York, NY for all English Speaking Countries'

	attributes['typesetter']='Mark Veltzer <mark.veltzer@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='f8098732-7367-11e5-bffe-3860779cb560'
	attributes['structure']='AA\''
	attributes['location']='jfb:309'

	attributes['idyoutuberemark1']='Jobim in Portugese'
	attributes['idyoutube1']='6_F7MX1hGtU'
	attributes['idyoutuberemark2']='Frank Sinatra with Jobim'
	attributes['idyoutube2']='mCI65SsOhb8'
	attributes['lyricsurl']='http://www.azlyrics.com/lyrics/franksinatra/quietnightsofquietstarscorcovado.html'
%>
% endif

% if part=='Doc':
	DONE:
	- put in location in the fake book.
	- put in the tunes meta data from the fake book.
	- put in the tunes structure.
	- put in the fake book chords.
	- put in the fake book lyrics.
	- put in the fake book tune.
	- check the fake book chords.
	- check the fake book tune.
	- check the fake book lyrics.
	- heard the tune to make sure it sounds good.
	- added you tube performances.
	- added a lyrics url.
	TODO:
	- add another version of this tune.

% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	d1*2:9 | aes:dim7 | \myEndLine
	g1:m7 | c8*5:7 ges4.:7 | f2:dim7 f:maj7 | f1:maj7 | \myEndLine
	f:m7 | bes:13 | e:m7 | a:7.5+ | \myEndLine
	d:9 | d2.:9 d4:m7 | d2.:m7 aes4:dim7 | aes1:dim7 | \myEndLine
	\endPart

	\myMark "A'"
	\startPart
	d1*2:9 | aes:dim7 | \myEndLine
	g1:m7 | c8*5:7 ges4.:7 | f2:dim7 f:maj7 | f1:maj7 | \myEndLine
	f:m7 | bes:7.5- | e:m7 | a:m7 | \myEndLine
	d:m7 | g:7.9- | e:m7 | a:7.5+ | \myEndLine
	d:m7 | g:9 | c1*2:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key c \major

	%% part "A"
	r8 e4 d8 e d4 e8~ | e d e2. | r8 e4 d8 e d4 e8~ | e d e2. |
	r8 d4 c8 d c4 d8~ | d c4 f8~ f e4 e8~ | e4. d8~ d2~ | d2. r4 |
	r8 g4 f8 g f4 g8~ | g f4 g8~ g2 | r8 f4 e8 f e4 f8~ | f e f2. |
	r8 e4 d8 e d4 e8~ | e d4 e8~ e d f4~ | f8 e4 f8 e4 f~| f8 e4 d8~ d c4. |

	%% part "A'"
	r8 e4 d8 e d4 e8~ | e d4 e8~ e2 | r8 e4 d8 e d4 e8~ | e d e4~ e8 g4 d8~ |
	d2 \tuplet 3/2 { c4 d c } | d8 c4 f8~ f e4 e8~ | e4. d8~ d2~ | d2. r4 |
	r8 c'4 bes8~ bes aes g f | e4. d8~ d2 | r4 r8 b' a g f e | d4. c8~ c2 |
	r4 r8 a' g f e d | c b4 c8~ c d4 g8~ | g1~ | g2 r |
	r4 r8 a g f e d | c b4 c8~ c d4 c8~ | c1~ | c2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Qui -- et Nights Of Qui -- et Stars,
	qui -- et chords from my __ gui -- tar
	float -- ing on the si -- lence that __ sur -- rounds __ us. __
	Qui -- et thoughts and qui -- et dreas, __
	qui -- et walks by qui -- et streams,
	and a win -- dow look -- ing on __ the moun -- tains and the sea. __
	How love -- ly!

	%% part "A'"
	This is where I want __ to be. __
	Here, with you so close __ to me __
	un -- til __ the fin -- al flick -- er of __ life's em -- ber. __
	I, who __ was lost and lone -- ly, __
	be -- liev -- ing life was on -- ly __
	a bit -- ter tra -- gic joke, have found __ with you, __
	the mean -- ing of ex -- ist -- ence.
	Oh, __ my love. __
}
% endif
