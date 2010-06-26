\version "2.12.3"
\header {
	filename="[% target_node %]"
	title="Chanson des faucheurs"
	subtitle=""
	composer="R. Schumann"
	copyright=""
	style="Jazz"
	piece="Med Swing"

	enteredby="[% lily_enteredby %]"
	maintainerEmail="[% lily_maintaineremail %]"
	footer="[% lily_footer %]"
	tagline="[% lily_tagline %]"
}

tune=\relative g'' {
	\key c \major
	\time 3/4

	g4 ( c ) b | a ( d ) c | b ( a ) b | c2 ( d4 ) |
	g,4 ( c ) b | a ( d ) c | b ( a ) b | c2 r4 |

	d,4 ( g ) fis | e ( a ) g | fis ( e ) fis | g2 ( b4 ) |
	d4 ( g ) fis | e ( a ) g | fis ( e ) fis | g2 r4 |

	g,4 ( c ) b | a ( d ) c | b ( a ) b | c2 ( d4 ) |
	g,4 ( c ) b | a ( d ) c | b ( a ) b | c2 r4 \bar "|."
}

\score {
	<<
		\context Staff \tune
	>>
	\midi {}
	\layout {}
}
