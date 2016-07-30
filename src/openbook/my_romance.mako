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

	attributes['title']='My Romance'
	attributes['style']='Jazz'
	# this is from the fake book
	attributes['subtitle']='From \'Jumbo\''
	# this is from the fake book
	attributes['composer']='Richard Rodgers'
	# this is from the fake book
	attributes['poet']='Lorenz Hart'
	# this is from the real book
	#attributes['piece']='Med.'
	# this is from the fake book
	attributes['piece']='Moderately Slow'
	# this is from the fake book
	attributes['copyright']='1935, T.B. Harms Company. Copyright Renewed, (c/o The Welk Music Group, Santa Monica, CA 90401)'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='6a5d2730-c7dd-11df-b3d0-0019d11e5a41'
	attributes['structure']='ABAC'
	attributes['structureremark']='this tunes song could also be noted as AB but then you lose the info that the first 8 bars of the A and part B are the same.'
	attributes['location']='rbk1:311,jfb:268'

	attributes['idyoutuberemark1']='Ben Webster on his airy sax...'
	attributes['idyoutube1']='_D2XBzcKFPM'
	attributes['idyoutuberemark2']='The great Bill Evans in the late 70\'s trio'
	attributes['idyoutube2']='aCO1Gd0jRto'
	attributes['lyricsurl']='http://www.lyricsfreak.com/e/ella+fitzgerald/my+romance_20045848.html'
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
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

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
	f:maj7 f:maj7/e | d:m7 d:m7/c | b:m7 bes:9.11+ | a:m7 aes:7.9 | \myEndLine
	c:maj7/g a:m7 | d:m7 d4:m7/g g:7 | c1*2:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Moderato" 4 = 100
	\time 2/2
	\key c \major

	\partial 4 e8 f |

	%% part "A"
	g2. e8 f | g4 a b c | c2. b8 a | g2. c,8 d |
	e2. c8 d | e4 f g a | a2. g8 f | e2. g4 |

	%% part "B"
	c,2. c'4 | g2. g4 | c,2. c'4 | g2. c4 |
	b2. a4 | g2. c4 | b2. a4 | g2. e8 f |

	%% part "A"
	g2. e8 f | g4 a b c | c2. b8 a | g2. c,8 d |
	e2. c8 d | e4 f g a | a2. g8 f | e2. f8 g |

	%% part "C"
	a2. f8 g | a4 b c d | e e e e | c2. c8 d |
	e2. c8 d | e4 c4 a4 f4 | c'1~ | c2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	My Ro -- mance does -- n't have to have a moon in the sky,
	My Ro -- mance does -- n't need a blue la -- goon stand -- ing by;

	%% part "B"
	no month of May, no twin -- kling stars,
	no hide a -- way, no soft gui -- tars.

	%% part "A"
	My Ro -- mance does -- n't need a cas -- tle ris -- ing in Spain,
	nor a dance to a con -- stant -- ly sur -- pris -- ing re -- frain.

	%% part "C"
	Wide a -- wake I can make my most fan -- tas -- tic dreams come true;
	My Ro -- mance does -- n't need a thing but you. __
}
% endif
