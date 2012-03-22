<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Real"

	attributes['title']="Autumn In New York"
	attributes['style']="Jazz"
	attributes['composer']="Vernon Duke"
	attributes['copyright']=""
	attributes['copyrightextra']=""
	attributes['poet']=""
	# this is from the fake book.
	attributes['piece']="Medium Swing"

	attributes['structure']="ABAC"
	attributes['structureremark']="I determined it was ABAC although the A part does not repeat exactly. It is good enough"

	attributes['completion']="5"
	attributes['uuid']="9677b522-7463-11e1-a57d-bbc28ffad085"
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']="http://www.sing365.com/music/lyric.nsf/Autumn-in-New-York-lyrics-Frank-Sinatra/C779DB117665DFD94825691F00067AD0"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\mark "A"
	\startPart
	g2:m7 a:m7 | bes:6 c:7 | f:maj7 g:m7 | a:m7 d:7.9- | \myEndLine
	g:m7 a:m7 | bes:6 c:7 | a1:m7.5- | d:7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	g:m7 | bes2:m7 ees:7 | aes1.:maj7 d2:m7.5- | \myEndLine
	c1:m7 | d2:m7 g:7.9- | c1:maj7 | c2.:7 c4:7.5+ | \myEndLine
	\endPart

	\mark "A"
	\startPart
	g2:m7 a:m7 | bes:6 c:7 | f:maj7 g:m7 | a:m7 d4:7.9- des:7 | \myEndLine
	c2:m7 d:m7 | ees:m6 f:7 | bes:m6 aes:m7 | ges1:7 | \myEndLine
	\endPart

	\mark "C"
	\startPart
	f2:m7 c:7 | f:m aes:7 | des:maj7 aes:7 | des2.:maj7 aes4:7 | \myEndLine
	g2:m7 a:m7 | bes:m6 c:7.9- | f1*2:m | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative e' {
	\time 4/4
	\key f \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Andante" 4 = 76
	%% part A
	a8 g f d c2 | r8 d f bes d d4 c8 | d2 a | r1 |
	a8 g f d c2 | r8 d f bes d d4 c8 | d2 a | r1 |
	%% part B
	c8 c4 a8 a4. f8 | aes8 aes4 f8 ees4. des8 | ees b4 c8 ees2~ | ees f |
	g8 d4 ees8 g2~ | g b | g1~ | g2. gis4 |
	%% part A
	a8 g! f d c2 | r8 d f bes d d4 c8 | d2 a | r1 |
	d8 c bes g f2~ | f8 ges bes c des ees4 c8 | des1~ | des2. r4 |
	%% part C
	c8 aes4 c8 e4 e | c2. bes4 | aes8 f4 aes8 c4 c | aes2. aes4 |
	a!8 g f d c2~ | c8 bes des f aes bes4 g8 | f1 | r1 |
}
% endif

% if part=='LyricsReal':
%% lyrics are taken from the fake book and adjusted for the real one
\lyricmode {
	%% A part
Autumn in New York
Why does it seem so exciting (inviting)
Autumn in New York
It spells the thrill of first-nighting

Shimmering clouds - glimmering crowds (glittering crowds and shimmering clouds)
In canyons of steel
They're making me feel - I'm home

It's autumn in New York
That brings a (the) promise of new love
Autumn in New York
Is often mingled with pain

Dreamers with empty hands 
(They) All sigh for exotic lands

(But) It's autumn in New York
It's good to live it again

This autumn in New York
Transforms the slums into Mayfair
Autumn in New York
You'll need no castles in Spain

Lovers that bless the dark
On benches in Central Park

(But) It's autumn in New York
It's good to live it again
	%% B part
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	%% A part
}
% endif
