<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="Poor Butterfly"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['composer']="Raymond Hubbell"
	# this is from the fake book
	attributes['poet']="John L. Golden"
	# this is from the fake book
	attributes['piece']="Moderately Slow"
	attributes['copyright']="1998 Hal Leonard Corporation"

	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"
	attributes['completion']="5"
	attributes['uuid']="2db00c66-da81-11e3-9d15-47dd58c4ba8d"
	attributes['structure']="ABAC"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
% endif

% if part=='ChordsFake':
\chordmode {
	\startSong
	\startChords

	\partial 2. s2.

	\myMark "A"
	\startPart
	bes1:m7 | ees:7 | aes:maj7 | aes:maj7 |
	c:7.5+ | c:7.5+ | f:7 |
	\endPart

	\myMark "B"
	\startPart
	f:7 | bes:m7 | ees:7 |
	g2:m7.5- c:7.5+ | f1:m7 | bes:7 | bes:7 | bes:m7 | ees:7 |
	\endPart

	\myMark "A"
	\startPart
	bes:m7 | ees:7 | aes:maj7 | aes:maj7 | c:7.5+ |
	c:7.5+ | f:7 |
	\endPart

	\myMark "C"
	\startPart
	f:7 | bes:m7 | des2:m7 ges:7 |
	aes1:maj7 | c2:m7 f:7 | bes1:m7 | ees:7 | aes | aes |
	\endPart

	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	%%\tempo "Andante" 4 = 88
	\time 4/4
	\key aes \major

	\partial 2.

	%% part "A"
	ees,4 e f |
	des'1~ | des4 c8 bes des4 c | bes2 bes~ | bes4 aes b, c |
	aes'1~ | aes4 b,8 c aes'4 g | g1~ |

	%% part "B"
	g4 f b, c | g' f8 g f2~ | f4 ees d ees |
	bes' aes8 bes aes2~ | aes4 f g aes | c bes8 c bes2~ | bes4 aes e f | bes1~ |

	%% part "A"
	bes4 ees,4 e f | des'1~ | des4 c8 bes des4 c | bes2 bes~ | bes4 aes b, c | aes'1~ |
	aes4 b,8 c aes'4 g | g1~ |

	%% part "C"
	g2 f4 c | des ees8 f ees'2~ | ees4 des8 c ees4 des |
	des b8 c g2~ | g4 aes c, g' | f1~ | f4 d8 ees des'?4 c | aes1~ | aes4 r r2 |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	Poor But -- ter -- fly, __ 'neath the blos -- soms wait -- int, __ Poor But -- ter --
	fly __ for she loved him so. __ The mo -- ments pass in -- to hour, __ the hours _
	pass in -- to years, __ and as she smiles through her tears, __ she mur -- murs low, __
	"\"The" moon and I __ know that he'll be faith -- ful. __ I'm sure he'll come __
	to me by and bye. __ But if he don't come back, __ then I'll nev -- er
	sigh or _ cry, __ I just mus' "die.\"" Poor _ But -- ter -- fly. __
}
% endif
