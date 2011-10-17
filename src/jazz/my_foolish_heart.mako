<%def name="vars()">
<%
	attributes['type']="harmony_tune_lyrics"
	attributes['render']="Fake"

	attributes['title']="My Foolish Heart"
	attributes['composer']="Victor Young"
	attributes['style']="Jazz"
	attributes['piece']="Slowly & Expressively"
	attributes['poet']="Ned Washington"
	attributes['copyright']="1949 by Anne-Rachel Music Corp."
	attributes['copyrightextra']="Copyright Renewed, Young interest conrolled by Chappel & Co., Inc. Intersong Music, Publisher"

	attributes['completion']="5"
	attributes['uuid']="ce9be996-a26e-11df-bf2c-0019d11e5a41"

	attributes['idyoutube']="a2LFVWBmoiw"
	attributes['idyoutube']="neXL51g8P-M"
	attributes['lyricsurl']="http://www.oldielyrics.com/lyrics/frank_sinatra/my_foolish_heart.html"
%>
</%def>

<%doc>
	DONE:
	TODO:
	- add the missing parts of the real book version and check it.
	- add an epdf of the real book.
	- In the lyrics where it says "His" a boy should sing "Her". We should have
	alternate lyrics here. See how they did it in the fake book.
	- mark whats been done with this tune.
	- document the youtube performances.
</%doc>

<%def name="myVoiceReal()">
\relative f' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Moderato" 4 = 108
	\key bes \major
	\time 4/4

	\partial 4 f4 |

	f2~ f8 bes, d f | g a g2 g4 | g2~ g8 c, ees g | a2. a4 |
	a2~ a8 d, f a | bes c bes2 bes4 | bes2~ bes8 ees, g bes |
	c2. bes8 c | d4. d8 d4 c8 bes | d4 d2 c8 bes |
	c4. c16 c \times 2/3 {c8 d c} a8 bes | c2. bes8 a |
	bes4. bes8 bes a g a | bes4 bes2 a8 g | a4. a8 a f g f |
	a2. g4 |
	f2~ f8 bes, d f | g a g2 g4 | g2~ g8 c, ees g | a2. a4 |
	a2~ a8 d, f a | bes c bes2 bes4 | bes2~ bes8 ees, g bes |
	d2. c4 |

	bes4. bes8 bes a g a | bes4 bes2 bes8 c |
	d4. d8 d d c bes | d,2. g4 | bes2~ bes8 ees, g bes |
	c4 d bes c | bes1 | r1 |
}
</%def>

<%def name="myChordsFake()">
\chordmode {
	\startChords

	\startSong

	\partial 4 r4 |

	\repeat volta 2 {

		\mark "A"
		bes2:maj7 ees:maj7 | d:m7 g:7 | c1:m7 | f:7.9- | \myEndLine
		bes2:maj7 d:7.9+ | g1:m7 | c:m7 | f:7 | \myEndLine
		bes1:maj7 | bes2:7 bes:7.5- | ees1:6 | a2:m7.5- d:7.9- | \myEndLine
		g2:m7 d:7.5+ | g:m7 c:7 | f1:maj7 | f:7 | \myEndLine

		\mark "B"
		bes2:maj7 ees:maj7 | d:m7 g:7 | c1:m7 | f:7.9- | \myEndLine
		bes2:maj7 d:7.9+ | g1:m7 | c:m7 | a2:m7.5- d:7.5- | \myEndLine
		g1:m7 | ges:7 | bes2:maj7 ees:maj7 | d:m7.5- g:7 | \myEndLine
		c1:m7 | c:m7/f |

	} \alternative {
		{ bes2 g:m7 | c:m7 f:7 | }
		{ bes1*2 | }
	}

	\endSong

	\endChords
}
</%def>

<%def name="myVoiceFake()">
\relative f' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Moderato" 4 = 108
	\key bes \major
	\time 4/4

	\partial 4 f4 |

	\repeat volta 2 {
		f2~ f8 bes, d f | g a g2 g4 | g2~ g8 c, ees g | a2. a4 |
		a2~ a8 d, f a | bes c bes2 bes4 | bes2~ bes8 ees, g bes | c2. bes8 c |
		d4. d16 d d8 d d d | d4 d~ d8 d c bes | c4 c8 c c d c bes | c2. bes8 a |
		bes8 bes4 bes8 bes c a g | bes4 bes2 g8 gis | a4 a8 a a a g f | a2. g4 |

		f2~ f8 bes, d f | g a g2 g4 | g2~ g8 c, ees g | a2. a4 |
		a2~ a8 d, f a | bes c bes2 bes4 | bes2~ bes8 ees, g bes | d2. c4 |
		bes4 bes8 bes bes a g a | bes4 bes2 bes8 c | d4 d8 d d d c bes | d,2. g4 |
		bes2~ bes8 ees, g bes | c4 d bes c |
	} \alternative {
		{ bes1~ | bes4 r2 f4 | }
		{ bes1~ | bes1 | }
	}
}
</%def>

<%def name="myLyricsFake()">
\lyricmode {
	The night __ is like a love -- ly tune,
	be -- ware __ My Fool -- ish Heart!
	How while __ the ev -- er con -- stant moon;
	take care __ My Fool -- ish Heart!

	There's a line be -- tween love and fas -- ci -- na -- tion __
	that's hard to see on an eve -- ning such as this,
	for they both give the ver -- y same sen -- sa -- tion
	when you're lost in the mag -- ic of a kiss.

	His lips __ are much to close to mine,
	be -- ware __ My Fool -- ish Heart
	but should __ our ea -- ger lips com -- bine
	then let __ the fire _ start

	for this time it is -- n't fas -- ci -- na -- tion,
	or a dream that will fake and fall a -- part,
	it's love __ this time, it's love,
	My Fool -- ish Heart. __ The

	Heart. __
}
</%def>
