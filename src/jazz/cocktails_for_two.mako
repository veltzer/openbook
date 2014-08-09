<%page args="part"/>
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

	attributes['title']="Cocktails For Two"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['composer']="Arthur Johnston and Sam Coslow"
	# this is from the fake book
	attributes['poet']="Arthur Johnston and Sam Coslow"
	# this is from the fake book
	attributes['piece']="Moderately"
	# this is from the fake book
	attributes['copyright']="1934 (Renewed 1961) Famous Music Corporation"

	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"
	attributes['completion']="5"
	attributes['uuid']="dd76c35c-da80-11e3-ac15-97e8d2a823ca"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- mark what has been done to this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 2.. s2..

	\myMark "A"
	\startPart
	\repeat volta 2 {
		c2 g:5+7 | c1 | g2:7 g:dim7 | g1:7 | \myEndLine
		d2:m7 g:7 | d:m7 g:5+7 |
	} \alternative {
		{
			c2 cis:dim7 | g1:7
		}
		{
			g1:m7 |
		}
	}
	\myEndLine
	\endPart

	\myMark "B"
	\startPart
	c2:7 c:5+7 | f:maj7 f:6 | bes1:9 | a:m7 | \myEndLine
	a:dim7 | d2:m7 g:7 | d:m7 g:7 | c cis:dim | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g1:7 | c2 g:5+7 | c1 | g2:7 g:dim7 | \myEndLine
	g1:7 | d2:m7 g:7 | d:m7 g:7 | c4:6 f:m c2 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key c \major

	\partial 2.. c8 e g gis b a8. e16 |

	%% part "A"
	\repeat volta 2 {
		a1~ | a8 c, e g gis b a8. e16 | g1~
		g8 d f a c e d8. c16 | a4. c8 b4. f8 | a4. c8 b4. g8 |
	} \alternative {
		{
			b g g g~ g2 | r8 c, e g gis b a8. e16 |
		}
		{
			d'8 g, g g~ g2 |
		}
	}
	%% part "B"
	r4 e'4 \times 2/3 { e4 e e } |
	e2 d | r4 d8 cis e d c b | d4. c8 c2 |
	r4 c8 b d c b a | c b~ b2 b8 a | a4. g8 g4. fis8 | a4. g8 g2 |
	r8 c, e g gis b a8. e16 | a1~ | a8 c, e g gis b a8. e16 | g1~ |
	g8 d f a c e d8. c16 | a4. c8 b4. f8 | a4. c8 b4. g8 | e' c c c~ c2 |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% part "A"
	In some se -- clud -- ed ren -- dez -- vous __ that o -- ver looks the av -- e --neu __
	with some one shar -- ing a de -- light -- ful chat, of this and that and
	%% Volta
	Cock -- tails For Two. __
	As we en -- joy a cig -- a --
	%% part "B"
	Cock -- tails For Two. __
	My head may go reel -- ing, but my heart will be o -- be -- di --ent
	with in -- tox -- i -- cat -- ing kiss -- es for the prin -- ci -- pal in -- gre -- di --ent.
	%% part "A"
	Most an -- y af -- ter -- nnon at five __ we'll be so gald we're both a -- live, __
	then may -- be for -- tune will com -- plete her plan that all be -- gan with Cock -- tails For Two. __
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {
	_ _ _ _ _ _ _
	rette, __ to some ex -- qui -- site chan -- son -- ette __
	two hand are sure to sly -- ly meet be -- neath a ser -- vi -- nette, with
}
% endif
