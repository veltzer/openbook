<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	version['doLyricsmoremore']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	attributes['title']='Blue Bossa'
	attributes['style']='Jazz'
	attributes['composer']='Kenny Dorham'
	attributes['poet']='Joan Cartwright'
	attributes['piece']='Bossa Nova'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='f7fdc5e0-db41-11e0-a31c-0019d11e5a41'
	attributes['structure']='A'
	attributes['location']='rbk1:51'
	# from the real book
	attributes['remark']='Play last 4 bars twice more to end'

	attributes['idyoutube1']='EhQfGODnvww'
	attributes['idyoutube2']='-0mNSP1452o'
	attributes['idyoutube3']='6sr7BXinJMw'
	attributes['idyoutube4']='lKEEVECH58Q'
	attributes['lyricsurl']='http://fyicomminc.bizland.com/music/lyrics/bluebossa.htm'
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book edpf.
	TODO:
	- get another version in here (is there a fake book version?!?).
	- mark what's been done to this tune.
	- document the youtube performances.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\repeat volta 3 {

		\myMark "A"
		\startPart
		c1*2:m7 | f:m7 | \myEndLine
		d1:m7.5- | g:7 | c1*2:m7 | \myEndLine
		ees1:m7 | aes:7 | des1*2:maj | \myEndLine
		d1:m7.5- | g:7 |
	} \alternative {
		{
			c1:m7 | d2:m7.5- g:7 | \myEndLineVoltaNotLast
		}
		{
			c1:m7 | c:m7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 150
	\time 4/4
	\key c \minor

	\partial 4 g'4 |

	%% part "A"
	\repeat volta 3 {
		g'4. f8 ees d4 c8~ | c2. bes4 | aes2 g'4. f8~ | f1 |
		f4. ees8 d c4 bes8~ | bes2. aes4 | g2 f'4. ees8~ | ees1 |
		ees4. des8 c bes4 aes8~ | aes2. ges4 | ges f8 bes~ bes f aes4~ | aes1 |
		aes4 g8 bes~ bes2 | aes4 g8 bes~ bes4. aes8 |
	} \alternative
	{
		{
			g1~ | g2. g4 |
		}
		{
			g1~ | g2. r4 |
		}
	}
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the internet adjusted for the real book.
\lyricmode {

	%% part "A"
	A place in -- side my heart __
	Is where you live __
	Mem -- ories of our start __
	The love you give __

	Days when we're a -- lone __
	And you are in my arms __
	The_blue -- ness of the_true -- ness of our love __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	_ Nights of moon -- lit skies __
	A gen -- tle kiss __
	Some -- thing in your eyes __
	Fills me with bliss __

	Hold me in your arms __
	And then I will re -- call __
	The_blue -- ness of the_true -- ness of our love __

	The
}
% endif

% if part=='LyricsmoremoreReal':
\lyricmode {

	%% part "A"
	The thought of how we met __
	Still lin -- gers on __
	How can I for -- get __
	That mag -- ic dawn __

	All the warm de -- sire __
	The fi -- re in your touch __
	The_blue -- ness of the_true -- ness of our love __
}
% endif
