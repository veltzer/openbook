<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Real"

	attributes['title']="Just Friends"
	attributes['style']="Jazz"
	# from the new real book
	attributes['composer']="John Klenner"
	# from the new real book
	attributes['poet']="Sam M. Lewis"
	# from the new real book
	attributes['piece']="Medium Swing"
	# from the new real book
	attributes['copyright']="1931 (renewed 1959) EMI Robbins Catalog, Inc."
	# from the new real book
	attributes['copyrightextra']="Used by by Persmission of CPP/Belwin, Inc., Miami, FL. International Copyright Secured."

	attributes['completion']="5"
	attributes['uuid']="2f6e2740-f29e-11e0-9ede-0019d11e5a41"
	attributes['structure']="AB"

	attributes['idyoutubedesc']="the fabulous Chet Baker"
	attributes['idyoutube']="88CqlgFAJ-k"
	attributes['idyoutubedesc']="fast and furious Trane"
	attributes['idyoutube']="9W_XQCLD_I0"
%>
% endif

% if part=='Doc':
	DONE:
	- put in the real book chords.
	- put in the real book notes.
	- put in lyrics to the real book version and adjusted them.
	- adjusted the speed of the tune.
	- checked the chords of the real book version.
	- checked the audio of the real book version.
	- checked the lyrics of the real book version.
	- checked the notes of the real book version.
	- filled in the copyright poet and style.
	- added the real book epdf.
	- added the new real book epdf.
	- filled in the strucutre of the tune.
	- added youtube performances.
	TODO:
	- add a lyrics url.
	- add the new real book version (already have it in the epdfs).
	- how do I put the last two chords in the real book version into parenthesis?
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 4 g4:7 |

	\myMark "A"
	\startPart
	c1*2:maj7 | c1:m7 | f:7 | \myEndLine
	g1*2:maj7 | bes1:m7 | ees:7 | \myEndLine
	a:m7 | d:7 | b:m7 | e:m7 | \myEndLine
	a1*2:7 | a1:m7 | d2:7 des:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	c1*2:maj7 | c1:m7 | f:7 | \myEndLine
	g1*2:maj7 | bes1:m7 | ees:7 | \myEndLine
	a:m7 | d:7 | b:m7 | e:m7 | \myEndLine
	a:7 | a2:m7 d:7 | g1:6 | d2:m7 g:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 168
	\time 4/4
	\key g \major

	%% partial
	\partial 4 b4 |

	%% part "A"
	b1~ | b2 \times 2/3 { a4 b a } | ees1~ | ees2 a |
	a1~ | a4 a \times 2/3 { g a g } | des1~ | des2. g4 |
	g4. e8 g4. e8 | fis2. fis4 | fis4. d8 fis4. d8 | e4 fis g b |
	e2 b~ | b4 e, \times 2/3 { e fis g } | b2 a~ | a b |

	%% part "B"
	b1~ | b2 \times 2/3 { a4 b a } | ees1~ | ees2 a |
	a1~ | a4 a \times 2/3 { g a g } | des1~ | des2. g4 |
	g4. e8 g4. e8 | fis2. a4 | a4. fis8 a4. fis8 | g4 a b d |
	e2 e, | d' b | g1 | r2 b |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
	%% part "A"
	Just friends, __ lov -- ers no more __
	Just friends, __ but not like be -- fore. __
	To think of what we've been and not to kiss a -- gain seems like
	pre -- tend -- ing __ it is -- n't the end -- ing. __
	%% part "B"
	Two friends __ drift -- ing a -- part, __
	Two friends __ but one brok -- en heart. __
	We loved, we laughed, we cried and sud -- den -- ly love died.
	The sto -- ry ends and we're just friends.
}
% endif
