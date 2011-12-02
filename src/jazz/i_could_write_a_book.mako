<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Real"

	attributes['title']="I Could Write A Book"
	attributes['style']="Jazz"
	attributes['subtitle']="From 'Pal Joey'"
	attributes['composer']="Richard Rodgers"
	attributes['poet']="Lorenz Hart"
	attributes['piece']="Modeartely Slow"
	attributes['copyright']="1940, Chappel & Co."

	attributes['completion']="5"
	attributes['uuid']="e00ddbf8-a26e-11df-92da-0019d11e5a41"

	attributes['idyoutube']="_DH46QyK2cw"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- document the youtube performance.
	- mark what was done in this.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 2 s2 |

	\startPart

	\repeat volta 2 {
		c2:maj7 a:m9 | d:m7 g:7 | c1:maj7 | c2:maj7 g:7 | \myEndLine
		c:maj7 g:7 | c:maj7 cis:dim7 | d1:m7 | g:7 | \myEndLine
		c2/e aes:7/ees | d:m7 g:7 |
	}
	\alternative {
		{
			a:m7 d:7.9- | g2. b4:7 | \myEndLine
			e1:m | a2:m7 d:7 | d1:m7 | g:7 | \myEndLine
		}
		{
			g2:m7 c:7 | f:maj7 f4:m7 bes:7 | \myEndLine
			c2 a:7 | d:m7 g:7 | c1:maj7 | c:maj7 | \myEndLine
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c' {
	\time 4/4
	\key c \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130

	\partial 2 e4 f4 |
	\repeat volta 2 {
		g2 b2 | a4 g e d | e1~ | e4 g e4 d4 |
		e4 g4 e4 d4 | e4 c'8 r8 r4 e,4 | g1~ | g4 r4 a4 b4 |
		c2 c2 | c4 d8 r8 r4 b4 |
	}
	\alternative {
		{
			a2 a2 | g2 e4 fis4 |
			g2 g2 | g4 a8 r8 r4 fis4 | g1~ | g4 r4 e4 f4 |
		}
		{
			bes2 bes2 | a2 g4 f4 |
			e2 e2 | d4 c'8 r8 r4 b4 | c1~ | c2 r2 |
		}
	}
}
% endif

% if part=='LyricsReal':
\lyricmode {
	If they asked me I Could Write A Book,
	a -- bout the way you walk and whis -- per and look,
	I could write a pre -- face on how we met,
	so the world would nev -- er for -- get,

	and the

	my book ends,
	how to make two lov -- ers of friends.

}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	_ _ sim -- ple se -- cret of the plot
	is just to tell them that I love you a -- lot,
	then the world dis -- cov -- ers as
}
% endif
