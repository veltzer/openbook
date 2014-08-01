<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Real"

	attributes['title']="The Girl From Ipanema"
	attributes['style']="Jazz"
	attributes['subtitle']="Garota De Ipanema"
	attributes['composer']="Antonio Carlos Jobim"
	attributes['poet']="Vincius De Moraes, Norman Gimbel"
	attributes['piece']="Bossa Nova"
	attributes['piece']="Moderate Bossa Nova"
	attributes['copyright']="1963, Antonio Carlos Jobim and Vincius De Moraes, Brazil"
	attributes['copyrightextra']="Sole Selling Agent Duchess Music Corporation (MCA), New York, NY for all. English speaking countries"

	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"
	attributes['completion']="5"
	attributes['uuid']="2c3b337c-a26f-11df-b7d1-0019d11e5a41"
	attributes['structure']="AABA"
	attributes['location']="rbk1:171"

	attributes['idyoutube1']="DmV0TcTNJ3o"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- fill in from where the meta data came.
	- document what has been done to this tune.
	- the lyrics do not have __ in them.
	- the quotation in the lyrics is not done right.
	- add a lyrics url.
	- add description of the you tube performance and add another performance.
	- add the fakebook version of this tune.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\mark "Intro"
	\startPart
	f1:6.9 | c2:m7 c:m6 | f1:6.9 | c2:m7 c:m6 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f1*2:maj7.9 | g:13 | \myEndLine
		g1:m7.9 | ges:7.5- |
	} \alternative {
		{
			f1:maj7.9 | ges:7.5- | \myEndLineVoltaNotLast
		}
		{
			f1*2:maj7.9 | \myEndLine
		}
	}
	\endPart

	\myMark "B"
	\startPart
	ges1*2:maj7 | ces:7.9 | \myEndLine
	fis:m7.9 | d:7.9 | \myEndLine
	g:m7.9 | ees:7.9 | \myEndLine
	a1:m7 | d:7.5-.9- | g:m7 | c:7.5-.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1*2:maj7.9 | g:13 | \myEndLine
	g1:m7.9 | ges:7.5- | f:maj7.9 | ges:7.5- | \myEndLine
	f:maj7.9 | ges:7.5- | f1*2:maj7.9 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative {
	\time 4/4
	\key f \major
	\clef treble
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130

	%% part "intro"
	r1*4 |

	%% part "A"
	\repeat volta 2 {
		g'4. e8 e4 d8 g~ | g4 e8 e~ e e d g~ | g4 e e d8 g~ | g g e e~ e e d f~ |
		f d4 d8~ d d c e~ | e c4 c8~ c c bes4 |
	} \alternative {
		{
			r4 c2.~ | c2 r2 |
		}
		{
			r4 c2.~ | c2 r2 |
		}
	}

	%% part "B"
	f1~ | \times 2/3 {f4 ges f} \times 2/3 {ees4 f ees} |
	des4. ees8~ ees2~ | ees2. r8 gis~ |
	gis1~ | \times 2/3 {gis4 a gis} \times 2/3 {fis gis fis} |
	e4. fis8~ fis2~ | fis2. r8 a~ |
	a1~ | \times 2/3 {a4 bes a} \times 2/3 {g a g} |
	f4. g8~ g2~ | g2 \times 2/3 {r4 a bes} |
	\times 2/3 {c c, d} \times 2/3 {e f g} | gis2. a4 |
	\times 2/3 {bes bes, c} \times 2/3 {d e f} | fis2. r4 |

	%% part "A"
	g4. e8 e4 d8 g8~ | g4 e8 e~ e e d g~ | g4 e e d8 g~ | g g e e~ e e d a'~ |
	a4. f8 f f d c'~ | c4. e,8 \times 2/3 {e4 e d} | e1 | r4 r8 e8 \times 2/3 {e4 e d} |
	e1 | r4 r8 e8 \times 2/3 {e4 e d} | e1~ | e2. r4 |
}
% endif

% if part=='LyricsReal':
\lyricmode {
	%% part "A"
	Tall and tan and young __ and love -- __ ly,
	the Girl __ From I -- pa -- ne -- __ ma goes walk -- __ ing,
	and when __ she pass -- __ es, each one __ she pass -- __ es goes "ah!" __

	%% part "B"
	"ah!" __

	Oh, __ but I watch her so sad -- ly. __
	How __ can I tell her I love her? __
	Yes, __ I would give my heart glad -- ly, __
	but each day when she walks to the sea,
	she looks straight a -- head not at me.

	%% part "A"
	Tall and tan and young __ and love -- __ ly,
	The Girl __ From I -- pa -- ne -- __ ma goes walk -- __ ing,
	and when __ she pass -- es I smile, __
	but she does -- n't see.
	She just does -- n't see.
	No, she does -- n't see. __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	%% part "A"
	When she walks she's like __ a Sam -- __ ba
	that swings __ so cool and sways __ _ so gen -- __ tle,
	that when __ she pass -- __ es, each one __ she pass -- __ es goes
}
% endif
