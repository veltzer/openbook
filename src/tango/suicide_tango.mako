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

	attributes['idyoutube']="???"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:

	more chords for opening:
	f:m7 g:m7.5- f:m7 des:7
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 1 s1 |

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
	c1*2:7.9- | f1*2:m7 | \myEndLine
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

	%% intro
	\partial 1 \times 2/3 { r4 c des c f aes } |

	%% A part
	\repeat volta 2 {
		des2 c | \times 2/3 { r4 ees d des g, aes } | c2 bes | \times 2/3 { r4 ees d des g, aes } |
		c2 bes |
	} \alternative {
		{
			r2 \times 2/3 { c2 g4 } | aes1 | \times 2/3 { r4 c, des c f aes } |
		}
		{
			r2 \times 2/3 { c2 aes4 } | f1 | r | \myEndLine
		}
	}

	%% B part
	\times 2/3 { f2 g4 a2 bes4 } | \times 2/3 { c2 ees4 f2 c4 } |
	ees2 des2~ | des1 | \myEndLine
	\times 2/3 { ees,2 f4 g2 aes4 } | \times 2/3 { bes2 des4 ees2 bes4 } |
	des2 c2~ | \times 2/3 { c4 c, des c f aes } | \myEndLine

	%% A part
	des2 c | \times 2/3 { r4 ees d des g, aes } | c2 bes | \times 2/3 { r4 ees d des g, aes } |
	c2 bes | r2 \times 2/3 { c2 aes4 } | f1 | r | \myEndLine
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
