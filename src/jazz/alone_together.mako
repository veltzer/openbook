<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Real"

	attributes['title']="Alone Together"
	attributes['style']="Jazz"
	# this is from the internet
	attributes['composer']="Arthur Schwartz"
	# this is from the internet
	attributes['poet']="Howard Dietz"
	# this is from the real book
	attributes['piece']="Ballad"
	attributes['copyright']="1932 (Renewed) Warner Bros. Inc."

	attributes['completion']="5"
	attributes['uuid']="b647880a-0b68-11e1-b491-0019d11e5a41"
	attributes['structure']="AABA"

	attributes['idyoutuberemark']="The great trumpet version of Chet Baker"
	attributes['idyoutube']="zdDhinO58ss"
	attributes['idyoutuberemark']="Dexter in a soprano sax version"
	attributes['idyoutube']="mmu6kgQtl-k"
	attributes['lyricsurl']="http://www.hotlyrics.net/lyrics/E/Ella_Fitzgerald/Alone_Together.html"
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- filled in meta data from somewhere.
	- filled in the tunes structure.
	- put in the real book chords.
	- put in the real book tune.
	- put in the real book lyrics.
	- checked the real book chords.
	- checked the real book tune.
	- checked the real book lyrics.
	- played the real book version to hear that it sounds well.
	- put in a lyrics url.
	- put in you tube performances with documentation.
	TODO:
	- put in another version of this tune.
	- how do I put the last two chords in the real book version in parenthesis? (the turn around chords).
	- I didn't find any other epdf for this. Bring it from somewhere.
	REMARKS:
	- this tunes structure can also be categorised as "ABAC" since the first 8 bars of both the first and second part are the same.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		d1:m | e2:m7.5- a:7.9- | d1:m | e2:m7.5- a:7.9- | \myEndLine
		d1:m | a2:m7.5- d:7.9- | g1:m | g:m7 | \myEndLine
		b2:m7 e:7 | g:m7 c:7 | f f:7 | e:m7.5- a:7 | \myEndLine
	} \alternative {
		{
			d1:maj7 | e2:m7.5- a:7 |
		}
		{
			d1*2:maj7 | \myEndLine
		}
	}
	\endPart

	\myMark "B"
	\startPart
	a1:m7.5- | d:7.9- | g1*2:m | \myEndLine
	g1:m7.5- | c:7.9- | f2 f:7 | e:m7.5- a:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	d1:m | e2:m7.5- a:7.9- | d1:m | e2:m7.5- a:7.9- | \myEndLine
	d1:m | bes2:7 a:7 | d1:m | e2:m7.5- a:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key d \minor

	\partial 8 d8 |

	%% part "A"
	\repeat volta 2 {
		f2.. d8 | e e4.~ e2~ | e4 r8 d e4. f8 | a1~ |
		a4 r8 d, e4. f8 | a1~ | a4 r8 g a4. bes8 | d2.. d8 |
		e2.. d8 | c c4.~ c bes8 | a4. g8 a4. g8 | a2.. g8 |
	} \alternative {
		{ fis fis4.~ fis2~ | fis2. r8 d | }
		{ fis fis4.~ fis2~ | fis2. d4 | }
	}

	%% part "B"
	c'1~ | \times 2/3 { c4 a bes } \times 2/3 { c ees d } | bes1~ | bes2. d,4 |
	bes'1~ | \times 2/3 { bes4 g a } \times 2/3 { bes des c } | a2.. f8 | g2.. d8 |

	%% part "A"
	f2.. d8 | e e4.~ e2~ | e4 r8 d e4. f8 | a1~ |
	a4 r8 a b4. d8 | f2.. cis8 | d d4.~ d2~ | d2 r4 r8 <\parenthesize d,>8 |

}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
	%% A part
	A -- lone To -- geth -- er; __
	be -- yond the crowd. __
	a -- bove the world, __
	we're not too proud
	to cling to -- geth -- er. __
	Were strong
	As long as we're to -- geth -- er __

	A
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	%% A part
	A -- lone To -- geth -- er; __
	the blind -- ing rain __
	The star -- less night, __
	we're not in vain;
	For we're to -- geth -- er, and what is there
	to fear to _ _ _ -- geth -- er. __

	%% B part
	Our love __ is as deep as the sea, __
	Our love __ is as great as a love can be,

	%% A part
	And we can wea -- ther __
	the great un -- known, __
	If we're A -- lone To -- geth -- er. __

	A
}
% endif
