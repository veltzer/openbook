<%page args='part'/>
% if part=='Vars':
<%
	from scripts import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.add_version('Real', version)
	attributes.set_default_version_name('Real')

	attributes['title']='My Favorite Things'
	attributes['style']='Jazz'
	# this is from the fake book
	attributes['subtitle']='From \'The Sound Of Music\''
	# this is from the fake book
	attributes['composer']='Richard Rodgers'
	# this is from the fake book
	attributes['poet']='Oscar Hammerstein II'
	# this is from the fake book
	attributes['piece']='Lively, with spirit'
	# this is from the fake book
	attributes['copyright']='1959 by Richard Rodgers and Oscar Hammerstein II. Copyright Renewed.'
	# this is from the fake book
	attributes['copyrightextra']='Williamson Music Co., owner of publication and allied right throughout the Westen Hemisphere and Japan. All Rights Administered by Chappell & Co., Inc.'

	attributes['typesetter']='Mark Veltzer <mark.veltzer@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='02c22208-a26f-11df-98fd-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='rbk1:306,jfb:260'

	attributes['idyoutuberemark1']='Sarah Vaughan'
	attributes['idyoutube1']='dusavln6Cjw'
	attributes['idyoutuberemark2']='The great version by Coltrane'
	attributes['idyoutube2']='0I6xkVRWzCY'
	attributes['lyricsurl']='http://www.stlyrics.com/songs/s/soundofmusic9841/myfavouritethings323514.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added epdf for the real book.
	- added epdf for the fake book.
	- put in the chords for the real book.
	- checked the chords for the real book.
	- put in the notes for the real book.
	- filled in meta data for this tune (copyright and more).
	- checked the notes for the real book.
	- checked how the tune sounds.
	- added lyrics url and youtube performances.
	- added lyrics for the real book version.
	- checked the lyrics for the real book version.
	- added the song structure (and note about it).
	- added notation about where I got the meta data from.
	TODO:
	- add the fake book version.
	NOTES:
	- in the real book version the last repeat sign is not taken because it seems out of place.
	- this tunes structure could be categorized as ABCA but the A and B in this categorization
	would be too close one to the other.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		e2.:m7 | fis:m7 | e:m7 | fis:m7 | \myEndLine
		c2.*4:maj7 | \myEndLine
		a2.:m7 | d:7 | g:maj7 | c:maj7 | \myEndLine
		g:maj7 | c:maj7 | fis:m7.5- | b:7 | \myEndLine
	}
	%% removed in order to show the repeat sign...
	%%\endPart

	\myMark "A"
	\startPart
	e2.:maj7 | fis:m7 | e:maj7 | fis:m7 | \myEndLine
	a2.*4:maj7 | \myEndLine
	a2.:m7 | d:7 | g:maj7 | c:maj7 | \myEndLine
	g:maj7 | c:maj7 | fis:m7.5- | b:7.9- | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	e2.*2:m7 | fis2.:m7.5- | b:7 | \myEndLine
	e2.*2:m7 | c:maj7 | \myEndLine
	c:maj7 | a:7 | \myEndLine
	g2.:maj7 | c2.*2:maj7 | d2.:7 | \myEndLine
	g:6 | c:maj7 | g:6 | c:maj7 | \myEndLine
	g:maj7 | c:maj7 | fis:m7.5- | b:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 130
	\time 3/4
	\key g \major

	%% part "A"
	\repeat volta 2 {
		\repeat unfold 2 { e4 b' b | fis e e | b e e | fis e2 | }
		e4 b' a | e fis d | d a' g | c,2. |
		b4 c d | e fis g | a b a | dis,2. |
	}

	%% part "A"
	\repeat unfold 2 { e4 b' b | fis e e | b e e | fis e2 | }
	e4 b' a | e fis d | d a' g | c,2. |
	b4 c d | e fis g | a ais b | c2. |

	%% part "B"
	r4 b b | b2 e,4 | r a a | a2 dis,4 |
	r g g | g2 b,4 | e2.~ | e2 e4 |
	e fis e | fis e fis | g a g |
	a2 g4 | b c b | c2.~ | c | b |
	g~ | g~ | g~ | g |
	r | r | r | r |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

	%% part "A"
	Rain -- drops on ros -- es and whisk -- ers on kit -- tens,
	bright cop -- per ket -- tles and warm wool -- en mit -- tens;
	brown pa -- per pack -- ag -- es tied up with string,
	these are a few of My Fa -- vor -- ite Things.

	%% part "A"
	Girls in white dress -- es with blue sat -- in sash -- es,
	snow -- flakes that stay on my node and eye -- lash -- es,
	sil -- ver white win -- ters that melt in to spring.
	These are a few of My Fa -- vor -- ite Things.

	%% part "B"
	When the dog bites, when the bee stings,
	when I'm feel -- ing sad, __
	I sim -- ply re -- mem -- ber My Fa -- vor -- ite things
	and then I don't feel so bad. __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	cream col -- ored po -- nies and crip ap -- ple strud -- els,
	door -- bells and sleigh -- bell and schnitz -- el with noo -- dles;
	wild geese that fly with the moon on the wings,
	these are a few of My Fa -- vor -- ite Things.
}
% endif
