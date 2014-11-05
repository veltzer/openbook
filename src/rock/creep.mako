<%page args='part'/>
% if part=='Vars':
<%
	# vim: set filetype=lilypond :
	import attr
	version=attr.Version()
	version['doGuitar']=True
	version['doOwn']=True
	attributes.addVersion('DontMatter', version)
	attributes.setDefaultVersionName('DontMatter')

	attributes['title']='Creep'
	attributes['style']='Rock'
	attributes['composer']='Radiohead'
	attributes['poet']='Radiohead'
	attributes['piece']='Med. Ballad'
	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'

	attributes['completion']='5'
	attributes['uuid']='e9b74c60-97f6-11e0-86b8-0019d11e5a41'

	attributes['remark']='The G scale is the one used in the original version (Mark Veltzer,17/6/11)'

	attributes['idyoutube1']='XFkzRNyygfk'
	attributes['lyricsurl']='http://www.azlyrics.com/lyrics/radiohead/creepacoustic.html'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- document what was done in this tune.
	- document the youtube performances.
% endif

<%namespace name="defs" file="/src/include/defs.makoi"/>

<%def name="chords()">
	\chordmode {
		\startChords
		\startRepeat
		g1*4 | b | c | c:m |
		\endRepeat
		\endChords
	}
</%def>

% if part=='Own':
\score {
	<<
		\new FretBoards {
			${chords()}
		}
		\new ChordNames="Chords"
		${defs.chordDefs()}
		${chords()}
	>>
	%%\midi {}
	\layout {}
}

%% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small { %% \teeny \tiny \small \normalsize \large \huge
		\fill-line {
			\column {
				"When you were here before"
				"Couldn't look you in the eye"
				"You're just like an angel"
				"Your skin makes me cry"
				\null
				"You float like a feather"
				"In a beautiful world"
				"I wish I was special"
				"You're so fucking special"
				\null
				"But I 'm a creep"
				"I 'm a weirdo"
				"What the hell am I doing here?"
				"I don't belong here"
			}
			\null
			\column {
				"I don't care if it hurts"
				"I want to have control"
				"I want a perfect body"
				"I want a perfect soul"
				\null
				"I want you to notice"
				"When I'm not around"
				"You're so fucking special"
				"I wish I was special"
				\null
				"But I'm a creep"
				"I'm a weirdo"
				"What the hell am I doing here?"
				"I don't belong here"
			}
			\null
			\column {
				"She's running out again"
				"She's running out"
				"She run, run, run run"
				"Run"
				\null
				"Whatever makes you happy"
				"Whatever you want"
				"You're so fucking special"
				"I wish I was special"
				\null
				"But I'm a creep"
				"I'm a weirdo"
				"What the hell am I doing here?"
				"I don't belong here"
				"I don't belong here."
			}
		}
	}
}
% endif
