<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['render']="Real"

	attributes['title']="Afternoon in Paris"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['composer']="John Lewis"
	# this is from the fake book
	attributes['piece']="Moderate Swing"
	# this is from the real book
	attributes['piece']="Swing"
	# this is from the fake book
	attributes['copyright']="1955 and Renewal of Copyright 1983 by MJQ Music, Inc."

	attributes['completion']="5"
	attributes['uuid']="8f0a1ea6-a26e-11df-8edc-0019d11e5a41"
	attributes['structure']="AABA"

	attributes['idyoutuberemark']="Chet Baker in a cool jazz version"
	attributes['idyoutube']="o3KtgcvYkig"
	attributes['idyoutuberemark']="Milt Jackson in a cool jazz version"
	attributes['idyoutube']="FFj03f2Zr5Y"
%>
% endif

% if part=='Doc':
	DONE:
	- put in this tunes structure.
	- put in this tunes meta data.
	- added the real book epdf.
	- added the fake book epdf.
	- put in the fake book chords.
	- put in the fake book tune.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked that the fake book tune sounds well and it's speed is ok in the midi.
	- put in the real book chords.
	- put in the real book tune.
	- checked the real book chords.
	- checked the real book tune.
	- checked that the real book tune sounds well and it's speed is ok in the midi.
	- added youtube performances.
	TODO:
	- are there lyrics to this thing? Even if there isn't it needs to be marked clearly here.
	- the last two chords of the real book version (d:m7 and g:7) should be in parenthesis since they are part of the turn around.
	I still don't know how to do that.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	c1:6 | c2:m7 f:7 | bes1:6 | bes2:m7 ees:7 | \myEndLine
	aes1:maj7 | d2:m7.5- g:7 | c:maj7 a:m7 | d:m7 g:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c1:6 | c2:m7 f:7 | bes1:6 | bes2:m7 ees:7 | \myEndLine
	aes1:maj7 | d2:m7.5- g:7 | c1 | a:m7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	d1:m7 | g:7.9- | c:6 | a:m7 | \myEndLine
	d:m7 | g:7.9- | cis2:m7.5- fis:7 | d:m7 g:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c1:6 | c2:m7 f:7 | bes1:6 | bes2:m7 ees:7 | \myEndLine
	aes1 | d2:m7.5- g:7 | c1*2 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\key c \major
	\time 4/4
	\partial 4 e''4 |

	%% A part
	g8 d r c b c d e | ees g, bes d c4 d | f8 c r bes a bes c d | des f, aes c bes4 c |
	ees8 c aes ees g bes aes4 | f2 \times 2/3 { g4 f g } | e8 g b d a b c e | f a, c e d4 e |
	%% A part
	g8 d r c b c d e | ees g, bes d c4 d | f8 c r bes a bes c d | des f, aes c bes4 c |
	ees8 c aes ees g bes aes4 | aes2 \times 2/3 { g4 f g } | e1~ | e2 a4 b |
	%% B part
	c2. d4 | e2. d4 | c2. e4 | a,2. b4 |
	c2. d4 | e2. d4 | e1 | f2. e4 |
	%% A part
	g8 d r c b c d e | ees g, bes d c4 d | f8 c r bes a bes c d | des f, aes c bes4 c |
	ees8 c aes ees g bes aes4 | f2 \times 2/3 { g4 f g } | e1~ | e2. r4 |
}
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		c1:maj7 | c2:m7 f:7 | bes1:maj7 | bes2:m7 ees:7 | \myEndLine
		aes1:maj7 | d2:m7 g:7.9- | c1:maj7 |
	}
	\alternative {
		{
			d2:m7 g:7 | \myEndLineVoltaNotLast
		}
		{
			c1:maj7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	d1:m7 | g:7 | c:maj7/e | a:9 | \myEndLine
	d:m7 | g:7 | c:maj7 | d2:m7 g:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c1:maj7 | c2:m7 f:7 | bes1:maj7 | bes2:m7 ees:7 | \myEndLine
	aes1:maj7 | d2:m7 g:7.9- | c1:maj7 | d2:m7 g:7 | \myEndLine
	\endPart

	\endSong

	\endChords
}
% endif

% if part=='VoiceReal':
\relative c {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\key c \major
	\time 4/4
	\partial 4 e''8-- g-^ |
	%% A part
	\repeat volta 2 {
		r8 d4-^ c8 b c d e | ees g, bes d c4 d8-- f-^ |
		r c4-^ bes8 a bes c d | des f, aes c bes4 c8 ees-^ |
		r c4-^ aes8 g bes aes g~ | g2~ g8 bes aes g~ |
		g1 |
	}
	\alternative {
		{
			r2 r4 e'8-- g-^ |
		}
		{
			r2 a,4 b8 c~ |
		}
	}
	%% B part
	c2. d8 e~ | e2. d8 c~ | c2. e8 a,~ | a2. b8 c~ |
	c2. d8 e~ | e2. f8 g~ | g2 g8 e f g~ |
	g2. e8-- g-^ |
	%% A part
	r8 d4-^ c8 b c d e | ees g, bes d c4 d8-- f-^ |
	r c4-^ bes8 a bes c d | des f, aes c bes4 c8-- ees-^ |
	r c4-^ aes8 g bes aes g~ | g2~ g8 bes aes g~ |
	g1~ \mark \markup { \italic { Fine } } | g1 |
}
% endif
