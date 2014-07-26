<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=False
	attributes['render']="Fake"

	# from the fake book
	attributes['title']="I'll Be Seeing You"
	# from the fake book
	attributes['style']="Jazz"
	# from the fake book
	attributes['composer']="Irving Kahal, Sammy Fain"
	# from the fake book
	attributes['poet']="Irving Kahal, Sammy Fain"
	# from the fake book
	attributes['piece']="Moderately"
	# from the fake book
	attributes['copyright']="1938 Williamson Music Co. Copyright Renewed."

	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"
	attributes['completion']="5"
	attributes['uuid']="6161149e-da7f-11e3-9076-0bd9aa7a6778"
	attributes['structure']="ABA'C"
	attributes['structureremark']="This is almost a pure ABAC"

	attributes['idyoutuberemark1']="Sinatra in his younger days"
	attributes['idyoutube1']="oL60OQLekWQ"
	attributes['idyoutuberemark2']="Stitt in a cool instrumental version"
	attributes['idyoutube2']="cmkEbH43GIQ"
	attributes['lyricsurl']="http://www.azlyrics.com/lyrics/billieholiday/illbeseeingyou.html"
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the fake book epdf.
	- filled in the meta data from the fake book.
	- put in the tunes strucuture.
	- put in the fake book chords.
	- put in the fake book tune.
	- put in the fake book lyrics.
	- check the fake book chords.
	- check the fake book tune.
	- check the fake book lyrics.
	- check that tune sounds well in midi and tempo wise.
	- put in you tube performances with documentation.
	- put in a lyrics url.
	TODO:
	- get another version of this tune in here.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {
		\myMark "A"
		\startPart
		ees1 | g:7 | f2:m c:7 | f1:m | \myEndLine
		f2:m c:7 | f:m bes:7 | ees f:m7 | fis:dim7 ees/g | \myEndLine
		\endPart
		\myMark "B"
		\startPart
		c1*2:m7 | f:m7 | \myEndLine
		bes1:7 | bes:7.5+ | ees:6 | bes:9.5+ | \myEndLine
		\endPart
		\myMark "A'"
		\startPart
		ees | g:7 | f2:m c:7 | f1:m | \myEndLine
		f2:m c:7 | f:m bes4:7 bes:7/aes | g1:m7.5- | c:7 | \myEndLine
		\endPart
		\myMark "C"
		\startPart
		f2:m d:m7.5- | g1:7 | c:m7 | f:9 | \myEndLine
		f:m7 | aes:m6 |
	} \alternative {
		{
			ees | f2:m7 bes4:7 bes:7.5+ | \myEndLineVoltaNotLast
		}
		{
			ees2 f4:m7 e:m7 | ees1:6 | \myEndLine
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 160
	\time 2/2
	\key ees \major

	\repeat volta 2 {
		%% part "A"
		g'2. f4 | f8 ees4 d8~ d4 ees | aes4. g8 g4. f8 | f4. e8 e4 f |
		as4. g8 g4. f8 | f4. e8 e4 f | fis8 g4 c8~ c2~ | c2. r4 |
		%% part "B"
		ees2. d4 | d8 c4 b8~ b4 c | ees2. d4 | d8 c4 b8~ b4 c |
		c2. bes4 | bes8 fis4 fis8~ fis4 d' | c8 g4 g8~ g4 c | fis,8 c4 c8~ c2 |
		%% part "A'"
		g'2. f4 | f8 ees4 d8~ d4 ees | aes4. g8 g4. f8 | f4. e8 e4 f |
		aes4. g8 g4. f8 | f4. e8 e4 f | bes4. aes8 aes4. g8 | g4. fis8 fis4 g |
		%% part "C"
		%% on the third bar we can do <g \parenthesize \tweak #'font-size #-1 g'>2.
		c4. c8 bes4 aes | d4. d8 c4 b | ees ees d c | g2. f8 g |
		aes aes aes aes aes2~ | aes8 aes bes ces bes4 aes |
	} \alternative {
		{
			ees'2. r4 | r1 |
		}
		{
			ees1~ | es2. r4 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% part "A"
	I'll Be See -- ing You __ in all the old fa -- mil -- iar plac -- es that this heart of mine em -- brac -- es all day thru. __
	%% part "B"
	In that samll ca -- fe; __ the park a -- cross the way, __ the chil -- dren's ca -- rou -- sel, __ the
	chet -- nut -- trees, __ the wish -- ing well. __
	%% part "A'"
	I'll Be See -- ing You __ in ev -- 'ry love -- ly sum -- mer's day, in ev -- 'ry -- thing that's
	light and gay, I'll al -- ways think of you that way.
	%% part "C"
	I'll find you in the morn -- ing sun and when the night is new. I'll be
	look -- ing at the moon, __ but I'll Be See -- ing You!
	%% part "Volta"
	You! __
}
% endif
