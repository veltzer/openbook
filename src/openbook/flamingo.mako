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

	attributes['title']='Flamingo'
	attributes['style']='Jazz'
	# this is from the fake book
	attributes['composer']='Ted Grouya'
	# this is from the fake book
	attributes['poet']='Ed Anderson'
	# this is from the fake book
	attributes['piece']='Slowly'
	# this is from the fake book
	attributes['copyright']='1941 Tempo Music, Inc.'
	attributes['copyrightextra']='Renewed 1969 Edwin H. Morris & Company, A Division of MPL Communications, Inc.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='be87a49a-1a05-11e1-ba9e-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='jfb:119'

	attributes['idyoutuberemark1']='Duke and his orchestra'
	attributes['idyoutube1']='XlmMzUMCIIg'
	attributes['idyoutuberemark2']='Petrucciani and Grappelli'
	attributes['idyoutube2']='oqR5hPjPM3o'
	attributes['lyricsurl']='http://lyricsplayground.com/alpha/songs/f/flamingo.shtml'
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the fake book epdf.
	- filled in the meta data from the fake book.
	- put in the tunes structure.
	- put in the fake book chords.
	- put in the fake book lyrics.
	- put in the fake book tune.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- played the fake book version to hear that it sounds well.
	- put in you tube performances with documentation.
	- put in a lyrics url.
	TODO:
	- add another version of this tune (from where?)
	REMARKS:
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f2:maj7 d:m7 | g:m7 c:7.5+ | f1:m7 | bes2:7 c:7.5+ | \myEndLine
		des1:7.9 | g2:m7 c4:7 c:7/bes | \myEndLine
	} \alternative {
		{
			a2:m7 d:7 | g:m7 c:7 | \myEndLineVoltaNotLast
		}
		{
			f bes:7.9 | f c4:m7 f:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	bes2:m bes:m7.7+ | bes:m7 ees:7.9 | aes1:6 | c2:m7.5- f:7 | \myEndLine
	bes:m7 ees:7 | bes:m7 bes:m7/aes | g1:m7 | c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f2:maj7 d:m7 | g:m7 c:7.5+ | f1:m7 | bes2:7 c:7.5+ | \myEndLine
	des1:7.9 | g2:m7 g:m7/c | f:maj7 bes:maj7 | f1:maj7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

	\partial 4 c4 |

	%% part "A"
	\repeat volta 2 {
		c'4. a8~ a2 | r4 bes8 c e4 d8 c | aes1 | r4 g8 aes c4 bes8 aes |
		f4 f2. | r4 f8 f g4 f8 g |
	} \alternative {
		{
			a1~ | a2 r4 c,4 |
		}
		{
			f1~ | f4 r r f |
		}
	}

	%% part "B"
	f'1 | r4 f8 f f4 ees8 des | ees4. ees8 aes2 | r4 ees8 ees~ ees4 des8 c |
	des4. des8 g2 | r4 des4 des c8 bes | c1~ | c2 r4 c,4 |

	%% part "A"
	c'4. a8~ a2 | r4 bes8 c e4 d8 c | aes1 | r4 g8 aes c4 bes8 aes |
	f4 f2. | r4 g \tuplet 3/2 { bes d f } | a1~ | a2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Fla -- min -- go, __
	like a flame in the sky,
	fly -- ing o -- ver the is -- land
	to my lov -- er near by. __
	%% Volta
	Fla
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {

	%% part "A"
	Fla -- min -- go, __
	in your trop -- i -- cal hue,
	speak of pas -- sion un -- dy -- ing
	and a love that is _ _ true. __

	%% part "B"
	The wind sings a song to you as you go,
	a song __ that I hear be -- low the mur -- mur -- ing palms. __

	%% part "A"
	Fla -- min -- go, __
	when the sun meets the sea,
	say fare -- well to my lov -- er
	and has -- ten to me. __
}
% endif
