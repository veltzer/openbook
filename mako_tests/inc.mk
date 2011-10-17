<%page args="part"/>
% if part=='First':
	This is the first part of song1
% endif
% if part=='Second':
	This is the second part of song1
% endif
% if part=='Vars':
	${self.Vars()}
% endif
% if part=='foo':
	${self.foo()}
% endif
