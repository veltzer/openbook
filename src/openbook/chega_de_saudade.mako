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
	attributes['title']='Chega De Saudade'
	# from the fake book
	attributes['style']='Latin/Jazz'
	# from the fake book
	attributes['subtitle']='No More Blues'
	# from the fake book
	attributes['composer']='Antonio Carlos Jobim'
	# from the fake book
	attributes['poet']='Vinicius DeMoraes, John Hendricks, Jessie Cavanaugh'
	# from the fake book
	attributes['piece']='Bossa Nova'
	# from the fake book
	attributes['copyright']='1962 and 1967 Editora Musical Arapua, Sao Paulo, Brazil'
	# from the fake book
	attributes['copyrightextra']='TRO-Hollis Music, Inc., New York, controls all publication rights for the U.S.A. and Canada'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='a8d44d0c-a26e-11df-a32b-0019d11e5a41'
	attributes['structure']='AA\'BA\'\''
	attributes['location']='jfb:82'

	attributes['idyoutuberemark1']='The original Jobim on piano'
	attributes['idyoutube1']='-c6Zbi3tbMg'
	attributes['idyoutuberemark2']='And Jobim sings...'
	attributes['idyoutube2']='UzFJwiHRwDg'
	attributes['lyricsurl']='http://www.stlyrics.com/songs/j/janemonheit24558/chegadesaudadenomoreblues1055457.html'
%>
% endif

% if part=='Doc':
	DONE:
	- brought in fake book epdf for this tune.
	- filled in meta data from the fake book.
	- filled in chords from the fake book.
	- filled in lyrics from the fake book.
	- filled in tune from the fake book.
	- checked chords from the fake book.
	- checked tune from the fake book.
	- checked lyrics from the fake book.
	- heard that the tune sounds well.
	- added youtube performances.
	- added lyrics url.
	TODO:
	- there is a boy/girl part in the lyrics of which I retrained just the 'boy' part. Do them both.
	- get another version of this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	d1:m7 | d2.:m7 d4:m7/c | b1:m7.5- | e:7.9- | \myEndLine
	e:m7.5- | a:7.9- | d:m | e2:m7.5- a:7.9- | \myEndLine
	d2:m d:m/c | b:m7.5- e:7 | a1*2:m | \myEndLine
	bes:maj7 | e1:m7.5- | a:7.9- | \myEndLine
	\endPart

	\myMark "A'"
	\startPart
	d1:m7 | d2.:m7 d4:m7/c | b1:m7.5- | e:7.9- | \myEndLine
	e:m7.5- | a:7.9- | d:m | d:7 | \myEndLine
	g2:m g:m/f | a:7/e a:7 | d1:m | d:m/c | \myEndLine
	b2:m7.5- e:7.9- | a1:7.9- | d:m | e2:m7 a:7.5+ | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	d1:maj7 | dis:dim7 | e1*2:m7 | \myEndLine
	a:7 | d1:dim7 | d:maj7 | \myEndLine
	fis:m7 | f:dim7 | e1*2:m7 | \myEndLine
	e:7 | e1:m7.5- | a:7.9- | \myEndLine
	\endPart

	\myMark "A''"
	\startPart
	d2:maj7 d:m7/cis | b1:m7 | e1*2:7 | \myEndLine
	fis1 | fis:7 | b2:m7 bes:m7 | a2:m7 d:7.9- | \myEndLine
	g1:maj7 | c:9 | fis:m7 | b2:7 b:7.5+ | \myEndLine
	e1:7 | e2..:m7/a a8:7/g | fis1:m7 | b:7.9- | \myEndLine
	e:7 | e2:m7/a e8:m7/a a4.:7 | d1*2 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Presto" 4 = 200
	\time 2/2
	\key f \major

	%% part "A"
	f'2 a, | d2. f4 | e2 b! | d2. e4 |
	f2 bes, | cis f4 e~ | e8 d4 f8~ f e d4 | a1 |
	f'2 a, | b!2. d4 | c2 e~ | e4 e d c |
	c2 bes~ | bes4 f' e d | d cis e8 cis4 bes8~ | bes2. r4 |

	%% part "A'"
	f'2 a, | d2. f4 | e2 b! | d2. e4 |
	f2 bes, | cis f4 e~ | e8 d4 cis8~ cis d ees4~ | ees d fis a |
	g2 bes | cis,~ cis8 a'4 g8~ | g f4 a8~ a g f4 | e4. d8 cis4 d |
	f8 d4 b!8~ b d4 f8~ | f cis4 bes8~ bes f'4 d8~ | d1 | r |

	\key d \major

	%% part "B"
	fis2. a4 | g2. dis4 | fis e dis8 e4 b'8~ | b4 g e b |
	d4. cis8~ cis2~ | cis4 e cis8 a4 b8~ | b1 | a2. cis4 |
	e d cis8 d4 f8~ | f4 gis cis8 b4 a8~ | a g4 b,8~ b2~ | b4 b cis8 d4 fis8~ |
	fis4 e d8 b4 gis8~ | gis4 b cis8 e4 d8~ | d2~ d4. cis8~ | cis1 |

	%% part "A''"
	fis2 a, | b2. fis'4 | e2 b | d2. e4 |
	fis2 ais, | cis2. fis4 | e8 d4 cis8~ cis d4 e8~ | e d4 fis8~ fis4 b |
	a8 fis4 d8~ d4. b8 | a' f!4 d8~ d4 bes | a'8 e4 cis8~ cis4 a | gis'4 b g! b |
	fis8 d4 b8 d4 fis~ | fis d b8 d4 fis8~ | fis2~ fis8 fis g a | b4 a g fis |
	d8 b4 d8 fis4 d~ | d b d8 fis4 d8~ | d1~ | d2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	No More Blues,
	I'm goin' back home.
	No, No More Blues,
	I prom -- ise no __ more to roam.
	Home is where the heart is, __
	the fun -- ny part is __
	my heart's been right there all a -- long. __

	%% part "A'"
	No more tears and no more sighs,
	and no more fears, I'll say __ no more __ good -- byes. __
	If tra -- vel beck -- ons me __
	I swear __ I'm gon -- __ na re -- fuse,
	I'm gon -- na set -- tle down __
	and there'll __ be No __ More Blues. __

	%% part "B"
	Ev -- 'ry day while I am far a -- way __
	my thoughts turn home -- ward, __
	for -- ev -- er home -- __ ward.
	I trav -- elled 'round the world __
	in search of hap -- pi -- ness, __
	but all my hap -- pi -- ness I found __
	was in my home -- __ town. __

	%% part "A''"
	No More Blues, I'm goin' back home.
	No, no more dues, I'm through with all __
	my wan -- __ drin', now __ I'll set -- tle down __ and live my life __
	and build a home __ and find a wife,
	when we set -- tle down there'll __ be No More Blues __
	noth -- in' but hap -- pi -- ness.
	When we set -- tle down there'll __ be No More Blues. __
}
% endif
