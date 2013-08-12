<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['render']="Fake"

	attributes['title']="St. Thomas"
	attributes['style']="Jazz"
	attributes['composer']="Sonny Rollins"
	attributes['piece']="Latin/Calypso"
	attributes['copyright']="1963, Prestigve Music"
	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"

	attributes['completion']="5"
	attributes['uuid']="ef0827e0-f690-11e0-ba56-0019d11e5a41"
	attributes['structure']="AABC"
%>
% endif

% if part=='Doc':
	DONE:
	- chords were taken from the fake book.
	TODO:
	- fill out what's been done for this tune.
	- add epdf from the fake book.
	- add another version from some other book.
	- add youtube performances.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	c1 | a:7 | d2:m7 g4:7 c | c2 g:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c1 | a:7 | d2:m7 g4:7 c | c1 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	e1:m7.5- | a:7 | d:m7 | g:7 | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	c:7 | f2 fis:dim7 | c/g g4:7 c | c1 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

	%% part "A"
	r4 g8 c r b r a | g4 a e f | g c b c | r1 |

	%% part "A"
	r4 g8 c r b r a | g4 a e f | g c b c | r1 |

	%% part "B"
	e2 f4. g8 | r1 | f2 e4. d8 | r1 |

	%% part "C"
	e2 d | c a | g4 c b c | r1 |
}
% endif
