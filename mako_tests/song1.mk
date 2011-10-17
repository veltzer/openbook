<%def name="foo()">
This is the content of foo in song1
</%def>
<%def name="vars()">
	<%
		attributes['g']="song1 value"
	%>
</%def>
<%page args="part"/>
% if part=='First':
	This is the first part of song1
% endif
% if part=='Second':
	This is the second part of song1
% endif
% if part=='Vars':
	${self.vars()}
% endif
% if part=='foo':
	${self.foo()}
% endif
