<%page args='part'/>
% if part=='Vars':
<%
	# vim: set filetype=lilypond :
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Stan', version)
	attributes.setDefaultVersionName('Stan')

	# from the standards real book
	attributes['title']='The More I See You'
	attributes['style']='Jazz'
	# from the standards real book
	attributes['subtitle']='From \'Diamond Horseshoe\''
	# from the standards real book
	attributes['composer']='Harry Warren'
	# from the standards real book
	attributes['poet']='Mack Gordon'
	# from the standards real book
	#attributes['piece']='Freely'
	# from the standards real book (middle of tune)
	attributes['piece']='Med. Ballad or Medium'
	# from the standards real book
	attributes['copyright']='1945 WB Music Corp. (Renewed) All Rights Reserved. Used by Permission'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='0'
	attributes['uuid']='ca5eae8e-ee84-11e3-a0d7-d7aaa2e1aa93'
	attributes['structure']='ABAC'
	attributes['structureremark']='The tune in the standards real book is written as ABCD but A and C are so close that it\'s really ABAC'
	attributes['location']='tsrbk:309-310'

	attributes['idyoutuberemark1']='Hank Mobley in a great and soulful version'
	attributes['idyoutube1']='ViniUjqqVZI'
	attributes['idyoutuberemark2']='Classic vocal version of Nat King Cole'
	attributes['idyoutube2']='XASZpJcgVLI'
	attributes['lyricsurl']='http://www.metrolyrics.com/the-more-i-see-you-lyrics-nat-king-cole.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added tune location.
	- added lyrics url.
	- added youtube performances.
	- added the meta data from the standards real book.
	- put in the tunes structure
	TODO:
	- put in the chords (standards real book).
	- put in the lyrics (standards real book).
	- put in the tune (standards real book).
	- check the chords (standards real book).
	- check the tune (standards real book).
	- check the lyrics (standards real book).
	- heard the tune to check that it is right and adjust the tempo.
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
{
	\tempo "Allegro" 4 = 130
	\time 2/2
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
