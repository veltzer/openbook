<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Stan"

	# from the standards real book
	attributes['title']="The More I See You"
	attributes['style']="Jazz"
	# from the standards real book
	attributes['composer']="Harry Warren"
	# from the standards real book
	attributes['poet']="Mack Gordon"
	# from the standards real book
	attributes['piece']="Freely"
	attributes['piece']="Med. Ballad or Medium"
	# from the standards real book
	attributes['copyright']="1945 WB Music Corp. (Renewed) All Rights Reserved. Used by Permission"

	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"
	attributes['completion']="0"
	attributes['uuid']="ca5eae8e-ee84-11e3-a0d7-d7aaa2e1aa93"
	attributes['structure']="ABAC"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the standards real book.
	TODO:
	- put in the tunes structure
	- added the meta data from the fake book.
	- put in the chords (fakebook).
	- put in the lyrics (fakebook).
	- put in the tune (fakebook).
	- check the chords (fakebook).
	- check the tune (fakebook).
	- check the lyrics (fakebook).
	- heard the tune to check that it is right and adjust the tempo.
	- added lyrics url.
	- added youtube performances.
	- add another version of this tune.
% endif

% if part=='ChordsStan':
\chordmode {
	\startChords
	\startSong

	\partial 8 \OPC bes8:7 |

	\myMark "Verse"
	\startPart
	ees2:6 f4:9 bes:9.5+ | ees2:6 e:dim7 | f:m7 bes:9.11 | ees:maj7 \OPC bes:13 | \myEndLine
	ees:6 a4:m7.5- d:7.9- | g:sus4 gis:dim7 | a:m7 d4:9sus4 \OPC d:9 | g:7 c:7 f:7 bes:7 | bes:7 |
	\endPart

	\myMark "A"
	\startPart
	\endPart

	\myMark "B"
	\startPart
	\endPart

	\myMark "A"
	\startPart
	\endPart

	\myMark "C"
	\startPart
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceStan':
\relative {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key ees \major

	\partial 8 b8 |

	%% part "Verse"
	%% part "A"
	%% part "B"
	%% part "A"
	%% part "C"
}
% endif

% if part=='LyricsStan':
\lyricmode {
	%% part "Verse"
	%% part "A"
	%% part "B"
	%% part "A"
	%% part "C"
}
% endif
