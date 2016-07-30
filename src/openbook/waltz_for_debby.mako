<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	version['doLyricsmoremore']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	# from the fake book
	attributes['title']='Waltz For Debby'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Bill Evans'
	# from the fake book
	attributes['poet']='Gene Lees'
	# from the fake book
	attributes['piece']='Moderately, in one'
	# from the fake book
	attributes['copyright']='1964 and 1965 Acom Music Corp., New York, NY.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='010d881c-e348-11e3-bd2b-af99bf9a3980'
	attributes['structure']='AABA'
	attributes['location']='jfb:414'

	attributes['idyoutuberemark1']='Bill Evans in great form'
	attributes['idyoutube1']='dH3GSrCmzC8'
	attributes['idyoutuberemark2']='Bill with Tony Bennett'
	attributes['idyoutube2']='lsb8mYrYycE'
	attributes['lyricsurl']='http://www.azlyrics.com/lyrics/tonybennett/waltzfordebby.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the fake book.
	- put in the tunes structure
	- added the meta data from the fake book.
	- put in the lyrics (fakebook).
	- put in the chords (fakebook).
	- put in the tune (fakebook).
	- check the chords (fakebook).
	- check the tune (fakebook).
	- check the lyrics (fakebook).
	- heard the tune to check that it is right and adjust the tempo.
	- added lyrics url.
	- added youtube performances.
	TODO:
	- lilypond does not create the midi for this one right because of the code and all. fix this.
	- add another version of this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 3 {
		g2.:m7 | c:m7 | f:m7 | bes:7 | g:7 | g2:m7.5- c4:7 | f2.:7 | bes:7 |
		ees:7 | aes:maj7 |
	} \alternative {
		{
			f:m7.5- | bes2:7 bes4:7/aes | g2.:m7 | c:7 | f:m7 | bes:7 | \myEndLineVoltaNotLast
		}
		{
			a:m7 | d2:7 d4:7/c | b2.:m7 | a:m7 | g:maj7 | fis:m7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	f2.:m7 | bes:7 | g:m7 | c2:7.5- c4:7 | f2.:m7 | g:7 | c:m7 | bes:m7/ees | \myEndLine
	aes:maj7 | g:7 | c:m7 | f:9 | g:m7 | ges:7 | f:m7 | bes:7 | \myEndLine
	\endPart

	%%\myMark "Coda"
	\mark \markup { \musicglyph #"scripts.coda" }
	\startPart
	g2.:m7 | c2:7.5- c4:7 | a2.:m7 | d:7 | g:m7 | ees2:11 ees4:7 | \myEndLine
	aes2.:maj7 | des:9 | c:m | c:m7/bes | f:7/a | aes:dim7 | ees:6/g | ges:dim7 | \myEndLine
	f:m7 | bes2:9 bes4:7.9- | ees2. | ees:6.9 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Presto" 4 = 200
	\time 3/4
	\key ees \major

	%% part "A"
	%%\repeat volta 2 {
		bes'2. | ees, | aes | d, | g~ | g | r4 f ees | d ees f |
		g2 f4 | ees f g |
	%%} \alternative {
	\set Score.repeatCommands = #'((volta "1, 3") end-repeat)
	%%	{
			aes aes g | f g aes | bes2.~ | bes~ | bes~ | bes |
	%%	}
	\set Score.repeatCommands = #'((volta #f) (volta "2.") end-repeat)
	%%	{
			a!2 g4 | fis! g a! | b!2.~ | b~ | b~ | b |
	%%	}
	%%}
	\set Score.repeatCommands = #'((volta #f))

	%% part "B"
	c2.~ | c2 bes4 | c2.~ | c2 bes4 | c bes aes | g2 d4 | f2 ees4 | c' bes aes |
	g2 aes4 | g2 d4 | ees g bes | d ees c | bes2.~ | bes~ | bes~ | bes^\markup {D.C. al Coda} |

	%% part "Coda"
	c2.~ | c | r4 d c | d c d | bes2.~ | bes |
	r4 bes aes | bes aes bes | g2.~ | g~ | g | r4 f ees | f ees f | ees f ees |
	c'2. | d, | ees( | bes') |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	In her own sweet world, __ pop -- u -- lat -- ed by dolls and clowns and a
	prince and a big pur -- ple bear, __
	wear -- y grown -- ups all wear. __

	%% part "B"
	In __ the sun, __ she danc -- es to si -- lent mu -- sic, songs that are spun of
	gold some -- where in her own lit -- tle head. __

	%% part "Coda"
	bear. __ When she goes they will cry __ as they whis -- per "\"good" -- "bye.\"" __
	They will miss her, I fear, but then, so will I. __
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {

	%% part "A"
	lives my fav -- 'rite girl, __ un -- a -- ware of the wor -- ried frowns that we
}
% endif

% if part=='LyricsmoremoreFake':
\lyricmode {

	%% part "A"
	one day all too soon __ she'll grow up and she'll leave her dolls and her prince and
	her sil -- ly old
}
% endif
