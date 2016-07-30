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
	attributes['title']='I\'ll Remember April'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Don Raye, Gene De Paul, Pat Johnson'
	# from the fake book
	attributes['poet']='Don Raye, Gene De Paul, Pat Johnson'
	# from the fake book
	attributes['piece']='Moderately'
	# from the fake book
	attributes['copyright']='1941, 1942 by MCA Music Publishing, A Division of MCA, Inc.'
	# from the fake book
	attributes['copyrightextra']='Renewed 1969, 1970 Pic Corp.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='84142766-dba0-11e3-9e62-bb6aa0505531'
	attributes['structure']='ABA'
	attributes['location']='jfb:168-169'

	attributes['idyoutuberemark1']='Caterina Valente & Chet Baker'
	attributes['idyoutube1']='2YZ4FGEGom8'
	attributes['idyoutuberemark2']='Sonny Stitt blasts away...'
	attributes['idyoutube2']='VHbwr4ieI2U'
	attributes['lyricsurl']='http://www.lyricsfreak.com/f/frank+sinatra/ill+remember+april_20055817.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the fake book.
	- added the meta data from the fake book.
	- put in the tunes structure
	- put in the chords (fakebook).
	- put in the lyrics (fakebook).
	- put in the tune (fakebook).
	- check the chords (fakebook).
	- check the tune (fakebook).
	- check the lyrics (fakebook).
	- heard the tune to check that it is right and adjust the tempo.
	- fixed the coda thing.
	- added lyrics url.
	- added youtube performances.
	TODO:
	- add another version of this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	g1 | g:6 | c1*2:9 | \myEndLine
	f:maj7 | e1:m7 | a:7 | \myEndLine
	a:m7.5- | d2:7 d:7/c | b1:m7 | e:9 | \myEndLine
	a:m7 | d:7.9- | g:maj7 | g:6 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	c:m7 | f:7 | bes:maj7 | g:m7 | \myEndLine
	c:m7 | f:7 | bes:maj7 | bes:6 | \myEndLine
	a:m11 | d:7 | g:maj7 | g:6 | \myEndLine
	fis:m11 | b:9 | e2:maj7 e:6 | a:m7 d:7 | \myEndLine
	\endPart

	%%\myMark "Coda"
	\mark \markup { \musicglyph #"scripts.coda" }
	\startPart
	a1:m7.5- | d2:7 d:7/c | b1:m7 | e:9 | \myEndLine
	a:m7 | d:7.9- | g2 a:m7 | aes:maj7 g:6.9 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key g \major

	%% part "A"
	r4 b' c d | c b a g | a2. g4 | fis e2. |
	r4 a bes c | bes a g f! | g8 a g2.~ | g2 r4 g^\markup {To Coda \musicglyph #"scripts.coda"} |
	a2. a4 | a a b4. c8 | d4 d2.~ | d4 r e4. d8 |
	b4 c d c~ | c2 b4 ais | b1~ | b2 r4 b |

	%% part "B"
	g g g2~ | g4 a bes c | d2. c4 | bes4 g2 f!4 |
	g g g2~ | g4 a bes c | d d d2~ | d4 d \tuplet 3/2 { d d d } |
	d2. d4 | e c d4. b8 | a4 b2.~ | b4 b d c |
	b b2.~ | b4 r \tuplet 3/2 { b a gis } | b1~ | b^\markup {D.C. al Coda} |

	%% part "Coda"
	a4. a8 a2~ | a4 a \tuplet 3/2 { a b c } | d d2.~ | d4 r e4. d8 |
	b4 c d c~ | c2 b4 b | g1~ | g2 r |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	This love -- ly day will leng -- then in -- to ev -- 'ning,
	we'll sign good -- bye to all we've ev -- er had. __
	A -- lone, where we have walked to -- geth -- er, __
	I'll Re -- mem -- ber A -- pril __ and be glad. __

	%% part "B"
	I'll be con -- tent __ you loved me once in A -- pril.
	your lips were warm __ and love and Spring were new. __
	But I'm not a -- fraid of Au -- tumn and her sor -- row, __
	for I'll Re -- mem -- ber __ A -- pril and you. __

	%% part "Coda"
	won't for -- get, __ but I won't be lone -- ly, __
	I'll Re -- mem -- ber A -- pril, __ and I'll smile. __
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {

	%% part "A"
	The fire will dwin -- dle in -- to glow -- ing ash -- es,
	for flames and love live such a lit -- tle while. __
	I
}
% endif
