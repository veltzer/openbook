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

	attributes['title']='Heart And Soul'
	attributes['style']='Jazz'
	attributes['composer']='Frank Losser, Hoagy Carmichael'
	attributes['poet']='Frank Losser, Hoagy Carmichael'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='2c3e3512-da7f-11e3-9149-3707f62022e6'
	attributes['structure']='AABA'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- mark what has been done to this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startSong
	\startChords

	\myMark "A"
	\startPart
	f2 d:m7 | g:m7 c:7 | f d:m7 | g:m7 c:7 | \myEndLine
	f d:m7 | g:m7 c:7 | f1 | g2:m7 c:9 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f d:m7 | g:m7 c:7 | f d:m7 | g:m7 c:7 | \myEndLine
	f d:m7 | g:m7 c:7 | f1 | f2. f4:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	bes2 a:7 | d:7 g:7 | c:7 f:7 | e:7 a:7 | \myEndLine
	bes a:7 | d:7 g:7 | c:9 f:7 | e:7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f d:m7 | g:m7 c:7 | f d:m7 | g:m7 c:7 | \myEndLine
	f d:m7 | g:m7 c:7 | a:7 d:7 | g:m7 g4:7 c:7 | f1~ | f | \myEndLine
	\endPart

	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
{
	\tempo "Andante Moderato" 4 = 88
	\time 2/2
	\key f \major

	%% part "A"
	f4 f f2~ | f8 f e d e f g4 | a a a2~ | a8 a g f g a bes4 |
	c2 f, | r8 d' c bes a4 g | f2~ f8 g a bes | c4 bes8 a g2 |

	%% part "A"
	f4 f f2~ | f8 f e d e f g4 | a a a2~ | a8 a g f g a bes4 |
	c2 f, | r8 d' c bes a4 g | f2~ f8 g a bes | c4 f,2. |

	%% part "B"
	r8 d' c bes a4. g8 | fis2 g | e f | d e |
	r8 d' c bes a4. g8 | fis2 g | e f | d e4. c8 |

	%% part "A"
	f4 f f2~ | f8 f e d e f g4 | a a a2~ | a8 a g f g a bes4 |
	c2 f, | r8 d' c bes a4 g | a1 | r8 bes a g f4 e | f1~ | f2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Heart and soul, __ I fell in love with you Heart and Soul, __ the way a fool would do,
	Mad -- ly, be -- case you held me tight __ and stole a kiss in the night.

	%% part "A"
	Heart and soul, __ I begged to be a -- dored; Lost con -- trol, __ and tum -- bled o -- ver -- board
	Glad -- ly, that mag -- ic night we kissed. __ there in the moon -- mist.

	%% part "B"
	Oh! but your lips were thrill -- ing, much too thirll -- ing. Nev -- er be -- fore were
	mine so strange -- ly will -- ing. But

	%% part "A"
	now I see __ what one em -- brace can do. Look at me, __ it's got me love -- ing you, Mad -- ly
	that lit -- tle kiss your stole Heald all my heart and soul. __
}
% endif
