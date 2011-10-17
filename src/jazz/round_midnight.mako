<%def name="vars()">
<%
	attributes['jazzTune']=True
	attributes['type']="harmony_tune"
	attributes['render']="Unknown"

	attributes['title']="Round Midnight"
	attributes['composer']="Cootie Williams & Thelonious Monk"
	attributes['poet']="Bernie Hanighen"
	attributes['style']="Jazz"
	attributes['piece']="Med Swing"

	attributes['completion']="0"
	attributes['uuid']="1c99c334-a26f-11df-b3cb-0019d11e5a41"
%>
</%def>

<%def name="myChordsUnknown()">
\chordmode {
}
</%def>

<%def name="myVoiceUnknown()">
\relative c' {
	\time 4/4
	\key aes \major

	%% INTRO
	\repeat unfold 3 {
		r4 f16 g a b \grace { dis8 } e8 b16 a \grace { dis8 } e8 b16 a |
		\grace {fis'8 } g4~ g16 fis c gis ais2 |
	}
	\myEndLine

	{
		\repeat "unfold" 3 {
			r16 < a, e gis bis >16 < a, e gis bis >8 < a, e gis bis >8
			< a, e gis bis >16 < a, e gis bis >16
		}
		r16 < a, e gis bis >16 < a, e gis bis >8 < bes, e fis c' >4
	}

	%% theme
	\repeat volta 2 {
		r4 c16 f g c aes4. c,8 | f8 f~ f4~ f8 f c'16 bes8. |
		r4 f16 aes c ees d4. aes8 | b4 bes bes8 aes~ a4 |
		r4 bes16 des f aes g4. des8 | c2. f,8 g |
	} \alternative {
		{ \times 2/3 {aes g aes} g4~ g4. f8 | e c~ c2. | }
		{ aes8 g4 f8~ f4 f8 f8~ | f2. f8 g | }
	}
	\times 2/3 {aes g aes} g4~ g4. f8 | e c~ c2 f8 g |
	\times 2/3 {aes8 g aes} g4~ g4. f8 | e c'8~ c2. |
	des4 des8. des16 c8 c~ c4 | aes8. aes16 aes8 g8~ g4. c8 |
	f4. f16 f ees4. ees16 ees | des4. ees16 des c2 |

	r4 c,16 f g c aes4. c,8 | f8 f~ f4~ f8 f c'16 bes8. |
	r4 f16 aes c ees d4. aes8 | b4 bes bes8 aes~ a4 |
	r4 bes16 des f aes g4. des8 | c2. f,8 g |
	aes8 g4 f8~ f4 f8 f8~ | f2. r4 |

	%% coda
	r8 c \times 2/3 {d8 e f} g f~ \times 2/3 {g8 ees d} |
	aes'1~ | aes4~ \times 2/3 {aes8 g f} g8. e16 f g aes bes |
	\times 2/3 {b8 des ais} b2.~ |
	b4~ \times 2/3 {b8 ais gis} ais8. gis16 g gis ais b |
	cis2.~ \times 2/3 {cis8 fis, g} |
	c4 \times 2/3 {bes8 f d} <cis fis a>4 r8 c |
	f4 c' f bes,! ees! aes,! des! fis, c'2
	<b gis e b-\fermata>1
}
</%def>
