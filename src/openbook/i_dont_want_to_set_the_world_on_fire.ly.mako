<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']='I Don\'t Want To Set The World On Fire'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Eddie Seiler, Sol Marcus, Bennie Benjamin'
	# from the fake book
	attributes['poet']='Eddie Seiler, Sol Marcus, Bennie Benjamin'
	# from the fake book
	attributes['piece']='Moderately'
	# from the fake book
	attributes['copyright']='1940 by Bergman, Vocco, & Conn, Inc.'
	# from the fake book
	attributes['copyrightextra']='Copyright Renewed, Benjamin & Marcus interests assigned to Bennie Benjamin Music, Inc. (Intersong Music, Publisher)'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='5a3efd64-70b7-11e5-bcb5-3860779cb560'
	attributes['structure']='AABA'
	attributes['location']='jfb:156'

	attributes['idyoutuberemark1']='Fats Domino classic version'
	attributes['idyoutube1']='olF-OnbDM3w'
	attributes['idyoutuberemark2']='Betty Carter version'
	attributes['idyoutube2']='gbDYyzvc9Kc'
	attributes['lyricsurl']='http://www.lyricsmode.com/lyrics/t/the_ink_spots/i_dont_want_to_set_the_world_on_fire.html'
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the meta data from the fake book
	- added epdf for the fake book.
	- put in the tunes structure.
	- added the fake book chords.
	- added the fake book tune.
	- added the fake book lyrics.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- heard the tune to make sure it sounds ok.
	- add youtube urls.
	- add lyrics url.
	TODO:
	- add another version of this tune from somewhere.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		f1 | f2:/a aes:dim7 | g1:m | g2:m bes:m | \myEndLine
		c1:7 | g2:m9 c:7 | a:7 d:7 | g:7 c:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		f1 | f2:/a aes:dim7 | g1:m | g2:m bes:m | \myEndLine
		c1:7 | g2:m9 c:7 | f2 ees4:6 e:6 | f1:6 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		c2:m7 f:7 | c:m7 f:7 | bes1*2:maj7 | \myEndLine
		d2:m g:7 | d:m g:7 | d:m g:7 | c:7 c:7.5+ | \myEndLine
		\endPart

		\myMark "A"
		f1 | f2:/a aes:dim7 | g1:m | g2:m bes:m | \myEndLine
		c1:7 | g2:m9 c:7 |
		\startPart
	} \alternative {
		{
			f aes:dim7 | g:m c:7 | \myEndLineVoltaNotLast
		}
		{
			f1*2 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key f \major

	\repeat volta 2 {

		%% part "A"
		a'4 c c,8. d16 f8. a16 | c2 ces | bes4 d2.~ | d2 bes |
		a8. c16 a8 c~ c2 | r4 a c8. cis16 d8 a~ | a1~ | a1 |

		%% part "A"
		a4 c c,8. d16 f8. a16 | c2 ces | bes4 d2.~ | d2 bes |
		a8. c16 a8 c~ c2 | r4 a c8. cis16 d8 f,~ | f1~ | f2. f4 |

		%% part "B"
		g8. g16 g8 d'~ d d4 f,8 | g8. g16 g8 d'~ d2 | c8. c16 bes8. bes16 a8. a16 d8. d16 | a2. g4 |
		a8. a16 a8 e'~ e e4 g,8 | a8. a16 a8 e'~ e2 | d8. cis16 d8. cis16 d8. cis16 \tuplet 3/2 { d8 dis e~ } | e4 d8 a~ a aes4. |

		%% part "A"
		a4 c c,8. d16 f8. a16 | c2 ces | bes4 d2.~ | d2 bes |
		a8. c16 a8 c~ c2 | r4 a c8. cis16 d8 f,~ |
	} \alternative {
		{
			f1 | r |
		}
		{
			f~ | f2. r4 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	I Don't Want To Set The World On Fire __ _
	I just want to start __
	a flame in your heart __

	%% part "A"
	In my heart I have but one de -- sire __ _
	and that one is you __
	no oth -- er will do. __

	%% part "B"
	I've lost all am -- bi -- tion for world -- ly ac -- claim
	I just want to be the one you love
	and with your ad -- mis -- sion that you feel the same. __
	I'll have reached the goal I'm dream -- ing of __
	be -- lieve __ me!

	%% part "A"
	I Don't Want To Set The World On Fire __ _
	I just want to start __
	a flame in your heart __
}
% endif
