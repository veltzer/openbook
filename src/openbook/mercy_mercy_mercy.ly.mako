<%page args='part'/>
% if part=='Vars':
<%
	from scripts import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	version['doLyricsmoremore']=True
	attributes.add_version('Fake', version)
	attributes.set_default_version_name('Fake')

	attributes['title']='Mercy Mercy Mercy'
	attributes['style']='Jazz'
	attributes['composer']='Joe Zawinul'
	attributes['poet']='Vincent Levy, Gail Fisher'
	attributes['piece']='Funk'
	attributes['copyright']='1966 ZAWINUL MUSIC, ADivisionofGopam Enterprises,Inc.'

	attributes['typesetter']='Werner Grünberger <openbook@wernergruenberger.de>'
	attributes['structure']='AB'
	attributes['location']='rbk2:242'

	attributes['idyoutuberemark1']='Joe Zawinul -- Mercy, Mercy, Mercy.'
	attributes['idyoutube1']='ycNv57aZFTg'
	attributes['lyricsurl']='https://www.songtexte.com/songtext/marlena-shaw/mercy-mercy-mercy-5bd22b70.html'
%>
% endif

% if part=='Doc':
	DONE:
	- filled in meta data from the fake book.
	- added real book epdf.
	- added fake book chords.
	- added fake book tune.
	- added fake book lyrics.
	- check fake book chords.
	- check fake book tune.
	- check fake book lyrics.
	- hear the tune to make sure it's ok.
	- add you tube performances.
	- add lyricsurl.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	bes1:7 | es1:7 | bes1:7 | es1:7 \myEndLine
	bes1:7 | es1:7 | bes1:7 | es1:7 \myEndLine
	\endPart


	\myMark "B"
	\startPart
	bes2 es2:/+bes | bes2:7 es2:/+bes | bes2 es2:/+bes | bes2:7 es2:/+bes \myEndLine
	bes2 bes4:/+d es4 | f1:sus7 | bes2 bes4:/+d es4 | f1:sus7 \myEndLine
	c1:m7 | d:m7 | g4:m f g:m f | g1:m \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Andante" 4 = 84
	\time 4/4
	\key bes \major

	%% part "A"
	r4 g'8 f8~ f4 d8 bes8 |
	c8 bes8 bes8 g8 bes8 bes8 c8 bes8 |
	r4 g'8 f8~ f4 d8 bes8 |
	c8 bes8 bes8 g8 bes8 bes8 c8 bes8 |
	r4 g'8 f8~ f4 d8 bes8 |
	c8 bes8 bes8 g8 bes8 bes8 c8 bes8 |
	r4 g'8 f8~ f4 d8 bes8 |
	c8 bes8 bes8 g8 bes8 bes8 c8 bes8 |

	%% part "B"
	f'4 f4 g8 g4 aes8~ |
	aes4 aes4 g8 g4 f8~ |
	f4 f4 g8 g4 as8~ |
	as4 as4 g8 g4 f8 ~|
	f4 bes,8 bes8 d8 d8 es8 es8|
	f8^^ r8 es4 es8 es8 es8 d8~ |
	d8 r8 bes8 bes8 d8 d8 es8 es8|
	f8^^ r8 r4 r8 f,8 g8 bes8 |
	c4. c8~ c4 bes8 c8 |
	d4. d8~ d8 c8 d8 f8 |
	g4. f8 g4. f8 |
	g16 f16 g8 r4 r2 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	It seems life has played a game on me _ _ _
	I'm lost in a sea of misery _ _ _ _ _
	My love _ has turned her back on me _ _ _
	Heartaches why won't you _ _ let me be I said now

	%% part "B"
	Ba -- by have some mer -- cy please
	Dont leave me baby on bended knee _
	Oh please mer -- cy mer -- cy mer -- cy please
	Have mer -- cy on me
	Mer -- cy mer -- cy mer -- cy please
	How can I face life _ with out you
	What would I do if we were through
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {

	%% part "A"
	Don't you know -- babe I wait for you _ every single night
	Hop -- ing you'll re -- turn and make things right _ _ _
	You don′t show and I′m sitting here all alone (all alone) _
	To pray you're gon -- na call me on the phone _ _

	%% part "B"
	Ba -- by, have some mer -- cy please
	Don′t make your mama beg on bended knee Oh please
	mer -- cy mer -- cy mer -- cy please
	Have mer -- cy on me
	mer -- cy mer -- cy mer -- cy please

	You know I love you and I'm beg -- ging
	For one more chance, one chance, once more
}
% endif

% if part=='LyricsmoremoreFake':
\lyricmode {

	%% part "A"
	I know life′s got _ ma -- ny a twist _ _ _
	Loving you, baby, is a thing I cannot resist _ _ _
	Your love and un -- der -- stan -- ding you′ve been giving giving giving
	Without it, I just can't _ go on living _ _ _

	%% part "B"
	Ba -- by, have some mer -- cy please
	Don't leave me, baby, on bended knee
	I say now, mer -- cy, mer -- cy, mer -- cy please
	Have mer -- cy on me
	mer -- cy, mer -- cy, mer -- cy please
	Have mer -- cy on me.
}
% endif
