<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=False
	attributes['render']="Fake"

	attributes['title']="Like Someone In Love"
	attributes['style']="Jazz"
	attributes['composer']="Johnny Burke, Jimmy Van Heusen"
	# from the fake book
	attributes['poet']="Johnny Burke, Jimmy Van Heusen"
	# from the fake book
	attributes['piece']="Moderately"
	# from the fake book
	attributes['copyright']="1944 Bourne Co. and Dorsey Bros. Music, Inc. Division of Music Sales Corporation"
	attributes['copyrightextra']=""
	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"

	attributes['completion']="5"
	attributes['uuid']=""
	attributes['structure']="ABAB'"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		c2:maj7 c/b | c:6/a c/g | d:7/fis g:7/f | e:m7 ees:7 | d1:m7 | g2.:7 g4:9.5+ | c1:maj7 |
		g4:m7 c2:9 c4:9.5+ |
		\endPart
		\myMark "B"
		\startPart
		f2.:6 f4:5+ | b2:m7 e:7 | a1:maj7 | a:6 | a:m7 | d:7 |
		d1:7 | g:7.5+ |
		\endPart
		\myMark "A"
		\startPart
		c2:maj7 c/b | c:6/a c/g | d:7/fis g:7/f | e:m7 ees:7 | d1:m7 | g2.:7 g4:9.5+ |
		c1:maj7 | g4:m7 c2:9 c4:9.5+ |
		\endPart
		\myMark "B'"
		\startPart
		f2.:6 f4:5+ | b2:m7 e:7 | a1:maj7 | d2.:9 dis4:dim |
		e2:m7 a:7 | d:m7 g:7.9- |
	} \alternative {
		{
			c a:m7 | d:9 g:7 |
		}
		{
			c f:m6 | c1 |
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key c \major
	\repeat volta 2 {
		%% part "A"
		e4 e2 e4 | e4 a g e | d d2 b'4 | g1 | f4 f2 c'4 | b2. a4 | g4 g2 e'4 |
		d1 | d4 d2 cis4 | e d cis b | e,2 e~ | e1 | c'4 c2 b4 | d c b a |
		d,1 | dis | e4 e2 e4 | e a g e | d d2 b'4 | g1 | f4 f2 c'4 | b2. a4 |
		g4 g2 e'4 | d1 | d4 d2 cis4 | e d cis b | e, e2 e4 | fis2. fis4 |
		g4 g2 g4 | f d'2 b4 |
	} \alternative {
		{
			c1 | R |
		}
		{
			c1~ | c |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% part "A"
	Late -- ly I find my -- self out gaz -- ing at stars, hear -- ing gui -- tars Like Some -- one In
	Love. Some -- times the things I do a -- stound me, __ most -- ly when -- ev -- er you're a --
	round me. Late -- ly I seem to walk as though I had wings, bump in -- to things Like
	Some -- one In Love. Each time I look at you I'm linmp as a glove and
	feel -- ing Like Some -- one In Love.
	Love. __
}
% endif
