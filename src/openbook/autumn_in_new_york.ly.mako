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

	attributes['title']='Autumn In New York'
	attributes['style']='Jazz'
	# from the hal leonard book
	attributes['composer']='Vernon Duke'
	attributes['poet']='Vernon Duke'
	# this is from the hal leonard book.
	attributes['piece']='Brightly'
	# from the hal leonard book
	attributes['copyright']='1934 by Kay Duke Music.'
	attributes['copyrightextra']='Copyright Renewed. All Rights Administered by BMG Songs, Inc.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='9677b522-7463-11e1-a57d-bbc28ffad085'
	attributes['structure']='ABAC'
	attributes['structureremark']='I determined it was ABAC although the part A does not repeat exactly. It is good enough'
	attributes['location']='rbk1:33,hlrjb:34'

	attributes['idyoutuberemark1']='Virtuoso Sonny Stitt'
	attributes['idyoutube1']='Nn11v07Db3s'
	attributes['idyoutuberemark2']='The classic Billie Holiday...'
	attributes['idyoutube2']='cl_e7UW-bz8'
	attributes['lyricsurl']='http://www.sing365.com/music/lyric.nsf/Autumn-in-New-York-lyrics-Frank-Sinatra/C779DB117665DFD94825691F00067AD0'
%>
% endif

% if part=='Doc':
	DONE:
	- filled out basic details.
	- filled in lyrics url.
	- filled in the tunes structure.
	- filled in more meta data from the hal leonard version.
	- added the real book epdf.
	- entered the real book chords.
	- entered the real book tune.
	- entered the real book lyrics.
	- checked the real book chords.
	- checked the real book tune.
	- checked the real book lyrics.
	- heard the real book version and it sounds good.
	- adjusted the speed of the real book version.
	- added the hal leonard epdf.
	- added performances on you tube.
	TODO:
	- how do I mention the beat of the chords when it's confusing?
		(consider the a2:m7 d4:7 des4:7 in the tune where the sheet
		music does NOT SHOW the fact that the a minor is two beats and
		each of the following chords are on one beat).
		Document this issue in the lilyponds hints file.
	- how do I enter french keys? As in the words of the song 'rou -- es'
		(the e is supposed to be a french e)
	- how do I united two exact lyrics? Look at the hal leonard lyrical
		ending of this songs and see how he joins the two lyrics
		versions... Document this.
	- do the hal leonard epdf.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	g2:m7 a:m7 | bes:6 c:7 | f:maj7 g:m7 | a:m7 d:7.9- | \myEndLine
	g:m7 a:m7 | bes:6 c:7 | a1:m7.5- | d:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	g:m7 | bes2:m7 ees:7 | aes1.:maj7 d2:m7.5- | \myEndLine
	c1:m7 | d2:m7 g:7.9- | c1:maj7 | c2.:7 c4:7.5+ | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2:m7 a:m7 | bes:6 c:7 | f:maj7 g:m7 | a:m7 d4:7.9- des:7 | \myEndLine
	c2:m7 d:m7 | ees:m6 f:7 | bes:m6 aes:m7 | ges1:7 | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	f2:m7 c:7 | f:m aes:7 | des:maj7 aes:7 | des2.:maj7 aes4:7 | \myEndLine
	g2:m7 a:m7 | bes:m6 c:7.9- | f1*2:m | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Andante" 4 = 76
	\time 4/4
	\key f \major

	%% part "A"
	a'8 g f d c2 | r8 d f bes d d4 c8 | d2 a | r1 |
	a8 g f d c2 | r8 d f bes d d4 c8 | d2 a | r1 |

	%% part "B"
	c8 c4 a8 a4. f8 | aes8 aes4 f8 ees4. des8 | ees b4 c8 ees2~ | ees f |
	g8 d4 ees8 g2~ | g b | g1~ | g2. gis4 |

	%% part "A"
	a8 g! f d c2 | r8 d f bes d d4 c8 | d2 a | r1 |
	d8 c bes g f2~ | f8 ges bes c des ees4 c8 | des1~ | des2. r4 |

	%% part "C"
	c8 aes4 c8 e4 e | c2. bes4 | aes8 f4 aes8 c4 c | aes2. aes4 |
	a!8 g f d c2~ | c8 bes des f aes bes4 g8 | f1 | r1 |
}
% endif

% if part=='LyricsReal':
%% lyrics are taken from the fake book and adjusted for the real one
\lyricmode {

	%% part "A"
	Au -- tumn In New York,
	why does it seem so in -- vit -- ing?
	Au -- tumn In New York,
	it spells the thrill of first night -- ing.

	%% part "B"
	Glit -- ter -- ing crowds and shim -- mer -- ing clouds
	in can -- yons of steel, __
	they're mak -- ing me feel __
	I'm home. __

	%% part "A"
	It's Au -- tumn In New York,
	that brings the pro -- mise of new love;
	Au -- tumn In New York __
	is of -- ten min -- gled with pain. __

	%% part "C"
	Dream -- ers with emp -- ty hands
	may sigh for ex -- ot -- ic lands;
	It's Au -- tumn In New York, __
	it's good to live it a -- gain.
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	Au -- tumn In New York,
	the gleam -- ing roof -- tops at sun -- down.
	Au -- tumn In New York,
	it lifts you up when you're run -- down.

	%% part "B"
	Jad -- ed rou -- es and gay di -- vor -- cees
	who lunch at the Ritz __
	will tell you that "\"it's" __
	di -- "vine!\"" __

	%% part "A"
	This Au -- tumn In New York,
	trans -- forms the slums in -- to May -- fair;
	Au -- tumn In New York, __
	you'll need no cas -- tles in Spain. __

	%% part "C"
	Lov -- ers that bless the dark
	on bench -- es in Cen -- tral Park
	greet Au -- tumn In New York, __
	it's good to live it a -- gain.
}
% endif
