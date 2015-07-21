<%page args='part'/>
% if part=='Vars':
<%
	# vim: set filetype=lilypond :
	import attr
	version=attr.Version()
	version['doChords']=True
	attributes.addVersion('My', version)
	attributes.setDefaultVersionName('My')

	attributes['heb']=True

	attributes['title']=u'עוד חוזר הניגון'
	attributes['style']='Israeli'
	attributes['piece']=u'בלדה מתונה'
	attributes['singer']=u'ברי סחרוף'
	attributes['typesetter']=u'מרק ולצר <mark.veltzer@gmail.com>'

	attributes['completion']='0'
	attributes['uuid']='505a0a3a-a26f-11df-bbef-0019d11e5a41'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- complete this tune.
	- mark what has been done.
	- add youtube performance.
% endif

% if part=='ChordsMy':
\chordmode {
	\mark "פתיחה"
	\repeat volta 4 {
		b2:m7 a2:7 |
	}
	\mark "בית"
	d2 e2:m7 | g2 b2:m7 | e2:m7 fis2:7 | g2 d2 | \myEndLine
	g2 d2 | e2:m7 b2:m7 | e2:m7 fis2:7 | g2 a2:7 | \myEndLine
}
% endif
