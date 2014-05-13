<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	# from the fake book
	attributes['title']="Chega De Saudade"
	# from the fake book
	attributes['subtitle']="No More Blues"
	# from the fake book
	attributes['style']="Latin/Jazz"
	# from the fake book
	attributes['composer']="Antonio Carlos Jobim"
	# from the fake book
	attributes['piece']="Bossa Nova"
	# from the fake book
	attributes['copyright']="1962 and 1967 Editora Musical Arapua, Sao Paulo, Brazil"
	# from the fake book
	attributes['copyrightextra']="TRO-Hollis Music, Inc., New York, controls all publication rights for the U.S.A. and Canada"

	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"
	attributes['completion']="5"
	attributes['uuid']="a8d44d0c-a26e-11df-a32b-0019d11e5a41"
	attributes['structure']="AA'BA''"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	- brought in fake book epdf for this tune.
	- filled in meta data from the fake book.
	- fill in chords from the fake book.
	- fill in lyrics from the fake book.
	TODO:
	- fill in tune from the fake book.
	- check chords from the fake book.
	- check tune from the fake book.
	- check lyrics from the fake book.
	- hear that the tune sounds well.
	- add youtube performances.
	- add lyrics url.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	d1:m7 | d2:m7 d:m7/c | b:m7.5- | e1:7.9- | \myEndLine
	e:m7.5- | a:7.9- | d:m | e2:m7.5- a:7.9- | \myEndLine
	d2:m d:m/c | b:m7.5- e:7 | a1*2:m | \myEndLine
	bes:maj7 | e1:m7.5- | a:7.9- | \myEndLine
	\endPart

	\myMark "A'"
	\startPart
	d1:m7 | d2:m7 d:m7/c | b:m7.5- | e1:7.9- | \myEndLine
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
	e:7 | e2.:m7/a a4:7 | d1*2 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative f'' {
	\set Staff.timeSignatureFraction=#'(2 . 2)
	\time 4/4
	\key f \major

	%% part "A"
	f'2 a, | d2. f4 | e2 b! | d2. e4 | \myEndLine
	f2 b | cis f4 e~ | e8 d4 f8~ f e d4 | a1 | \myEndLine
	%% part "A'"
	%% part "B"
	%% part "A''"
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
	the funny part is __
	my heart's been right there all a -- long. __
	%% part "A'"
	No more tears and no more sighs,
	and no more fears, I'll say __ no more __ good -- byes. __
	If tra -- vel beck -- ons me __
	I swear __ I'm gon -- na re -- fuse,
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
