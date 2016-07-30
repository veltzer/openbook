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

	attributes['title']='Let\'s Call The Whole Thing Off'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='George Gershwin'
	# from the fake book
	attributes['poet']='Ira Gershwin'
	# from the fake book
	attributes['piece']='Brightly'
	# from the fake book
	attributes['copyright']='1936, 1937 by Gershwin Publishing Corporation'
	# from the fake book
	attributes['copyrightextra']='Copyright Renewed, Assigned to Chappell & Co, Inc.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='135384a2-4235-11e5-941e-3860779cb560'
	attributes['structure']='AA\'BA\'\''
	attributes['structureremark']='this tune is very close to AABA. The tags (A\') are there to show that there are subtle changes but these are indeed subtle.'
	attributes['location']='jfb:216'

	attributes['idyoutuberemark1']=''
	attributes['idyoutube1']=''
	attributes['idyoutuberemark2']=''
	attributes['idyoutube2']=''
	attributes['lyricsurl']=''
%>
% endif

% if part=='Doc':
	DONE:
	- added the fake book epdf.
	- filled in the meta data from the fake book.
	- filled in the tunes structure.
	- wrote down the fake book chords.
	- wrote down the fake book tune.
	TODO:
	- wrote down the fake book lyrics.
	- added a lyrics url.
	- check the fake book chords.
	- check the fake book tune.
	- check the fake book lyrics.
	- played the midi to hear that it sounds right.
	- added youtube performances.
	- get another version in here (from where?)
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		g2 e:m9 | a:m7 d:7 | g2 e:m9 | a:m7 d:7 | \myEndLine
		g g:7/f | c/e c:m/ees | g/d e:m | a:7 d:7 | \myEndLine
		\endPart

		\myMark "A'"
		\startPart
		g2 e:m9 | a:m7 d:7 | g2 e:m9 | a:m7 d:7 | \myEndLine
		g g:7/f | c/e c:m/ees | g/d d:7 | g1 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		cis:m7.5- | fis2:7 b:m7 | e:7 a:m7 | d1:7 | \myEndLine
		cis:m7.5- | fis2:7 b:m7 | e:7 a:m7 | d1:7 | \myEndLine
		\endPart

		\myMark "A''"
		\startPart
		g2 e:m9 | a:m7 d:7 | g2 e:m9 | a:m7 d:7 | \myEndLine
		g g:7/f | c/e c:m/ees | g/d d:7 | b:7 e:7 | a:m7 d:7 |

	} \alternative {
		{
			g ees4:7 d:7 | \myEndLineVoltaNotLast
		}
		{
			g1 | \myEndLineVoltaLast
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

	\repeat volta 2 {

		%% part "A"
		g'4 e8 fis~ fis fis4 e8 | g4 a8 b~ b b4. | g4 e8 fis~ fis fis4 e8 | g4 a8 b~ b b4. |
		d8 g, r4 d'8 g, r4 | d'8 g, r4 d'8 g, r4 | d'4 c8. b16 a4 g | a2. r4 |

		%% part "A"
		g8 g4 e8 fis fis4 e8 | g g4 a8 b b4. | g8 g4 e8 fis fis4 e8 | g g4 a8 b b4 b8 |
		d g, r g d' g, r g | d' g, r g d' g, r g | d'4 c8. b16 a4 g | g2 r4 g |

		%% part "B"
		e'1 | d8. cis16 b8. cis16 d4 d | b b c c | a2. e4 |
		e'1 | d8. cis16 b8. cis16 d4 d | b b c c | a2. d,8. d16 |

		%% part "A"
		g8 g4 e8 fis fis4 e8 | g g4 a8 b b4. | g8 g4 e8 fis fis4 e8 | g g4 a8 b b4 b8 |
		d g, r4 d'8 g, r4 | d'8. d16 g,8. g16 d'8 g,4. | d'8. d16 c8. b16 c8. b16 a4 | b2. r4 | e b8. c16 b4 a |
	} \alternative {
		{
			g2. r4 |
		}
		{
			g2. r4 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	You say ee -- __ ther and I say eye -- __ ther,
	you say nee -- __ ther and I say ny -- __ ther;
	ee -- ther, eye -- ther, nee -- ther, ny -- ther,
	Let's Call The Whole Thing Off!

	%% part "A"
	You like po -- ta -- to and I like po -- tah -- to,
	you like to -- ma -- to and I like to - mah -- to;
	po -- ta -- to, po -- tah -- to, to -- ma -- to, to -- mah -- to!
	Let's Call The Whole Thing Off!
	But

	%% part "B"
	oh! If we call the whole thing off,
	then we must part. And
	oh! If we ev -- er part, then that might break my heart!

	%% part "A"

	%% part "Volta"
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {

	%% part "A"

	%% part "A"

	%% part "B"

	%% part "A"
}
% endif
