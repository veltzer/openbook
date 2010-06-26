\include "lilypond/include/common.lyi"
\header {
	filename="[% target_node %]"
	title="I'll Close My Eyes"
	subtitle=""
	composer="Blue Mitchell"
	copyright="[no copyright notice]"
	style="Jazz"
	piece="Med Swing"
}

harmony=\chords {
	\partial 8*5 r8 r4 r4
	\repeat volta 2 {
		f1*2:maj7 | e1:m7.5- | a1:7.9- | \break
		d1*2:m7 | c1:m7 | f1:7 | \break
	}
	\alternative {
		{
			bes1*2:maj7 | f1*2:maj7 | \break
			e1*2:7 | a2:m7 d2:7 | g2:m7 c2:7 | \break
		}
		{
			bes1*2:maj7 | a1:m7.5- | d1:7.9- | \break
			g1:m7 | c1:7 | f2:maj7 d2:7 | g2:7 c2:7 | \break
		}
	}
}

tune={
	\time 4/4
	\key f \major
	\partial 8*5 c'8 bes'4 a'4 |
	\repeat volta 2 {
		a'1 | r4 r8 c'8 bes'4 a'4 | a'4 g'4 e'2 | r4 r8 e'8 g'4 f'4 | \break
		f'1 | r4 r8 f'8 g'4 f'4 | ees'1 | r4*3 ees'4 | \break
	}
	\alternative {
		{
			d'4 f'4 c''2 | r4 r8 bes'8 f'4 g'4 | a'1 | r4*3 a'4 | \break
			gis'1 | r4 r8 e'8 g'4 f'4 | e'1 | r4 r8 c'8 bes'4 a'4 | \break
		}
		{
			d'4 f'4 c''2 | r4 r8 bes'8 f'4 g'4 | a'1 | r4 r8 a'8 c''4 b'4 | \break
			bes'4. d'8 e'4 f'4 | g'2 a'2 | f'1 | r4 r8 c'8 bes'4 a'4 \bar "|." \break
		}
	}
}

\score {
	<<
		\context ChordNames \harmony
		\context Staff \tune
	>>
	\midi {}
	\layout {}
}
