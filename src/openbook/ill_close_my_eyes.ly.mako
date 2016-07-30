<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('My', version)
	attributes.setDefaultVersionName('My')
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Real', version)

	attributes['title']='I\'ll Close My Eyes'
	attributes['style']='Jazz'
	attributes['composer']='Billy Reid'
	attributes['poet']='Buddy Kaye'
	attributes['piece']='Medium Swing'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='e7277c50-a26e-11df-863c-0019d11e5a41'
	attributes['structure']='AB'
	attributes['structureremark']='this tunes structure could also be thought of as ABAC since the begining of the A and part B (the first 8 bars) under the AB interpretation is exactly the same.'
	attributes['location']='rbk3:130'
	attributes['remark']='the My version is from Amit Golan'

	attributes['idyoutube1']='7Oh-Dl-KbF0'
	attributes['idyoutube2']='u6lXbfx1hHw'
	attributes['lyricsurl']='http://lyricsplayground.com/alpha/songs/i/illclosemyeyes.shtml'
%>
% endif

% if part=='Doc':
	DONE:
	- Checked chords against the real book.
	- Checked tune against the real book.
	- Fixed up the lyrics.
	- Wrote down my own version.
	TODO:
	- add info about the youtube performances.
	- problem with the words ( the phrase "Don't you know" did not fit in my version, fix the tune).
	- get copyright for this tune (the real book didn't have one).
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 2. s2. |

	\myMark "A"
	\startPart
	f1*2:maj7 | e1:m7 | a:7 | \myEndLine
	d1:m7 | g:7 | c:m7 | f:7 | \myEndLine
	bes:maj7 | ees:7 | f1*2:maj7 | \myEndLine
	b1:m7.5- | e1:7.9- | a2:m7 aes:dim7 | g:m7 ges:7/c | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	f1*2:maj7 | e1:m7 | a:7 | \myEndLine
	d:m7 | g:7 | c:m7 | f:7 | \myEndLine
	bes:maj7 | ees:7 | a:m7.5- | d:7.9- | \myEndLine
	g:7 | g2:m7 c2:7 | f1*2:6.9 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 150
	\time 4/4
	\key f \major

	\partial 4*3 c4 bes' c8 a~ |

	%% part "A"
	a1~ | a4 c, bes' a | a4 g8 e~ e2~ | e4 a, g' a8 f~ |
	f1~ | f4 f a f8 ees~ | ees1~ | ees2 r4 d |
	cis d c'2~ | c4 bes f g | a4. a8 a a4 a8~ | a4 r \tuplet 3/2 { a a a } |
	a4. gis8 gis2~ | gis4 e dis e | g1~ | g4 c, bes' c8 a~ |

	%% part "B"
	a1~ | a4 c, bes' a | a4 g8 e~ e2~ | e4 a, g' a8 f~ |
	f1~ | f4 f a f8 ees~ | ees1~ | ees2 r4 d |
	cis d c'2~ | c4 bes f g | a4. a8 a a4 a8~ | a4 a c bes |
	a4. d,8 e f4 g8~ | g2 a | f1~ | f4 r r2 |
}
% endif

% if part=='LyricsReal':
%% these are lyrics from the internet adjusted by me to the real book tune
%% the adjustment is pretty horrible
\lyricmode {

	%% part "A"
	I'll Close My Eyes __ __
	To eve -- ry -- one but you __ __
	And when I do __ __
	I'll_see_you stand -- ing there __ __

	I'll lock my heart __
	To any_other ca -- ress __ _ _ _ _
	I'll nev -- er say yes __ _
	To_a_new love af -- fair

	%% part "B"
	Then_I'll Close My Eyes __ __
	To eve -- ry -- thing that's gay __ __
	If you_are not there __ __
	Oh,_to_share_each love -- ly day __ __

	And through the years __
	In_those moments When_we're_far apart
	Do -- n't you know I'll Close My Eyes
	And I'll see you_with __ my heart __
}
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\partial 8*5 s8 s2 |

	\myMark "A"
	\startPart
	f1*2:maj7 | e1:m7.5- | a:7.9- | \myEndLine
	d:m7 | g:7 | c:m7 | f:7 | \myEndLine
	bes:maj7 | ees:7 | f1*2:maj7 | \myEndLine
	b1:m7.5- | e:7 | a2:m7 aes:dim7 | g:m7 ges:7/c | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	f1*2:maj7 | e1:m7.5- | a:7.9- | \myEndLine
	d:m7 | g:7 | c:m7 | f:7 | \myEndLine
	bes:maj7 | ees:7 | a1:m7.5- | d:7.9- | \myEndLine
	g:m7 | c:7 | f2:maj7 d:7 | g:m7 c:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceMy':
{
	\tempo "Allegro" 4 = 150
	\time 4/4
	\key f \major

	\partial 8*5 c8 bes'4 c8 a~ |

	%% part "A"
	a1 | r4 r8 c, bes'4 a | a4 g8 e8~ e2 | r4 a, g'4 a8 f~ |
	f1 | r4 r8 f a4 f8 ees8~ | ees1 | r2 r4 ees |
	des d c'2 | r4 r8 bes f4 g | a1 | r2 r4 a |
	gis1 | r4 r8 e g4 f | e1 | r4 r8 c bes'4 c8 a~ |

	%% part "B"
	a1 | r4 r8 c, bes'4 a | a4 g8 e8~ e2 | r4 a, g'4 a8 f~ |
	f1 | r4 r8 f a4 f8 ees8~ | ees1 | r2 r4 ees |
	des d c'2 | r4 r8 bes f4 g | a1 | r4 r8 a c4 b |
	bes4. d,8 e4 f | g2 a | f1~ | f2 r2 |
}
% endif

% if part=='LyricsMy':
\lyricmode {

	%% part "A"
	I'll Close My Eyes __
	To eve -- ry -- one but you __
	And when I do __
	I'll_see_you stand -- ing there __

	I'll lock my heart
	To any_other ca -- ress
	I'll_never_say yes
	To_a_new love af -- fair

	%% part "B"
	Then_I'll Close My Eyes __
	To eve -- ry -- thing that's gay __
	If you_are not there __
	Oh,_to_share_each love -- ly day __

	And through the years
	In_those moments When_we're_far apart
	%%Do -- n't you know
	I'll Close My Eyes
	And I'll see you_with my heart __
}
% endif
