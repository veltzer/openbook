<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doVoice']=True
	version['doChords']=True
	version['doLyrics']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']='It Might As Well Be Spring'
	attributes['style']='Jazz'
	# this is from the fake book
	attributes['subtitle']='From \'State Fair\''
	# this is from the fake book
	attributes['composer']='Richard Rodgers'
	# this is from the fake book
	attributes['poet']='Oscar Hammerstein II'
	# this is from the fake book
	attributes['piece']='Moderately'
	# this is from the fake book
	attributes['copyright']='1945 by Williamson Music Co.'
	# this is from the fake book
	attributes['copyrightextra']='Copyright Renewed. All Rights Administered by Chappell & Co., Inc.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='f4f39800-a26e-11df-b97a-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='jfb:189'

	attributes['idyoutuberemark1']='Astrud Gilberto in the classic version'
	attributes['idyoutube1']='86MwK3TT9og'
	attributes['idyoutuberemark2']='Bill Evans the master himself'
	attributes['idyoutube2']='kUvIdEWiQms'
	attributes['lyricsurl']='http://www.lyricsondemand.com/soundtracks/s/statefairlyrics/itmightaswellbespringlyrics.html'
%>
% endif

% if part=='Doc':
	DONE:
	- filled in this tunes meta data from the fake book.
	- filled in this tunes structure.
	- brought in the fake book epdf.
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
	- in the lyrics there is a boy/girl part which is currently only boy in the implementation.
	find out how to do the dual parts and fix that.
	- bring another version of this tune in here.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	g2:6 c:9 | b4:m7 e:7 a:m7 d:7 | g1 | d2:m7 g:7 | \myEndLine
	c cis4:m7 fis:7 | b2:m7 e:7 | a:m7 d4:7 d:7/c | b:m7 e:7 a:m7 d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2:6 c:9 | b4:m7 e:7 a:m7 d:7 | g1 | d2:m7 g:7 | \myEndLine
	c cis4:m7 fis:7 | b2:m7 e:7 | a:m7 d:7 | g d4:m7 g:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	c1 | d:m7 | d2:m7 g:7 | c1 | \myEndLine
	a2:m7 a:m7/g | fis:7.5- b:7 | e:m7 a:7 | a:m7/d d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2:6 c:9 | b4:m7 e:7 a:m7 d:7 | g1 | d2:m7 g:7 | \myEndLine
	c cis4:m7 fis:7 | g2:6.9/b e:m7 | a:m7 d4:9 d:7/c | b2:7 e:7 | \myEndLine
	a1:7 | c2:m7 f:7 | b:m7 e4:m7 e:m7/d | a2:7/cis c4:m7 f:9 | \myEndLine
	b2:m7 e:m7 | a:m7 d:7 | g c:6 | g1 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Andante" 4 = 88
	\time 2/2
	\key g \major

	\partial 4 d8 d |

	%% part "A"
	e d d d e d d g | e4 d2 d8 d | d8. b'16 d8. g,16 b8. d,16 g8. d16 | f2. f4 |
	e4 dis8 e fis!4. g8 | g4 d2 d8 d | c'4 c c fis, | b2. d,8 d |

	%% part "A"
	e d d d e d d g | e4 d2 d8 d | d8. b'16 d8. g,16 b8. d,16 g8. d16 | f2. f4 |
	e4 dis8 e fis!4. g8 | g4 d2 d8 d | d'4 d d fis, | g1 |

	%% part "B"
	c4 c c8 d c b | a4 f f2 | a8 f f f f4 e | g1 |
	c4 c c8 d c b | a4 fis! fis g8 a | b4 b cis cis | d2. d,8 d |

	%% part "A"
	e d d d e d d g | e4 d2 d8 d | d8. b'16 d8. g,16 b8. d,16 g8. d16 | f2. f4 |
	e8 e dis e fis! fis eis fis | g4 g2 fis8 g | a4 a a fis | b2. b8 bis |
	cis4 a a a8 b | c a a a a4 a8 ais | b4 g g b | a2. g4 |
	d~ d8. b'16 g2 | d4~ d8. c'16 a2 | g1~ | g4 r r2 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	I'm as

	%% part "A"
	rest -- less as a wil -- low in a wind -- storm,
	I'm as jump -- y as a pup -- pet on a string.
	I'd say that I had spring fev -- er,
	but I know it is -- n't spring. I am

	%% part "A"
	star -- ry eyed and vague -- ly dis -- con -- tent -- ed,
	like a night -- in -- gale with -- out a song to sing.
	Oh, why should I have spring fev -- er
	when it is -- n't e -- ven spring?

	%% part "B"
	I keep wish -- ing I were some -- where else
	walk -- ing down a strange new street;
	hear -- ing words that I have nev -- er heard
	from a man I've yet to meet, I'm as

	%% part "A"
	bu -- sy as a spi -- der spinn -- ing day -- dreams
	I'm as gid -- dy as a ba -- by on a swing.
	I have -- n't seen a cro -- cus or a rose -- bud,
	or a rob -- in on the wing.
	But I feel so gay in a mel -- an -- cho -- ly way
	that It Might As Well Be Spring.
	It Might __ _ As Well __ _ Be Spring! __
}
% endif
