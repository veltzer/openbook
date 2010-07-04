\include "src/include/common.lyi"
\header {
	title="Forever Young"
	composer="Alphaville"
	style="Pop"
	piece="Med. Ballad"
}

%{
	TODO:
	- add lyrics
	- add tune
%}

\score {
<<
\chords {
	c1 | g1:7 | a1:min |
}
\new Voice="melody" \relative c'' {
	\time 4/4
	\key c \major

	r2 g8 g8 g8 g8 ~ | g4 f4 e8 e8 d8 e8 ~ |
}
\new Lyrics \lyricsto "melody" {
	Let's dance in style, let's dance for a while
	Heaven can wait we're only watching the skies
	Hoping for the best but expecting the worst
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
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 110 4)
		}
	}
	\layout {}
}
