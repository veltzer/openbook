<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Real"

	attributes['title']="Easy To Love"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['subtitle']="From 'Born To Dance'"
	# this is from the real book
	attributes['composer']="Cole Porter"
	# this is from the fake book
	attributes['poet']="Cole Porter"
	# this is from the fake book
	attributes['piece']="Moderately"
	# this is from the real book
	attributes['piece']="Ballad"
	# this is from the fake book
	attributes['copyright']="1936 by Chappell & Co., Inc."
	attributes['copyrightextra']="Copyright Renewed, Assigned to John F. Wharton, Trustee of the Cole Porter Musical & Literary Property Trusts Chappell & Co., Inc., owner of publication and allied rights throughout the world"
	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"

	attributes['completion']="5"
	attributes['uuid']="ac74c90e-0d62-11e1-816c-0019d11e5a41"
	attributes['structure']="ABAC"
	attributes['structureremark']="Can also think of this tune as AB"

	attributes['idyoutuberemark']="Ella"
	attributes['idyoutube']="uYnqy84ZY9Q"
	attributes['idyoutuberemark']="Billie Holiday"
	attributes['idyoutube']="izaZR89BJBo"
	attributes['lyricsurl']="http://www.sing365.com/music/lyric.nsf/Easy-To-Love-lyrics-Ella-Fitzgerald/3040B6936D6C386048256AAB00074FEE"
%>
% endif

% if part=='Doc':
	DONE:
	- added the real book pdf.
	- added the fake book pdf.
	- added the meta data from the fake book.
	- wrote down the tunes structure.
	- added lyrics url.
	- added the real book chords.
	- added the real book tune.
	- added the real book lyrics.
	- print "Fine" at the end in the real book version.
	- check the real book chords.
	- check the real book tune.
	- check the real book lyrics.
	- heard the real book version to make sure it sounds ok and is in good pace.
	- added you tube performances.
	TODO:
	- add the fake book version (epdf is already there).
	REMARK:
	- the structure of this tune could also be thought of as "ABAC" since the first 8 bars of the A and B
	parts of an "AB" conception are almost identical.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\repeat volta 2 {
		d1:m7 | g:m7 | d:m7 | g:7 | \myEndLine
		c:maj7 | f:maj7 | e:m7 |
	} \alternative {
		{
			f:7 | \myEndLine
			\myMark "B"
			d:m7 | g:7 | c:maj7 | a:m7 | \myEndLine
			d:m7 | g:7 | e:m7 | a:7 | \myEndLine
		}
		{
			%% \myEndLine after the following line was removed to reduce
			%% number of lines in the presentation
			a:7 |
			\myMark "C"
			d:m7 | f:m6 | c:maj7 | e2:7 ees:dim | \myEndLine
			d1:m7 | g:7 | c1*2:6 | \myEndLine
		}
	}

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c'' {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Moderato" 4 = 108
	\key c \major
	\time 4/4

	\repeat volta 2 {
		a1 | d,2. e4 | f2 e4. f8 | b2. a4 |
		g2 fis4 g | d' des c b | a2 gis4. a8 |
	} \alternative {
		{
			g'!1 |
			g | a,2. b4 | e e e2~ | e4 r r2 |
			r4 g g,4. g8 | aes aes4 aes8 a4 a8 b~ | b4 b b2~ | b4 r r2 |
		}
		{
			a'2. e4 |
			g2. d4 | f2. c4 | e2 b4 c | d des c b |
			a2 e' | e ees4 d | c1~ \mark \markup { \italic { Fine } } | c4 r r2 |
		}
	}
}
% endif

% if part=='LyricsReal':
\lyricmode {
	%% A part
	You'd be so Eas -- y To Love,
	So eas -- y to i -- dol -- ize,
	All oth -- ers a -- bove
	%% B part
	So worth the yearn -- ing for, __
	So swell to keep ev -- 'ry home -- fire burn -- ing for __

	shame
	%% C part
	that you can't see
	your fu -- ture with me,
	'cause you'd be oh, so Eas -- y To Love! __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	%% A part
	We'd be so grand at the game
	So care -- free to -- get -- her,
	that it does seem a
}
% endif
