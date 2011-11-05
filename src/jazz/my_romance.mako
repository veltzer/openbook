<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="My Romance"
	# this is from the fake book
	attributes['subtitle']="From 'Jumbo'"
	# this is from the fake book
	attributes['composer']="Richard Rodgers"
	# this is from the fake book
	attributes['poet']="Lorenz Hart"
	attributes['style']="Jazz"
	# this is from the real book
	attributes['piece']="Med."
	# this is from the fake book
	attributes['piece']="Modeartely Slow"
	# this is from the fake book
	attributes['copyright']="1935, T.B. Harms Company. Copyright Renewed, (c/o The Welk Music Group, Santa Monica, CA 90401)"

	attributes['structure']="AB"
	attributes['completion']="5"
	attributes['uuid']="6a5d2730-c7dd-11df-b3d0-0019d11e5a41"

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
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- heard that the fake book tune sounds well.
	- document the youtube performance.
	- add a lyrics url.
	TODO:
	- add the real book version.
	- the Bb9#11 in the fake book version appears as Bb#11 in the print. Check it out and document the results.
	- the fake book version should be in cut time. Make it so.
	REMARKS:
	- this tunes song could also be noted as "ABAC" since the first 8 bars of each of the "AB" parts are the same.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 4 r4

	\mark "A"
	\startPart
	c2:maj7 d2:m7 | e2:m7 ees2:dim7 | d2:m7 g2:7 | c2:maj7 bes2:7.13 | \myEndLine
	a2:m a2:m7+ | a2:m7 a2:7 | d2:m7 g2:7 | c2:maj7 c2:7 | \myEndLine

	f2:maj7 fis2:dim7 | c2:maj7 c2:7 | f2:maj7 fis2:dim7 | c1:maj7 | \myEndLine
	fis2:m7 f2:7.5- | e2:m7 ees:7 | a2:m7.9 d2:7 | d2:m7 g2:7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	c2:maj7 d2:m7 | e2:m7 ees2:dim7 | d2:m7 g2:7 | c2:maj7 bes2:7.13 | \myEndLine
	a2:m a2:m7+ | a2:m7 a2:7 | d2:m7 g2:7 | c2:maj7 c2:7 | \myEndLine

	f2:maj7 f2:maj7/e | d2:m7 d2:m7/c | b2:m7 bes2:7.9.11+ | a2:m7 aes2:7.9 | \myEndLine
	c2:maj7/g a2:m7 | d2:m7 d4:m7/g g4:7 | c1:6 | c1:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c' {
	\time 4/4
	\key c \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Moderato" 4 = 100

	\partial 4 e8 f |

	%% A part
	g2. e8 f | g4 a b c | c2. b8 a | g2. c,8 d |
	e2. c8 d | e4 f g a | a2. g8 f | e2. g4 |

	c,2. c'4 | g2. g4 | c,2. c'4 | g2. c4 |
	b2. a4 | g2. c4 | b2. a4 | g2. e8 f |

	%% B part
	g2. e8 f | g4 a b c | c2. b8 a | g2. c,8 d |
	e2. c8 d | e4 f g a | a2. g8 f | e2. f8 g |

	a2. f8 g | a4 b c d | e e e e | c2. c8 d |
	e2. c8 d | e4 c4 a4 f4 | c'1~ | c2. r4 |

}
% endif

% if part=='LyricsFake':
\lyricmode {
	My Ro -- mance does -- n't have to have a moon in the sky,
	My Ro -- mance does -- n't need a blue la -- goon stand -- ing by;
	no month of May, no twin -- kling stars,
	no hide a -- way, no soft gui -- tars.

	My Ro -- mance does -- n't need a cas -- tle ris -- ing in Spain,
	nor a dance to a con -- stant -- ly sur -- pris -- ing re -- frain.
	Wide a -- wake I can make my most fan -- tas -- tic dreams come true;
	My Ro -- mance does -- n't need a thing but you. __
}
% endif
