<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="My Funny Valentine"
	attributes['style']="Jazz"
	attributes['composer']="Richard Rodgers"
	# this direction is from the fake book
	attributes['piece']="Slowly"
	attributes['poet']="Lorenz Hart"
	attributes['copyright']="1937 by Chappell & Co., Inc. Copyright Renewed"

	attributes['completion']="5"
	attributes['uuid']="087137ac-a26f-11df-aa1f-0019d11e5a41"
	attributes['structure']="AABA"

	attributes['idyoutuberemark']="Frank!"
	attributes['idyoutube']="wG6lAtpcI_Q"
	attributes['idyoutuberemark']="Chet Baker vocal version (amazing!)"
	attributes['idyoutube']="7iQQGBfbB0k"
	attributes['lyricsurl']="http://www.elyrics.net/read/f/frank-sinatra-lyrics/my-funny-valentine-lyrics.html"
%>
% endif

% if part=='Doc':
	DONE:
	- identified the version as the fake book version.
	- made sure we have two epdfs (real and fake).
	- marked down the structure of this tune.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- listened to the tune and adjust the speed if need be.
	- documented the youtube performances.
	- added lyrics url.
	TODO:
	- get the real book version in here.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	c1:m | g:7/b | c:m7/+bes | a:m7.5- | \myEndLine
	aes:maj7 | f:m7.9 | d:m7.5- | g:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c1:m | g:7/b | c:m7/+bes | f/a | \myEndLine
	aes:maj7 | a4:m7.5- d:7.5-.9- g:m7 c:7.5-.9- | f1:m7.5- | bes:7.9- | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	ees2:maj7 f:m7 | g:m7 f:m7 | ees2 f:m7 | g:m7 f:m7 | \myEndLine
	ees:maj7 g4:7.5+ g:7 | c2:m7 bes4:m7 a:7.9- | aes1:maj7 | d2:m7.5- g:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c1:m | g:7/b | c:m7/+bes | f/a | \myEndLine
	aes:maj7 | d2:m7.5- g:7.9- | c:m7 b:7.9 | bes:m7.9 a:7.5-.9+ | \myEndLine
	aes1:maj7 | f2:m7 bes:7 | ees1*2 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative a {
	\time 4/4
	\key c \minor
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130

	%% A part
	c2 d4 ees | d4. ees8 d2 | c2 d4 ees | d4. ees8 d2 |
	c2 d4 ees | bes'2 aes4 g | f1~ | f |

	%% A part (2)
	ees2 f4 g | f4. g8 f2 | ees2 f4 g | f4. g8 f2 |
	ees2 f4 g | d'4. c8 bes4. a8 | aes1~ | aes2 g4 f |

	%% B part
	bes4 r8 ees, ees4 d | ees2 ees4 d | c'4 r8 ees, ees4 d | ees2 ees4 d |
	bes' r8 ees, ees4 d | ees2 f4 g | c1~ | c2 d, |

	%% A part
	c2 d4 ees | d4. ees8 d2 | ees2 f4 g | f4. g8 f2 |
	c'2 d4 ees | d4. ees8 d2 | ees1~ | ees |
	ees,2 f4 g | f4. g8 f2 | ees1~ | ees2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	My Fun -- ny Val -- en -- tine,
	sweet com -- ic val -- en -- tine,
	you make me smile with my heart. __
	Your looks are laugh -- a -- ble, un -- pho -- to -- graph -- a -- ble,
	yet, you're my fav -- 'rite work of art. __

	Is your fig -- ure less than Greek;
	is your mouth a lit -- tle weak
	when you o -- pen it to speak, are you smart? __

	But don't change a hair for me,
	not if you care for me,
	stay lit -- tle val -- en -- tine, stay! __
	Each day is Val -- en -- tine's day. __
}
% endif
