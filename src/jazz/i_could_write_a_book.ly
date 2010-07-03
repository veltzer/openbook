\include "src/include/common.lyi"
\header {
	title="I Could Write A Book"
	subtitle="(From 'Pal Joey')"
	composer="Richard Rodgers"
	poet="Lorenz Hart"
	style="Jazz"
	piece="Modeartely Slow"
	copyright="1940, Chappel & Co."

	completion="5"
}

%{
	TODO:
%}

<<
\chords {
	\partial 2 r2 |
	\repeat volta 2 {
		c2:maj7 a2:min9 | d2:min7 g2:7 | c1:maj7 | r2 g2:7 | \break
		c2:maj7 g2:7 | c2:maj7 cis2:dim7 | d1:min7 | g1:7 | \break
		c2/e aes2:7/ees | d2:min7 g2:7 |
	}
	\alternative {
		{
			a2:min7 d2:7.9- | g2. b4:7 | \break
			e1:min | a2:min7 d2:7 | d1:min7 | g1:7 | \break
		}
		{
			g2:min7 c2:7 | f2:maj7 f4:min7 bes4:7 | \break
			c2 a2:7 | d2:min7 g2:7 | c1:maj7 | r1 | \break
		}
	}
}

\new Voice="melody" \relative c' {
	\time 4/4
	\key c \major

	\partial 2 e4 f4 |
	\repeat volta 2 {
		g2 b2 | a4 g e d | e1 ~ | e4 g e4 d4 |
		e4 g4 e4 d4 | e4 c'8 r8 r4 e,4 | g1 ~ | g4 r4 a4 b4 \bar "||"
		c2 c2 | c4 d8 r8 r4 b4 |
	}
	\alternative {
		{
			a2 a2 | g2 e4 fis4 |
			g2 g2 | g4 a8 r8 r4 fis4 | g1 ~ | g4 r4 e4 f4 \bar "||"
		}
		{
			bes2 bes2 | a2 g4 f4 |
			e2 e2 | d4 c'8 r8 r4 b4 | c1 ~ | c2 r2 \bar "||"
		}
	}
}
\new Lyrics \lyricsto "melody" {
	If they asked me I Could Write A Book,
	a -- bout the way you walk and whis -- per and look,
	I could write a pre -- face on how we met,
	so the world would nev -- er for -- get,

	and the

	my book ends,
	how to make two lov -- ers of friends.

}
\new Lyrics \lyricsto "melody" {
	and the sim -- ple se -- cret of the plot
	is just to tell them that I love you a -- lot,
	then the world dis -- cov -- ers as
}
>>
