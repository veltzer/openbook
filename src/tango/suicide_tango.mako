<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Real"

	attributes['title']="Suicide Tango"
	attributes['style']="Tango"
	attributes['subtitle']="Utomlyonnye solntsem"
	attributes['composer']="???"
	attributes['poet']="???"
	attributes['piece']="Tango"
	attributes['copyright']="???"
	attributes['copyrightextra']="???"

	attributes['completion']="5"
	attributes['uuid']="66834ecc-dcd0-11e2-9ec9-782bcbdd3b7a"
	attributes['structure']="AABA"

	attributes['idyoutube']="http://www.youtube.com/watch?v=qOnU-TRRmSE"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- the grace notes seem to meddle with the line breaks. Why is that? find
	the reason/submit a bug and document the issue in the hints file.
	- add russian lyrics (write it in russian?!?).
% endif

% if part=='ChordsReal':
\chordmode {
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
			c:7.9- |
		}
		{
			c:7.9- | \myEndLine
		}
	}

	\mark "A"
	\startPart
	\repeat volta 2 {
		f1*2:m7 | g1*2:m7.5- | \myEndLine
		c1:7.9- |
	} \alternative {
		{
			c:7.9- | f1:m7 | c:7.9- |
		}
		{
			c:7.9- | f:m7 | f:7 | \myEndLine
		}
	}
	\endPart

	\mark "B"
	\startPart
	f1*2:7 | bes1*2:m7 | \myEndLine
	ees1*2:7 | aes1 | c:7.9- | \myEndLine
	\endPart

	\mark "A"
	\startPart
	f1*2:m7 | g1*2:m7.5- | \myEndLine
	c1*2:7.9- | f2:m7 c:7.9- | f4:m7 c:7.9- f2:m7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c' {
	\time 4/4
	\key f \minor
	\clef treble
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\set Staff.midiInstrument = #"accordion"
	\set Staff.midiMinimumVolume = #0.95
	\set Staff.midiMaximumVolume = #0.95

	%% intro
	\repeat volta 2 {
		\grace b'16\f c8 c4 c8 \grace c16 des4 des \grace b16 | c8 c4 c8 \grace bes16 b4 b \grace b16 |
		c8 c4 c8 \grace e8 f4 des \grace b8 | c2~ ~c8 \grace e,16 f8 g aes \grace a16 |
		bes8 bes4 g8 \grace b8 c4 bes \grace g16 | aes8 aes4 f8 \grace b8 c4 aes \grace g8 |
		\times 2/3 { aes4 g f \grace e8 f4 e f} \grace fis8 |
	} \alternative {
		{
			\times 2/3 { g8 c, des } c8 d e f g aes |
		}
		{
			\times 2/3 { g4 c, des c f aes } \grace c8 |
		}
	}

	%% A part
	\repeat volta 2 {
		des2 c | \times 2/3 { r4 \grace d8 ees4 d des g, aes } | \grace b8 c2 bes | \times 2/3 { r4 \grace d8 ees4 d des g, aes } |
		\grace b8 c2 bes |
	} \alternative {
		{
			r2 \grace b8 \times 2/3 { c2 g4 } | aes1 | \times 2/3 { r4 c, des c f aes } \grace c8 |
		}
		{
			r2 \grace b8 \times 2/3 { c2 aes4 } | f1 | r \grace e8 | \myEndLine
		}
	}

	%% B part
	\times 2/3 { f2 g4 a2 c4 } | \times 2/3 { ees2 e4 f2 c4 } |
	ees2 des2~ | des1 \grace d,8 | \myEndLine
	\times 2/3 { ees2 f4 g2 bes4 } | \times 2/3 { des2 d4 ees2 bes4 } |
	c1~ | \times 2/3 { c4 c, des c f aes } \grace c8 | \myEndLine

	%% A part
	des2 c | \times 2/3 { r4 \grace d8 ees4 d des g, aes } \grace b8 | c2 bes | \times 2/3 { r4 \grace d8 ees4 d des g, aes } \grace b8 |
	c2 bes | r2 \grace b8 \times 2/3 { c2 aes4 } | f4. des'8 c aes4 g8 | f4 e f2 | \myEndLine
}
% endif

% if part=='LyricsReal':
\lyricmode {
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
}
% endif
