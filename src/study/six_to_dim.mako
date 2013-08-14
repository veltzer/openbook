<%page args="part"/>
% if part=='Vars':
<%
	attributes['doVoice']=True
	attributes['render']="My"

	attributes['title']="Six to Diminished scale exercises"
	attributes['style']="Jazz"
	attributes['piece']="Upbeat Jazz"
	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"

	attributes['copyright']=attributes['copyrightvalstudy']

	attributes['completion']="4"

	attributes['uuid']="35529555-8b38-4cc0-be20-2dc5f1848d77"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- six to dim with full chords going up and down.
	- six to dim with drop two (two hands).
	- six to dim with full chords left hand going down.
	- six to dim arpeggio with the two hands in an interval (a third and then a fifth).
		at least a couple of kinds of argpegios.
% endif

% if part=='VoiceMy':
\relative c' {
	\time 4/4
	\key bes \major

	%% this is to be played over: cm6 as tonic, am7.5- as II chord, f7 as dominant, b7 as dominant

	<c ees g a>1 <d f aes b> <ees g a c> <f aes b d>
	<g a c ees> <aes b d f> <a c ees g> <b d f aes>
	<c ees g a>
}
% endif
