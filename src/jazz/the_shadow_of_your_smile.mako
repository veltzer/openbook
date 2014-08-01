<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Real"

	attributes['title']="The Shadow of Your Smile"
	attributes['style']="Jazz"
	# this is from the real book
	attributes['composer']="Johnny Mandel"
	# this is from wikipedia
	attributes['poet']="Paul Francis Webster"
	# this is from the new real book vol 3
	attributes['piece']="Medium Bossa (or Swing)"
	# this is from the real book
	attributes['piece']="Slow Bossa"
	# this is from the new real book vol 3
	attributes['copyright']="1965 (Renewed 1993) MGM/EMI Miller Catalog, Inc"
	attributes['copyrightextra']="Used by Permission of CPP/Belwin, Inc, Miami, FL"

	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"
	attributes['completion']="5"
	attributes['uuid']="dff04e04-a969-11e1-b8c5-5a1faa0d3cc5"
	attributes['structure']="ABAC"
	attributes['structureremark']="The structure could also be thought of as AB but it is very close to a pure ABAC"
	attributes['location']="nrbk3:336,rbk1:381"

	attributes['idyoutuberemark1']="A very sensitive rendition by Dexter Gordon"
	attributes['idyoutube1']="8PttNhYVY3c"
	attributes['idyoutuberemark2']="Sarah Vaughan, fucking awesome"
	attributes['idyoutube2']="t9HxfF7faXk"
	attributes['lyricsurl']="http://www.absolutelyrics.com/lyrics/view/barbra_streisand/the_shadow_of_your_smile"
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the lyrics URL.
	- filled in all the meta data for this tune.
	- filled in the tunes structure.
	- put in the real book chords.
	- put in the real book tune.
	- put in lyrics to the real book version.
	- checked the real book chords.
	- checked the real book tune.
	- checked the real book lyrics.
	- put in youtube performances.
	- filled in the copyright for this tune (from the new real book vol 3).
	- heard the real book version to make sure it sounds good and in the right tempo.
	TODO:
	- put in the new reall book version of this tune (already have the epdf).
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 8*5 s8 s2 |

	\myMark "A"
	\startPart
	fis1:m7 | b2:7.9 b:7.9- | e1:m7 | a:7 | \myEndLine
	a:m7 | d:7 | g:maj7| c:maj7 | \myEndLine
	\endPart
	\myMark "B"
	\startPart
	fis:m7.5- | b:7 | e1.:m7 e2:m7/d | \myEndLine
	cis1:m7.5- | fis:7 | fis:m7 | b:7 | \myEndLine
	\endPart
	\myMark "A"
	\startPart
	fis1:m7 | b2:7.9 b:7.9- | e1:m7 | a:7 | \myEndLine
	a:m7 | d:7 | b:m7.5- | e:7.3-.5-.9-.11-.13- | \myEndLine
	\endPart
	\myMark "C"
	\startPart
	a:m7 | c2:m7 f:7 | b1:m7 | e:7.9- | \myEndLine
	a2:7 ees:7 | a:m7 d:7.9- | g1.:6 \OPC b2:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key g \major

	\partial 8*5 b8 e fis g b |

	%% part "A"
	cis,2. fis4 | dis2. c!4 | b1~ | b4. b8 e fis g b |
	e,2. a4 | fis2. d4 | b'1~ | b2 c8 b a g |
	%% part "B"
	a2. c,4 | b2. a'4 | g1~ | g2 b8 a g fis |
	g2. b,4 | ais2. g'4 | fis1~ | fis4 r8 b, e fis g b |
	%% part "A"
	cis,2. fis4 | dis2. c!4 | b1~ | b4. b8 e fis g b |
	e,2. c'4 | a2. fis4 | d'1~ | d2 e8 d c b |
	%% part "C"
	c4. e,8 c'2~ | c d8 c b a | b4. d,8 b'2~ | b c8 b a gis |
	a4. cis,8 a'2~ | a4. c,!8 b' a g fis | g1 | r4_\markup { \italic { Fine } } r8 b, e fis g b |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics).
\lyricmode {
	%% part "A"
	The sha -- dow of your smile, when you are gone. __
	Will co -- lor all my dreams, and light the dawn. __
	%% part "B"
	Look in -- to my eyes, my love, and see. __
	All the love -- ly things you are to me. __
	%% part "A"
	A wist -- ful lit -- tle star, was far too high. __
	A tear drop kissed your lips, and so did I. __
	%% part "C"
	Now when I re -- mem -- ber spring. __
	All the joy that love can bring. __
	I will be re -- mem -- be -- ring __
	The sha -- dow of your smile.
	%% part "return"
	The sha -- dow of your
}
% endif
