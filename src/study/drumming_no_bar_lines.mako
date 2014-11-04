<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doOwn']=True
	attributes.addVersion('Own', version)
	attributes.setDefaultVersionName('Own')

	attributes['title']='Drumming drills with no bar lines'
	attributes['style']='Jazz'
	attributes['copyright']=gattr['copyrightvalstudy']

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='6d469874-6e9e-11e0-b6e5-0019d11e5a41'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
% endif

% if part=='Own':
\markup {
	\wordwrap-lines { \italic {
	These are exercises to train the control of your hands. The idea is to train your hand for flexibility and agility.
	Try be aware of how you are performing the exercises and make sure you are not straining your wrists or your muscles.
	Make sure the stick bounces back nice and fast. Try to sustain the exercises for minutes at a time with perfect rythmic precision.
	Start at random points in the following exercises and cycle.
	} }
}
\markup {
Starting with the left hand.
Same number of strokes in each hand.
}
\score {
<<
	\new DrumStaff \with {
		\remove Time_signature_engraver
		%% you don't really need this (have yet to see this do anything useful...)
		%%\remove Forbid_line_break_engraver
		\remove Bar_engraver
		drumStyleTable = #percussion-style
		\override StaffSymbol.line-count = #1
		\override Stem.Y-extent = ##f
		\override Stem.transparent = ##t
	} <<
		\set Score.timing = ##f
		\new DrumVoice {
			\stemUp
			\drummode {
				sn^"L"\( sn^"L" sn^"L" sn^"L"\)
				sn^"R"\( sn^"R" sn^"R" sn^"R"\)
				sn^"L"\( sn^"L" sn^"L"\)
				sn^"R"\( sn^"R" sn^"R"\)
				sn^"L"\( sn^"L"\)
				sn^"R"\( sn^"R"\)
				sn^"L"
				sn^"R"
				sn^"L"\( sn^"L"\)
				sn^"R"\( sn^"R"\)
				sn^"L"\( sn^"L" sn^"L"\)
				sn^"R"\( sn^"R" sn^"R"\)
				sn^"L"\( sn^"L" sn^"L" sn^"L"\)
				sn^"R"\( sn^"R" sn^"R" sn^"R"\)
			}
		}
	>>
>>
	\layout {
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130/4)
		}
	}
}
\markup {
Starting with the right hand.
Same number of strokes in each hand.
}
\score {
<<
	\new DrumStaff \with {
		\remove Time_signature_engraver
		%% you don't really need this (have yet to see this do anything useful...)
		%%\remove Forbid_line_break_engraver
		\remove Bar_engraver
		drumStyleTable = #percussion-style
		\override StaffSymbol.line-count = #1
		\override Stem.Y-extent = ##f
		\override Stem.transparent = ##t
	} <<
		\set Score.timing = ##f
		\new DrumVoice {
			\stemUp
			\drummode {
				sn^"R"\( sn^"R" sn^"R" sn^"R"\)
				sn^"L"\( sn^"L" sn^"L" sn^"L"\)
				sn^"R"\( sn^"R" sn^"R"\)
				sn^"L"\( sn^"L" sn^"L"\)
				sn^"R"\( sn^"R"\)
				sn^"L"\( sn^"L"\)
				sn^"R"
				sn^"L"
				sn^"R"\( sn^"R"\)
				sn^"L"\( sn^"L"\)
				sn^"R"\( sn^"R" sn^"R"\)
				sn^"L"\( sn^"L" sn^"L"\)
				sn^"R"\( sn^"R" sn^"R" sn^"R"\)
				sn^"L"\( sn^"L" sn^"L" sn^"L"\)
			}
		}
	>>
>>
	\layout {
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130/4)
		}
	}
}
\markup {
Starting with the left hand.
Different number of strokes in each hand.
}
\score {
<<
	\new DrumStaff \with {
		\remove Time_signature_engraver
		%% you don't really need this (have yet to see this do anything useful...)
		%%\remove Forbid_line_break_engraver
		\remove Bar_engraver
		drumStyleTable = #percussion-style
		\override StaffSymbol.line-count = #1
		\override Stem.Y-extent = ##f
		\override Stem.transparent = ##t
	} <<
		\set Score.timing = ##f
		\new DrumVoice {
			\stemUp
			\drummode {
				sn^"L"\( sn^"L" sn^"L" sn^"L"\)
				sn^"R"\( sn^"R" sn^"R"\)
				sn^"L"\( sn^"L"\)
				sn^"R"
				sn^"L"\( sn^"L"\)
				sn^"R"\( sn^"R" sn^"R"\)
				sn^"L"\( sn^"L" sn^"L" sn^"L"\)
			}
		}
	>>
>>
	\layout {
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130/4)
		}
	}
}
\markup {
Starting with the right hand.
Different number of strokes in each hand.
}
\score {
<<
	\new DrumStaff \with {
		\remove Time_signature_engraver
		%% you don't really need this (have yet to see this do anything useful...)
		%%\remove Forbid_line_break_engraver
		\remove Bar_engraver
		drumStyleTable = #percussion-style
		\override StaffSymbol.line-count = #1
		\override Stem.Y-extent = ##f
		\override Stem.transparent = ##t
	} <<
		\set Score.timing = ##f
		\new DrumVoice {
			\stemUp
			\drummode {
				sn^"R"\( sn^"R" sn^"R" sn^"R"\)
				sn^"L"\( sn^"L" sn^"L"\)
				sn^"R"\( sn^"R"\)
				sn^"L"
				sn^"R"\( sn^"R"\)
				sn^"L"\( sn^"L" sn^"L"\)
				sn^"R"\( sn^"R" sn^"R" sn^"R"\)
			}
		}
	>>
>>
	\layout {
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130/4)
		}
	}
}
\markup {
	\wordwrap-lines { \italic {
	Focus on the center of the previous exercises. This could be thought of in 3/4 time.
	} }
}
\markup {
Starting with the right hand.
}
\score {
<<
	\new DrumStaff \with {
		\remove Time_signature_engraver
		%% you don't really need this (have yet to see this do anything useful...)
		%%\remove Forbid_line_break_engraver
		\remove Bar_engraver
		drumStyleTable = #percussion-style
		\override StaffSymbol.line-count = #1
		\override Stem.Y-extent = ##f
		\override Stem.transparent = ##t
	} <<
		\set Score.timing = ##f
		\new DrumVoice {
			\stemUp
			\drummode {
				sn^"R"\( sn^"R"\)
				sn^"L"\( sn^"L"\)
				sn^"R"
				sn^"L"
				sn^"R"\( sn^"R"\)
				sn^"L"\( sn^"L"\)
			}
		}
	>>
>>
	\layout {
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130/4)
		}
	}
}
\markup {
Starting with the left hand.
}
\score {
<<
	\new DrumStaff \with {
		\remove Time_signature_engraver
		%% you don't really need this (have yet to see this do anything useful...)
		%%\remove Forbid_line_break_engraver
		\remove Bar_engraver
		drumStyleTable = #percussion-style
		\override StaffSymbol.line-count = #1
		\override Stem.Y-extent = ##f
		\override Stem.transparent = ##t
	} <<
		\set Score.timing = ##f
		\new DrumVoice {
			\stemUp
			\drummode {
				sn^"L"\( sn^"L"\)
				sn^"R"\( sn^"R"\)
				sn^"L"
				sn^"R"
				sn^"L"\( sn^"L"\)
				sn^"R"\( sn^"R"\)
			}
		}
	>>
>>
	\layout {
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130/4)
		}
	}
}
% endif
