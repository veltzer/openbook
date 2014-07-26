<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="My"

	attributes['title']="Suicide Tango"
	attributes['style']="Tango"
	attributes['subtitle']="Utomlyonnye solntsem"
	attributes['composer']="???"
	attributes['poet']="???"
	attributes['piece']="Tango"
	attributes['copyright']="???"
	attributes['copyrightextra']="???"
	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"

	attributes['completion']="5"
	attributes['uuid']="66834ecc-dcd0-11e2-9ec9-782bcbdd3b7a"
	attributes['structure']="AABA"

	attributes['idyoutuberemark1']="Original Russian version"
	attributes['idyoutube1']="qOnU-TRRmSE"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- the myGrace notes seem to meddle with the line breaks. Why is that? find
	the reason/submit a bug and document the issue in the hints file.
	- add russian lyrics (write it in russian?!?).
	- find out how to balance volume of accompaniment and lead and set the
	instruments back in (violin for melody and accordion for chords).
% endif

% if part=='ChordsMy':
\chordmode {
%%	http://lilypond.org/doc/v2.11/Documentation/user/lilypond/MIDI-instruments#MIDI-instruments
%%	\set ChordNames.midiInstrument = #"accordion"
%%	\set ChordNames.midiMinimumVolume = #0.1
%%	\set ChordNames.midiMaximumVolume = #0.1
%%	\set ChordNames.dynamicAbsoluteVolumeFunction = #0.1
	\startChords
	\startSong

	\mark "Intro"
	\repeat volta 2 {
		f2:m7 g:m7.5- | f:m7 des:7 | f:m7 g:m7.5- | f1:m7 | \myEndLine
		bes:m7 | f:m7 | des:7 |
	} \alternative {
		{
			c:7.9- | \myEndLineVoltaNotLast
		}
		{
			c:7.9- | \myEndLine
		}
	}

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f1*2:m7 | g:m7.5- | \myEndLine
		c1:7.9- |
	} \alternative {
		{
			c:7.9- | f1:m7 | c:7.9- | \myEndLineVoltaNotLast
		}
		{
			c:7.9- | f:m7 | f:7 | \myEndLine
		}
	}
	\endPart

	\myMark "B"
	\startPart
	f1*2:7 | bes:m7 | \myEndLine
	ees:7 | aes1 | c:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1*2:m7 | g:m7.5- | \myEndLine
	c:7.9- | f2:m7 c:7.9- | f4:m7 c:7.9- f2:m7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceMy':
\relative {
	\time 4/4
	\key f \minor
	\clef treble
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
%%	http://lilypond.org/doc/v2.11/Documentation/user/lilypond/MIDI-instruments#MIDI-instruments
%%	\set Staff.midiInstrument = #"violin"
%%	\set Staff.midiMinimumVolume = #0.5
%%	\set Staff.midiMaximumVolume = #0.5

	%% intro
	\repeat volta 2 {
		\myGrace b'16\f c8 c4 c8 \myGrace c16 des4 des | \myGrace b16 c8 c4 c8 \myGrace bes16 b4 b |
		\myGrace b16 c8 c4 c8 \myGrace e8 f4 des | \myGrace b8 c2~ c8 \myGrace e,16 f8 g aes |
		\myGrace a16 bes8 bes4 g8 \myGrace b8 c4 bes | \myGrace g16 aes8 aes4 f8 \myGrace b8 c4 aes |
		\times 2/3 { \myGrace g8 aes4 g f \myGrace e8 f4 e f } |
	} \alternative {
		{
			\times 2/3 { \myGrace fis8 g8 c, des } c8 d e f g aes |
		}
		{
			\times 2/3 { g4 c, des c f aes } |
		}
	}

	%% A part
	\repeat volta 2 {
		\myGrace c8 des2 c | \times 2/3 { r4 \myGrace d8 ees4 d des g, aes } | \myGrace b8 c2 bes | \times 2/3 { r4 \myGrace d8 ees4 d des g, aes } |
		\myGrace b8 c2 bes |
	} \alternative {
		{
			r2 \times 2/3 { \myGrace b8 c2 g4 } | aes1 | \times 2/3 { r4 c, des c f aes } |
		}
		{
			r2 \times 2/3 { \myGrace b8 c2 aes4 } | f1 | r |
		}
	}

	%% B part
	\times 2/3 { \myGrace e8 f2 g4 a2 c4 } | \times 2/3 { ees2 e4 f2 c4 } |
	ees2 des2~ | des1 |
	\times 2/3 { \myGrace d,8 ees2 f4 g2 bes4 } | \times 2/3 { des2 d4 ees2 bes4 } |
	c1~ | \times 2/3 { c4 c, des c f aes } |

	%% A part
	\myGrace c8 des2 c | \times 2/3 { r4 \myGrace d8 ees4 d des g, aes } | \myGrace b8 c2 bes | \times 2/3 { r4 \myGrace d8 ees4 d des g, aes } |
	\myGrace b8 c2 bes | r2 \times 2/3 { \myGrace b8 c2 aes4 } | f4. des'8 c aes4 g8 | f4 e f2 |
}
% endif

% if part=='LyricsMy':
\lyricmode {
}
% endif

% if part=='LyricsmoreMy':
\lyricmode {
}
% endif
