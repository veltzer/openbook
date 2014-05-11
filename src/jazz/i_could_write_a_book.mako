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
	# this is from the fake book
	attributes['subtitle']="From 'Pal Joey'"
	# this is from the real book and the fake book
	attributes['composer']="Richard Rodgers"
	# this is from the real book and the fake book
	attributes['poet']="Lorenz Hart"
	# this is from the jazz fake book
	attributes['piece']="Modeartely Slow"
	# this is from the real book
	attributes['piece']="Ballad"
	# this is from the jazz fake book
	attributes['copyright']="1940, Chappell & Co., Inc. Copyright Renewed."
	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"

	attributes['completion']="5"
	attributes['uuid']="e00ddbf8-a26e-11df-92da-0019d11e5a41"
	attributes['structure']="ABAC"
	attributes['structureremark']="could be categorized as AB"

	attributes['idyoutuberemark']="Frank in the classic vocal version"
	attributes['idyoutube']="UwoZNHhFgLQ"
	attributes['idyoutuberemark']="Miles swings!"
	attributes['idyoutube']="_DH46QyK2cw"
	attributes['lyricsurl']="http://www.lorenzhart.org/booksng.htm"
%>
% endif

% if part=='Doc':
	DONE:
	- added the real book epdf.
	- filled in the tunes meta data (from real and fake book).
	- added the real book chords.
	- added the real book tune.
	- added the real book lyrics (from the fake book).
	- put in the tunes structure (in the meta data and in the tune itself).
	- added the fake book epdf.
	- added youtube performance.
	- added lyrics url.
	- checked the real book chords.
	- checked the real book tune.
	- checked the real book lyrics.
	- checked that the tune sounds good (rythm wise and note wise).
	TODO:
	- how do I put the last two chords in the real book version in parenthesis?
	- add the fake book version.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 2 s2 |

	\repeat volta 2 {
		\myMark "A"
		c2:maj7 a:m7 | d:m7 g:7 | c1:maj7 | c2:maj7 g:7 | \myEndLine
		c:maj7 g:7 | c:maj7 cis:dim7 | d1:m7 | g:7 | \myEndLine
	}
	\alternative {
		{
			\myMark "B"
			c2/e aes:7/ees | d:m7 g:7 | a:m7 d:7.9- | g2.:maj7 b4:7 | \myEndLine
			e1:m | a2:m7 d:7 | d1:m7 | g:7 | \myEndLine
		}
		{
			\myMark "C"
			a2:m a:m7+ | a:m7 a:m6 | g2:m7 c:7 | f:maj7 f4:m7 bes:7 | \myEndLine
			c2:maj7 a:7 | d:m7 g:7 | c1:6 | d2:m7 g:7 | \myEndLine
		}
	}

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c' {
	\time 4/4
	\key c \major
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130

	%% partial
	\partial 2 e4 f |
	\repeat volta 2 {
		%% part "A"
		g2 b | a4 g e d | e1~ | e4 g e d |
		e g e d | e c'2 e,4 | g1~ | g2 a4 b |
	}
	\alternative {
		{
			%% part "B"
			c2 c | c4 d2 b4 | a2 a | g e4 fis |
			g2 g | g4 a2 fis4 | g1~ | g4 r e f |
		}
		{
			%% part "C"
			c'2 c | c4 d2 b4 | bes2 bes | a g4 f |
			e2 e | d4 c'2 b4 | c1 | r2 e,4 f |
		}
	}
}
% endif

% if part=='LyricsReal':
%% these are lyrics from the fake book adjusted for the real book
\lyricmode {
	%% partial
	If they

	%% part "A"
	asked me I Could Write A Book, __
	a -- bout the way you walk and whis -- per and look, __
	I could

	%% part "B"
	write a pre -- face on how we met,
	so the world would nev -- er for -- get, __

	and the
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	%% partial
	_ _

	%% part "A"
	sim -- ple se -- cret of the plot __
	is just to tell them that I love you a -- lot, __
	then the

	%% part "B"
	_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

	%% part "C"
	world dis -- cov -- ers as my book ends,
	how to make two lov -- ers of friends.

	%% partial
	If they
}
% endif
