<%inherit file="/src/include/common.makoi"/>
<%
	attributes['jazzTune']=True
	attributes['render']="Fake"
	attributes['type']="harmony_tune_lyrics"

	attributes['title']="There Will Never Be Another You"
	attributes['composer']="Harry Warren"
	attributes['style']="Jazz"
	attributes['piece']="Easy Swing"
	attributes['poet']="Mack Gordon"
	attributes['copyright']="1942, 1987 Twentieth Century Music Corporation"
	attributes['copyrightextra']="Renewed 1970 Twentieth Century Music Corporation. All Rights Controlled by Morley Music Co. International Copyright Secured. All Rights Reserved."
	attributes['structure']="AB"

	attributes['completion']="5"
	attributes['uuid']="e30e1074-eaf3-11e0-a377-0019d11e5a41"

	attributes['idyoutube']="kh_NnsbIqNQ"
	attributes['idyoutube']="Til3lV_ItZE"
%>

<%doc>
	DONE:
	TODO:
	- in the real book version move the last chord to be written in parenthesis (I don't know how to do that).
</%doc>

<%def name="myChordsReal()">
\chordmode {
	\startChords

	\startSong

	\partial 4 r4 |

	\mark "A"
	\startPart
	ees1*2:maj7 | d1:m7.5- | g:7.9- | \myEndLine
	c1*2:m7 | bes1:m7 | ees:7 | \myEndLine
	aes:maj7 | f2:m7.5- bes:7 | ees1:maj7 | c:m7 | \myEndLine
	f:7 | c2:m7 f:7 | f1:m7 | bes:7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	ees1*2:maj7 | d1:m7.5- | g:7.9- | \myEndLine
	c1*2:m7 | bes1:m7 | ees:7 | \myEndLine
	aes:maj7 | f2:m7.5- bes:7 | ees1:maj7 | g2:m7 c:7 | \myEndLine
	%% the bes:7 at the end of the next line is supposed to be in parenthesis (as turn-around)
	ees:maj7 d:7 | g:7 c:7 | f:m7 bes:7 | ees:maj7 bes:7 | \myEndLine
	\endPart

	\endSong

	\endChords
}
</%def>

<%def name="myVoiceReal()">
\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key ees \major

	\partial 4 bes4 |

	%% Bar 1
	c d ees f | g bes f ees | f1~ | f2 r8 g4. |
	ees4 f g bes | c ees c4. bes8 | c1~ | c2. bes4 |
	ees c bes aes | g f g aes | bes g f ees | f ees8 f~ f4 ees |
	d' c bes a | g f g f | aes1~ | aes2. bes,4 |

	%% Bar 17
	c d ees f | g bes f ees | f1~ | f2 r8 g4. |
	ees4 f g bes | c ees c4. bes8 | c1~ | c2. bes4 |
	ees c bes aes | g f g aes | bes g f ees8 d'~ | d2 r8 c4. |
	bes4 ees d c | bes ees, bes' aes | f2 g | ees1 |

}
</%def>

<%def name="myLyricsReal()">
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
	There will be man -- y oth -- er nights like this, __
	and I'll be stand -- ing here with some -- one new, __
	There will be oth -- er songs to sing, an -- oth -- er fall, an -- oth -- er spring,
	but There Will Nev -- er Be An -- oth -- er You. __

	There will be oth -- er lips that I may kiss, __
	but they won't thrill me like yours used to do. __
	Yes, I may dream a mil -- lion dreams, but how can they come true,
	if there will nev -- er ev -- er be an -- oth -- er you?
}
</%def>

<%def name="myChordsFake()">
\chordmode {
	\startChords

	\startSong

	\partial 4 r4 |

	\mark "A"
	\startPart
	ees1:maj7 | aes:maj7 | d1:m7.5- | g:7.9- | \myEndLine
	c1*2:m7 | bes1:m7 | ees:7 | \myEndLine
	aes:maj7 | des:7.9 | ees:6 | c:m7 | \myEndLine
	f1*2:7 | f1:m7/bes | bes:7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	ees1:maj7 | aes:maj7 | d1:m7.5- | g:7.9- | \myEndLine
	c1*2:m7 | bes1:m7 | ees:7 | \myEndLine
	aes:maj7 | des:7.9 | g2:m7 c:7 | fis1:dim7 | \myEndLine
	ees2:6 d:7.9- | g:7.5+ c:7.9- | f:m7 bes:7.9 | ees1:6 | \myEndLine
	\endPart

	\endSong
}
</%def>

<%def name="myVoiceFake()">
\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key ees \major

	\partial 4 bes4 |

	%% Bar 1
	c d ees f | g bes f4. ees8 | f1~ | f2. g4 |
	ees f g bes | c ees c4. bes8 | c1~ | c2. bes4 |
	ees c bes aes | g f g4. aes8 | bes4 g f ees | f ees f4. ees8 |
	d'4 c bes a | g f g f | aes1~ | aes2. bes,4 |

	%% Bar 17
	c d ees f | g bes f4. ees8 | f1~ | f2. g4 |
	ees f g bes | c ees c4. bes8 | c1~ | c2. bes4 |
	ees4 c bes aes | g f g4. aes8 | bes4 g f ees | d'2. c4 |
	bes ees d c | bes ees, bes' aes | f2 g | ees2. r4 |
}
</%def>

<%def name="myLyricsFake()">
\lyricmode {
	There will be man -- y oth -- er nights like this, __
	and I'll be stand -- ing here with some -- one new, __
	There will be oth -- er songs to sing, an -- oth -- er fall, an -- oth -- er spring,
	but There Will Nev -- er Be An -- oth -- er You. __

	There will be oth -- er lips that I may kiss, __
	but they won't thrill me like yours used to do. __
	Yes, I may dream a mil -- lion dreams, but how can they come true,
	if there will nev -- er ev -- er be an -- oth -- er you?
}
</%def>
