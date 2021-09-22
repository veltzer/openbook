<%page args='part'/>
% if part=='Vars':
<%
	from scripts import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Latin', version)
	attributes.setDefaultVersionName('Latin')

	attributes['title']='Bésame Mucho'
	# this if the the latin real book
	attributes['style']='Jazz'
	# from the internet
	attributes['subtitle']='Kiss Me Much'
	# this is from the latin real book
	attributes['composer']='Consuelo Velazquez'
	# this is from the fake book
	attributes['poet']='Consuelo Velazquez'
	# this is the english poet from the internet
	#attributes['poet']='Sunny Skylar'
	# this is from the latin real book
	attributes['piece']='Slow Bolero'
	# need to fill this
	#attributes['copyright']='1963, 1964 by Antonio Carlos Jobim and Vincius De Moraes, Brazil'
	#attributes['copyrightextra']='Sole Selling Agent Duchess Music Corporation (MCA), New York, NY for the U.S.A. and Canada'

	attributes['typesetter']='Mark Veltzer <mark.veltzer@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='4901d188-1bcf-11ec-ae63-33f52bed6236'
	attributes['structure']='ABA'
	# attributes['structureremark']
	attributes['location']='lrb:26'

	attributes['idyoutuberemark1']='Classical version by Cesaria Evora'
	attributes['idyoutube1']='LLsg_Lk819s'
	attributes['idyoutuberemark2']='From the composer herself which is quite a piano virtuoso'
	attributes['idyoutube2']='0u0bX5gBCRw'
	attributes['lyricsurl']='https://www.lyrics.com/lyric/20915968/Ces%C3%A1ria+%C3%89vora/Besame+Mucho'
%>
% endif

% if part=='Doc':
	DONE:
	- played the latin book version to hear that it sounds well.
	- put in you tube performances with documentation.
	- put in a lyrics url.
	- filled in the meta data from the latin book.
	- put in the tunes structure.
	TODO:
	- brought in the latin book epdf.
	- put in the latin book chords.
	- put in the latin book tune.
	- put in the latin book lyrics.
	- checked the latin book chords.
	- checked the latin book tune.
	- checked the latin book lyrics.
	- heard the latin book version.
% endif

% if part=='ChordsLatin':
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

% if part=='VoiceLatin':
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

% if part=='LyricsLatin':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

	%% part "A"
	How __ In -- sen -- si -- tive __ I must have seemed __ when she told me that __ she loved me. __
	How __ un -- moved and cold __ I must have seemed __ when she told me so sin -- cere -- __ ly. __
	Why, __ she must have asked, __ did I just turn __ and stare in i -- cy si -- lence? __
	What __ was I to say? __ What can you say __ when a love af -- fair is o -- ver? __
}
% endif

% if part=='LyricsmoreLatin':
\lyricmode {

	%% part "B"
	Now, __ she's gone a -- way __ and I'm a -- lone __ with the mem -- 'ry of __ her last look. __
	Vague __ dra -- wn and sad, __ I see it still, __ all her heart- break in that last __ look. __
	How, __ she must have asked, __ could I just turn __ and stare in i -- cy si -- lence? __
	What __ was I to do? __ What can one do __ when a love af -- fair is o -- ver? __
}
% endif
