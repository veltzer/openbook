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

	# from the fake book
	attributes['title']='I Concentrate On You'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Cole Porter'
	# from the fake book
	attributes['poet']='Cole Porter'
	# from the fake book
	attributes['piece']='Slowly'
	# from the fake book
	attributes['copyright']='1939 by Chappell & Co., Inc.'
	# from the fake book
	attributes['copyrightextra']='Copyright Renenwed, Assigned to John F. Wharton, Trustee of the Cole Porter Musical & Literary Propery Trusts'
	# from the fake book
	attributes['copyrightextraextra']='Chappell & Co., Inc. owner of publication and allied rights throughout the World.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='74865056-6f44-11e5-89f9-3860779cb560'
	attributes['structure']='AA\'BA\'\''
	attributes['location']='jfb:152'

	attributes['idyoutuberemark1']='Sinatra in an old school orchestrated version'
	attributes['idyoutube1']='Nir7Yw6mTxM'
	attributes['idyoutuberemark2']='Ella with orchestra'
	attributes['idyoutube2']='u8j79CB2_Bo'
	attributes['lyricsurl']='http://www.azlyrics.com/lyrics/franksinatra/iconcentrateonyou.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the fake book.
	- added the meta data from the fake book.
	- put in the tunes structure
	- put in the chords (fakebook).
	- put in the lyrics (fakebook).
	- put in the tune (fakebook).
	- check the chords (fakebook).
	- check the tune (fakebook).
	- check the lyrics (fakebook).
	- heard the tune to check that it is right and adjust the tempo.
	- added lyrics url.
	- added youtube performances.
	TODO:
	- in the fake book version fix the boy/girl lyrics which are missing.
	- add another version of this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		ees1:6 | ees:maj7 | bes1*2:7 | ees1:m7 | des2:m7 ges:9 | ces1:6 | aes2:m7 aes:m7/ges | \myEndLine
		f1:m7.5- | bes:7 | ees:m6 | c:m7.5- | f:7 | bes:7 | ees:6 | f2:m7 bes:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		ees1:6 | ees:maj7 | bes1*2:7 | ees1:m7 | des2:m7 ges:9 | ces1:6 | ces2:6 ces/bes | \myEndLine
		aes1:m7 | des:7 | ges:maj7 | b:maj7 | f:7 | bes:7 | ees2:6 aes:6 | ees ees:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		aes1:maj7 | aes:m7 | ees | g2:m7 c:7 | f1:m7 | bes:7 | ees:maj7 | ees:7 | \myEndLine
		aes:maj7 | des:7 | ges2:maj7 ges/f | ees:m7 ees:m/des | c1:m7.5- | f:7 | bes2 bes:maj7 | bes1:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		ees | ees:maj7 | a:m7.5- | d:7 | bes:m7 | ees2:7 aes:maj7 | d1:m7.5- | g:7 | \myEndLine
		g:m7.5- | c:7.5+ | f:m | fis:dim7 | f:7.5-/ces | bes:7 |
	} \alternative {
		{
			ees | f2:m7 bes:7 | \myEndLineVoltaNotLast
		}
		{
			ees2:6 aes:6 | ees1:6 | f1*2:m7 | bes1:7.9- | bes2:7.9- e:9 | ees1*4:6.9 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key ees \major

	\repeat volta 2 {

		%% part "A"
		r4 bes c ees | d2. c4 | d4. d8 d2~ | d2. r4 | r ees \tuplet 3/2 { ges aes bes } | aes2. ges4 | aes1~ | aes2. r4 |
		r aes \tuplet 3/2 { aes bes ces } | bes a aes2 | r4 aes ges f | ges1 | r4 f aes g | ges f2 ees4~ | ees1~ | ees2. r4 |

		%% part "A"
		r bes c ees | d2. c4 | d4. d8 d2~ | d2. r4 | r ees \tuplet 3/2 { ges aes bes } | aes2. ges4 | aes1~ | aes2. r4 |
		r aes \tuplet 3/2 { ces des ees } | des c! ces2 | r4 b bes a | bes1 | r4 f aes g | ges f2 ees4~ | ees1~ | ees4 r ees ees |

		%% part "B"
		c'2. c4 | b2. b4 | b2 bes2~ | bes bes,4. bes8 | aes'2. aes4 | aes2 g4. fis8 | g1~ | g2 ees4. ees8 |
		c'2 c4 c | ces2 \tuplet 3/2 { ces4 des ces } | ces2 bes~ | bes4 bes bes bes | bes2. bes4 | c2. bes8 c | d1~ | d2. r4 |

		%% part "A"
		r ees ees ees | d2. bes4 | c4. c8 c2~ | c2. r4 | r c b c | bes!2 \tuplet 3/2 { bes,4 c ees } | g1~ | g2. r4 |
		r g bes a | aes!2. g4 | g f e4. f8 | c'1 | r4 f, aes g | ges f2 ees4~ |
	} \alternative {
		{
			ees1~ | ees2. r4 |
		}
		{
			ees1~ | ees2 ees | f4. f8 f2~ | f f | g4. g8 g2~ | g bes | bes1~ | bes~ | bes4 r r2 | r1 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	When -- ev -- er skies look grey to me __
	and trou -- ble be -- gins to brew, __
	when -- ev -- er the win -- ter winds be -- come too strong,
	I Con -- cen -- trate On You. __

	%% part "A"
	When for -- tune cries "\"nay," "nay!\"" to me __
	and peo -- ple de -- clare "\"You're" "through,\"" __
	when -- ev -- er the blues be -- come my on -- ly song,
	I Con -- cen -- trate On You. __

	%% part "B"
	On your smile so sweet, so ten -- der, __
	when at first my kiss you de -- cline. __
	On the light in your eyes,
	when you sur -- ren -- der __ and once a -- gain our arms in -- ter -- twine. __

	%% part "A"
	And so when wise -- men say to me __
	that love's young dream nev -- er comes true. __
	To prove that e -- ven wise -- men can be wrong,
	I Con -- cen -- trate On You. __
	_ I con -- cen -- trate, __ and con -- cen -- trate __ on you. __
}
% endif
