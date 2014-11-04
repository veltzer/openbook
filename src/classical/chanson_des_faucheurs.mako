<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doVoice']=True
	attributes.addVersion('Unknown', version)
	attributes.setDefaultVersionName('Unknown')

	attributes['title']='Chanson des faucheurs'
	attributes['style']='Classical'
	attributes['composer']='R. Schumann'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='0'
	attributes['uuid']='9ff5c7c4-a26e-11df-aa45-0019d11e5a41'
%>
% endif

% if part=='VoiceUnknown':
{
	\key c \major
	\time 3/4

	g''4 ( c ) b | a ( d ) c | b ( a ) b | c2 ( d4 ) |
	g,4 ( c ) b | a ( d ) c | b ( a ) b | c2 r4 |

	d,4 ( g ) fis | e ( a ) g | fis ( e ) fis | g2 ( b4 ) |
	d4 ( g ) fis | e ( a ) g | fis ( e ) fis | g2 r4 |

	g,4 ( c ) b | a ( d ) c | b ( a ) b | c2 ( d4 ) |
	g,4 ( c ) b | a ( d ) c | b ( a ) b | c2 r4 |
}
% endif
