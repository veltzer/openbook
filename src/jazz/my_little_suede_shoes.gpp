<%inherit file="/src/include/common.lyi"/>
<%
	attributes['jazzTune']=True
%>
\header {
	default_header

	title="My Little Suede Shoes"
	composer="Charlie Parker"
	style="Jazz"
	piece="Med Swing"

	completion="0"
	uuid="0db617f0-a26f-11df-92f0-0019d11e5a41"
}

A=\relative c' { bes8 ees g | f f f f ees f r g | }
B=\relative c' { bes8 ees g | f f f f ees f r ees | }

myVoice=\relative c' {
	\key ees \major
	\time 4/4
	\partial 4. bes8 ees g |

	\repeat volta 2 {
		f f f f ees f r g | r2 r8 \B r2 r8 \A
		r bes4. a4 aes | g8 g g g f f r ees |
	}
	\alternative {
		{r2 r8 bes ees g}
		{r2 r8 bes' c d}
	}
	ees'8 ees ees ees c aes r d | r d4. bes8 g r4 | c8 c c c aes f r bes~ |
	bes2 r8 bes c d | ees ees ees ees c aes r d | r d4. bes8 g r4 |
	c8 c c c aes f g ees~ | ees2 r8 \A r2 r8 \B r2 r8 \A
	r bes4. a4 aes | g8 g g g f f r ees | r1 |
}

myChords=\chordmode {
	\startChords

	\startSong

	\partial 4. r4. |

	\startPart
	\repeat volta 2 {
		f2:m7 bes:7 | g:m7 c:7 | f:m7 bes:7 | ees:maj7 c:7 |
		f:m7 bes:7 | g:m7 c:7.9+.5+ | f:m7 bes:7 |
	}
	\alternative { { ees:maj7 c:7 | } {ees:maj7 ees:7 } }
	\endPart

	\startPart
	aes:maj7 aes:m7 | g:m7 c:7.9- | f:m7 bes:7 | ees:maj7 ees:7 |
	aes aes:m7 | g:m7 c:7.9- | f:m7 bes:7 | g:m7 c:7 |
	\endPart

	\startPart
	f:m7 bes:7 | ees:maj7 c:7 | f:m7 bes:7 | ees:maj7 c:7 |
	f:m7 aes:m7 | g:m7 c:7.9+.5+ | f:m7 bes:7 | ees1:maj7 |
	\endPart

	\endSong

	\endChords
}

include(src/include/harmony_tune.lyi)
