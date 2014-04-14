<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="The Nearness Of You"
	attributes['subtitle']="from the Paramount Picture \\\"Romance in the Dark\\\""
	attributes['style']="Jazz"
	attributes['composer']="Hoagy Charmichael"
	attributes['poet']="Ned Washington"
	attributes['piece']="Slowly"
	attributes['copyright']="1937, 1940 Famous Music Corporation"
	attributes['copyrightextra']="Renewed 1964, 1967"
	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"

	attributes['completion']="5"
	attributes['uuid']=""
	attributes['structure']="AABA"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
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

	\partial 4.

	s4.
	\myMark "A"
	\startPart
	ees1:maj7 | bes2:m7 ees:7 | aes1:maj7 | aes:dim7 |
	g2:m7 c:7 | f:m7 bes:7 | g:m7 c:7 | f:m7 bes:7 |
	\endPart
	\myMark "A"
	\startPart
	ees1:maj7 | bes2:m7 ees:7 | aes1:maj7 | aes:dim7 |
	g2:m7 c:7 | f:m7 bes:7 | ees:maj7 aes:7 | ees1:maj7 |
	\endPart
	\myMark "B"
	\startPart
	f:m7 | bes:7 | ees2:maj7 ees:7 | bes:m7 ees:7 |
	aes:maj7 a4:m7.5- d:7 | g2:m7 c:7 | f1:7 | f2:m7 bes:7 |
	\endPart
	\myMark "A"
	\startPart
	ees1:maj7 | bes2:m7 ees:7 | aes1:maj7 | aes:dim7 |
	g2:m7 c:7 | f:m7 bes:7 | g1:m7.5- | c:7 |
	f:m7 | bes:7 | ees:maj7 | ees:maj7 |
	\endPart
	\startPart
	\endPart
	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Andante Moderato" 4 = 88
	\time 4/4
	\key ees \major
	\partial 4.

	bes,8 ees f |

	g2 bes4 aes8 g | f4 aes2 g4 | ees2 g4 f | d f2 ees4 |
	bes1~ bes8 c d ees \times 2/3 { f4 ees d } | bes'1~ | bes2~ bes8 bes, ees f |

	g2 bes4 aes8 g | f4 aes2 g4 | ees2 g4 f | d f2 ees4 |
	bes1~ bes8 c d ees \times 2/3 { f4 ees d } | ees1~ | ees2 bes8 c d ees |
	f1~ | f4 d8 ees f ees4 d8 | g4. d8 des2~ | des~ des8 ees4 ees8 |
	c'2. c4 | bes2. aes4 | f1~ | f2~ f8 bes, ees f |
	g2 bes4 aes8 g | f4 aes2 g4 | ees2 g4 f | d f2 ees4 |
	bes1~ | bes8 c d ees \times 2/3 { f4 ees d } | bes'1~ | bes4 g8 aes \times 2/3 { bes4 aes g } |
	c2. c,4 | d ees2 f4 | ees1~ | ees2 r |

}
% endif

% if part=='LyricsFake':
\lyricmode {
	It's not the pale moon that ex -- cites me, that thrills and de -- lights me. Oh,
	no, __ it's just The Near -- ness Of You. __ It is -- n't
	your sweet con -- ver -- sa -- tion that brings this sen -- sa -- tion. Oh,
	no, __ It's just the Near -- ness Of You. __ When you're in my
	arms __ and I feel you so close to me __ all my
	wild -- est dreams com true. __ I need no
	soft lights to en -- change me if you'll on -- ly grant me the
	right __ to hold you ev -- er so tight __ and to feel in the
	night The Near -- ness Of You. __
}
% endif
