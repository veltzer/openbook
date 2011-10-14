<%inherit file="/src/include/common.makoi"/>
<%
	attributes['jazzTune']=True
	attributes['type']="harmony_tune_lyricsmoremore"
	attributes['render']="Real"

	attributes['title']="Blue Bossa"
	attributes['composer']="Kenny Dorham"
	attributes['poet']="Joan Cartwright"
	attributes['style']="Jazz"
	attributes['piece']="Bossa Nova"
	attributes['structure']="A"

	attributes['completion']="5"
	attributes['uuid']="f7fdc5e0-db41-11e0-a31c-0019d11e5a41"

	attributes['remark']="Play last 4 bars twice more to end (taken from the real book)"
	attributes['remark']="Joe Henderson - 'Page One'"
	attributes['remark']="Real book version is in the first real book on page 51"

	attributes['idyoutube']="EhQfGODnvww"
	attributes['idyoutube']="-0mNSP1452o"
	attributes['idyoutube']="6sr7BXinJMw"
	attributes['idyoutube']="lKEEVECH58Q"
	attributes['lyricsurl']="http://fyicomminc.bizland.com/music/lyrics/bluebossa.htm"
%>

<%doc>
	DONE:
	TODO:
	- get another version in here.
	- mark what's been done to this tune.
	- document the youtube performances.
</%doc>

myChordsReal=\chordmode {
	\startChords

	\startSong

	\partial 4 r4 |

	\repeat volta 3 {

	c1*2:m7 | f1*2:m7 | \myEndLine
	d1:m7.5- | g:7 | c1*2:m7 | \myEndLine
	ees1:m7 | aes:7 | des1*2:maj | \myEndLine
	d1:m7.5- | g:7 | c1:m7 | d2:m7.5- g:7 | \myEndLine

	}

	\endSong

	\endChords
}

myVoiceReal=\relative c''' {
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

%% this version of the lyrics is from the internet...
myLyricsReal=\lyricmode {
	A place in -- side my heart
	Is where you live
	Mem -- ories of our start
	The love you give

	Days when we’re a -- lone
	And you are in my arms
	The_blue -- ness of the_true -- ness of our love
}

myLyricsRealmore=\lyricmode {
	_ Nights of moon -- lit skies
	A gen -- tle kiss
	Some -- thing in your eyes
	Fills me with bliss

	Hold me in your arms
	And then I will re -- call
	The_blue -- ness of the_true -- ness of our love

	The
}

myLyricsRealmoremore=\lyricmode {
	The thought of how we met
	Still lin -- gers on
	How can I for -- get
	That mag -- ic dawn

	All the warm de -- sire
	The fi -- re in your touch
	The_blue -- ness of the_true -- ness of our love
}
