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

	attributes['title']='Easy Living'
	attributes['style']='Jazz'
	# this is from the real book
	attributes['composer']='Ralph Rainger, Leo Robin'
	# this is from the real book
	attributes['poet']='Ralph Rainger, Leo Robin'
	# this is from the real book
	attributes['piece']='Med'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='c5019d6a-88cc-11e4-8336-3860779cb560'
	attributes['structure']='AABA'
	attributes['location']='rbk1:129'

	attributes['idyoutuberemark1']='Ella Fitzgerald with Joe Pass on Guitar'
	attributes['idyoutube1']='6vYIHpxuxp4'
	attributes['idyoutuberemark2']='The incredible Bill Evans'
	attributes['idyoutube2']='T0ZwAJAgBFM'
	attributes['lyricsurl']='http://www.lyricsfreak.com/b/billie+holiday/easy+living_20017912.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added the real book location.
	- added the meta data from the real book.
	- wrote down the tunes structure.
	- added the real book chords.
	- added the real book tune.
	- added the real book lyrics.
	- added lyrics url.
	- added you tube performances.
	- check the real book chords.
	- check the real book tune.
	TODO:
	- check the real book lyrics.
	- heard the real book version to make sure it sounds ok and is in good pace.
	- add the fake book version.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f2:maj7 fis:dim7 | g:m7 gis:dim7 | f:maj7/a c4:m7 f:7 | bes2:maj7 ees:7 | \myEndLine
		f:maj7 d:m7 |
	} \alternative {
		{
			g:m7 c:7 | a:7.5+ d:9 | g:7.5+ c:9 | \myEndLineVolta
		}
		{
			g:m7 c:7.9- | f bes:7 | ees:m7 aes:7 | \myEndLineVolta
		}
	}
	\endPart

	\myMark "B"
	\startPart
	des:maj7 bes:m7 | ees:m7 aes4:7 aes:7/ges | f2:m7 bes:7 | ees:m7 aes:7 | \myEndLine
	des:maj7 des/c | bes:m7 bes:m7/aes | g1:m7.5- | c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f2:maj7 fis:dim7 | g:m7 gis:dim7 | f:maj7/a c4:m7 f:7 | bes2:maj7 ees:7 | \myEndLine
	f:maj7 d:m7 | g:m7 c:7.9- | f \LPC aes:7 | des:maj7 \RPC c:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Moderato" 4 = 108
	\time 4/4
	\key f \major

	%% part "A"
	\repeat volta 2 {
		\tuplet 3/2 { a'4 d c } ees,2 | r8 d g bes d f4 e8 | \tuplet 3/2 { b4 d c } f,2 | r8 d f a c4. bes8 |
		\tuplet 3/2 { a4 g' f } a,4. e'8 |
	} \alternative {
		{
			d4 bes8 d, a'4 g | a1~ | a |
		}
		{
			d4 bes8 d, a'4 a8 f~ | f1~ | f2. f4 |
		}
	}

	%% part "B"
	aes1 | \tuplet 3/2 { ees'4 f fes } \tuplet 3/2 { ees c bes } | aes1 | e'!8 f e f ees4 c8 bes |
	aes2 \tuplet 3/2 { aes4 f aes } | bes2 \tuplet 3/2 { bes4 g bes } | c2 d | g8 e d c gis2 |

	%% part "A"
	\tuplet 3/2 { a4 d c } ees,2 | r8 d g bes d f4 e8 | \tuplet 3/2 { b4 d c } f,2 | r8 d f a c4. bes8 |
	\tuplet 3/2 { a4 g' f } a,4. e'8 | d4 bes8 d, a'4 a8 f~ | f1~ | f |
}
% endif

% if part=='LyricsReal':
\lyricmode {

	%% part "A"
	Li -- ving for you is ea -- sy li -- ving
	It's ea -- sy to live when you're in love
	And I'm so in love
	There is nothing in life but you __
	_ _ _ _ _ _

	%% part "B"
	For you may -- be I'm_a fool
	But it's fun
	Peo -- ple say you rule me with one wave of your hand
	Dar -- ling, it's grand
	They just don't un -- der -- stand

	%% part "A"
	Li -- ving for you is ea -- sy li -- ving
	It's ea -- sy to live when you're in love
	And I'm so in love
	There is nothing in life but you __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	I ne -- ver_reg -- ret the years that I'm giving
	They're ea -- sy to give when you're in love
	I'm hap -- py to do
	what -- _ _ _ _ _ _ ev -- er I do for you __
}

% endif
