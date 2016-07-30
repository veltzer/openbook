<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doGuitar']=True
	version['doOwn']=True
	attributes.addVersion('DontMatter', version)
	attributes.setDefaultVersionName('DontMatter')

	attributes['title']='Baby One More Time'
	attributes['style']='Pop'
	attributes['composer']='Max Martin'
	attributes['poet']='Max Martin'
	attributes['piece']='Pop'
	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'

	attributes['completion']='5'
	attributes['uuid']='8a728316-ee02-11e0-b7c5-0019d11e5a41'

	attributes['idyoutuberemark1']='the original Britney Spears clip'
	attributes['idyoutube1']='C-u5WLJ9Yk4'
	attributes['idyoutuberemark2']='a cover by Travis'
	attributes['idyoutube2']='acULghgYUg0'
	attributes['lyricsurl']='http://www.elyrics.net/read/b/britney-spears-lyrics/baby-one-more-time-lyrics.html'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- mark what has been done to thus tune.
% endif

<%namespace name="defs" file="/include/defs.ly.mako"/>

<%def name="chords()">
	\chordmode {
		\mark "Verse"
		\startRepeat
		b1:m | fis:7 | d | e2:m fis:7 |
		\endRepeat
		\mark "Special fill"
		g1 | a | g | e2:m fis:7 |
	}
</%def>

% if part=='Own':
\score {
	<<
		\new FretBoards {
			${chords()}
		}
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
	\small {
		\concat {
			\column {
				\box "Verse"
				"Oh baby, baby"
				"How was I supposed to know"
				"That somethin' wasn't right?"
				\vspace #0.3
				\box "Verse"
				"Oh baby, baby"
				"I shouldn't have let you go"
				"And now you're outta sight"
				\vspace #0.3
				\box "Transition"
				"Show me how you want it to be"
				"Tell me baby 'cause I need to know now"
				"Oh because"
				\vspace #0.3
				\box "Chorus"
				"My loneliness is killin' me"
				"I must confess I still believe"
				"When I'm not with you I lose my mind"
				"Give me a sign, hit me baby one more time"
				\vspace #0.3
				\box "Verse"
				"Oh baby, baby"
				"The reason I breathe is you"
				"Now, boy you got me blinded"
				\vspace #0.3
				\box "Verse"
				"I bet you baby"
				"There's nothing that I would not do, no"
				"It's not the way I planned it"
				\vspace #0.3
				\box "Transition"
				"Show me how you want it to be"
				"Tell me baby 'cause I need to know now"
				"Oh because"
			}
			\hspace #3
			\column {
				\box "Chorus"
				"My loneliness is killin' me"
				"I must confess I still believe"
				"When I'm not with you I lose my mind"
				"Give me a sign, hit me baby one more time"
				\vspace #0.3
				\box "Chorus"
				"Oh baby baby, oh baby baby"
				"Oh baby, baby"
				"How was I supposed to know"
				"Oh baby, baby"
				"I shouldn't have let you go"
				\vspace #0.3
				\box "Chorus"
				"I must confess that my lonliness is killing me now"
				"Don't you know I still believe?"
				"That you will be here and give me a sign"
				"Hit me baby one more time"
				\vspace #0.3
				\box "Chorus"
				"My loneliness is killin' me"
				"I must confess I still believe"
				"When I'm not with you I lose my mind"
				"Give me a sign, hit me baby one more time"
				\vspace #0.3
				\box "Chorus"
				"I must confess that my lonliness is killing me now"
				"Don't you know I still believe?"
				"That you will be here and give me a sign"
				"Hit me baby one more time"
			}
		}
	}
}
% endif
