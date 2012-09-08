<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="All The Things You Are"
	attributes['style']="Jazz"
	attributes['composer']="Jerome Kern"
	attributes['piece']="Moderately"
	attributes['poet']="Oscar Hammerstein II"
	attributes['copyright']="1939 T.B. Harms Company. Copyright Renewed."
	attributes['copyrightextra']="(c/o The Welk Music Group, Santa Monica, CA 90401)"

	attributes['completion']="5"
	attributes['uuid']="a064f20e-fb85-11e0-8d5d-0019d11e5a41"
	attributes['structure']="ABC"

	attributes['idyoutuberemark']="Charlie Parker, great performance"
	attributes['idyoutube']="UTORd2Y_X6U"
	attributes['idyoutuberemark']="Art Tatum. Brilliant"
	attributes['idyoutube']="_bPgf_olXeE"
	attributes['lyricsurl']="http://www.lyrics007.com/Jerome%20Kern%20Lyrics/All%20The%20Things%20You%20Are%20Lyrics.html"
%>
% endif

% if part=='Doc':
	DONE:
	- bring in real book pdf.
	- bring in fake book pdf.
	- wrote the real book chords.
	- wrote the real book tune.
	- filled in the meta data from the fake book.
	- write the fake book lyrics fitted for the real book tune.
	- checked the real book chords.
	- check the real book notes.
	- hear the tune, adjust it's speed and see it's ok.
	- check the lyrics.
	- wrote the lyrics for the fake book vesion.
	- wrote the fake book chords.
	- wrote the fake book tune.
	- checked the chords of the fake book version.
	- check the tune of the fake book version.
	- check the lyrics of the fake book version.
	- put you tube performances and lyrics url.
	TODO:
	- how do I put the last two chords of the real book version in parens?
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\mark "A"
	\startPart
	f1:m7 | bes:m7 | ees:7 | aes:maj7 | \myEndLine
	des:maj7 | g:7 | c1*2:maj7 | \myEndLine
	c1:m7 | f:m7 | bes:7 | ees:maj7 | \myEndLine
	aes:maj7 | d:7 | g1*2:maj7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	a1:m7 | d:7 | g1*2:maj7 | \myEndLine
	fis1:m7 | b:7 | e:maj7 | c:7.5+ | \myEndLine
	\endPart

	\mark "C"
	\startPart
	f1:m7 | bes:m7 | ees:7 | aes:maj7 | \myEndLine
	des:maj7 | des:m7 | c:m7 | b:dim7 | \myEndLine
	bes:m7 | ees:7 | aes:maj7 | g2:7 c:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key aes \major

	%% part "A"
	aes1 | des2. aes4 | g g g g | g c2 g4 |
	f f f f | f b2 f4 | e1~ | e |
	ees | aes2. ees4 | d d d d | d g2 d4 |
	c c c c | \times 2/3 { c d ees } d c | b1~ | b4 d g d' |

	%% part "B"
	d2 c2~ | c4 ees, e c' | b1~ | b4 d, g b |
	b2 a~ | a4 bes, b a' | aes1~ | aes |

	%% part "C"
	aes | des2. aes4 | g g g g | g c2 g4 |
	f1 | ees'2 des | ees,4 ees \times 2/3 { ees ees ees } | g2. f4 |
	des f aes des | f2 g | aes1~ | aes |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
	%% A part
	You are the prom -- ised kiss of spring -- time
	That makes the lone -- ly win -- ter seem long. __
	You are the breath -- less hush of eve -- ning
	That trem -- bles on the brink of a love -- ly song. __

	%% B part
	You are the angel glow __ that lights a star. __
	The dear -- est things_I know __ are what you are. __

	%% C part
	Some day my hap -- py arms will hold you,
	And some day I'll know that mo -- ment di -- vine,
	When All The Things You Are, are mine. __
}
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords

	\startSong

	\mark "A"
	\startPart
	f1:m7 | bes:m7 | ees:7 | aes:maj7 | \myEndLine
	des:maj7 | g:7 | c1*2:maj7 | \myEndLine
	c1:m7 | f:m7 | bes:7 | ees:maj7 | \myEndLine
	aes:maj7 | a2:m7.5- d:7.9- | g1:maj7 | g2:maj7 e:7.9+ | \myEndLine
	\endPart

	\mark "B"
	\startPart
	a1:m7 | d:7 | g:maj7 | c:maj7 | \myEndLine
	fis:m7.5- | b:7 | e:maj7 | c:7.5+ | \myEndLine
	\endPart

	\mark "C"
	\startPart
	f:m7 | bes:m7 | ees:7 | aes:maj7 | \myEndLine
	des:maj7 | des2:m7 ges:7.9 | aes1:maj7 | b:dim7 | \myEndLine
	bes:m7 | ees:7.9 | aes1*2:maj7 | \myEndLine
	\endPart

	\endSong
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key aes \major

	%% part "A"
	aes1 | des2. aes4 | g g g g | g c2 g4 |
	f f f f | f b2 f4 | e1~ | e |
	ees | aes2. ees4 | d d d d | d g2 d4 |
	c c c c | c d8 ees d4 c | b1~ | b4 d g d' |

	%% part "B"
	d4. c8 c2~ | c4 dis, e c' | b1~ | b4 d, g b |
	b4. a8 a2~ | a4 bes, b a' | gis1 | r |

	%% part "C"
	aes | des2. aes4 | g g g g | g c2 g4 |
	f1 | ees'2. des4 | ees, ees \times 2/3 { ees ees ees } | g2. f4 |
	des des f aes | f'2 g, | aes1~ | aes2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% A part
	You are the prom -- ised kiss of spring -- time
	That makes the lone -- ly win -- ter seem long. __
	You are the breath -- less hush of eve -- ning
	That trem -- bles on the brink of a love -- ly song. __

	%% B part
	You are the an -- gel glow __ that lights a star. __
	The dear -- est things I know __ are what you are.

	%% C part
	Some day my hap -- py arms will hold you,
	And some day I'll know that mo -- ment di -- vine,
	When All The Things You Are, are mine. __
}
% endif
