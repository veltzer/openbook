<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="Bewitched"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['composer']="Richard Rodgers"
	# this is from the fake book
	attributes['poet']="Lorenz Hart"
	# this is from the fake book
	attributes['piece']="Modeartely Slow"
	# this is from the fake book
	attributes['copyright']="1941, by Chappell & Co., Inc. Copyright Renewed"

	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"
	attributes['completion']="5"
	attributes['uuid']="dd1624e6-2567-11e1-9444-0019d11e5a41"
	attributes['structure']="AABA"
	attributes['location']="rbk2:43,jfb:58"

	attributes['idyoutuberemark1']="Ella Fitzgerald with the intro part..."
	attributes['idyoutube1']="nDlCCKHql0w"
	attributes['idyoutuberemark2']="Benny Goodman in the 1980's"
	attributes['idyoutube2']="rv8G78Cw2mc"
	attributes['lyricsurl']="http://www.lyricsfreak.com/e/ella+fitzgerald/bewitched_20045684.html"
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- brought in the fake book epdf.
	- filled in this tunes meta data from the fake book.
	- filled in this tunes structure.
	- filled in the fake book chords.
	- filled in the fake book tune.
	- filled in the fake book lyrics.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- heard that the fake book tune sounds well.
	- added a lyrics url.
	- added youtube performances.
	TODO:
	- add the real book version.
	REMARKS:
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong
	\partial 4 s4
	\repeat volta 2 {
		\myMark "A"
		\startPart
		c2 cis:dim7 | d:m7 dis:dim7 | c e:7 | f:maj7 fis:dim7 | \myEndLine
		c d:7 | g:7 a:7 | d1:m7 | g:7 | \myEndLine
		\endPart
		\myMark "A"
		\startPart
		c2 cis:dim7 | d:m dis:dim7 | c e:7 | f:maj7 fis:dim7 | \myEndLine
		c d:7 | g:7 c:7 | f1:maj7 | a:7 | \myEndLine
		\endPart
		\myMark "B"
		\startPart
		d1*2:m | a:m | \myEndLine
		d1:m | g:7 | e2:m7 a:7.9+ | d:m7 g:7 | \myEndLine
		\endPart
		\myMark "A"
		\startPart
		c2 cis:dim7 | d:m dis:dim7 | c e:7 | f:maj7 fis:dim7 | \myEndLine
		c d:7 | d:m g:7 |
	} \alternative {
		{
			c a:m | d:m7 g:7 |
		}
		{
		 	c f | c1 | \myEndLine \endPart
		}
	}
	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Moderato" 4 = 100
	\time 2/2
	\key c \major

	\partial 4 g'4 |

	\repeat volta 2 {
		%% part "A"
		e8 b' c2 e,4 | f8 b c2 f,4 | g8 b c4 gis8 b c4 | a8 b c2 b4 |
		c r b8 a g fis | g4 d2 e4 | f1~ | f2 r |
		%% part "A"
		e8 b' c2 e,4 | f8 b c2 f,4 | g8 b c4 gis8 b c4 | a8 b c2 b4 |
		c r b8 a g fis | g4 d2 e4 | a1~ | a2. r4 |
		%% part "B"
		b8 a f2 b8 a | f4 f2. | b8 a e2 b'8 a | e1 |
		c'8 b g2 c8 b | g4 g~ g8 a b c | d2 c f,2. g4 |
		%% part "A"
		e8 b' c2 e,4 | f8 b c2 f,4 | g8 b c4 gis8 b c4 | a8 b c2 b4 |
		c r b8 a g fis | g4 d'2 g,4 |
	} \alternative {
		{
			c1 | r2 r4 g4 |
		}
		{
			c1~ | c4 r4 r2 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% Partial
	I'm
	%% part "A"
	wild a -- gain, be -- guiled a -- gain,
	a sim -- per -- ing, whim -- per -- ing child a -- gain,
	Be -- witched, both -- ered and be -- wild -- ered am I. __
	%% part "A"
	Could -- n't sleep, and would -- n't sleep,
	when love came and told me I should -- n't sleep,
	Be -- witched, both -- ered and be -- wild -- ered am I. __
	%% part "B"
	Lost my heart, but what of it?
	He is cold I a -- gree,
	he can laugh, but I love it, __
	al -- though the laugh's on me.
	%% part "A"
	I'll sing to him, each spring to him,
	and long for the day when I'll cling to him,
	Be -- witched, both -- ered and be -- wild -- ered am I.
	%% Volta
	I'm I. __
}
% endif
