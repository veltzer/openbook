<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Fake"

	attributes['title']="A Fine Romance"
	attributes['composer']="Jerome Kern"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['piece']="Moderately"
	attributes['poet']="Dorothy Fields"
	# this is from the fake book
	attributes['copyright']="1936 T.B. Harms Company. Copyright Renewed."
	attributes['copyrightextra']="(c/o The Welk Music Group, Santa Monica, CA 90401)."

	attributes['structure']="ABAC"
	attributes['completion']="5"
	attributes['uuid']="7c9691e6-a26e-11df-8418-0019d11e5a41"

	attributes['idyoutube']="ytipqjANlrY"
	attributes['idyoutube']="cKbD4PQBrIA"
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- brought in the fake book epdf.
	- filled in the meta data from the fake book.
	- put in the fake book chords.
	- put in the fake book tune.
	- put in the fake book lyrics.
	- put in the real book chords.
	- put in the real book tune.
	- put in the real book lyrics.
	- checked the fake book chords.
	- checked the fake book tune.
	- heard the fake book tune to hear that it sounds well.
	TODO:
	- checked the fake book lyrics.
	- checked the real book chords.
	- checked the real book tune.
	- checked the real book lyrics.
	- fill in data about the you tube performances.
	- add a lyrics url.
	- how do I mark the "Fine" mark in the real book version?
	REMARKS:
	- the structure of this tune can also be AA or AA'. Doesn't really matter.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 4 r4 |
	\repeat volta 2 {
		c1:6 | cis:dim7 | g:7/d | dis:dim7 | \myEndLine
		e:m7 | a:m7 | d:m7 | g:7 | \myEndLine
		c:maj7 | c2:7 a4:13 aes:13 | g2:13 d:m7 | g:dim7 g:7 | \myEndLine
		c1:6 | a2:7 fis4:13 f:13 | e2:7 a:7 | d:7 g:7 | \myEndLine
		c1:6 | cis:dim7 | g:7/d | dis:dim7 | \myEndLine
		e:m7 | a:m7 | d:m7 | g:7 | \myEndLine
		c:6 | c2:7 a:7 | d:m7 a:7 | d:m7 dis:dim7 | \myEndLine
		e:m7 a:7 | d:m7 g:7.9- |

	}
	\alternative {
		{
			c:6 a:m7 | d:m7 g:7 |
		}
		{
			c:6 f:7 | c1:6.9 | \myEndLine
		}
	}
}
% endif

% if part=='VoiceFake':
\relative c' {
	\key c \major
	\time 4/4
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Presto" 4 = 196
	\partial 4 e4 |
	\repeat volta 2 {
		c1 | a'4 g2 a4 | b,1 | b'4 a2 b4 |
		e,1 | d'4 c2 e,4 | g1 | e'4 d2 g,4 |
		c4 b c d | \times 2/3 { c b! bes } a aes | g2 g~ | g2. g4 |
		a gis a b | \times 2/3 { a aes g! } fis f | e2 e~ | e2. e4 |
		c1 | a'4 g2 a4 | b,1 | b'4 a2 b4 |
		e,1 | d'4 c2 e,4 | g1 | e'4 d2 g,4 |
		c4 b c d | \times 2/3 { e d c } b! bes | a1 | \times 2/3 { c4 b bes } a! aes |
		g1 | \times 2/3 { b4 a aes } g! d' |
	}
	\alternative {
		{
			c1 | r2 r4 e,4 |
		}
		{
			c'1~ | c2. r4 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	A Fine Ro -- mance with no kis -- es!
	A Fine Ro -- mance, my friend, this is!
	We should be like a cou -- ple of hot to -- ma -- toes, __
	but you're as cold as yes -- ter -- day's mashed po -- ta -- toes. __

	A Fine Ro -- mance you won't nest -- le.
	A Fine Ro -- mance, you won't wrest -- le!
	I might as well play bridge with my old maid aunts!
	I have -- n't got a chance. This is A Fine Ro -- mance. A
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {
	_ Fine Ro -- mance my good fel -- low!
	You take ro -- mance, I'll take jel -- lo!
	You're calm -- er than the seal in the Arc -- tic O -- cean, __
	at least they flap their fins to ex -- press e -- mo -- tion. __

	A Fine Ro -- mance with no quar -- rels,
	With no in -- sults, and all mor -- als!
	I've nev -- er mussed the crease in your blue serge pants!
	I nev -- er get the chance. This is A Fine Ro -- _ _ mance. __
}
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 4 r4 |
	\repeat volta 2 {
		c1:6 | a:m7 | g:7 | dis:dim7 | \myEndLine
		e:m7 | a:m7 | d:m7 | g:7 | \myEndLine
	}
	\alternative {
		{
			c:6 | e2.:m7 aes4:7 | d2:m7 g:7 | d:m7 g:7 | \myEndLine
			a1:m7 | e2.:m7 f4:7 | e2:7 a:7 | d:m7 g:7 | \myEndLine
		}
		{
			c1:maj7 | c2:7/bes g4:7 c:7 | f2:maj7 a:7/e | d:m7 dis:dim7 | \myEndLine
			e1:m7 | g:7 | c:6 | d2:m7 g:7 | \myEndLine
		}
	}

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c' {
	\key c \major
	\time 4/4
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Presto" 4 = 196
	\partial 4 e4 |
	\repeat volta 2 {
		c1 | a'4 g2 a4 | b,1 | b'4 a2 b4 |
		e,1 | d'4 c2 e,4 | g1 | e'4 d2 g,4 |
	}
	\alternative {
		{
			c4 b c d | \times 2/3 { c b bes } a aes | g2 g~ | g2. g4 |
			a gis a b | \times 2/3 { a aes g } ges f | e2 e~ | e e |
		}
		{
			c'4 b c d | \times 2/3 { e d c } b bes | a1 | \times 2/3 { c4 b bes } a aes |
			g1 | \times 2/3 { b4 a aes } g d' | c1~ | c2 r4 <\parenthesize e,>4 |
		}
	}
}
% endif

% if part=='LyricsReal':
%% lyrics taken from the fake book and adjusted for the real book
\lyricmode {
	A Fine Ro -- mance with no kis -- es!
	A Fine Ro -- mance, my friend, this is!
	We should be like a cou -- ple of hot to -- ma -- toes, __
	but you're as cold as yes -- ter -- day's mashed po -- ta -- toes. __

	A

	might as well play bridge with my old maid aunts!
	I have -- n't got a chance. This is A Fine Ro -- mance.

	A
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	_ Fine Ro -- mance, you won't nest -- le.
	A Fine Ro -- mance, you won't wrest -- le!
	I
}
% endif
