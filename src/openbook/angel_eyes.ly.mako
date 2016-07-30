<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	# from the fake book
	attributes['title']='Angel Eyes'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Matt Dennis'
	# from the fake book
	attributes['poet']='Earl Brent'
	# from the fake book
	attributes['piece']='Slow Blues'
	# from the fake book
	attributes['copyright']='1946 (Renewed 1973) Dorsey Brothers Music'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='0a43bee4-e044-11e3-9617-b76a2faa3d0b'
	attributes['structure']='AABA'
	attributes['location']='jfb:45'

	attributes['idyoutuberemark1']='Chet Baker in a very good version'
	attributes['idyoutube1']='shuy1hpUGvQ'
	attributes['idyoutuberemark2']='Stings version (I like this one...)'
	attributes['idyoutube2']='QS1MgqJ7B3Y'
	attributes['lyricsurl']='http://www.metrolyrics.com/angel-eyes-lyrics-ella-fitzgerald.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the fake book.
	- put in the tunes structure
	- added the meta data from the fake book.
	- put in the lyrics (fakebook).
	- put in the chords (fakebook).
	- put in the tune (fakebook).
	- check the chords (fakebook).
	- check the tune (fakebook).
	- check the lyrics (fakebook).
	- heard the tune to check that it is right and adjust the tempo.
	- added lyrics url.
	- added youtube performances.
	TODO:
	- add another version of this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		c2:m7 aes:7/c | c:m6 aes:9/c | c:m9 a:m7.5- | ees4:13 aes:maj7 g:7.5- d:m11 | \myEndLine
		c2:m9 aes:7/c | c:m6 aes:9/c | d:7.9- aes4:9 g:7.9- |
	} \alternative {
		{
			c2:m7 aes4:9 g:7.9- | \myEndLineVoltaNotLast
		}
		{
			c1:m | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	bes2:m9 ees:7.9- | aes:maj7.9 f:7.9- | bes:m9 ees:7.9- | aes2.:maj7.9 des4:maj7.9 | \myEndLine
	a2:m9 d:7.9- | g2.:maj7 c4:maj7.9 | cis2:m7 fis:7.5+ | d:m7 g:7.5+ | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c2:m9 aes:7/c | c:m6 aes:9/c | c:m9 a:m7.5- | d:m7 g4:7.5- g:7 | \myEndLine
	c2:m9 aes:7/c | c:m6 aes:9/c | d:7.9- aes4:9 g:7.5+ | c2:m c:m/bes | aes:9 g:7.5+ | c1:m7+ | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Andante" 4 = 88
	\time 4/4
	\key c \minor

	%% part "A"
	\repeat volta 2 {
		r8. c16 g'8 ges8~ ges4. f8 | ees4 \tuplet 3/2 { ees8 c ees~ } ees2 |
		r8. c16 ees8 g d'8. d16 c8 g~ | g1 |
		r8. c,16 g'8 ges8~ ges4. f8 | ees8. ees16 c8 ees8~ ees4. c8 |
		ees8. c16 ees8. c16 ees4 ees8 c~ |
	} \alternative {
		{
			c2 r |
		}
		{
			c2. c'4 |
		}
	}

	%% part "B"
	c8 c4.~ c8 c bes ees,~ | ees ees4.~ ees2 | c'8 c4 c16 bes c4 bes8 ees,~ | ees2. c'4 |
	b2~ b8 a4 b16 a | d,8 d4.~ d4 r8 e | fis8. fis16 fis8 fis~ fis4 fis8 g~ | g1 |

	%% part "A"
	r8. c,16 g'8 ges8~ ges4. f8 | ees4 \tuplet 3/2 { ees8 c ees~ } ees2 |
	r8. c16 ees8 g d'8. d16 c8 g~ | g1 |
	r8. c,16 g'8 ges8~ ges4. f8 | ees8. ees16 c8 ees8~ ees4. c8 |
	ees8. c16 ees8. c16 ees4 ees8 c~ | c1 |
	ees8. c16 ees8. c16 bes'8. g16 f8 g~ | g1 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Try to think __
	that love's not a -- round __
	still it's un -- com -- fort -- 'bly near. __
	My old heart __
	ain't gain -- in' no ground __
	be -- cause my An -- gel Eyes ain't here. __
	_

	%% part "B"
	So drink up __ all you peo -- ple, __
	or -- der an -- y -- thing you see. __
	Have fun, __ you hap -- py peo -- ple __
	the drink and the laugh's __ on me. __

	%% part "A"
	Par -- don me, __
	but I got -- ta run, __
	the fact's un -- com -- mon -- ly clear. __
	Got -- ta find __ who's now "\"Num" -- ber "One\""__
	and why my An -- gel Eyes ain't here. __
	'Scuse me while I di -- s -- ap -- pear. __
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {

	%% part "A"
	An -- gel Eyes __
	that old dev -- il sent, __
	they glow un -- bear -- a -- bly bright. __
	Need I say __ that my love's mis -- spent, __
	mis -- spent with An -- gel Eyes to -- night. __
}
% endif
