<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']='Lullaby of birdland'
	attributes['style']='Jazz'
	attributes['composer']='George Shearing'
	attributes['poet']='George David Weiss'
	attributes['piece']='Relaxed Swing'
	attributes['copyright']='1952, 1953, 1954 Adam R. Levy & Father Ent., Inc., New York NY. Copyrights Renewed.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='f9668406-a26e-11df-8542-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='rbk1:277,jfb:234'

	attributes['idyoutuberemark1']='The famous Ella version'
	attributes['idyoutube1']='UY8zK4R9oE8'
	attributes['idyoutuberemark2']='George Shearing himself! Amazing!'
	attributes['idyoutube2']='LKXvMbAKAmY'
	attributes['lyricsurl']='http://www.bluesforpeace.com/lyrics/lullaby-birdland.htm'
%>
% endif

% if part=='Doc':
	DONE:
	- filled in meta data from the fake book.
	- added real book epdf.
	- added fake book epdf.
	- added fake book chords.
	- added fake book tune.
	- added fake book lyrics.
	- check fake book chords.
	- check fake book tune.
	- check fake book lyrics.
	- hear the tune to make sure it's ok.
	- add you tube performances.
	- add lyricsurl.
	TODO:
	- fill in where the meta data is from.
	- add the real book version.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f2:m6 d:m7.5- | g:7.9- c:7.9- | f:m7 des:maj7 | bes:m7 ees:7 | \myEndLine
	c:m7 f:m7 | bes:m7 ees:7.9- | aes:maj7 des:9 | g:m7.5- c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f2:m6 d:m7.5- | g:7.9- c:7.9- | f:m7 des:maj7 | bes:m7 ees:9 | \myEndLine
	c:m7 f:m7 | bes:m7 ees:7.9- | aes:maj7 ees:7 | aes1 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	c2:m7.5- f:7.9- | bes1:m7 | bes2:m7 ees:7.9- | aes1:maj7 | \myEndLine
	c2:m7.5- f:7.9- | bes1:m7 | ees:7.9- | aes2:maj7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f2:m6 d:m7.5- | g:7.9- c:7.9- | f:m7 des:maj7 | bes:m7 ees:9 | \myEndLine
		c:m7 f:m7 | bes:m7 ees:7.9- |
	} \alternative {
		{
			aes:maj7 des:9 | g:m7.5- c:7 | \myEndLineVoltaNotLast
		}
		{
			aes1:maj7 | bes2:m7 ees:9 | aes1:maj7 | bes2:m7 a4:maj7 aes:maj7.9 | \myEndLineVoltaLast
		}
	} \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \minor

	%% part "A"
	c'8 c bes aes g f4. | d4 f8 e~ e2 | c4 g'8 f~ f2 | des4 c'8 bes~ bes2 |
	ees8 ees des c bes aes4. | f8 c' bes e,~ e c' bes ees,~ | ees2~ ees8 bes' aes des,~ | des aes' g c,~ c2 |

	%% part "A"
	c'8 c bes aes g f4. | d4 f8 e~ e2 | c4 g'8 f~ f2 | des4 c'8 bes~ bes2 |
	ees8 ees des c bes aes4. | f8 c' bes e,~ e c' bes ees,~ | ees2~ ees8 ees g aes~ | aes1 |

	%% part "B"
	c4 des8 d ees c ees des~ | des bes4.~ bes2 | bes4 b8 c des bes des c~ | c1 |
	c4 des8 d ees c ees des~ | des bes4.~ bes2 | bes4 b8 c des bes des c~ | c des c bes~ bes2 |

	%% part "A"
	\repeat volta 2 {
		c8 c bes aes g f4. | d4 f8 e~ e2 | c4 g'8 f~ f2 | des4 c'8 bes~ bes2 |
		ees8 ees des c bes aes4. | f8 c' bes e,~ e c' bes ees,~ |
	} \alternative {
		{
			ees2~ ees8 bes' aes des,~ | des aes' g c,~ c r r4 |
		}
		{
			ees2~\repeatTie ees8 e f des'~ | des2 c4 c8 aes~ | aes1~ | aes2. r4 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Lul -- la -- by Of Bird -- land
	that's what I __
	al -- ways hear __
	when you sigh. __
	Nev -- er in my word -- land could there be ways __ to re -- veal __ __ in a phrase __ how I feel! __

	%% part "A"
	Have you ev -- er heard two tur -- tle doves __
	bill and coo __
	when they love? __
	That's the kind of mag -- ic mu -- sic we make __ with our lips __ __ when we kiss! __

	%% part "B"
	And tere's a weep -- y old wil -- low; __
	he real -- ly knows how to cry! __
	That's how I'd cry in my pil -- low __
	if you should tell me fare -- well __ and good -- bye! __

	%% part "A"
	Lul -- la -- by Of Bird -- land whis -- per low, __
	kiss me sweet __
	and we'll go __
	fly -- in' high in Bird -- land, high in the sky __ up a -- bove __ __ all be -- cause __ we're in love! __

	_ all be -- cause __ we're in love. __ __
}
% endif
