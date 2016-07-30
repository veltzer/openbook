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

	attributes['title']='A Cup Of Coffee, A Sandwich And You'
	attributes['style']='Jazz'
	attributes['composer']='Joseph Meyer'
	attributes['poet']='Billy Rose, Al Dubin'
	attributes['piece']='Moderato'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='efaf8a18-da80-11e3-83d3-8b992af01517'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
% endif

% if part=='ChordsFake':
\chordmode {
	\startSong
	\startChords

	\partial 2. s4 f2:5+ |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		bes1 | ees:m | bes | bes2 b:dim7 | \myEndLine
		c4:m7 f2.:7 | f1:5+ | bes2 b:dim7 | f:7 f:5+ | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		bes1 | ees:m | bes | bes2 b:dim7 | \myEndLine
		c4:m7 f2.:7 | f1:5+ | bes | bes2 f4:7 f:m6 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		ees1*2:7 | a1:m | d4:7 g2.:7 | \myEndLine
		c1:7 | c:7 | c:m7 | f2:7 f:5+ | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		bes1 | ees:m6 | bes | bes2 b:dim7 | \myEndLine
		c4:m7 f2.:7 | c4:m7 f2.:7 |
	} \alternative {
		{
			bes2 a:7 | f:7 f:5+ | \myEndLineVoltaNotLast
		}
		{
			bes2 ees:6 | bes1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
{
	\tempo "Andante" 4 = 88
	\time 2/2
	\key bes \major

	\partial 2. f4 g f |

	\repeat volta 2 {

		%% part "A"
		d' bes r d | c bes r d | d ( bes2.~ | bes4 ) d, ees d |
		g f r a | g f r a | a ( f2.~ | f4 ) f g f |
		d' bes r d | c bes r d | d ( bes2.~ | bes4 ) d, ees d |
		g f r a | g f r g | bes1~ | bes4 bes a aes |
		g bes2. | ees4 bes2 c4 | d1~ | d4 g, fis f |
		e g2. | d'4 bes2 d4 | c1~ | c4 f, g f |
		d'4 bes r d | c bes r d | d ( bes2.~ |
		bes4 ) d, ees d | g f r a | g f r d' |
	} \alternative {
		{
			d ( bes2. ) | r4 f g f |
		}
		{
			d' ( bes2.~ | bes4 ) r4 r2 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	A Cup of Cof -- fee a sand -- wich and you, __ A co -- zy
	cor -- ner, a ta -- ble for two, __ A chance to
	whis -- per and cud -- dle and coo __ With lots of
	hug -- gin' and kiss -- in' in view __ I don't need
	mus -- ic lob -- ster or wine. __ When -- ev -- er
	your eyes look in -- to mine __ The things I
	long for are sim -- ple and few; __
	A cup of cof -- fee, a sand __ wich and you! A cup of

	you! __
}
% endif
