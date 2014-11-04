<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doOwn']=True
	attributes.addVersion('Own', version)
	attributes.setDefaultVersionName('Own')

	attributes['title']='Bass Lines'
	attributes['style']='Jazz'
	attributes['piece']='Upbeat Jazz'
	attributes['copyright']=gattr['copyrightvalstudy']

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='805e8a3a-a26f-11df-aa51-0019d11e5a41'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- write was has been done in this tune.
	- Emphasize the bars which are important in the variations (how do you do that in lilypond ?)
	- add short bass lines, ones which form the harmony Dm7,G7,Cm7,F7,...
	- add long bass lines for harmony: Dm7,Dm7,G7,G7
	- add turn around bass lines for harmony: Cmaj7,A7,Dm7,G7
% endif

% if part=='Own':
\score {
<<
\chordmode {
	\startChords

	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine
	d1:m7 | g1:7 | c1:maj7 | c1:maj7 | \myEndLine

	\endChords
}
\new Voice="melody" {
	\time 4/4
	\key f \major
	\clef bass
	\relative c' {
		%% I should have at least 17 x 3 x 4 = 51 X 4 = 204 options

		%% 16 options for Dm7
		\mark "Dm 1"
		d,,4 e f fis | g d b des | c d e f | g f e des |

		\mark "Dm 2"
		d4 f a aes | g d b des | c d e f | g f e des |
		\mark "Dm 3"
		d4 f a fis | g d b des | c d e f | g f e des |
		\mark "Dm 4"
		d4 a' f aes | g d b des | c d e f | g f e des |
		\mark "Dm 5"
		d4 a' f fis | g d b des | c d e f | g f e des |

		\mark "Dm 6"
		d'4 f, a aes | g d b des | c d e f | g f e des |
		\mark "Dm 7"
		d'4 f, a fis | g d b des | c d e f | g f e des |
		\mark "Dm 8"
		d'4 a f aes | g d b des | c d e f | g f e des |
		\mark "Dm 9"
		d'4 a f fis | g d b des | c d e f | g f e des |

		\mark "Dm 10"
		d'4 c a aes | g d b des | c d e f | g f e des |
		\mark "Dm 11"
		d'4 c a fis | g d b des | c d e f | g f e des |
		\mark "Dm 12"
		d'4 c f, aes | g d b des | c d e f | g f e des |
		\mark "Dm 13"
		d'4 c f, fis | g d b des | c d e f | g f e des |

		\mark "Dm 14"
		d'4 d, a' aes | g d b des | c d e f | g f e des |
		\mark "Dm 15"
		d'4 d, a' fis | g d b des | c d e f | g f e des |
		\mark "Dm 16"
		d'4 d, f aes | g d b des | c d e f | g f e des |
		\mark "Dm 17"
		d'4 d, f fis | g d b des | c d e f | g f e des |

		%% 3 options for G7
		\mark "G7 1"
		d4 e f fis | g d b des | c d e f | g f e des |
		\mark "G7 2"
		d4 e f fis | g f d des | c d e f | g f e des |
		\mark "G7 3"
		d4 e f fis | g aes a b | c d e f | g f e des |

		\mark "Cmaj7 1"
		d4 e f fis | g aes a b | c d e d | c g e des |
		\mark "Cmaj7 2"
		d4 e f fis | g aes a b | c d e f | g f e des |
		\mark "Cmaj7 3"
		d,4 e f fis | g aes a b | c g c d | e d des b |
		\mark "Cmaj7 4"
		d,4 e f fis | g aes a b | c g e f | g aes a b |
	}
}
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
