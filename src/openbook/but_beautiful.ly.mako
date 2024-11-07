<%page args='part'/>
% if part=='Vars':
<%
	from scripts import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.add_version('Fake', version)
	attributes.set_default_version_name('Fake')

	attributes['title']='But Beautiful'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Johnny Burke, James Van Heusen'
	# from the fake book
	attributes['poet']='Johnny Burke, James Van Heusen'
	# from the fake book
	attributes['piece']='Slowly'
	# from the fake book
	attributes['copyright']='1947 by Doesey Brothers Music, A Division of Music Sales Corporation, New York'
	# from the fake book
	attributes['copyrightextra']='Copyright Renewed'

	attributes['typesetter']='Mark Veltzer <mark.veltzer@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='769f56f4-7f33-11ea-b0b2-eb3dd252214d'

	attributes['structure']='ABAC'
	attributes['structureremark']=''
	attributes['location']='jfb:74'

	attributes['idyoutuberemark1']='Tony Bennett and Lady Gaga'
	attributes['idyoutube1']='O1OdWOLWeCM'
	attributes['idyoutuberemark2']='Classic Nat King Cole version'
	attributes['idyoutube2']='uywr_l2tfdQ'
	attributes['lyricsurl']='https://genius.com/Nat-king-cole-but-beautiful-lyrics'
%>
% endif

% if part=='Doc':
	DONE:
	- added a lyrics url.
	- added the fake book epdf.
	- added the tune structure.
	- filled in the meta data from the fake book.
	- added youtube performances.
	- wrote down the fake book chords.
	- wrote down the fake book tune.
	- wrote down the fake book lyrics.
	- check the fake book chords.
	- check the fake book tune.
	- check the fake book lyrics.
	- played the midi to hear that it sounds right.
	TODO:
	- get another version in here (from where?)
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		g1:maj9 | b2:m7.5- e:7.9- | a1:m9 | cis2:m7.5- fis:7.9- | \myEndLine
		g1:maj9 | b2:m7.5- e:7 | a1*2:9 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		d2.:7 d4:7/c | b2:m7 e:m7 | a:m7 d:7 | g1 | \myEndLine
		e2:m6 e2:m7 | a1:9 | a:m7 | d:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		g:maj9 | b2:m7.5- e:7.9- | a1:m9 | cis2:m7.5- fis:7.9- | \myEndLine
		g1:maj9 | b2:m7.5- e:7 | a1*2:9 | \myEndLine
		\endPart

		\myMark "C"
		d2. d4:7/c | b2:m7 e:m7 | a:m7 b4:7.5+ b:7 | e2:m7 c4:m7 f:7 | \myEndLine
		g2 e:7 | a:m7 d4:7 aes:7 |
		\startPart

	} \alternative {
		{
			g1 | a2:m7 d:7 | \myEndLineVoltaNotLast
		}
		{
			g1*2 | \myEndLineVoltaLast
		}
	}
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

	\partial 4 cis8 d |

	\repeat volta 2 {

		%% part "A"
		a'4 a2 g8 fis | f!2. dis8 e | b'4 b2 a8 aes | g2. fis8 g |
		d'4 d2 b8 bes | a2. gis4 | b8 b b2.~ | b1 |

		%% part "B"
		b8 b b2 a4 | d b a4. g8 | c4 a g fis | b2. d,8 dis |
		e4 e2 g4 | b g fis e | a1~ | a2. cis,8 d |

		%% part "A"
		a'4 a2 g8 fis | f!2. dis8 e | b'4 b2 a8 aes | g2. fis8 g |
		d'4 d2 b8 bes | a2. gis4 | b8 b b2.~ | b e,8 eis |

		%% part "C"
		fis4 fis2 a4 | d b a4. g8 | e'4 c b a | g2. g4 |
		d'8 d d2 g,4 | c8 c c2 fis,4 |

	} \alternative {
		{
			g1~ | g2. cis,8 d |
		}
		{
			g1~ | g2. r4 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Love is fun -- ny or it's sad or it's qui -- et or it's mad;
	it's a good thing or it's bad, But Beau -- ti -- ful! __

	%% part "B"
	Beau -- ti -- ful to take a chance and if you fall, you fall,
	and I'm think -- ing I would -- n't mind at all. __

	%% part "A"
	Love is tear -- ful or it's gay; it's a prob -- lem or it's play;
	it's a heart -- ache eith -- er way, But Beau -- ti -- ful! __

	%% part "C"
	And I'm think -- ing if you were mine I'd nev -- er let you go,
	and that would be But Beau -- ti -- ful I

	%% part "Volta"
	know. __ Love is
	know. __
}
% endif
