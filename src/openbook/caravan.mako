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

	attributes['title']='Caravan'
	attributes['style']='Jazz'
	# this is from the new real book, volume III
	attributes['composer']='Duke Ellington, Juan Tizol'
	# this is from the new real book, volume III
	attributes['poet']='Irving Mills'
	# this is from the new real book, volume III
	attributes['piece']='Bright Latin and Swing'
	# this is from the new real book, volume III
	attributes['copyright']='1937 (renewed 1965) Mills Music c/o EMI Music Publishing'
	# this is from the new real book, volume III
	attributes['copyrightextra']='Used by Permission of CPP/Belwin, Inc., Miami, FL ALL Right Reserved'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='160af5b0-ebe1-11e2-937c-bb8193c610fc'
	# my own (the structure in the new real book claims ABC which is totally wrong)
	attributes['structure']='AABA'
	attributes['location']='nrbk3:73'

	attributes['idyoutuberemark1']='A great performance by Ella'
	attributes['idyoutube1']='s4VjltPMfds'
	attributes['idyoutuberemark2']='Jazz messengers with an intro by Blakey'
	attributes['idyoutube2']='eP12RhmBIRw'
	attributes['lyricsurl']='http://www.metrolyrics.com/caravan-lyrics-ella-fitzgerald.html'
%>
% endif

% if part=='Doc':
	DONE:
	- put in the chords.
	- put in the lyrics from the internet.
	- put in the melody.
	- checked the melody.
	- put in youtube performances.
	- put in lyrics url.
	- put in the lyrics from ella.
	- checked the lyrics of ella.
	- checked the lyrics from the internet.
	- checked the chords.
	- added the location in the real book
	TODO:
	- do the style marking which are now in remark. If you enable them they will not
	be seen since there is little room for them without stepping over the "A", "B"
	rehersal markings.
	- put the alternate chords from the (how do I do that?!?)
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	%%\mark "Bright Latin"
	\startPart
	\repeat volta 2 {
		c1*4:7 | \myEndLine
		c1*4:7 | \myEndLine
		c1*4:7 | \myEndLine
		f1*4:m6 | \myEndLine
	}
	%% so I would see the repeat marks
	%%\endPart

	\myMark "B"
	%%\mark "Swing"
	\startPart
	f1*4:9 | \myEndLine
	bes1*4:9 | \myEndLine
	ees1*4:7 | \myEndLine
	aes1*2:6 | c1*2:7 | \myEndLine
	\endPart

	\myMark "A"
	%%\mark "Bright Latin"
	\startPart
	c1*4:7 | \myEndLine
	c1*4:7 | \myEndLine
	c1*4:7 | \myEndLine
	f1*4:m6 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Prestissimo" 4 = 220
	\time 2/2
	\key f \minor

	%% part "A"
	\repeat volta 2 {
		c'1~ | c~ | c4 des c g | bes c e g, |
		bes1~ | bes~ | bes4 c des c | des c b g |
		bes!1~ | bes~ | bes4 c b bes | a aes g ges |
		f1~ | f~ | f | r |
	}

	%% part "B"
	f'1 | d2 c4. g8~ | g1~ | g4. f8 e4-. f-. |
	c'1 | g2 f4. c8~ | c1 | r2 bes'8 c des d |
	ees1 | c2 bes4. f8~ | f1~ | f2 g4-. ees-. |
	c'4. aes8~ aes2~ | aes bes4-. aes-. | g2 g4. g8~ | g2 r |

	%% part "A"
	c1~ | c~ | c4 des c g | bes c e g, |
	bes1~ | bes~ | bes4 c des c | des c b g |
	bes!1~ | bes~ | bes4 c b bes | a aes g ges |
	f1~ | f~ | f | r |
}
% endif

% if part=='LyricsInet':
%% these lyrics are from the Internet and adjusted for this tune...
\lyricmode {

	%% part "A"
	Night __ and stars ab -- ove that shine so bright __
	The mys -- t'ry of their fa -- ding light __
	That shines u -- pon our Ca -- ra -- van __

	%% part "B"
	This is so exciting, __ _ _ _
	you are so inviting __ _ _ _ _
	Res -- ting in my_arms __
	As I thrill to the magic charms __ _ _

	%% part "A"
	Of_you be -- side me here, be -- neath the blue __
	My dream of love is com -- ing true __
	With -- in our de -- sert Ca -- ra -- van __
}
% endif

% if part=='LyricsmoreInet':
\lyricmode {

	%% part "A"
	Sleep __ u -- pon my shou -- lder as we creep __
	Ac -- ross the sand so I may keep __
	This mem -- 'ry of our Ca -- ra -- van __
}
% endif

% if part=='LyricsReal':
%% these lyrics are from the Ella Firtgerald performance and adjusted for this tune...
\lyricmode {

	%% part "A"
	Night __ and stars that shine ab -- ove so bright __
	The ma -- gic of their fa -- ding light __
	That shines u -- pon our Ca -- ra -- van __

	%% part "B"
	You are so exciting, __ _ _ _
	This is so inviting __ _ _ _ _
	Res -- ting in my_arms __
	As I thrill to the magic charms __ _ _

	%% part "A"
	Of_you be -- side me here, be -- neath the blue __
	My dream of love is com -- ing true __
	With -- in our de -- sert Ca -- ra -- van __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	Sleep __ u -- pon my shou -- lder as we creep __
	Ac -- ross the sand so I may keep __
	This mem -- 'ry of our Ca -- ra -- van __
}
% endif
