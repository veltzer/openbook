<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="My Romance"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['subtitle']="From 'Jumbo'"
	# this is from the fake book
	attributes['composer']="Richard Rodgers"
	# this is from the fake book
	attributes['poet']="Lorenz Hart"
	# this is from the real book
	attributes['piece']="Med."
	# this is from the fake book
	attributes['piece']="Modeartely Slow"
	# this is from the fake book
	attributes['copyright']="1935, T.B. Harms Company. Copyright Renewed, (c/o The Welk Music Group, Santa Monica, CA 90401)"

	attributes['completion']="5"
	attributes['uuid']="6a5d2730-c7dd-11df-b3d0-0019d11e5a41"
	attributes['structure']="ABAC"

	attributes['idyoutuberemark']="Ben Webster on his airy sax..."
	attributes['idyoutube']="_D2XBzcKFPM"
	attributes['idyoutuberemark']="The great Bill Evans in the late 70's trio"
	attributes['idyoutube']="aCO1Gd0jRto"
	attributes['lyricsurl']="http://www.lyricsfreak.com/e/ella+fitzgerald/my+romance_20045848.html"
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- brought in the fake book epdf.
	- filled in this tunes meta data from the fake book.
	- filled in this tunes structure.
	- filled in the fake book chords.
	- filled in the fake book tune.
	- filled in the fake book lyrics.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- heard that the fake book tune sounds well.
	- added youtube performances.
	- added a lyrics url.
	TODO:
	- add the real book version.
	- the Bb9#11 in the fake book version appears as Bb#11 in the print. Check it out and document the results.
	REMARKS:
	- this tunes song could also be noted as "AB" but then you lose the info that the first 8 bars of the A and B part are the same.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong
	\partial 4 s4
	\myMark "A"
	\startPart
	c2:maj7 d:m7 | e:m7 ees:dim7 | d:m7 g:7 | c:maj7 bes:7.13 | \myEndLine
	a:m a:m7+ | a:m7 a:7 | d:m7 g:7 | c:maj7 c:7 | \myEndLine
	\endPart
	\myMark "B"
	\startPart
	f:maj7 fis:dim7 | c:maj7 c:7 | f:maj7 fis:dim7 | c1:maj7 | \myEndLine
	fis2:m7 f:7.5- | e:m7 ees:7 | a:m7.9 d:7 | d:m7 g:7 | \myEndLine
	\endPart
	\myMark "A"
	\startPart
	c:maj7 d:m7 | e:m7 ees:dim7 | d:m7 g:7 | c:maj7 bes:7.13 | \myEndLine
	a:m a:m7+ | a:m7 a:7 | d:m7 g:7 | c:maj7 c:7 | \myEndLine
	\endPart
	\myMark "C"
	\startPart
	f:maj7 f:maj7/e | d:m7 d:m7/c | b:m7 bes:7.9.11+ | a:m7 aes:7.9 | \myEndLine
	c:maj7/g a:m7 | d:m7 d4:m7/g g:7 | c1*2:6 | \myEndLine
	\endPart
	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c' {
	\set Staff.timeSignatureFraction=#'(2 . 2)
	\time 4/4
	\key c \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Moderato" 4 = 100
	\partial 4 e8 f |
	%% A part
	g2. e8 f | g4 a b c | c2. b8 a | g2. c,8 d |
	e2. c8 d | e4 f g a | a2. g8 f | e2. g4 |
	%% B part
	c,2. c'4 | g2. g4 | c,2. c'4 | g2. c4 |
	b2. a4 | g2. c4 | b2. a4 | g2. e8 f |
	%% A part
	g2. e8 f | g4 a b c | c2. b8 a | g2. c,8 d |
	e2. c8 d | e4 f g a | a2. g8 f | e2. f8 g |
	%% C part
	a2. f8 g | a4 b c d | e e e e | c2. c8 d |
	e2. c8 d | e4 c4 a4 f4 | c'1~ | c2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% A part
	My Ro -- mance does -- n't have to have a moon in the sky,
	My Ro -- mance does -- n't need a blue la -- goon stand -- ing by;
	%% B part
	no month of May, no twin -- kling stars,
	no hide a -- way, no soft gui -- tars.
	%% A part
	My Ro -- mance does -- n't need a cas -- tle ris -- ing in Spain,
	nor a dance to a con -- stant -- ly sur -- pris -- ing re -- frain.
	%% C part
	Wide a -- wake I can make my most fan -- tas -- tic dreams come true;
	My Ro -- mance does -- n't need a thing but you. __
}
% endif
