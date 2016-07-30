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

	attributes['title']='Fly Me To The Moon'
	attributes['style']='Jazz'
	# this is from the fake book
	attributes['subtitle']='In Other Words'
	# this is from the fake book
	attributes['composer']='Bart Howard'
	# this is from the fake book
	attributes['poet']='Bart Howard'
	# this is from the fake book
	attributes['piece']='Moderately, with a beat'
	# this is from the fake book
	attributes['copyright']='1954 and renewed 1982 Hampshire House Publishing Corp., New York NY.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='3244f4ae-159d-11e1-bbe3-0019d11e5a41'
	attributes['structure']='AB'
	attributes['location']='jfb:119'

	attributes['idyoutuberemark1']='The one and only Frank'
	attributes['idyoutube1']='oCW9Hey6IVY'
	attributes['idyoutuberemark2']='I didn\'t know that Diana Krall knew piano this well...'
	attributes['idyoutube2']='-b8brVSAAQA'
	attributes['lyricsurl']='http://www.metrolyrics.com/fly-me-to-the-moon-lyrics-frank-sinatra.html'
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the fake book epdf.
	- filled in the meta data from the fake book.
	- put in the tunes structure.
	- put in the fake book chords.
	- put in the fake book lyrics.
	- put in the fake book tune.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- played the fake book version to hear that it sounds well.
	- put in you tube performances with documentation.
	- put in a lyrics url.
	TODO:
	- add another version of this tune (from where?)
	REMARKS:
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		a1:m7 | d:m7 | g:7 | c:maj7 | \myEndLine
		f:maj7 | b:m7.5- | e:7.9- | a2.:m7 a4:7.9- | \myEndLine
		d1:m7 | g2.:7.9 g4:7.9- | c1:maj7.9 | a2.:m7 a4:m7.9 | \myEndLine
		d1:m7 | g:7 | f2:dim7/c c:maj7 | b:m7 e:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		a1:m7 | d:m7 | g:7 | c:maj7 | \myEndLine
		f:maj7 | b:m7.5- | e:7.9- | a2.:m7 a4:7.9- | \myEndLine
		d1:m7 | g2.:7.9 g4:7/f |
		\endPart
	} \alternative {
		{
			e1:m7.5- | a:7.9- | \myEndLine
			d:m7 | d2.:m7/g g4:7.9- | c1:6 | b2:m7 e:7 | \myEndLineVolta
		}
		{
			e2:m7.5- bes:7.9 | a1:7.9- | \myEndLine
			d:m7 | g2.:7 g4:7.9- | c2:6 bes4:6 b:6 | c1:6.9 | \myEndLineVoltaLast
		}
	}

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

	\repeat volta 2 {

		%% part "A"
		c'4 b a8 g4. | f g8 a4 c | b a g8 f4. | e1 |
		a4 g f8 e4. | d4. e8 f4 a | gis f e8 d4. | c2. cis4 |
		d8 a'4 a8~ a2~ | a4 c2 b4 | g1~ | g2. b,4 |
		c8 f4 f8~ f2~ | f4 a2 g4 | f2 e2~ | e1 |

		%% part "B"
		c'4 b a8 g4. | f g8 a4 c | b a g8 f4. | e1 |
		a4 g f8 e4. | d4 e4 f a | gis f e8 d4. | c2. cis4 |
		d8 a'4 a8~ a2~ | a4 c2 b4 |
	} \alternative {
		{
			g1~ | g2. gis4 |
			a8 c,4 c8~ c2~ | c4 c2 d4 | c1 | r |
		}
		{
			e'1~ | e2. c4 |
			d8 a4 a8~ a2~ | a4 b2 d4 | c1~ | c2. r4 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Fly Me To The Moon, and let me play a -- mong the stars;
	let me see what spring is like on Ju -- pi -- ter and Mars.
	In oth -- er words, __ hold my hand! __
	In oth -- er words, __ dar -- ling kiss me! __

	%% part "B"
	Fill my heart with song, and let me sing for -- ev -- er -- more;
	you are all I long for all I wor -- ship and a -- dore.
	In oth -- er words, __ please be true! __
	In oth -- er words, __ I love you!

	%% part "Volta"
	true! __ In oth -- er words, __ I love you! __
}
% endif
