<%def name="vars()">
<%
	attributes['type']="harmony"
	attributes['render']="My"

	attributes['title']=u"עוד חוזר הניגון"
	attributes['singer']=u"ברי סחרוף"
	attributes['piece']=u"בלדה מתונה"

	attributes['completion']="0"
	attributes['uuid']="505a0a3a-a26f-11df-bbef-0019d11e5a41"
%>
</%def>

<%doc>
	DONE:
	TODO:
	- complete this tune.
	- mark what has been done.
	- add youtube performance.
</%doc>

<%def name="myChordsMy()">
\chordmode {
	\mark "פתיחה"
	\repeat volta 4 {
		b2:m7 a2:7 |
	}
	\mark "בית"
	d2 e2:m7 | g2 b2:m7 | e2:m7 fis2:7 | g2 d2 | \myEndLine
	g2 d2 | e2:m7 b2:m7 | e2:m7 fis2:7 | g2 a2:7 | \myEndLine
}
</%def>
