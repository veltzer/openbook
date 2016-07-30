<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	attributes['title']='Alice In Wonderland'
	attributes['style']='Jazz'
	# this is from the internet
	attributes['composer']='Sammy Fain'
	# this is from the internet
	attributes['poet']='Bob Hilliard'
	# this is from the real book
	attributes['piece']='Med.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='718a13e0-023a-11e1-924f-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='rbk1:12'

	attributes['idyoutuberemark1']='An amzing version by Oscar Peterson'
	attributes['idyoutube1']='TSNPzm_wYLY'
	attributes['idyoutuberemark2']='Bill Evans in the amazing Village Vanguard version'
	attributes['idyoutube2']='bSXRvgFea-0'
	attributes['lyricsurl']='http://www.stlyrics.com/lyrics/aliceinwonderland/aliceinwonderland.htm'
%>
% endif

% if part=='Doc':
	DONE:
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
	TODO:
	- put in the copyright (from where?)
	- put more versions in here (from where?)
	REMARKS:
	- if you want a vocal recording then you can find one at:
		http://www.youtube.com/watch?v=seToJih5eq0
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		d2.:m7 | g:7 | c:maj7 | f:maj7 | \myEndLine
		b:m7.5- | e:7 | a:m7 | ees:7 | \myEndLine
		d:m7 | g:7 | e:m7 | a:m7 | \myEndLine
		d:m7 | g:7 |
	} \alternative {
		{
			%% the chords a:m7 d:7 are a mistake in the real book
			e4.:m7 a:7 | d:m7 g:7 | \myEndLineVoltaNotLast
		}
		{
			c2.:maj7 | a:m7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	d2.:7 | g:7 | e:m7 | a:m7 | \myEndLine
	d:m7 | g:7 | c:maj7 | f:maj7 | \myEndLine
	fis:m7.5- | b:7.9- | e:m7 | a:7 | \myEndLine
	d2:m7 a4:7 | d2:m7 a4:7 | d2:m7 aes4:7 | g2.:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	d2.:m7 | g:7 | c:maj7 | f:maj7 | \myEndLine
	b:m7.5- | e:7 | a:m7 | ees:7 | \myEndLine
	d:m7 | g:7 | e:m7 | a:m7 | \myEndLine
	d:m7 | g:7 | c2.*2:maj7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 130
	\time 3/4
	\key c \major

	%% part "A"
	\repeat volta 2 {
		g'2. | g'2 f4 | e2 c4 | g2. |
		d'4 e f | e2 d4 | e2 c4 | g2. |
		d'4 e f | e2 d4 | e2 g4 | c2 a4 |
		g2 f4 | e2 d4 |
	} \alternative {
		{ g2.~ | g | }
		{ c,2.~ | c2 cis4 | }
	}

	%% part "B"
	d2. | a' | g | c, |
	d4 e f | g2 a4 | b2 g4 | e2. |
	fis | c' | b2 g4 | e2. |
	a2 g4 | f2 e4 | d2 c4 | b2. |

	%% part "A"
	g2. | g'2 f4 | e2 c4 | g2. |
	d'4 e f | e2 d4 | e2 c4 | g2. |
	d'4 e f | e2 d4 | e2 g4 | c2 a4 |
	g2 f4 | e2 d4 | c2.~ | c |
}
% endif

% if part=='LyricsReal':
%% This is taken from the inetnet and adjusted for this tune
\lyricmode {

	%% part "A"
	A -- lice In Won -- der -- land
	How do you get to won -- der -- land
	O -- ver the hill or un -- der -- land
	or just be -- hind the tree __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	When clouds go rol -- ling by
	They roll a -- way and leave the sky
	Where is the land be -- yond the eye
	That peo -- ple can -- not _ see __

	%% part "B"
	And where do stars go
	Where is the sil -- ver cre -- scent moon
	They must be some -- where
	in the sun -- ny af -- ter -- noon

	%% part "A"
	A -- lice In Won -- der -- land
	Where is the path to won -- der -- land
	O -- ver the hill or here or there
	I real -- ly won -- der where __
}
% endif
