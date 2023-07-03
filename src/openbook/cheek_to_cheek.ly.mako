<%page args='part'/>
% if part=='Vars':
<%
	from scripts import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.add_version('Real', version)
	attributes.set_default_version_name('Real')

	attributes['title']='Cheek to Cheek'
	attributes['style']='Jazz'
	# this is from the real book
	attributes['composer']='Irving Berlin'
	# this is from the real book
	attributes['piece']='Bright Swing'

	attributes['typesetter']='Mark Veltzer <mark.veltzer@gmail.com>'
	attributes['completion']='1'
	attributes['uuid']='1ae3c3d4-1951-11ee-94b2-4fe241ad9c11'
	attributes['structure']='AABA'
	attributes['location']='rbk3:50'

	attributes['idyoutuberemark1']=''
	attributes['idyoutube1']=''
	attributes['idyoutuberemark2']=''
	attributes['idyoutube2']=''
	attributes['lyricsurl']='https://www.azlyrics.com/lyrics/franksinatra/cheektocheek.html'
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- put in the tunes structure.
	- filled in the meta data.
	TODO:
	- put in you tube performances with documentation.
	- put in a lyrics url.
	- put in the real book chords.
	- put in the real book tune.
	- put in the real book lyrics.
	- checked the real book chords.
	- checked the real book tune.
	- checked the real book lyrics.
	- played the real book version to hear that it sounds well.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		c2:maj7 cis:dim7 | d:m7 g:7 | c:maj7 cis:dim7 | d:m7 g:7 | \myEndLine
		c:maj7 d:m7 | ees:dim7 e:m7 | bes1:7.11+ | a2:7 d:7 | \myEndLine
		g:7 d:m7 | e:m7 f:7 | bes1:7.11+ | a:7 | \myEndLine
		d:m7 | g:7 |
	} \alternative {
		{
			e2:m7 a:7 | d:m7 g:7 | \myEndLineVoltaNotLast
		}
		{
			c1:6.9 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	\repeat volta 2 {
		d1:m7/g | c/g | d:m7/g | c/g | \myEndLine
		d:m7/g | c/g | d:m7/g |
	} \alternative {
		{
			c:6.9/g | \myEndLineVoltaNotLast
		}
		{
			c1:6.9 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

	%% part "A"
	\repeat volta 2 {
	} \alternative {
		{
		}
		{
		}
	}

	%% part "B"
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

	%% part "A"
	A Fog -- gy Day in Lon -- don town had __ _ me low and had me down.
	I viewed the morn -- ing with a -- larm, the Brit -- ish Mu -- seum had lost its charm.

	%% part "B"
	How long I wondered could this thing last? But_the age of mira -- cles had -- n't passed,
	for sud -- den -- ly I saw you there and through fog -- gy Lon -- don town the sun was shin -- ing ev -- 'ry where. __
}
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		f1:maj7 | a2:m7.5- d:7.9- | g1:m7 | c:7 | \myEndLine
		f2. d4:m7.5- | d1:m7.5- | g:7 | g2:m7 c:7 | \myEndLine
		f1:maj7 | c2:m7 f:7 | bes1:maj7 | bes:m6 | \myEndLine
		f:maj7 | a2:m7 d:7 | g1:7.9 | g2:m7 c:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		f1:maj7 | a2:m7.5- d:7.9- | g1:m7 | c:7 | \myEndLine
		f2. d4:m7.5- | d1:m7.5- | g:7 | g2:m7 c:7 | \myEndLine
		c1:m7 | f:7 | bes:maj7 | ees:7 | \myEndLine
		f2 g:m7 | a:m7 bes:m6 | a:m7 d:m7 | g:m7 c:7 | \myEndLine
	} \alternative {
		{
			f1 | g2:m7 c:7 | \myEndLineVoltaNotLast
		}
		{
			f1 | bes2:7 bes:m6 | f1:maj7 | \myEndLineVoltaLast
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
	\time 4/4
	\key f \major

	\partial 4 c4 |

	\repeat volta 2 {

	%% part "A"
	c c2 ees4~ | ees2. ees4 | d d2 a'4~ | a1 |
	f2 f4 aes~ | aes2. aes4 | g2 g4 d'~ | d1 |
	r4 e e e | c c2. | a2 a4 f~ | f2. f4 |
	a a a c~ | c c2 c4 | a2 a4 d,~ | d2. c4 |

	%% part "B"
	c2 c4 ees~ | ees ees2 ees4 | d2 d4 a'~ | a2 a4 a |
	f2 f4 aes~ | aes bes aes2 | g g4 d'~ | d2. d4 |
	f2 f4 d~ | d2. d4 | c2 c4 a~ | a2 a4 bes |
	c f, g bes | a f g bes | a2 f' | f, g |

	} \alternative {
		{
			f1 | r2 r4 c |
		}
		{
			f1~ | f~ | f |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	A Fog -- gy Day __ in Lon -- don town __ had me low __ and had me down. __
	I viewed the morn -- ing with a -- larm, __ the Brit -- ish Mu -- se -- um had lost its charm. __

	%% part "B"
	How long I won -- dered could this thing last? __ But the age of mir -- a -- cles had -- n't passed, __
	for sud -- den -- ly, __ I saw you there __ and through fog -- gy Lon -- don town the sun was shin -- ing ev -- 'ry where.

	%% part "Volta"
	A where. __
}
% endif
