<%page args="part"/>
% if part=='Vars':
<%
	attributes['doVoice']=True
	attributes['render']="Unknown"

	attributes['title']="Chanson des faucheurs"
	attributes['composer']="R. Schumann"
	attributes['style']="Classical"
	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"

	attributes['completion']="0"
	attributes['uuid']="9ff5c7c4-a26e-11df-aa45-0019d11e5a41"
%>
% endif

% if part=='VoiceUnknown':
\relative g'' {
	\key c \major
	\time 3/4

	g4 ( c ) b | a ( d ) c | b ( a ) b | c2 ( d4 ) |
	g,4 ( c ) b | a ( d ) c | b ( a ) b | c2 r4 |

	d,4 ( g ) fis | e ( a ) g | fis ( e ) fis | g2 ( b4 ) |
	d4 ( g ) fis | e ( a ) g | fis ( e ) fis | g2 r4 |

	g,4 ( c ) b | a ( d ) c | b ( a ) b | c2 ( d4 ) |
	g,4 ( c ) b | a ( d ) c | b ( a ) b | c2 r4 |
}
% endif
