<%page args='part'/>
% if part=='Vars':
<%
	from scripts import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']='Greensleeves'
	attributes['style']='Jazz'
	# this is from the fake book
	attributes['composer']='Traditional'
	# this is from the fake book
	attributes['piece']='Slowly'
	# this is from the fake book
	attributes['copyright']='1988 by HAL LEONARD PUBLISHING CORPORATION'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='dbd95022-6dd8-11e5-864c-3860779cb560'
	attributes['structure']='AA\'BB\''
	attributes['location']='jfb:138'

	attributes['idyoutuberemark1']='The great Oscar'
	attributes['idyoutube1']='35eZI9plYpk'
	attributes['idyoutuberemark2']='Paul Desmond in a mellow version'
	attributes['idyoutube2']='GH9tcQI_Qvw'
	attributes['lyricsurl']='http://www.metrolyrics.com/greensleeves-lyrics-loreena-mckennitt.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added the tune structure.
	- added meta data about the tune from the fake book.
	- added the fake book chords.
	- added the fake book notes.
	- added the fake book lyrics.
	- checked the fake book chords.
	- checked the fake book notes.
	- checked the fake book lyrics.
	- heard that the tune sounds right.
	- added youtube urls.
	- added lyrics url.
	TODO:
	- add another version of this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\myMark "A"
	\startPart
	\repeat volta 2 {

		e2.:m | d4. d8. dis8.:dim |
	} \alternative {
		{

			e4.:m fis:7 | b2. | \myEndLineVoltaLast
		}
		{
			e4.:m b:7 | e4:m a8:m e4.:m | \myEndLineVoltaNotLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	\repeat volta 2 {

		g2. | d4. d8. dis8.:dim | \myEndLine
	} \alternative {
		{
			e4.:m fis:7 | b2. | \myEndLineVoltaNotLast
		}
		{
			e4.:m b:7 | e4:m a8:m e4.:m | \myEndLineVoltaLast
		}
	}

	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Andante" 4 = 76
	\time 6/8
	\key e \minor

	e8 |

	%% part "A"
	\repeat volta 2 {
		g4 a8 b8. c16 b8 | a4 fis8 d8. e16 fis8 |
	} \alternative {
		{
			g4 e8 e8. dis16 e8 | fis4 dis8 b4 e8 |
		}
		{
			g fis e dis8. cis16 dis8 | e4 e8 e4 r8 |
		}
	}

	%% part "B"
	\repeat volta 2 {
		d'4. d8. c16 b8 | a4 fis 8 d8. e16 fis8 |
	} \alternative {
		{
			g4 e8 e8. dis16 e8 | fis4 dis8 b4 r8 |
		}
		{
			g' fis e dis8. cis16 dis8 | e4. e |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	A -- las, my love, __ _ you do me wrong __ _ to cast me off __ _ dis -- cour -- teous -- ly.
	And
	_ _ _ _ _ _ _ _ _
	Green -- sleeves __ _ was all my joy. __ _ _
	Green -- _ sleeves _ was my de -- light.
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {
	_
	I have loved __ _ you oh, so, long __ _ de
	_ _ _ _ _ _ _ _ _
	light -- _ ing in __ _ your com -- pa -- ny.
	Green -- sleeves was my heart of gold, __ _ and
	_ _ _ _ _ _ _ _
	who but my la -- _ dy Green -- sleeves.
}
% endif
