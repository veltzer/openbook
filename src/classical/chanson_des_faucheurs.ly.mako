<%page args='part'/>
% if part=='Vars':
<%
	from scripts import attr
	version=attr.Version()
	version['doVoice']=True
	attributes.add_version('Unknown', version)
	attributes.set_default_version_name('Unknown')

	attributes['title']='Chanson des faucheurs'
	attributes['style']='Classical'
	attributes['composer']='R. Schumann'

	attributes['typesetter']='Mark Veltzer <mark.veltzer@gmail.com>'
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
