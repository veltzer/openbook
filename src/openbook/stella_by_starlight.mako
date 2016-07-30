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

	attributes['title']='Stella By Starlight'
	attributes['style']='Jazz'
	attributes['composer']='Victor Young'
	attributes['poet']='Ned Washington'
	attributes['piece']='Slowly, with Expression'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='afea10ce-edc0-11e0-9cc4-0019d11e5a41'
	attributes['structure']='AB'
	attributes['location']='rbk1:408'
	attributes['remark']='there are a couple of different lyric versions for this song'

	attributes['idyoutube1']='Iqs3w1Q5sto'
	attributes['idyoutube2']='IbzxJuvbH08'
	attributes['lyricsurl']='http://www.lyrics007.com/Ella%20Fitzgerald%20Lyrics/Stella%20By%20Starlight%20Lyrics.html'
%>
% endif

% if part=='Doc':
	DONE:
	- checked the real book chords.
	- checked the real book notes.
	- heard it and made sure it sounds fine.
	- wrote the lyrics and adjusted them to the tune.
	- got epdf for the real book.
	- there is no fake book version of this tune.
	TODO:
	- fill in the copyright.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	e1:m7.5- | a:7.9- | c:m7 | f:7 | \myEndLine
	f:m7 | bes:7 | ees:maj7 | aes:7 | \myEndLine
	bes:maj7 | e2:m7.5- a:7.9- | d1:m7 | bes2:m7 ees:7 | \myEndLine
	f1:maj7 | e2:m7.5- a:7 | a1:m7.5- | d:7.9- | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	g1*2:7.5+ | c:m7 | \myEndLine
	aes:7 | bes:maj7 | \myEndLine
	e1:m7.5- | a:7.9- | d:m7.5- | g:7.9- | \myEndLine
	c:m7.5- | f:7.9- | bes1*2:maj7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key bes \major

	\partial 4 bes'4 |

	%% part "A"
	a1~ | a4 g a bes | f1~ | f2. f4 |
	g1~ | g4 f f g | bes,1~ | bes2. c4 |
	ees d c bes | d2. e4 | g4. f8 f2~ | f2. g4 |
	bes a g f | g2 a4 bes | d4. c8 c2~ | c d |

	%% part "B"
	ees1~ | ees4 ees ees d | f1~ | f4 ees \tuplet 3/2 { d c bes } |
	d2 d2~ | d4 c bes a | c1~ | c2. bes4 |
	a1~ | a4 g a bes | f1~ | f4 f f ees |
	ges1~ | ges4 ges ges f | f1~ | f1 |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

	%% part "A"
	The song a rob -- in sings,
	Through years of end -- less springs,
	The mur -- mur of a brook at even -- ing tides.
	That rip -- ples through a nook where two lov -- ers hide.

	%% part "B"
	That great sym -- pho -- nic theme,
	That's Stel -- la by star -- light,
	And not a dream,
	My heart and I ag -- ree,
	She's eve -- ry -- thing on_this earth to me.
}
% endif
