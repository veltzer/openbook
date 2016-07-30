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
	attributes['title']='All Or Nothing At All'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Arthur Altman'
	# from the fake book
	attributes['poet']='Jack Lawrence'
	# from the fake book
	attributes['piece']='Moderately Slow'
	# from the fake book
	attributes['copyright']='1930, 1940 by MCA MUSIC PUBLISHING, A Division of MCA Inc. Copyright Renewed'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='4a4a2f24-ed86-11e3-aaf5-87841dcdcaf2'
	attributes['structure']='AABA'
	attributes['location']='jfb:41'

	attributes['idyoutuberemark1']='Diana Krall in a good version of this one'
	attributes['idyoutube1']='GHyT8m6mSuI'
	attributes['idyoutuberemark2']='Early Frank with Orchestra'
	attributes['idyoutube2']='u7klm1GS3v8'
	attributes['lyricsurl']='http://www.azlyrics.com/lyrics/franksinatra/allornothingatall.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from the fake book.
	- put in the tunes structure
	- added the meta data from the fake book.
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
	- how do I make the a:m chord in the second B part not appear on the page after the line break?
	- add another version of this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	a1*2:m | a1:m7 | a:m6 | \myEndLine
	a2:m a:m6 | a1:m | bes2:9 bes:6 | bes:aug bes:7 | \myEndLine
	g1:m | e2:m7.5- a:7.9- | d1*2:m | \myEndLine
	g1:7 | g2.:7 g4:7.5+ | c1:maj7 | b2:m7.5- e:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	a1*2:m | a1:m7 | a2:m6 a:m | \myEndLine
	a:m a:m6 | a1:m | bes2:9 bes:6 | bes:aug bes:7 | \myEndLine
	g1:m | e2:m7.5- a:7.9- | d1*2:m | \myEndLine
	g1:7 | g2.:7 g4:7.5+ | c1:maj7 | bes2:m7 ees:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	aes aes:aug | aes:6 aes:aug | aes aes:aug | aes:6 aes4:aug ees:7 | \myEndLine
	aes2 aes:aug | des aes | ees1:9 | ees2:aug ees:7 | \myEndLine
	bes:m7 ees:7 | bes:m7 ees:7 | bes:m7 ees:7 | g:m7.5- c:7 | \myEndLine
	f1:m | des:7 | c:7 | e:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	a1*2:m | a1:m7 | a:m6 | \myEndLine
	a1*2:m | bes2:9 bes:6 | bes:aug bes:7 | \myEndLine
	g1:m | e2:m7.5- a:7.9- | d1:m | b2:m7.5- e:7 | \myEndLine
	a1:m | d2:m7.5- g:7.11 | c1 | c:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 168
	\time 4/4
	\key c \major

	%% part "A"
	e1~ | e4 e \tuplet 3/2 { e f c } | e1~ | e2. r4 |
	e2 e | e \tuplet 3/2 { e4 g c, } | d4. d8 d2~ | d2. r4 |
	d2 d | d \tuplet 3/2 { e4 cis d } | a'4. a8 a2~ | a b4 a |
	g g2 g4 | g g2 g4 | g1 | r |

	%% part "A"
	e~ | e4 e \tuplet 3/2 { e f c } | e1~ | e2. r4 |
	e2 e | e \tuplet 3/2 { e4 g c, } | d4. d8 d2~ | d2. r4 |
	d4. d8 d4. d8 | d4. d8 \tuplet 3/2 { e4 cis d } | a'4. a8 a2~ | a b4 a |
	g g2 g4 | g g2 g4 | g1~ | g4 r r ees |

	%% part "B"
	c' c c c | c4. c8 \tuplet 3/2 { c4 des aes } | c1~ | c2. ees,4 |
	c'4. c8 c4. c8 | des2 \tuplet 3/2 { c4 bes aes } | g1~ | g2. ees4 |
	\tuplet 3/2 { bes' bes bes } bes4. bes8 | \tuplet 3/2 { bes4 bes bes } \tuplet 3/2 { bes c g } | bes1~ | bes2 c4 bes |
	aes2 aes4 aes | aes aes2 aes4 | g1 | r4 d c b |

	%% part "A"
	e1 | \tuplet 3/2 { e4 f c } \tuplet 3/2 { e f c } | e1~ | e2. r4 |
	e2 e | e \tuplet 3/2 { e4 g c, } | d4. d8 d2~ | d2. r4 |
	d2 d | d4. d8 \tuplet 3/2 { e4 cis d } | a'1 | b |
	c1~ | c4 c \tuplet 3/2 { c c c } | c1~ | c2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	All, __ Or Noth -- ing At All. __
	Half a love nev -- er ap -- pealed to me. __
	If your heart nev -- er could yield to me, __
	then I'd rath -- er have noth -- ing at all!

	%% part "A"
	All __ Or Noth -- ing At All! __
	If it's love, there is no in -- be -- tween. __
	Why be -- gin, then cry for some -- thing that might have been. __
	No, I'd rath -- er have noth -- ing at all. __

	%% part "B"
	But, please, don't bring your lips so close to my cheek. __
	Don't smile or I'll be lost be -- yond re -- call. __
	The kiss in your eyes, the touch of your hand makes me weak, __
	And my heart may grow diz -- zy and fall.

	%% part "A"
	And if I fell un -- der the spell of your call. __
	I would be caught in the un -- der -- tow. __
	So, you see, I've got to say: No! No!
	All __ Or Noth -- ing At All! __
}
% endif
