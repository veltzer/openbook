\include "src/include/common.lyi"
\header {
	title="I'll Close My Eyes"
	composer="Blue Mitchell"
	style="Jazz"
	piece="Med Swing"

	uuid="e7277c50-a26e-11df-863c-0019d11e5a41"
}

%{
	TODO:
	- turn this tune relative
%}

harmony=\chords {
	\partial 8*5 r8 r4 r4
	\repeat volta 2 {
		f1:maj7 | r1 | e1:m7.5- | a1:7.9- | \myEndLine
		d1:m7 | r1 | c1:m7 | f1:7 | \myEndLine
	}
	\alternative {
		{
			bes1:maj7 | r1 | f1:maj7 | r1 | \myEndLine
			e1:7 | r1 | a2:m7 d2:7 | g2:m7 c2:7 | \myEndLine
		}
		{
			bes1:maj7 | r1 | a1:m7.5- | d1:7.9- | \myEndLine
			g1:m7 | c1:7 | f2:maj7 d2:7 | g2:7 c2:7 | \myEndLine
		}
	}
	\endBar
}

tune={
	\time 4/4
	\key f \major
	\partial 8*5 c'8 bes'4 a'4 |
	\repeat volta 2 {
		a'1 | r4 r8 c'8 bes'4 a'4 | a'4 g'4 e'2 | r4 r8 e'8 g'4 f'4 |
		f'1 | r4 r8 f'8 g'4 f'4 | ees'1 | r4*3 ees'4 |
	}
	\alternative {
		{
			d'4 f'4 c''2 | r4 r8 bes'8 f'4 g'4 | a'1 | r4*3 a'4 |
			gis'1 | r4 r8 e'8 g'4 f'4 | e'1 | r4 r8 c'8 bes'4 a'4 |
		}
		{
			d'4 f'4 c''2 | r4 r8 bes'8 f'4 g'4 | a'1 | r4 r8 a'8 c''4 b'4 |
			bes'4. d'8 e'4 f'4 | g'2 a'2 | f'1 | r4 r8 c'8 bes'4 a'4 |
		}
	}
}
\include "src/include/harmony_tune.lyi"
