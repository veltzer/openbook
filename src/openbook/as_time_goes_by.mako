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

	attributes['title']='As Time Goes By'
	attributes['style']='Jazz'
	# this is from the internet
	attributes['composer']='Herman Hupfeld'
	# this is from the internet
	attributes['poet']='Herman Hupfeld'
	# this is from the real book
	attributes['piece']='Ballad'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='0a7b423c-7a4e-11e1-8d67-878c1414bdce'
	attributes['structure']='AABA'
	attributes['location']='rbk1:31'

	attributes['idyoutuberemark1']='Classic Billie Holiday'
	attributes['idyoutube1']='vYoet7-qDHI'
	attributes['idyoutuberemark2']='The classic Sinatra performance with the Casablanca footage'
	attributes['idyoutube2']='AY62QByUYJQ'
	attributes['lyricsurl']='http://www.lyrics007.com/Frank%20Sinatra%20Lyrics/As%20Time%20Goes%20By%20Lyrics.html'
%>
% endif

% if part=='Doc':
	DONE:
	- brough in the real book jazz epdf.
	- put in the tunes meta data from the real book and from the internet.
	- put in the tunes structure.
	- put in the real book chords.
	- put in a lyrics url.
	- put in lyrics for the real book from the internet.
	- put in the real book tune.
	- checked the real book chords.
	- checked the real book tune.
	- adjusted the tunes speed.
	- heard the tune to make sure it's ok.
	- sync the words to the melody.
	- put in youtube performances.
	TODO:
	- put in the copyright (from where?)
	- put another version here (from where?)
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f2:m7 bes:7 | bes:m6 bes:7 | ees:6 f:m7 | fis:dim7 g:m7 | \myEndLine
		f1:7 | f2:m7 bes:7 |
	} \alternative {
		{
			ees1:maj7 | f2:m7 bes:7 | \myEndLineVoltaNotLast
		}
		{
			ees1:6 | bes2:m7 ees:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	aes1:maj7 | c:7 | f:m | a:dim | \myEndLine
	c2:m aes:7 | f1:7 | bes2:7 bes:dim | bes1:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f2:m7 bes:7 | bes:m6 bes:7 | ees:6 f:m7 | fis:dim7 g:m7 | \myEndLine
	f1:7 | g2:m7 c:7 | f:m7 bes:7 | ees4:6 des:7 ees:6 \OPC bes:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Andante" 4 = 76
	\time 4/4
	\key ees \major

	\partial 8 g'8 |

	%% part "A"
	\repeat volta 2 {
		aes g f ees f4. g8 | bes aes g f aes4. bes8 | ees d c bes c2 | r2 r4 d |
		f8 ees d c d4 ees | bes bes ees, f |
	} \alternative {
		{
			g1~ | g2 r4 r8 g |
		}
		{
			ees1~ | ees2 r |
		}
	}

	%% part "B"
	ees8 f ees c'~ c4 c | c8 des c b c2 | f,8 g f c'~ c4 c | c8 des c b c2 |
	g8 aes g ees'~ ees4 ees | ees8 d ees d f4 d | c c g g | bes2. r8 g |

	%% part "A"
	aes g f ees f f4 g8 | bes aes g f aes aes4 bes8 | ees d c bes c2 | r r4 d |
	f8 ees d c d4 ees | bes bes2 g4 | bes2 bes | ees2. r8 g, |
}
% endif

% if part=='LyricsReal':
%% This is taken from the inetnet and adjusted for this tune
\lyricmode {

	%% part "A"
	You must re -- mem -- ber this
	A kiss is still a kiss
	A sigh is still a sigh
	The fun -- da -- men -- tal things app -- ly
	As Time Goes By __

	%% part "A"
	And _

	%% part "B"
	Moon -- light and love __ songs- nev -- er out of date
	Hearts full of pas -- __ sion- jea -- lou -- sy and hate
	Wo -- men needs man- __ and man must have his mate
	That no one can de -- ny

	%% part "A"
	It's still the same old sto -- ry
	A fight for love and glo -- ry
	A case of do or die
	The world will al -- ways wel -- come lov -- ers
	As Time Goes By
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	And when two lov -- ers woo
	They still say: "\"I" love "you\""
	On that you can re -- ly
	No mat -- ter what the fu -- ture brings
	As Time Goes _ _ By __
}
% endif
