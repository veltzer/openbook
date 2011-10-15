<%inherit file="/src/include/common.makoi"/>
<%
	attributes['type']="tune"
	attributes['render']="Epdf0"

	attributes['title']="Sonata III"
	attributes['composer']="Wolfgang Amadeus Mozart"
	attributes['copyright']="1918, G.Schirmer Inc."
	attributes['style']="Classical"
	attributes['remark']="Edited, revised and fingered by Richard Epstein"

	attributes['completion']="0"
	attributes['uuid']="744f61d8-a26f-11df-b6b1-0019d11e5a41"
%>

<%doc>
	DONE:
	TODO:
	- turn this tune relative.
	- add it as an epdf:
	"Schirmer's library of musical classics"
	An accompaniment for Second Piano by Edvard Grieg may be found in Schirmer's Library, Vol. 1440.
	- write whats been done for this tune.
</%doc>

<%def name="myVoiceEpdf0()">
\relative c{
	\key c \major
	\time 4/4
	\startTune
	\partial 4 e'4 |
	\repeat volta 2 {
		c'1 | a'4 g'2 a'4 | b1 | b'4 a'2 b'4 |
		e'1 | d''4 c''2 e'4 | g'1 | e''4 d''2 g'4 |
	}
	\alternative {
		{
			c''4 b'4 c''4 d''4 | \times 2/3 { c''4 b'4 bes'4 } a'4 aes'4 | g'2 g'2~ | g'2. g'4 |
			a'4 gis'4 a'4 b'4 | \times 2/3 { a'4 aes'4 g'4 } ges'4 f'4 | e'2 e'2~ | e'2 e'2 |
		}
		{
			c''4 b'4 c''4 d''4 | \times 2/3 { e''4 d''4 c''4 } b'4 bes'4 | a'1 | \times 2/3 { c''4 b'4 bes'4 } a'4 aes'4 |
			g'1 | \times 2/3 { b'4 a'4 aes'4 } g'4 d''4 | c''1~ | c''2 r4 <\parenthesize e'>4 |
		}
	}
	\endTune
}
</%def>
