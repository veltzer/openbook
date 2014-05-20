<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['render']="Real"

	attributes['title']="500 Miles High"
	attributes['style']="Jazz"
	# this is from the real book
	attributes['composer']="Chick Corea"
	# this is from the real book
	attributes['piece']="Samba"

	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"
	attributes['completion']="5"
	attributes['uuid']="ed0cff46-dffa-11e3-b4b7-43ee65102d59"
	attributes['structure']="A"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
%>
% endif

% if part=='Doc':
	DONE:
	- put in the meta data from the real book.
	- put in the chords from the real book.
	- put in the tune from the real book.
	- get the real book epdf.
	- played the real book version to hear that it sounds well.
	- checked the real book chords.
	- checked the real book tune.
	TODO:
	- fix the coda thing.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	%%\myMark "A"
	\mark \markup { \musicglyph #"scripts.segno" }
	\startPart
	\repeat volta 2 {
		e1*2:m | g:m | \myEndLine
		bes:maj7 | b1:m7.5- | e:7.9+ | \myEndLine
		a1*2:m11 | fis:m7.5- | \myEndLine
		f:m7 | c:m11 | \mark \markup { \musicglyph #"scripts.coda" } b:7.3-.5-.9-.11-.13- \mark \markup {D.S. al Coda} | \myEndLine
	}
	\endPart

	%%\myMark "Coda"
	%%\mark \markup { \musicglyph #"scripts.coda" }
	\startPart
	\repeat volta 2 {
		b1:7.3-.5-.9-.11-.13- | c1*2:m11 | b1:7.3-.5-.9-.11-.13- | \myEndLine
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 168
	\time 4/4
	\key c \major

	\partial 4 d''4 |

	%% part "A"
	\repeat volta 2 {
		b1~ | \times 2/3 { b4 b, d a' fis d } | e1~ | e4 c \times 2/3 { a f d } | \myEndLine
		g1 | f2. f4 | f8 e4 g8~ g2~ | g2~ \times 2/3 { g4 f e } | \myEndLine
		d'1~ | d2. c4 | c b8 d~ d2~ | d2~ \times 2/3 { d4 c b } | \myEndLine
		bes aes8 c~ c2~ | c4 r8 g d' ees aes, d | c1~ | c | r | r2. <\parenthesize d'>4 | \myEndLine
	}
	%% part "Coda"
	\repeat volta 2 {
		r4 r8 g,, d' ees aes, d | c1~ | c | r | \myEndLine
	}
}
% endif
