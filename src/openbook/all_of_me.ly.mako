<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	attributes['title']='All Of Me'
	attributes['style']='Jazz'
	attributes['composer']='Seymour Simons, Gerald Marks'
	attributes['poet']='Seymour Simons, Gerald Marks'
	# this if from the real book
	attributes['piece']='Mod. Swing'
	# this is from the fake book
	#attributes['piece']='Moderately'
	# this is from the fake book
	attributes['copyright']='1931 Bourne Co. Copyright Renewed'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='6dd0233c-03b8-11e1-b5a9-0019d11e5a41'
	attributes['structure']='AB'
	attributes['structureremark']='the structure of this tune could also be interpreted as ABAC since the 8 first bars of A and B are the same.'
	attributes['location']='rbk1:16,jfb:39'

	attributes['idyoutuberemark1']='Louis Armstrong with amazing rythm'
	attributes['idyoutube1']='wFzxo-XI8As'
	attributes['idyoutuberemark2']='Ella Firtzerald - amazing'
	attributes['idyoutube2']='Mx5b4AFVaT8'
	attributes['idyoutuberemark3']='Oscar - amazing version'
	attributes['idyoutube3']='aNLvaBCFHdE'
	attributes['lyricsurl']='http://www.lyrics007.com/Frank%20Sinatra%20Lyrics/All%20Of%20Me%20Lyrics.html'
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the structure of the tune.
	- wrote down the real book chords.
	- added a lyrics url.
	- wrote down the real book tune.
	- wrote down the real book lyrics.
	- checked the real book lyrics.
	- bring in real book pdf.
	- bring in fake book pdf.
	- fill in the meta data from the fake book pdf.
	- checked the real book chords.
	- checked the real book tune.
	- hear the tune, adjust it's speed and see it's ok.
	- put you tube performances.
	TODO:
	- add the fake book version.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	c1*2:maj7 | e:7 | \myEndLine
	a:7 | d:m | \myEndLine
	e:7 | a:m | \myEndLine
	d:7 | d1:m7 | g:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	c1*2:maj7 | e:7 | \myEndLine
	a:7 | d:m | \myEndLine
	f1 | f:m | c2:maj7 e:m7 | a1:7 | \myEndLine
	d:m7 | g:7 | c2:6 \LPC ees:dim | d:m7 \RPC g:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 168
	\time 4/4
	\key c \major

	%% part "A"
	c'4 g8 e~ e2~ | e \tuplet 3/2 { c'4 d c } | b gis8 e~ e2~ | e1 |
	a4. g8 e2~ | e4 dis \tuplet 3/2 { e bes' a } | g2 f~ | f1 |
	e4. ees8 d2~ | d \tuplet 3/2 { e4 gis b } | d2 c~ | c1 |
	b4. bes8 a2~ | a \tuplet 3/2 { a4 d b } | a1 | b |

	%% part "B"
	c4 g8 e~ e2~ | e \tuplet 3/2 { c'4 d c } | b gis8 e~ e2~ | e1 |
	a4. g8 e2~ | e4 dis \tuplet 3/2 { e bes' a } | g2 f~ | f1 |
	d'2 c4 b | d2. c4 | b2 e,4 g | b2. a4 |
	c2 a4 c | e2 e | c1~ | c |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the internet but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

	%% part "A"
	All of me __
	why not take all of me __
	Can't you see __
	I'm no good with -- out you __

	Take my lips __
	I want to lose them __
	Take my arms __
	I'll ne -- ver use them __

	%% part "B"
	Your good -- bye __
	left me with eyes that cry __
	How can I __
	get a -- long with -- out you __

	You took the part
	that once was my heart
	So why not
	take all of me __
}
% endif
