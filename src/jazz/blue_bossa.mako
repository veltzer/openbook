<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['doLyricsmoremore']=True
	attributes['render']="Real"

	attributes['title']="Blue Bossa"
	attributes['style']="Jazz"
	attributes['composer']="Kenny Dorham"
	attributes['poet']="Joan Cartwright"
	attributes['piece']="Bossa Nova"

	attributes['completion']="5"
	attributes['uuid']="f7fdc5e0-db41-11e0-a31c-0019d11e5a41"
	attributes['structure']="A"
	# from the real book
	attributes['remark']="Play last 4 bars twice more to end"

	attributes['idyoutube']="EhQfGODnvww"
	attributes['idyoutube']="-0mNSP1452o"
	attributes['idyoutube']="6sr7BXinJMw"
	attributes['idyoutube']="lKEEVECH58Q"
	attributes['lyricsurl']="http://fyicomminc.bizland.com/music/lyrics/bluebossa.htm"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- get another version in here.
	- mark what's been done to this tune.
	- document the youtube performances.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\repeat volta 3 {
		\mark "A"
		\startPart
		c1*2:m7 | f1*2:m7 | \myEndLine
		d1:m7.5- | g:7 | c1*2:m7 | \myEndLine
		ees1:m7 | aes:7 | des1*2:maj | \myEndLine
		d1:m7.5- | g:7 | c1:m7 | d2:m7.5- g:7 | \myEndLine
		%% remarked to show the repeat sign...
		%%\endPart
	}

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c''' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 150
	\time 4/4
	\key c \minor

	\partial 4 g,4 |

	\mark "A"

	\repeat volta 3 {

	g'4. f8 ees d4 c8~ | c2. bes4 | aes2 g'4. f8~ | f1 |
	f4. ees 8 d c4 bes8~ | bes2. aes4 | g2 f'4. ees8~ | ees1 |
	ees4. des8 c bes4 aes8~ | aes2. ges4 | ges f8 bes~ bes f aes4~ | aes1 |
	aes4 g8 bes~ bes2 | aes4 g8 bes~ bes4. aes8 | g1~ | g2. <\parenthesize g>4 |

	}
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the internet adjusted for the real book.
\lyricmode {
	%% A part
	A place in -- side my heart
	Is where you live
	Mem -- ories of our start
	The love you give

	Days when we're a -- lone
	And you are in my arms
	The_blue -- ness of the_true -- ness of our love
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	%% A part
	_ Nights of moon -- lit skies
	A gen -- tle kiss
	Some -- thing in your eyes
	Fills me with bliss

	Hold me in your arms
	And then I will re -- call
	The_blue -- ness of the_true -- ness of our love

	The
}
% endif

% if part=='LyricsmoremoreReal':
\lyricmode {
	%% A part
	The thought of how we met
	Still lin -- gers on
	How can I for -- get
	That mag -- ic dawn

	All the warm de -- sire
	The fi -- re in your touch
	The_blue -- ness of the_true -- ness of our love
}
% endif
