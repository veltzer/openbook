<%page args='part'/>
% if part=='Vars':
<%
	# vim: set filetype=lilypond :
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('TBK', version)
	attributes.setDefaultVersionName('TBK')

	attributes['title']='Always'
	attributes['style']='Jazz'
	# this is from the internet
	attributes['composer']='Irving Berlin'
	# this is from the internet
	attributes['poet']='Irving Berlin'
	# this is from 'The Book'
	attributes['piece']='Waltz'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='e2f7709c-da80-11e3-80dc-7f255b43b3a5'
	attributes['structure']='AB'
	attributes['structureremark']='The tune has an ABAC feel to it because the A and B part start off the same way'
	attributes['location']='tbk:354'

	attributes['idyoutuberemark1']='Frank!'
	attributes['idyoutube1']='eLh-m1Z_feY'
	attributes['idyoutuberemark2']='Billie!'
	attributes['idyoutube2']='iQPdnqDAJE4'
	attributes['lyricsurl']='http://www.metrolyrics.com/always-lyrics-irving-berlin.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added location.
	- added lyrics url.
	- added youtube performances.
	- added structure comments.
	- add "The Book" chords.
	- add "The Book" tune.
	- add lyrics.
	- checked "The Book" chords.
	- checked "The Book" tune.
	- checked lyrics.
	TODO:
	- add another version of this tune.
% endif

% if part=='ChordsTBK':
\chordmode {
	\startSong
	\startChords

	\repeat volta 2 {

		\myMark "A"
		\startPart
		f2.*4 | \myEndLine
		c2.*2:7 | f | \myEndLine
		f2. | f2 f4:7 | a2.*2 | \myEndLine
		e:7 | a2. | c2.:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		f2.*2 | f2.:7 | f4:7/f f:7/e f:7/ees | \myEndLine
		d2.*2:7 | c4:m g2:m | g2.:m | \myEndLine
		g:m | bes:m | f | g:9 | \myEndLine
		c2.*2:7 |
	} \alternative {
		{
			f2. | c:7 | \myEndLineVoltaNotLast
		}
		{
			f2.*2 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endChords
	\endSong
}
% endif

% if part=='VoiceTBK':
{
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Andante" 4 = 88
	\time 3/4
	\key f \major

	\repeat volta 2 {

		%% part "A"
		c4. d8 f g | a2. | c4 a2~ | a2. |
		c,4. d8 e f | g2. | a4 f2~ | f2. |
		c4. d8 f g | a2. | e4. fis8 a b | cis2. |
		e,4. fis8 gis b | d2. | cis4 a2 | a4 g2 |

		%% part "B"
		c,4. d8 f g | a2. | c4 a2~ | a2. |
		d,4. e8 fis a | d2. | es4 d2~ | d2. |
		bes4. a8 g a | bes2. | a4. g8 f g | a2. |
		g4. f8 e f | g2 c,4 |
	} \alternative {
		{
			a'4 f2~ | f4 r r |
		}
		{
			a4 f2~ | f2 r4 |
		}
	}
}
% endif

% if part=='LyricsTBK':
\lyricmode {

	%% part "A"
	I'll be lov -- ing you, Al -- ways __
	With a love that's true, Al -- ways __
	When the things you've planned
	Need a help -- ing hand,
	I will un -- der -- stand, Al -- ways, Al -- ways.

	%% part "B"
	Days may not be fair, Al -- ways __
	That's when I'll be there, Al -- ways. __
	Not for just and hour, Not for just a day,
	Not for just a year, But Al -- ways. __

	%% part "Volta"
	Al -- ways. __
}
% endif
