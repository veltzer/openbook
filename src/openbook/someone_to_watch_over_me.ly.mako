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

	attributes['title']='Someone To Watch Over Me'
	attributes['style']='Jazz'
	attributes['composer']='George Gershwin'
	attributes['poet']='Ira Gershwin'
	attributes['piece']='Jazz Ballad'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='75cbb354-1411-11e0-9a9e-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='rbk2:331'

	attributes['idyoutube1']='CCTIpclVQe4'
	attributes['idyoutube2']='gLqsIIrk5wQ'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- where did this come from?
	- do the intro.
	- match the other verse lyrics to the melody.
	- fill in the copyright.
	- document the youtube performances.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		aes2:maj7 aes:7 | d:m7.5- des:dim7 | c:m7 b:dim7 | bes:m6 c4:m7 f:7.5+ | \myEndLine
		bes2:m7 c4:m7 des:6 | d2:dim7 ees:7.4 |
	} \alternative {
		{
			c:m7 f:7 | bes:m7 ees:7 | \myEndLineVoltaNotLast
		}
		{
			aes1:maj7 | ees2:m7 aes:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
		des1:maj7 | des1:maj7 | des2:maj7 d:dim7 | aes1:maj7/ees | \myEndLine
		d:m7.5- | g:7 | c2:m7 f:7.9- | bes:m7 ees:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
		aes2:maj7 aes:7 | d:m7.5- des:dim7 | c:m7 b:dim7 | bes:m6 c4:m7 f:7.5+ | \myEndLine
		bes2:m7 c4:m7 des:6 | d2:dim7 ees:7.4 | aes:maj7 f:7 | bes:m7 ees:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Andante" 4 = 92
	\time 4/4
	\key aes \major

	%% part "A"
	\repeat volta 2 {
		r4 aes8 bes c ees f aes | bes bes4 aes8 g2 | aes8 aes4 g8 f2 | g8 g4 f8 ees2 |
		r4 f ees des | aes'2 aes,8 bes4. |
	} \alternative {
		{ c1~ | c2 r | }
		{ aes1 | r4 bes c ees | }
	}

	%% part "B"
	g4 aes g aes | bes aes2 g4 | bes aes2 g4 | bes aes2 f4 |
	aes g2 f4 | aes g2 e4 | c1~ | c2 r |

	%% part "A"
	r4 aes8 bes c ees f aes | bes bes4 aes8 g2 | aes8 aes4 g8 f2 | g8 g4 f8 ees2 |
	r4 f ees des | aes'2 aes,8 bes4. | aes1 | r |
}
% endif

% if part=='LyricsReal':
%% lyrics from the internet adjusted for the real book
\lyricmode {
%%	There's a saying old, says that love is blind
%%	Still we're often told, "seek and ye shall find"
%%	So I'm going to seek a certain lad I've had in mind

%%	Looking everywhere, haven't found him yet
%%	He's the big affair I cannot forget
%%	Only man I ever think of with regret

%%	I'd like to add his initial to my monogram
%%	Tell me, where is the shepherd for this lost lamb?

	%% part "A"
	There's a some -- bo -- dy I'm lon -- gin' to see
	I hope that he, turns out to be
	Some -- one who'll watch o -- ver me

	me

	%% part "B"
	Al -- though he may not be the man some
	Girls think of as hand -- some
	To my heart he car -- ries the key

	%% part "A"
	Won't you tell him please to put on some speed
	Fol -- low my lead, oh, how I need
	Some -- one to watch o -- ver me

%%	Won't you tell him please to put on some speed
%%	Follow my lead, oh, how I need
%%	Someone to watch over me

%%	Someone to watch over me
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	I'm a lit -- tle lamb who's lost in the wood
	I know I could, al -- ways be good
	To one who'll watch o -- ver %% me
}
% endif
