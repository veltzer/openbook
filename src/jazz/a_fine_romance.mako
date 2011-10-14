<%inherit file="/src/include/common.lyi"/>
<%
	attributes['jazzTune']=True
	attributes['type']="harmony_tune_lyricsmore"
	attributes['render']="Fake"

	attributes['title']="A Fine Romance"
	attributes['composer']="Jerome Kern"
	attributes['style']="Jazz"
	attributes['piece']="Med. Ballad"
	attributes['poet']="Dorothy Fields"
	attributes['copyright']="1936 T.B. Harms Company"
	attributes['copyrightextra']="Copyright Renewed. (c/o The Welk Music Group, Santa Monica, CA 90401)."

	attributes['completion']="5"
	attributes['uuid']="7c9691e6-a26e-11df-8418-0019d11e5a41"

	attributes['idyoutube']="ytipqjANlrY"
	attributes['idyoutube']="cKbD4PQBrIA"
%>

<%doc>
	DONE:
	TODO:
	- fill in whats been done for this tune.
	- fill in data about the you tube performances.
</%doc>

%% these are the chords from the fake book
myChordsFake=\chordmode {
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
			c:6 a:m7 | d:m7 g:7 | \myEndLine
		}
		{
			c:6 f:7 | c1:6.9 | \myEndLine
		}
	}
}

%% notes from the fake book
myVoiceFake=\relative c' {
	\key c \major
	\time 4/4
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Presto" 4 = 196
	\partial 4 e4 |
	\repeat volta 2 {
		c1 | a'4 g2 a4 | b,1 | b'4 a2 b4 |
		e,1 | d'4 c2 e,4 | g1 | e'4 d2 g,4 |
		c4 b c d | \times 2/3 { c b bes } a aes | g2 g~ | g2. g4 |
		a gis a b | \times 2/3 { a aes g } fis f | e2 e~ | e2. e4 |
		c1 | a'4 g2 a4 | b,1 | b'4 a2 b4 |
		e,1 | d'4 c2 e,4 | g1 | e'4 d2 g,4 |
		c4 b c d | \times 2/3 { e d c } b bes | a1 | \times 2/3 { c4 b bes } a aes |
		g1 | \times 2/3 { b4 a aes } g d' |
	}
	\alternative {
		{
			c1 | r2. e,4 |
		}
		{
			c'1~ | c2. r4 |
		}
	}
}

%% lyrics taken from the fake book
myLyricsFake=\lyricmode {
	A Fine Ro -- mance with no kis -- es!
	A Fine Ro -- mance, my friend, this is!
	We should be like a cou -- ple of hot to -- ma -- toes, __
	but you're as cold as yes -- ter -- day's mashed po -- ta -- toes. __

	A Fine Ro -- mance you won't nest -- le.
	A Fine Ro -- mance, you won't wrest -- le!
	I might as well play bridge with my old maid aunts!
	I have -- n't got a chance. This is A Fine Ro -- mance. A
}

myLyricsFakemore=\lyricmode {
	_ Fine Ro -- mance my good fel -- low!
	You take ro -- mance, I'll take jel -- lo!
	You're calm -- er than the seal in the Arc -- tic O -- cean, __
	at least they flap their fins to ex -- press e -- mo -- tion. __

	A Fine Ro -- mance with no quar -- rels,
	With no in -- sults, and all mor -- als!
	I've nev -- er mussed the crease in your blue serge pants!
	I nev -- er get the chance. This is A Fine Ro -- _ _ mance. __
}

%% these are the chords from the real book
myChordsReal=\chordmode {
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

%% notes from the real book
myVoiceReal=\relative c' {
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

%% lyrics taken from the fake book and adjusted for the real book
myLyricsReal=\lyricmode {
	A Fine Ro -- mance with no kis -- es!
	A Fine Ro -- mance, my friend, this is!
	We should be like a cou -- ple of hot to -- ma -- toes, __
	but you're as cold as yes -- ter -- day's mashed po -- ta -- toes. __

	A

	might as well play bridge with my old maid aunts!
	I have -- n't got a chance. This is A Fine Ro -- mance.

	A
}

myLyricsRealmore=\lyricmode {
	_ Fine Ro -- mance, you won't nest -- le.
	A Fine Ro -- mance, you won't wrest -- le!
	I
}
