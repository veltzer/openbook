<%inherit file="/src/include/common.makoi"/>
<%
	attributes['jazzTune']=True
	attributes['type']="harmony_tune_lyrics"
	attributes['render']="Unknown"

	title="What a wonderful world"
	composer="George David Weiss & Bob Thiele"
	poet="George David Weiss & Bob Thiele"
	style="Jazz"
	piece="Med Swing"

	completion="0"
	uuid="39de7d2c-a26f-11df-8dbc-0019d11e5a41"
%>

<%doc>
	DONE:
	TODO:
	- check this tune.
	- mark what's been done.
</%doc>

myChordsUnknown=\chordmode {
	\startChords

	\startSong

	r1 | r1 |

	f2 a:m bes a:m g:m7 f a:7 d:m des1 c2:7.11 c:7 f f:5+ bes:7+ c:7
	f2 a:m bes a:m g:m7 f a:7 d:m des1 c2:7.11 c:7 f bes bes f
	c1:7 f c:7 f
	d2:m c d:m c d:m fis:dim7 g4:m7 fis:dim7 c2:7
	f2 a:m bes a:m g:m7 f a:7 d:m
	des1 c2:7.11 c:7 f a:m7.5- d1:7
	g:m7 r2 c:7.9- f bes:6 r f

	\endSong

	\endChords
}

myVoiceUnknown={
	\key f \major
	\time 4/4

	r1 | r2 r4 c8 e |
	f4. a8 c'2 | r8 d' d' d' c'2 | r8 bes bes bes a2 |
	r8 g g g f4~ \times 2/3 { f8 f f } | f4~ \times 2/3 { f8 f f } f2 |
	r4 f8 f \times 2/3 {e4 f g} | a1~ | a2 r4 c8 e |
	f4. a8 c'4. c'8 | d'4. d'8 c'4. c'8 |
	bes4~ \times 2/3 { bes8 bes bes } a4. a8 |
	g4~ \times 2/3 { g8 g g } f4~ \times 2/3 { f8 f f } |
	f4~ \times 2/3 { f8 f f } f2 |
	r4 f8 f \times 2/3 {e4 f g } | f1~ | f2 r4 f4 | g8 g g g g c4 c8 |
	bes, a a gis a4. f8 | g g g g g c4 g8 | bes, a a gis a4 a8 c' |
	d'4 d'8 d' c'4~ \times 2/3 { c'8 a c' } | d'4 d'8 d' c'2 |
	r8 d' d' d' c' c'4. | bes4 a g c8 e | f4. a8 c'4. c'8 | d'4. d'8 c'2 |
	r8 bes bes bes a4. a8 | g4~ \times 2/3 { g8 g g } f4~ \times 2/3 { f8 f f } |
	f4~ \times 2/3 { f8 f f } f2 | r4 f8 f \times 2/3 {e4 f g} | a1~ | a4 r a a |
	\times 2/3 {a4 f g} f2 | r4 f8 f \times 2/3 {e4 f g} | f1~ | f
}

myLyricsUnknown=\lyrics {
	I see trees of green, red ros -- es too, I see the bloom for me and you, ___
	and I think ___ to my -- self what a won -- der -- ful world. ___

	I see skies of blue and clouds of white,
	he bright ___ bles -- sed day, the dark ___ sac -- red night, ___
	and I think ___ to my- self what a won -- der -- ful world. ___

	The col -- ors of the rain- bow so pret -- ty in the sky
	are al -- so on the fa- ces of peo -- ple go -- in' by,

	I see friends sha -- kin' hands, ___ say -- in' How do you do!
	They're real -- ly say -- in' I love you

	I hear ba -- bies cry, I watch them grow
	They'll learn much more than I'll ___ ev -- er know ___
	and I think ___ to my -- self what a won -- der -- ful world. ___
	Yes, I think to my -- self what a won -- der -- ful world. ___
}
