<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	attributes['title']='Night And Day'
	attributes['style']='Jazz'
	# from the real book
	attributes['composer']='Cole Porter'
	# from wikipedia
	attributes['poet']='Cole Porter'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='f3f8f010-3fda-11e2-ad72-a3725b0aaeaa'
	attributes['structure']='AAB'
	attributes['location']='kw:42,rbk1:320'

	attributes['idyoutuberemark1']='Cannonical version by Frank Sinatra'
	attributes['idyoutube1']='mGGirB4XOmI'
	attributes['idyoutuberemark2']='Cole Porter version'
	attributes['idyoutube2']='5WX_fKVWX2s'
	attributes['lyricsurl']='http://www.lyricsfreak.com/f/frank+sinatra/night+day_20055251.html'
	attributes['wiki']='Night_and_Day_(song)'
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the meta data from the real book
	- filled in the chords from the real book version.
	- filled in this songs structure.
	- filled in the wikipedia link.
	- brought in the real book version.
	- brought in the kiselev book version.
	- checked the chords from the real book version.
	- fill in the meta data from the kiselev book version (there was no meta info).
	- fill in the tune from the real book version.
	- filled in the words from the internet for the real book version (there are no lyrics in the real book version).
	- check the tune from the real book version.
	- checked that the tune sounds right in the midi version.
	- bring you tube performances.
	- check the lyrics from the real book version.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 2 s2 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		d1:m7.5- | g:7 | c1*2:maj7 | \myEndLine
		d1:m7.5- | g:7 | c1*2:maj7 | \myEndLine
		fis1:m7.5- | f:m7 | e:m7 | ees:dim7 | \myEndLine
		d:m7 | g:7 | c:maj7 |
	} \alternative {
		{
			c:maj7 | \myEndLineVoltaNotLast
		}
		{
			bes:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	ees1*2:maj7 | c:maj7 | \myEndLine
	ees:maj7 | c:maj7 | \myEndLine
	fis1:m7.5- | f:m7 | e:m7 | ees:dim7 | \myEndLine
	d:m7 | g2:7 d:m7 | c1:6 | \LPC d2:7 \RPC g:7 | \myEndLine
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

	\partial 2 g'4 g8 g~ |

	%% part "A"
	\repeat volta 2 {
		g1~ | g2 \tuplet 3/2 { f4 e dis } | e1~ | e2 g4 g8 g~ |
		g4 g g g | g f \tuplet 3/2 { f e dis } | e1~ | e2 e4. e8 |
		e4 e e e | ees2~ ees8 ees4 ees8 | d4 d d d | d des8 c~ c4 b |
		a4 aes8 g~ g2 | g g'4 g8 g~ | g1~ |
	} \alternative {
		{
			g2 g4 g8 g |
		}
		{
			g2 g4 g |
		}
	}

	%% part "B"
	bes1~ | bes2 \tuplet 3/2 { g4 f ees } | g g8 g~ g2~ | g g4. g8 |
	bes c4 bes8 c4 bes8 c~ | c bes4 g8~ \tuplet 3/2 { g4 f ees } | g g8 g~ g2~ | g2 e!4. e8 |
	e4 e e e | ees2~ ees8 ees4 ees8 | d4 d d d | d8 des c b'~ b bes a4 |
	g4 g8 g~ g2~ | g c4 c8 c~ | c1 | r |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

	%% part "A"
	Night And Day __
	You are the one __
	On -- ly you __ be -- nea -- th the moon
	And under the sun __
	Whe -- ther near to me or far __ _
	No mat -- ter, dar -- ling Where you are __ _
	I think of __ you
	Night And Day __

	Day and night __

	%% part "B"
	_ Night And Day
	Un -- der the hide of me __
	There's an oh such a hun -- gry
	Year -- __ nin' bur -- __ nin' in -- side of me __
	And its tor -- ment won't be through __
	'Til you let me spend my life
	Mak -- ing love __ to you
	Day and night __
	Night And Day __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	_ _ _
	Why it is so __
	That this long -- __ ing for you
	Fol -- lows wher -- ever I go. __
	In the roa -- rin' tra -- ffic's boom __
	In the si -- lence of my lone -- ly room __ _
	I think of __ you
	Night And Day __
}
% endif
