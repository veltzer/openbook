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
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Real', version)

	attributes['title']='How Insensitive'
	attributes['style']='Jazz'
	# from the internet
	attributes['subtitle']='Insensatez'
	# this is from the real book
	#attributes['composer']='A.C. Jobim'
	# this is from the fake book
	attributes['composer']='Antonio Carlos Jobim'
	# this is from the fake book
	attributes['poet']='Vincius De Moraes, Norman Gimbel'
	# this is from the real book
	#attributes['piece']='Bossa'
	# this is from the fake book
	attributes['piece']='Moderately'
	# this is from the fake book
	attributes['copyright']='1963, 1964 by Antonio Carlos Jobim and Vincius De Moraes, Brazil'
	attributes['copyrightextra']='Sole Selling Agent Duchess Music Corporation (MCA), New York, NY for the U.S.A. and Canada'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='ee9c0d62-15fd-11e1-bd56-0019d11e5a41'
	attributes['structure']='AB'
	attributes['structureremark']='this tunes structure can also be categorised as ABAC since the first 8 bars of both the first and second part are the same.'
	attributes['location']='rbk1:203,jfb:150'

	attributes['idyoutuberemark1']='Jobim with Pat Metheny'
	attributes['idyoutube1']='VendEbBv3nc'
	attributes['idyoutuberemark2']='Astrud Gilberto in the classic version'
	attributes['idyoutube2']='nIW049UrhGM'
	attributes['lyricsurl']='http://www.lyricsmode.com/lyrics/a/antonio_carlos_jobim/how_insensitive.html'
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- filled in the meta data from the real book.
	- put in the tunes structure.
	- put in the real book chords.
	- brought in the fake book epdf.
	- filled in the meta data from the fake book.
	- put in the real book tune.
	- checked the real book chords.
	- checked the real book tune.
	- put in the real book lyrics.
	- checked the real book lyrics.
	- played the real book version to hear that it sounds well.
	- put in you tube performances with documentation.
	- put in a lyrics url.
	- add the fake book chords.
	- add the fake book tune.
	- add the fake book lyrics.
	- check the fake book chords.
	- check the fake book tune.
	- check the fake book lyrics.
	- heard the fake book version.
	TODO:
	- this song has two poets one for the original portugese and one for english. This is not reflected in the output,
		make it not so.
	- in the real book version of the chords in the B section the des:7 should come in the middle of the bar and I
		have no way to indicate that. The original real book score does indicate that using tempo markings.
		Find out how to do that in lilypond and do it.
	REMARKS:
	- this tune was written in the real book under a C major scale (or A minor scale) where the B is always flat.
		Obviously this is a serious mistake.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	d1*2:m9 | cis:dim7 | \myEndLine
	c:m6 | g:7/b | \myEndLine
	bes:maj7 | ees:maj7 | \myEndLine
	e1:m7.5- | a:7.9- | d:m7 | des:13 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	c1*2:m7 | b:dim7 | \myEndLine
	bes1:maj7 | e2:m7.5- a:7 | d1.:m7 des2:7 | \myEndLine
	c1:m9 | f:7 | b:m7 | e:7.9- | \myEndLine
	bes:maj7 | a:7 | d1*2:m7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key d \minor

	%% part "A"
	a'1~ | a8 bes4 a bes a8~ | a1~ | a8 bes4 a bes a8~ |
	a2~ \tuplet 3/2 { a4 gis a } | c8 b4 bes8~ bes a4. | a4. g8~ g2~ | g1 |
	g~ | g8 a4 g a g8~ | g1~ | g8 a4 g a g8~ |
	g2~ \tuplet 3/2 { g4 fis g } | bes4. a8 \tuplet 3/2 { aes4 g g~ } | g4. f8~ f2~ | f1 |

	%% part "B"
	f1~ | f8 g4 f g f8~ | f1~ | f8 g4 f g a8~ |
	a2. f4 | d e d e | f2 f~ | f1 |
	f~ | f4. g8 f g4 e8~ | e1~ | e8 f4 e f e8~ |
	e2~ \tuplet 3/2 { e4 dis e } | g4. ges8 f4 e | e4. d8~ d2 | r1 |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

	%% part "A"
	How __ In -- sen -- si -- tive __ I must have seemed __ when she told me that __ she loved me. __
	How __ un -- moved and cold __ I must have seemed __ when she told me so sin -- cere -- __ ly. __
	Why, __ she must have asked, __ did I just turn __ and stare in i -- cy si -- lence? __
	What __ was I to say? __ What can you say __ when a love af -- fair is o -- ver? __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "B"
	Now, __ she's gone a -- way __ and I'm a -- lone __ with the mem -- 'ry of __ her last look. __
	Vague __ dra -- wn and sad, __ I see it still, __ all her heart- break in that last __ look. __
	How, __ she must have asked, __ could I just turn __ and stare in i -- cy si -- lence? __
	What __ was I to do? __ What can one do __ when a love af -- fair is o -- ver? __
}
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		d1*2:m7 | des:dim7 | \myEndLine
		c:m6 | g:7 | \myEndLine
		bes:maj7 | ees:maj7 | \myEndLine
		e1:m7.5- | a:7.9- | d:m7 | des:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		c1*2:m7 | b:dim7 | \myEndLine
		bes1:maj7 | e2:m7.5- a:7.9- | d1.:m7 des2:7 | \myEndLine
		c1:m7 | f:7 | b:m7 | e:7.9- | \myEndLine
		g:m6 |
	} \alternative {
		{
			a:7 | d:m7 | e2:m7.5- a:7.9- | \myEndLineVolta
		}
		{
			a1:7 | d2:m d:m6 | d1:m6 | \myEndLineVolta
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
	\key d \minor

	\repeat volta 2 {

		%% part "A"
		a'1~ | a4 bes8 a~ a bes4 a8~ | a1~ | a4 bes8 a~ a bes4 a8~ |
		a2~ a8 gis4 a8 | c b4 bes8~ bes a4 a8~ | a4. g8~ g2~ | g2~ g4. g8~ |
		g1~ | g4 a8 g~ g a4 g8~ | g1~ | g4 a8 g~ g a4 g8~ |
		g2 r8 fis4 g8 | bes a4 gis8~ gis g4 g8~ | g4. f8~ f2~ | f~ f4. f8~ |

		%% part "B"
		f1~ | f4 g8 f~ f g4 f8~ | f1~ | f4 g8 f~ f g4 a8~ |
		a2. f4 | d e8 d~ d e4 f8~ | f2 f~ | f~ f4. f8~ |
		f1~ | f4 g8 f~ f g4 e8~ | e1~ | e4 f8 e~ e f4 e8~ |
		e2 r8 dis e g~ |
	} \alternative {
		{
			g fis4 f8~ f e4 e8~ | e4. d8~ d2~ | d4 r r2 |
		}
		{
			g8\repeatTie fis4 f8~ f e4 e8~ | e4. d8~ d2~ | d2.\fermata r4 |
		}
	}
}
% endif

% if part=='LyricsFake':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

	%% part "A"
	How __ In -- sen -- __ si -- tive __ I must __ have seemed __ when she told me that __ she loved __ me. __
	How __ un -- moved __ and cold __ I must __ have seemed __ when she told me so __ sin -- cere -- __ ly. __
	Why, __ she must __ have asked, __ did I __ just turn __ and stare in i -- __ cy si -- lence? __
	What __ was I __ to say? __ What can __ you say __ when a love __ af -- fair __ is o -- __ ver? __

	%% part "Volta"
	_ af -- fair __ is o -- __ ver? __
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {

	%% part "B"
	Now, __ she's gone __ a -- way __ and I'm __ a -- lone __ with the mem -- 'ry of __ her last __ look. __
	Vague __ _ drawn __ and sad, __ I see __ it still, __ all her heart- break in __ that last __ look. __
	How, __ she must __ have asked, __ could I __ just turn __ and stare in i -- __ cy si -- lence? __
	What __ was I __ to do? __ What can __ one do __ when a love __
}
% endif
