<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=False
	attributes['render']="Fake"

	attributes['title']="I'll Be Seeing You"
	attributes['style']="Jazz"
	attributes['composer']="Irving Kahal, Sammy Fain"
	attributes['poet']="Irving Kahal, Sammy Fain"
	attributes['piece']="Moderately"
	attributes['copyright']="1938 Williamson Music Co."
	attributes['copyrightextra']="Copyright Renewed."
	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"

	attributes['completion']="5"
	attributes['uuid']=""
	attributes['structure']=""

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		ees1 | g:7 | f2:m c:7 | f1:m | f2:m7 c:7 | f:m bes:7 | ees f:m7 |
		fis:dim7 ees/g | c1:m7 | c:m7 | f:m7 | f:m7 | bes:7 | bes:7.5+ |
		ees:6 | bes:9.5+ | ees | g:7 | f2:m c:7 | f1:m | f2:m c:7 |
		f:m bes4:7 bes:7/aes | g1:m7.5- | c:7 | f2:m d:m7.5- | g1:7 | c:m7 | f:9 |
		f:m7 | aes:m6 |
	} \alternative {
		{
			ees | f2:m7 bes4:7 bes:7.5+ |
		}
		{
			ees2 f4:m7 e:m7 | ees1:6 |
		}
	}
	\endPart
	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	%%\tempo "Allegro" 4 = 130
	\time 2/2
	\key ees \major

	%% A part
	\repeat volta 2 {
		g2. f4 | f8 ees4 d8~ d4 ees | aes4. g8 g4. f8 | f4. e8 e4 f | as4. g8 g4. f8 | f4. e8 e4 f | fis8 g4 c8~ c2~ | c2. r4 | ees2. d4 | d8 c4 b8~ b4 c | ees2. d4 | d8 c4 b8~ b4 c | c2. bes4 | bes8 fis4 fis8~ fis4 d' |
		c8 g4 g8~ g4 c | fis,8 c4 c8~ c2 | g'2. f4 | f8 ees4 d8~ d4 ees | aes4. g8 g4. f8 | f4. e8 e4 f | aes4. g8 g4. f8 |
		f4. e8 e4 f | bes4. aes8 aes4. g8 | g4. fis8 fis4 g | c4. c8 bes4 aes | d4. d8 c4 b | ees ees d c | <g \parenthesize \tweak #'font-size #-1 g' >2. f8 g |
		aes aes aes aes aes2~ | aes8 aes bes ces bes4 aes |
	} \alternative {
		{
			ees'2. r4 | R1 |
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
	In that samll ca -- fe; __ the park a -- cross the way, __ the chil -- dren's ca -- rou -- sel, __ the
	chet -- nut -- tree, __ the wish -- ing well. __ I'll Be See -- ing You __ in ev -- 'ry love -- ly sum -- mer's day, in ev -- 'ry -- thing that's
	light and gay, I'll al -- ways think of you that way. I'll find you in the morn -- ing sun and when the night is new. I'll be
	look -- ing at the moon. __ but I'll Be See -- ing you!
	You! __
}
% endif
