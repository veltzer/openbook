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

	# from the fake book
	attributes['title']='Bluesette'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Jean \'Toots\' Thielemans'
	# from the fake book
	attributes['poet']='Norman Gimbel'
	# from the fake book
	attributes['piece']='Moderate Waltz'
	# from the fake book
	attributes['copyright']='1963, 1964 by MUSIC CORPORATION OF AMERICA, INC., New York, NY'
	# from the fake book
	attributes['copyrightextra']='Rights Administered by MCA MUSIC PUBLISHING, A Division of MCA Inc., New York, NY'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='e4c0cc74-eb5c-11e3-8d65-b71fa04c4d86'
	attributes['structure']='A'
	attributes['location']='jfb:67-68'

	attributes['idyoutuberemark1']='Bill with Toots'
	attributes['idyoutube1']='micPH3vJVs0'
	attributes['idyoutuberemark2']='Toots with Orchestra'
	attributes['idyoutube2']='yKnG_9q4crA'
	attributes['lyricsurl']='http://www.lyricsmode.com/lyrics/t/toots_thielemans/bluesette.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the fake book.
	- added the meta data from the fake book.
	- put in the tunes structure
	- put in the lyrics (fakebook).
	- put in the chords (fakebook).
	- put in the tune (fakebook).
	- check the chords (fakebook).
	- check the tune (fakebook).
	- check the lyrics (fakebook).
	- heard the tune to check that it is right and adjust the tempo.
	- added lyrics url.
	- added youtube performances.
	TODO:
	- this tune produces funny warnings when compiled individually. Investigate and eliminate.
	- add another version of this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		g2.*2 | fis2.:m7.5- | b:7.9- | e:m7 | a:7.9- | d:m7 | g:7 | \myEndLine
		c:maj7 | c:6 | c:m7 | f:9 | bes2.*2:maj7 | bes2.:m7 | ees:9 | \myEndLine
		aes:maj7 | aes | a:m7.5- | d:7.9- | b:m7 | bes:7 | a:m7 | d:7 | \myEndLine
	}
	\endPart

	\myMark "A"
	\startPart
	g2.*2 | fis2.:m7.5- | b:7 | e:m7 | a:7 | d:m7 | g:7 | \myEndLine
	c:maj7 | c:6 | c:m7 | f:7 | bes:maj7 | bes:6 | bes:m7 | ees:9 | \myEndLine
	aes2.*2:maj7 | a2.:m7.5- | d:7.9- | b:m7 | bes:7 | a:m7 | d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2.*2 | fis2.:m7.5- | b:7 | e:m7 | a:7 | d:m7 | g:7 | \myEndLine
	c:maj7 | c:6 | c:m7 | f:7 | bes:maj7 | bes:6 | bes:7 | ees:7 | \myEndLine
	aes2.*2:maj7 | a2.:m7.5- | d:7 | b:m7 | bes:7 | a:m7 | d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2.*2 | fis2.:m7.5- | b:7.9- | e:m7 | a:7.9- | d:m7 | g:7 | \myEndLine
	c:maj7 | c:6 | c:m7 | f:9 | bes2.*2:maj7 | bes2.:m7 | ees:9 | \myEndLine
	aes2.*2:maj7 | a2.:m7.5- | d:9 | b2.*2:m7 | e2.:7 | e2:7.5+ e4:7 | \myEndLine
	a2.*2:m7 | d:7 | g2. | d2:7.9+ d4:9 | b4:m7 a:m7 aes:maj7 | g2.:maj7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 168
	\time 3/4
	\key g \major

	%% part "A"
	\repeat volta 2 {
		d4 e fis | g a b | c2 e,4 | dis2. | b'2 d,!4 | cis2. | a'2 c,!4 | b2. |
		g'2 b,4 | c4. d8 ees f | g2 ees'4 | d2 c4 | f,2 d'4 | c2 bes4 | f2 des'4 | c2 bes4 |
		ees, f g | aes bes c | d2 c4 | b2 a4 | d,2.~ | d~ | d~ | d4 r r |
	}

	%% part "A"
	g a b | d r r | c b a | g2 fis4 | e fis g | b2. | a4 g f | e2 d4 |
	g2 b,4 | c4. b8 c d | ees4. f8 g bes | a4 bes c | f,2 a,4 | bes4. c8 des ees | f2 des'4 | c2 bes4 |
	ees,8 ees f f g g | aes aes bes bes c c | d2 \tuplet 3/2 { c8 d c } | b2 a4 | d,2.~ | d~ | d | r2. |

	%% part "A"
	r4 d'8 d d d | c4 b2 | r4 c8 c c c | b4 a2 | r4 b8 b b b | a4 g2 | r4 a8 a a a | g4 f2 |
	e4 f fis | g a b | c cis d | ees d c | f, g a | bes b c | cis d dis | e ees des |
	c r8 bes4. | aes4 r8 bes4 c8 | d4 r8 c4 b8 | aes4 r fis8 e | d4 d d | f d4. c8 | d2.~ | d2 r4 |

	%% part "A"
	d e fis | g a b | c2 e,4 | dis2. | b'2 d,!4 | cis2. | a'2 c,!4 | b2. |
	g'2 b,4 | c4. d8 ees f! | g2 ees'4 | d2 c4 | f,!2 d'4 | c2 bes4 | f2 des'4 | c2 bes4 |
	ees, f g | aes bes c | d2 c4 | b2 a4 | e'2.~ | e~ | e2 d4 | c2 b4 |
	d2.~ | d~ | d2 c4 | b g4. e8 | g2.~ | g~ | g~ | g4 r r |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Poor lit -- tle, sad lit -- tle blue Blues -- ette,
	don't you cry, don't you fret.
	You can bet one luck -- y day you'll wak -- en and your blues will be for -- sak -- en.
	One luck -- y day love -- ly love will come your way. __

	%% part "A"
	Get set, Blues -- ette, true love is com -- ing.
	Your trou -- bled heart soon will be hum -- ming.
	\markup \italic Hum __ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
	Doo -- ya, doo -- ya, doo -- ya, doo -- ya, doo -- ya, doo -- ya,
	Doo -- oo -- _ _ oo Blues -- ette. __

	%% part "A"
	Pret -- ty lit -- tle Blues -- ette must -- n't be a mourn -- er.
	Have you heard the news yet?
	Love is 'round the cor -- ner.
	Love wrapped in rain -- bows and tied with pink rib -- bon
	to make your next spring -- time your gold wed -- ding ring time.
	So, dry your eyes. Don't -- cha pout, don't -- cha fret,
	good -- y good times are com -- ing, Blues -- ette. __

	%% part "A"
	Long as there's love in your heart to share, dear Blues -- ette, don't des -- pair.
	Some blue boy is long -- ing, just like you,
	to find a some -- one to be true to.
	One luck -- y day love -- ly love will come your way. __
	That mag -- ic day __
	may just be to -- day. __
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {

	%% part "A"
	Long as there's love in your heart to share, dear Blues -- ette, don't des -- pair
	Some blue boy is long -- ing, just like you to find a some -- one to be true to.
	Two lov -- ing arms he can nest -- le in and stay. __
}
% endif
