<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Real"

	attributes['title']="My Funny Valentine"
	attributes['composer']="Richard Rodgers"
	attributes['copyright']="1937 by Chappell & Co., Inc. Copyright Renewed"
	attributes['style']="Jazz"
	attributes['piece']="Ballad"
	attributes['poet']="Lorenz Hart"

	attributes['completion']="5"
	attributes['uuid']="087137ac-a26f-11df-aa1f-0019d11e5a41"

	attributes['idyoutube']="jvXywhJpOKs"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- mark what has been done with this tune.
	- get another version of this tune (fakebook?).
	- document the youtube performances.
	- add lyrics url.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords

	\startSong

	\mark "A"
	\startPart
	c1:m7 | c:m7/+b | c:m7/+bes | a:m7.5- | \myEndLine
	aes:maj7 | f:m7.9 | d:m7.5- | g:7.9- | \myEndLine
	\endPart

	\mark "A"
	\startPart
	c1:m7 | c:m7/+b | c:m7/+bes | f/a | \myEndLine
	aes:maj7 | a4:m7.5- d:7.5-.9- g:m7 c:7.5-.9- | f1:m7.5- | bes:7.9- | \myEndLine
	\endPart

	\mark "B"
	\startPart
	ees2:maj7 f:m7 | g:m7 f:m7 | ees2:maj7 f:m7 | g:m7 f:m7 | \myEndLine
	ees2:maj7 g4:7.5+ g:7 | c2:m7 bes4:m7 a:7.9- | aes1:maj7 | d2:m7.5- g:7.9- | \myEndLine
	\endPart

	\mark "A"
	\startPart
	c1:m7 | c:m7/+b | c:m7/+bes | f/a | \myEndLine
	aes:maj7 | d2:m7.5- g:7.9- | c:m7 b:7.9 | bes:m7.9 a:7.5-.9+ | \myEndLine
	aes1:maj7 | f2:m7 bes:7 | ees1*2 | \myEndLine
	\endPart

	\endSong

	\endChords
}
% endif

% if part=='VoiceReal':
\relative a {
	\time 4/4
	\key c \minor
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130

	c2 d4 ees | d4. ees8 d2 | c2 d4 ees | d4. ees8 d2 |
	c2 d4 ees | bes'2 aes4 g | f1~ | f |

	ees2 f4 g | f4. g8 f2 | ees2 f4 g | f4. g8 f2 |
	ees2 f4 g | d'4. c8 bes4. a8 | aes1~ | aes2 g4 f |

	bes4 r8 ees, ees4 d | ees2 ees4 d | c'4 r8 ees, ees4 d | ees2 ees4 d |
	bes' r8 ees, ees4 d | ees2 f4 g | c1~ | c2 d, |

	c2 d4 ees | d4. ees8 d2 | ees2 f4 g | f4. g8 f2 |
	c'2 d4 ees | d4. ees8 d2 | ees1~ | ees |
	ees,2 f4 g | f4. g8 f2 | ees1~ | ees2. r4 |
}
% endif

% if part=='LyricsReal':
\lyricmode {
	My Fun -- ny Val -- en -- tine,
	Sweet com -- ic val -- en -- tine,
	You make me smile with my heart.
	Your looks are laugh -- a -- ble, un -- pho -- to -- graph -- a -- ble,
	Yet, you're my fav' -- rite work of art.

	Is your fig -- ure less than Greek?
	Is your mouth a lit -- tle weak?
	When you o -- pen it to speak, are you smart?

	But don't change a hair for me,
	Not if you care for me,
	Stay lit -- tle Val -- en -- tine, stay!
	Each day is Val -- en -- tine's day.
}
% endif
