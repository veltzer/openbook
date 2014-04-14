<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=False
	attributes['render']="Fake"

	attributes['title']="I'll Never Smile Again"
	attributes['style']="Jazz"
	attributes['composer']="Ruth Lowe"
	attributes['poet']="Ruth Lowe"
	attributes['piece']="Moderately"
	attributes['copyright']="1939 MCA Music Publsihing, A Division of MCA inc,."
	attributes['copyrightextra']=""
	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"

	attributes['completion']="5"
	attributes['uuid']=""
	attributes['structure']=""

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 2.
	s2.

	\repeat volta 2 {
		\myMark "A"
		\startPart
		f1:m7 | bes:7 | ees2:maj7 f:m7 | g:m7 ges:dim7 | f1:m7 | bes:7 |
		ees | ees |
		\endPart
		\myMark "B"
		\startPart
		b2:7.5+ bes:7 | ees1 | f2:m7.5- bes:7.5+ | ees2.:maj7 d4:9 | g2 d:7 | g ges:dim7 |
		f1:m7 | bes4:7 ees:maj7 g:m7 ges:dim |
		\endPart
		\myMark "A"
		\startPart
		f1:m7 | bes:7 | ees2:maj7 f:m7 | g:m7 ges:dim7 | f1:m7 |
		bes:7 | ees:7 | ees:7 |
		\endPart
		\myMark "C"
		\startPart
		aes2.:maj7 aes4:6 | des1:9 | ees | g2:m7 c:7 |
		f1:m7 | f2:m7 b4:7.5+ bes:7 |
	} \alternative {
		{
			ees2 ges:dim7 | bes4:7/f ees:maj7 g:m7 ges:dim7 |
		}
		{
			ees1 | ees |
		}
	}
	\endPart
	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	%%\tempo "Allegro" 4 = 130
	\time 4/4
	\key ees \major

	\partial 2.
	bes4 d c |
	%% A part
	\repeat volta 2 {
		ees4. f,8 f2 | r8 f f g f4 ees | g1~ | g4 bes d c | ees4. f,8 f2~ | f4 g \times 2/3 { f ees d } |
		c1~ | c2. c4 | g' g g g | ees2. g4 | bes bes bes bes | g2. b4 | d d d2~ | d d |
		bes1~ | bes4 bes d c | ees4. f,8 f2 | r8 f f g f4 ees | g1~ | g4 bes d c | ees4. f,8 f2~ |
		f4 g \times 2/3 { f ees d } | g1~ | g2 r4 ees4 | g2. f4 | aes2. g4 | \times 2/3 { d4 ees g } bes4 c | d2. c4 |
		ees4. f,8 f2 | r8 c d ees g4 g |
	} \alternative {
		{
			ees1 | r4 bes' d c |
		}
		{
			ees1~ | ees2. r4
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	I'll Nev -- er Smile A -- gain, un -- til I smile at you. __ I'll nev -- er laugh a -- gain, __ what good would it
	do? __ For tears would fill my eyes my heart would re -- a -- lize that our ro -- mance __ is
	trough, __ I'll nev -- er love a -- gain, I'm so in love with you. __ I'll nev -- er thrill a -- gain __
	to some -- bod -- y new. __ With -- in my heart I know I will nev -- er start to
	smile a -- gain un -- til I smil at you I'll ne -- ver

	you
}
% endif
