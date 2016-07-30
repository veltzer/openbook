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

	# this is from the fake book
	attributes['title']='Strang Fruit'
	attributes['style']='Jazz'
	# this is from the fake book
	attributes['composer']='Lewis Allan'
	# this is from the fake book
	attributes['poet']='Lewis Allan'
	# this is from the fake book
	attributes['piece']='Andante Moderato'
	# this is from the fake book
	attributes['copyright']='1940 by Edward B. Marks Music Company. Copyright Renewed.'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='68679a0a-da80-11e3-8208-4fcd89557297'
	attributes['structure']='A'
	attributes['location']='jfb:364'

	attributes['idyoutuberemark1']='Nina Simon version'
	attributes['idyoutube1']='ughAVo2ZAag'
	attributes['idyoutuberemark2']='The famous version by Billie Holiday'
	attributes['idyoutube2']='h4ZyuULy9zs'
	attributes['lyricsurl']='http://www.lyricsfreak.com/b/billie+holiday/strange+fruit_20017859.html'
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the meta data from the fake book.
	- brought the fake book epdf.
	- filled in the structure.
	- filled in the fake book lyrics.
	- filled in the fake book chords.
	- filled in the fake book tune.
	- check the fake book chords.
	- check the fake book tune.
	- check the fake book lyrics.
	- check that the tune sounds well and the tempo is well adjusted.
	- added youtube performances.
	- added lyrics url.
	TODO:
	- do another version of this tune.
	REMARKS:
	- In the 6th bar Fake Book has d:m7.9- for the first measure, second system here, but I
	think the a (fifth) should be flat to match the melody so d:m7.5 (JE)
% endif

% if part=='ChordsFake':
\chordmode {
	\startSong
	\startChords

	\myMark "A"
	\startPart
	c1:m | g2:7.5+ g:7 | c1:m | g:7 | \myEndLine
	d2:m7.5- g:7.9- | d:m7.9- g:7 | c:m g:7 | c1:m | \myEndLine
	c2:m g:7/d | c:m/ees c:m | c1:m | \myEndLine
	c2:m g:7/d | c:m/ees c:m | c:m d:m7.5- | g1:7.9- | \myEndLine
	c2:m g:7 | c:m g:7 | g:7.9-/f g:7.9-/d | g:7.9-/b g:7.9- | g1:7.9- | \myEndLine
	c2:m c:m/bes | aes:maj7 g:7 | d:m7.5- g:7 | d:m7.5- g:7 | \myEndLine
	c1:m | d:m7.5- | c2:m/g g:7 | \myEndLine
	c1:m | g2:7 des:6.9 | c:m g:7 | c1:m | \myEndLine
	\endPart

	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
{
	\tempo "Andante Moderato" 4 = 88
	\time 4/4
	\key c \minor

	%% part "A"
	c4 c c c8 c | ees2 d | \tuplet 3/2 { c4 c c } c c | \tuplet 3/2 { d d d } d2 |
	d4 d8 d f f f f | aes^"Piu mosso (a little faster)" aes g2. | c,4 c b8 b b b | c c4 c8~ c2 |
	ees4 c d b | c g g2 | ees' d |
	\tuplet 3/2 { ees'4 c ees } \tuplet 3/2 { d b d } | c4. g8 g4. b,8 | c4. c8 c4 c8 c | d4. d8 d2 |
	\tuplet 3/2 { ees'4 c ees } \tuplet 3/2 { d b d } | \tuplet 3/2 { c bes! aes } g4 d8 d | d4 d f f | aes aes b r | r1 |
	c,4 c8 c c4 c8 c | ees4 ees d d8 d | d4 d f8 f f f | aes4 aes g g8 g |
	g4 g g g8 g | bes4 bes aes r | ees2 d |
	c4 c8 c c4 c | ees8 d4. g2 | ees4 ( c d b | c1 ) |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	South -- ern trees bear a strange fruit, blood on the leaves and blood at the root, black bod -- y swing -- ing in the
	south -- ern breeze; Strange Fruit hang -- ing from the pop -- lar trees. __ \markup \italic (Humming) __ _ _ _ _ _ _ _ _
	Pas -- tor -- al scene of the gal -- lant South, the bulg -- ing eyes and the twist -- ed mouth; scent of mag -- no -- _ lia
	sweet __ _ and fresh, and the sud -- den smell of burn -- ing flesh! Here is the fruit for the
	crows to pluck, for the rain to gath -- er, for the wind to suck, for the sun to rot, for the tree to drop.
	\markup \italic (Hum) __ _ Here is a strange and bit -- ter crop. \markup \italic (Hum) __
}
% endif
