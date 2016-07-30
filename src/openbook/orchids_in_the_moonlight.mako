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

	# from the fake book
	attributes['title']='Orchids In The Moonlight'
	# from the fake book
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Vincent Youmans'
	# from the fake book
	attributes['poet']='Gus Kahn, Edward Eliscu'
	# from the fake book
	attributes['piece']='With a Tango Beat'
	# from the fake book
	attributes['copyright']='1933 by T.B. Harms Co.'
	# from the fake book
	attributes['copyrightextra']='Copyright Renewed, assigned to Chappell & Co., Inc (Intersong Music, Publisher) and T.B. Harms Co. (c/o The Welk Music Group, Santa Monica, CA 90401) for the U.S.A. only. Rights outside controlled by T.B. Harms Co.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='ba3d8788-10f7-11e4-b63c-8397db34c0b9'
	attributes['structure']='ABA'
	attributes['structureremark']='Each A part is the 16 bars where the first 4 of every half are the same'
	attributes['location']='jfb:292'

	attributes['idyoutuberemark1']='Excellent piano arrangement'
	attributes['idyoutube1']='2LEah90aDmA'
	attributes['idyoutuberemark2']='Classic tango vocal version'
	attributes['idyoutube2']='WuD8XmCza5U'
	attributes['lyricsurl']='http://lyricsplayground.com/alpha/songs/o/orchidsinthemoonlight.shtml'
%>
% endif

% if part=='Doc':
	DONE:
	- added the fake book epdf.
	- filled in the meta data from the fake book.
	- put in the tunes structure.
	- wrote down the fake book chords.
	- wrote down the fake book lyrics.
	- wrote down the fake book tune.
	- check the fake book chords.
	- check the fake book tune.
	- check the fake book lyrics.
	- played the midi to hear that it sounds right.
	- added youtube performances.
	TODO:
	- get another version in here (from where?)
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f1:m | des2 f1.:m | c1:7 | \myEndLine
	c:7 | g2:m7.5- c1.:7 | f1:m | \myEndLine
	f:m | des2 f:m | f1:7 | bes:m | \myEndLine
	bes:m | f1:m | c:7 | f4:m c:7 f2:m | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	f2 f4:dim c:7 | f1. f2:6 | c1:7 | \myEndLine
	c1*3:7 | f2. fis4:dim | \myEndLine
	c2:7 f4:dim c:7 | f1. f2:7 | bes1 | \myEndLine
	bes | des:7 | f2 f4:dim c:7 | f4 c:7 f2 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Moderato" 4 = 108
	\time 4/4
	\key f \minor

	%% part "A"
	r8 f f g aes4 g8 f | des'2 c~ | c8 c c des ees4 des8 c | e!1 |
	r8 bes bes c des4 c8 bes | f'2 e!2~ | e8 c c des ees!4 des8 c | f1 |
	r8 f, f g aes4 g8 f | des'2 c~ | c8 c c des ees4 des8 c | f1 |
	r8 des ees f~ f ees des bes | r c des ees~ ees des c aes | r bes c des~ des bes g e! | f4 r r2^\markup { \italic { Fine } } |

	%% part "B"
	\key f \major
	r4 c8 a' aes4 bes,8 g' | f2 c~ | c4 f8 a c4. c8 | c1 |
	r4 bes8 a bes c4 bes8 | a4 gis8 g gis a4 gis8 | g!4 fis8 f fis g4 e8 | c2. r4 |
	r c8 a' aes4 bes,8 g' | f2 c~ | c8 f a c f4. f8 | f1 |
	r4 d8 cis d e4 d8 | des4 des8 c des ees4 des8 | c4 c,8 a' aes4 bes,8 g' | f2. r4^\markup { \italic { D.C. al Fine } } |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	When or -- chids bloom in the moon -- light __ and lov -- ers vow to be true;
	I still can dream in the moon -- light, __ of one dear night that we knew.
	When or -- chids fade in the dawn -- ing, __ they speak of tears and "\"Good" -- "bye!\""
	Tho' my dreams __ are shat -- tered, like the pet -- als scat -- tered, still my love __ can nev -- er die.

	%% part "B"
	There is peace in the twi -- light, __ when the day is thru,
	but the shad -- own that fall on -- ly seem to re -- call all my long -- ing for you.
	There's a dream in the moon -- beams, __ up on the sea of blue;
	but the moon -- beams that fall, on -- ly seem to re -- call, love is all, love is you.
}
% endif
