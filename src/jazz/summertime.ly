\include "src/include/common.lyi"
\header {
	title="Summertime"
	composer="George Gershwin"
	style="Jazz"
	piece="Med Swing"
	poet="DuBose Heyward"
	copyright="1935, Gershwin Publishing Corporation"
}

%{
	TODO:
		- add lyrics
%}

harmony=\chords {
	\partial 4 r4 \bar "||"
	\repeat volta 2 {
		d1:min7 | r1 | r1 | r1 |
		g1:min7 | r1 | e1:min7.5- | a:7.9+ |
		d1:min7 | r1 | r1 | r1 |
		g2:min7 c2:7 | f1:maj7 | e2:min7.5- a2:7.9+ | d1:min7 | a1:7.9+ \bar "||"
	}
}

tune=\relative c'''{
	\time 4/4
	\key d \minor
	\partial 4 a8. f16 |
	\repeat volta 2 {
		a1 | r4 g8. f16 g8. a16 f4 | d2 a ~ | a4 r a' f | \break
		g8 g ~ g2. | r4 f8. d16 f8. d16 f4 | e1 ~ | e2 r4 a8. f16 | \break
		a1 | r4 g8. f16 g8. a16 f4 | d2 a ~ | a2 r4 a | \break
		c a8 c d f ~ f4 | a8 g ~ g4 f2 | d1 ~ | d4 r r a'8. f16 |
	}
}

\include "src/include/harmony_tune.lyi"
