
##<%
##	for a in attributes['list']:
##		context.write(str(dir(context)))
##%>

## this way I could find the list from within the template...
##<%
##	attributes['list']=[ 'mako_tests/song2.mk' ]
##%>

% for a in attributes['list']:
	<%include file="/${a}" args="part='Vars'"/>
	${attributes['g']}
% endfor
% for a in attributes['list']:
	<%include file="/${a}" args="part='foo'"/>
% endfor
% for a in attributes['list']:
	<%include file="/${a}" args="part='First'"/>
% endfor
% for a in attributes['list']:
	<%include file="/${a}" args="part='Second'"/>
% endfor
##% for a in attributes['list']:
##<%
	##	context.write(a)
	##	context.write(str(dir(context)))
##		context.write(str(context['attributes']))
##		context['attributes']['iter']=a
##		context.write("\n")
##		context.write(str(context['attributes']))
##		context.write("\n\n\n")
##%>
##	${attributes['iter']['iter']}
##	${context['attributes']['iter']}
##	<%namespace file="/${context['attributes']['iter']}" import="*"/>
##	<%namespace file="/${context}" name="ns"/>
##	${foo()}
##	${dir(self)}
##	${self.callables}
##	${self.include_file}
##	${self.template}
##	${dir(self.template)}
##	${self.get_namespace(None)}
##% endfor

##<%doc>
##<%namespace file="/mako_tests/song2.mk" name="song2"/>
##${song2.foo()}
##</%doc>
