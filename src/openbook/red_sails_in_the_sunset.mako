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

	# from the fake book
	attributes['title']='Red Sails In The Sunset'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Hugh Williams'
	# from the fake book
	attributes['poet']='Jimmy Kennedy'
	# from the fake book
	attributes['piece']='Slowly'
	# from the fake book
	attributes['copyright']='1935 The Peter Maurice Music Co. Ltd., London, England'
	# from the fake book
	attributes['copyrightextra']='United Sates Copyright Renewed and Assigned to Sharpiro, Bernstein & Co., Inc.'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='2507f6ec-da80-11e3-9bfd-ff436f70a1a7'
	attributes['structure']='AABA'
	attributes['location']='jfb:313'

	attributes['idyoutuberemark1']='Nat King Cole in a classic...'
	attributes['idyoutube1']='HLQZZoAkdig'
	attributes['idyoutuberemark2']='The Beatles?!?'
	attributes['idyoutube2']='b_Xg_md46Sw'
	attributes['lyricsurl']='http://www.sing365.com/music/lyric.nsf/Red-Sails-In-the-Sunset-lyrics-Nat-King-Cole/F51AC099651BC18A48256AF1000B7499'
%>
% endif

% if part=='Doc':
	DONE:
	- added location from the fake book.
	- added meta data from the fake book.
	- filled in the structure of this tune.
	- added the fake book chords.
	- added the fake book tune.
	- added the fake book lyrics.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- played the tune for tempo and bugs.
	- added youtube performances and lyrics url.
	TODO:
	- get another version of this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		g1*2 | c2 c:m6 | g1 | \myEndLine
		g2 gis:dim7 | a2:m7 d:7 | a:m7 d:7 | g1 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		g1*2 | c2 c:m6 | g1 | \myEndLine
		g2 gis:dim7 | a2:m7 d:7 | a:m7 d:7 | g1 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		c2 c:m6 | g1 | d:7 | g | \myEndLine
		c2 c:m6 | g1 | a:7 | a2:m7 d:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		g1*2 | c2 c:m6 | g1 | \myEndLine
		g2 gis:dim7 | a2:m7 d:7 | a:m7 d:7 |
	} \alternative {
		{
			g2 a4:m7 d:7 | \myEndLineVoltaNotLast
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
	\tempo "Moderato" 4 = 100
	\time 2/2
	\key g \major

	\repeat volta 2 {

		%% part "A"
		r4 b' \tuplet 3/2 { b c b } | d d2. | r4 g, \tuplet 3/2 { g a g } | b1 |
		r4 d, \tuplet 3/2 { d e d } | a' a2. | r4 a \tuplet 3/2 { a g fis } | g1 |

		%% part "A"
		r4 b \tuplet 3/2 { b c b } | d d2. | r4 g, \tuplet 3/2 { g a g } | b1 |
		r4 d, \tuplet 3/2 { d e d } | a' a2. | r4 a \tuplet 3/2 { a g fis } | g1 |

		%% part "B"
		a2 \tuplet 3/2 { g4 a g } | e d2. | r4 a' \tuplet 3/2 { a g e } | g1 |
		a2 \tuplet 3/2 { g4 a g } | e d2. | r8 b' b b b a4 g8 | a1 |

		%% part "A"
		r4 b \tuplet 3/2 { b c b } | d d2. | r4 g, \tuplet 3/2 { g a g } | b1 |
		r4 d, \tuplet 3/2 { d e d } | a' a2. | r4 a \tuplet 3/2 { a g fis } |
	} \alternative {
		{
			g2 r |
		}
		{
			g1 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Red Sails In The Sun -- set way out on the sea, oh! car -- ry my loved one
	home safe -- ly to me.

	%% part "A"
	He sailed at the dawn -- ing, all day I've been blue.
	Red Sails In The Sun -- set I'm trust -- ing in you.

	%% part "B"
	Swift wings you must bor -- row, make stright for the shore.
	We mar -- ry to -- mor -- row and he goes sail -- ing no more.

	%% part "A"
	Red Sails In The Sun -- set way out on the sea, oh! car -- ry my loved one home safe -- ly to me.

	%% part "Volta"
	me.
}
% endif
