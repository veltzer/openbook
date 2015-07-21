<%page args='part'/>
% if part=='Vars':
<%
	# vim: set filetype=lilypond :
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	attributes['title']='Once I Loved'
	attributes['style']='Jazz'
	# from the real book
	attributes['composer']='Antonio Carlos Jobim'
	# Ray Gilbert from the new real book
	attributes['poet']='Vinicius DeMoraes, Ray Gilbert'
	# from the real book
	attributes['piece']='Bossa'
	# from the new real book
	#attributes['piece']='Med.-Slow Bossa Nova'
	# from the new real book
	attributes['copyright']='1965, Ipanema Music. Used By Permission.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='18294374-a26f-11df-a5f0-0019d11e5a41'
	attributes['structure']='AAB'
	attributes['location']='rbk1:329,nrbk1:250'

	attributes['idyoutuberemark1']='Joe Henderson accompanied by guitar doing Bossa...'
	attributes['idyoutube1']='rJxHFW2S-Eo'
	attributes['idyoutuberemark2']='Astrud Gilberto (original Bossa Style with Orchestra)'
	attributes['idyoutube2']='BwP0eIRU-dQ'
	attributes['lyricsurl']='http://www.sing365.com/music/lyric.nsf/Once-I-Loved-lyrics-Ella-Fitzgerald/24CD6F6E245519E348256AAB0009C557'
%>
% endif

% if part=='Doc':
	DONE:
	- added the chords.
	- added the melody.
	- added the lyrics.
	- marked out the structure of this tune.
	- filled in poet and composer.
	- heard the tune and it sounded fine.
	- adjusted the lyrics.
	- added copyright materials.
	- added lyrics url.
	- added youtube urls.
	- added epdfs.
	- checked the chords.
	- checked the tune.
	- checked the lyrics.
	TODO:
	- add the version from the new real book.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		g1:m7 | c:7.5+ | f:maj7 | fis:dim7 | \myEndLine
		g:m7 | gis:dim7 | a:m7 | a:m7/g | \myEndLine
		f:m7 | bes:7.5+ | ees1*2:maj7 | \myEndLine
		e1:m7.5- | a:7.9- |
	}
	\alternative {
		{ d:maj7 | d:7.9- | }
		{ d:maj7 | g:7 | \myEndLine }
	}
	\endPart

	\myMark "B"
	\startPart
	c1:maj7 | f:7 | bes1*2:maj7 | \myEndLine
	b1:dim7 | bes:m6 | a:m6 | aes:7.5- | \myEndLine
	g:7 | g2:m7 a:7.9- | d1:m6 | d2:m6 \OPC d:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 144
	\time 4/4
	\key f \major

	%% part "A"
	\repeat volta 2 {
		d'1~ | d2~ d8 c4 a8~ | a1~ | a2 \tuplet 3/2 { r4 bes c } |
		\tuplet 3/2 { d d d } \tuplet 3/2 { d d d } | d2 \tuplet 3/2 { f4 e d } |
		\tuplet 3/2 { e c a~ } a2~| a2. r4 |
		c1~ | c2~ c8 bes4 g8~ | g1~ | g2 \tuplet 3/2 { r4 g a } |
		\tuplet 3/2 { bes bes a } \tuplet 3/2 { c c bes } | a2 \tuplet 3/2 { g4 bes a } |
	}
	\alternative {
		{ g8 fis4 fis8~ fis2~ | fis r }
		{ g8 fis4 a8~ a2 | g8 f!4 a8~ a g4 e8~ | }
	}

	%% part "B"
	e1 | g2~ g8 f4 d8~ | d1~ | d2 \tuplet 3/2 { r4 d e } |
	\tuplet 3/2 { f f e~ } \tuplet 3/2 { e g ges } | f2~ f8 f4 des8 | e4 d8 d~ d2~ |
	d2 \tuplet 3/2 { r4 d e } | \tuplet 3/2 { f f e~ } \tuplet 3/2 {e g ges } |
	f2~ f8 f4 cis8 | e4. d8 d2~ | d1 |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
	Once __ __ I loved, __ __
	And I gave so much love to this love,
	You were the world to me; __ __

	Once __ __ I cried __ __
	at the thought I was fool -- ish and proud
	and let you say good -- bye. __ __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	Then __ __ one day, __ __
	From my in -- fi -- nite sad -- ness you came
	and brought me love a -- gain; __ __
	Now __ __ I know __ __
	that no mat -- ter what -- ev -- er be -- falls
	I'll nev -- er _ _ _ let you go, __

	I will hold __ you close, __
	Make __ you stay; __ __
	Be -- cause love is the __ sad -- dest thing __
	when it goes a -- way, __ __
	Be -- cause love is the __ sad -- dest thing __
	when it goes a -- way, __
}
% endif
