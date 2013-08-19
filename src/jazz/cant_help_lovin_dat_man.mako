<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="Can't Help Lovin' Dat Man"
	attributes['style']="Jazz"
	attributes['composer']="Jerome Kern"
	attributes['poet']="Oscap Hammerstein III"
	attributes['piece']="Moderately and rather freely"
	attributes['copyright']="1927 T.B. Hama Company, Copyright Renewed"
	attributes['copyrightextra']=""
	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"

	attributes['completion']="5"
	attributes['uuid']=""
	attributes['structure']="AABA"

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
	\startSong
	\startChords

	\myMark "A"
	\startPart
	c2:maj7 a:m7 | d:m7 g:7 | c:maj7 g4:m7 c:7.9- | f2:6 bes:9 | e:m7 a:m7 |
	aes2:7 d4:7.9- g:7.9- | c2:maj7 ees:dim7 | d:m7 g:7.5+ |
	\endPart
	\myMark "A"
	\startPart
	c:maj7 a:m7 | d:m7 g:7 |
	c:maj7 g4:m7 c:7.9- | f2:6 bes:9 | e:m7 a:m7 | aes:7 d4:7.9- g:7.9- | c2:maj7 d:m7 | g:m7 c:7.9- |
	\endPart
	\myMark "B"
	\startPart
	f1:6 | fis:dim7 | c:maj7 | d:7 | e2:m7 ees:maj7 | d:m7 d:9 | d1:m7/g | g:7 |
	\endPart
	\myMark "A"
	\startPart
	c2:maj7 a:m7 | d:m7 g:7 | c:maj7 g4:m7 c:7.9- | f2:6 bes:9 | e:m7 a:m7 |
	aes:7 d4:7.9- g:7.9- | c2:maj7 ees:9 aes:maj7 des:maj7 | c1:maj7 |
	\endPart
	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Andante Moderato" 4 = 88
	\time 4/4
	\key c \major
	%% part "A"
	g8 g g c~ c4 c | c8 g g g~ g2 | e8 e e a~ a4 a | a8 d, d d~ d2 | g c, |
	aes8 c c ees~ ees4 d | c1 | R1 |
	%% part "A"
	g'8 g g c~ c4 c | c8 g g g~ g2 | e8 e e a~ a4 a | a8 d, d d~ d2 | g c, |
	aes8 c c ees~ ees4 d | c1 | R1 |
	%% part "B"
	d4 d d d8 ees~ | ees1 | e?4 e e e8 fis~ | fis1 | g4 g g g | a a a a | d2~ d8 c b a | g1 |
	%% part "A"
	g8 g g c~ c4 c | c8 g g g~ g2 | e8 e e a~ a4 a | a8 d, d d~ d2 | g c |
	ees8 c d ees~ ees4 d | c1~ | c2. r4 | R1 |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	Fish got to swim __ and birds got to fly __ I got to love __ one man 'til I die, __ Can't Help
	Lov -- in' Dat Man of mine. Tell me he's la -- zy tell me he's slow, __
	tell me I'm cra -- zy may -- be I know, __ Can't Help Lov -- in' Dat Man of mine.

	When he goes a -- way __ dat's a rain -- y day, __ and when he comes back dat day is fine, __ the sun will shine.
	He can come home as late as can be, __ home with -- out him __ ain't no home to me, __ Can't Help Lov -- in' Dat Man of mine. __
}
% endif
