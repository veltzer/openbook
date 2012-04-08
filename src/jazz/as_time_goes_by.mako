<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Real"

	attributes['title']="As Time Goes By"
	attributes['style']="Jazz"
	# this is from the internet
	attributes['composer']="Herman Hupfeld"
	# this is from the internet
	attributes['poet']="Herman Hupfeld"
	# this is from the real book
	attributes['piece']="Ballad"
	# this is still missing
	#attributes['copyright']=""
	attributes['completion']="0"

	attributes['uuid']="0a7b423c-7a4e-11e1-8d67-878c1414bdce"
	attributes['structure']="AABA"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	TODO:
	- put in the real book chords.
	- brought in the real book epdf.
	- put in the real book tune.
	- checked the real book chords.
	- checked the real book tune.
	- heard the tune to make sure it's ok.
	- put in meta data (composer, poet).
	- put in youtube performances.
	- put in lyrics url.
	- put in the real book lyrics (from the internet)
	- put in the copyright (from where?)
	- put more versions in here (from where?)
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\mark "A"
	\startPart
	\repeat volta 2 {
		f2:m7 bes:7 | bes:m6 bes:7 | ees:6 f:m7 | fis:dim7 g:m7 | \myEndLine
		f1:7 | f2:m7 bes:7 |
	} \alternative {
		{
			ees1:maj7 | f2:m7 bes:7 | \myEndLine
		}
		{
			ees1:6 | bes2:m7 ees:7 | \myEndLine
		}
	}
	\endPart

	\mark "B"
	\startPart
	a1:maj7 | c:7 | f:m | a:dim | \myEndLine
	c2:m aes:7 | f1:7 | bes2:7 bes:dim | bes1:7 | \myEndLine
	\endPart

	\mark "A"
	\startPart
	f2:m7 bes:7 | bes:m6 bes:7 | ees:6 f:m7 | fis:dim7 g:m7 | \myEndLine
	f1:7 | g2:m7 c:7 | f:m7 bes:7 | ees
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 3/4
	\key c \major

	%% A part
	\repeat volta 2 {
		g2. | g'2 f4 | e2 c4 | g2. |
		d'4 e f | e2 d4 | e2 c4 | g2. |
		d'4 e f | e2 d4 | e2 g4 | c2 a4 |
		g2 f4 | e2 d4 |
	} \alternative {
		{ g2.~ | g | }
		{ c,2.~ | c2 cis4 | }
	}

	%% B part
	d2. | a' | g | c, |
	d4 e f | g2 a4 | b2 g4 | e2. |
	fis | c' | b2 g4 | e2. |
	a2 g4 | f2 e4 | d2 c4 | b2. |

	%% A part
	g2. | g'2 f4 | e2 c4 | g2. |
	d'4 e f | e2 d4 | e2 c4 | g2. |
	d'4 e f | e2 d4 | e2 g4 | c2 a4 |
	g2 f4 | e2 d4 | c2.~ | c |
}
% endif

% if part=='LyricsReal':
%% This is taken from the inetnet and adjusted for this tune
\lyricmode {
	%% A part
	A -- lice In Won -- der -- land
	How do you get to won -- der -- land
	O -- ver the hill or un -- der -- land
	or just be -- hind the tree __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	%% A part
	When clouds go rol -- ling by
	They roll a -- way and leave the sky
	Where is the land be -- yond the eye
	That peo -- ple can -- not _ see __
	%% B part
	And where do stars go
	Where is the sil -- ver cre -- scent moon
	They must be some -- where
	in the sun -- ny af -- ter -- noon
	%% A part
	A -- lice In Won -- der -- land
	Where is the path to won -- der -- land
	O -- ver the hill or here or there
	I real -- ly won -- der where __
}
% endif
