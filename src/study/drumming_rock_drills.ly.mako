<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doOwn']=True
	attributes.addVersion('Own', version)
	attributes.setDefaultVersionName('Own')

	attributes['title']='Drumming rock drills'
	attributes['style']='Jazz'
	attributes['copyright']=gattr['copyrightvalstudy']

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='d54f6d36-6d29-11e0-a6dd-0019d11e5a41'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
% endif

% if part=='Own':
\markup {
Regular rock type drumming...
}
\score {
<<
	\new DrumStaff <<
		\new DrumVoice {
			\stemUp
			\drummode {
				hh8 hh hh hh hh hh hh hh |
				hh hh hh hh hh hh hh hh |
				hh hh hh hh hh hh hh hh |
				hh hh hh hh hh hh hh hh |
				hh hh hh hh hh hh hh hh |
				hh hh hh hh hh hh hh hh |
			}
		}
		\new DrumVoice {
			\stemDown
			\drummode {
				bd4 sn bd8 bd sn4 |
				bd8 bd sn bd bd4 sn |
				bd4 sn8 bd r bd sn bd |
				bd4 sn r8 bd sn bd |
				r8 bd sn bd bd4 sn8 sn |
				bd4 sn8 sn r bd sn sn |
			}
			\endBar
		}
	>>
>>
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130/4)
		}
	}
	\layout {}
}

\markup {
My own drills for understanding the on and off 8 notes...
}
\score {
<<
	\new DrumStaff <<
		\new DrumVoice {
			\stemUp
			\drummode {
				hh8 hh hh hh hh hh hh hh |
				hh hh hh hh hh hh hh hh |
				hh hh hh hh hh hh hh hh |
			}
		}
		\new DrumVoice {
			\stemDown
			\drummode {
				bd4 sn bd8 sn r4 |
				bd4 sn r8 bd sn r |
				bd4 sn r bd8 sn |
			}
			\endBar
		}
	>>
>>
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130/4)
		}
	}
	\layout {}
}

\markup {
Patterns of 3 located in different places in the eight 8 notes...
}
\score {
<<
	\new DrumStaff <<
		\new DrumVoice {
			\stemUp
			\drummode {
				hh8 hh hh hh hh hh hh hh |
				hh hh hh hh hh hh hh hh |
				hh hh hh hh hh hh hh hh |
			}
		}
		\new DrumVoice {
			\stemDown
			\drummode {
				bd8 sn4 bd8 sn4 bd8 sn8 |
				bd8 sn4 bd8 sn8 bd8 sn4 |
				bd8 sn8 bd8 sn4 bd8 sn4 |
			}
			\endBar
		}
	>>
>>
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130/4)
		}
	}
	\layout {}
}
% endif
