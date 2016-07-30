<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doGuitar']=True
	version['doOwn']=True
	attributes.addVersion('DontMatter', version)
	attributes.setDefaultVersionName('DontMatter')

	attributes['title']='Forever Young'
	attributes['style']='Pop'
	attributes['composer']='Alphaville'
	attributes['piece']='Med. Ballad'
	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'

	attributes['completion']='5'
	attributes['uuid']='625ad0a2-a26f-11df-8f71-0019d11e5a41'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- finish the tune and the chords...
	- add you tube performances.
% endif

<%namespace name="defs" file="/include/defs.ly.mako"/>

<%def name="chords()">
	\chordmode {
		\startChords
		\mark "Intro"
		c1 | g1:7 | a1:m | f1 | g1:7 | d1:m | f1 | c2. g4:7 |
		\mark "Verse"
		c1 | g1:7 | a1:m | f1 | g1:7 | d1:m | f1 | a2.:m g4:7 |
		\endChords
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
\new Voice="melody" \relative c' {
	\time 4/4
	\key c \major

	%% part "Intro"
	e'1 | d | c | c | d | d | c | c2. b4 |

	%% part "Verse"
	r2 g8 g g g~ | g4 f e8 e d e~ | e2 e8 e g f~ | f4 e c8 c d d~ |
	d2 d8 c d c | e4 d c8 c a c~ | c4 c8 a c a c a | c4 a2 r4 |
}
\new Lyrics \lyricsto "melody" {
	_ _ _ _ _ _ _ _ _

	Let's dance in style, let's dance for a while
	Hea -- ven can wait we're only watching the skies
	Ho -- ping for the best but expecting the worst
	Are you gonna drop the bomb or not?

	Let us die young or let us live forever
	We don't have the power but we never say never
	Sitting in a sandpit, life is a short trip
	The music's for the sad man

	Can you imagine when this race is won
	Turn our golden faces into the sun
	Praising our leaders we're getting in tune
	The music's played by the, the madman

	Forever young, I want to be forever young
	Do you really want to live forever?
	Forever, or never

	Forever young, I want to be forever young
	Do you really want to live forever?
	Forever young

	Some are like water, some are like the heat
	Some are a melody and some are the beat
	Sooner or later they all will be gone
	Why don't they stay young?

	It's so hard to get old without a cause
	I don't want to perish like a fading rose
	Youth like diamonds in the sun
	And diamonds are forever

	So many adventures couldn't happen today
	So many songs we forgot to play
	So many dreams are swinging out of the blue
	We let 'em come true

	Forever young, I want to be forever young
	Do you really want to live forever?
	Forever, or never

	Forever young, I want to be forever young
	Do you really want to live forever?
	Forever, or never

	Forever young, I wanna be forever young
	Do you really want to live forever?
}
>>
	%%\midi {
	%%	\context {
	%%		\Score
	%%		tempoWholesPerMinute = #(ly:make-moment 130/4)
	%%	}
	%%}
	\layout {}
}
% endif
