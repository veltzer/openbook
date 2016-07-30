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
	attributes['title']='Strangers In The Night'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Bert Kaempfert'
	# from the fake book
	attributes['poet']='Charles Singleton, Eddie Snyder'
	# from the fake book
	attributes['piece']='Moderately Slow'
	# from the fake book
	attributes['copyright']='1966 by Champion Music Corporation and Screen Gems-EMI'
	# from the fake book
	attributes['copyrightextra']='Sole Selling Agent MCA MUSIC PUBLISHING, A Division of MCA Inc., New York, NY'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='2af3e35c-e252-11e3-abb7-932771d3c7a0'
	attributes['structure']='AA\'BA'
	attributes['location']='jfb:364-365'

	attributes['idyoutuberemark1']='Cannonical version by Frank'
	attributes['idyoutube1']='hlSbSKNk9f0'
	attributes['idyoutuberemark2']='Another version by Frank'
	attributes['idyoutube2']='nHuko5BCFzA'
	attributes['lyricsurl']='http://www.lyricsfreak.com/f/frank+sinatra/strangers+in+the+night_20056148.html'
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
	- add another version of this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f1*4:maj7 | \myEndLine
	f1:maj7 | f2/a aes:dim7 | g:m7 ees/g | g:m6 ees/g | \myEndLine
	\endPart

	\myMark "A'"
	\startPart
	g1*4:m7 | \myEndLine
	g1.:m7 g4:m7/c c:7.9- | f1*2:maj7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	a1*2:m7.5- | d:7.9- | \myEndLine
	g1:m7 | bes:m6 | f2 d:m7 | g:m7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1*3:maj7 | f2:maj7 f4/a aes:dim7 | \myEndLine
	g1:m | c2:7.9- g4:m7/c c:7.9- | f1*2:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Andante" 4 = 88
	\time 2/2
	\key f \major

	%% part "A"
	f8 g g f g2~ | g8 f g a g4 f | e8 f f e f2~ | f8 e f g f4 e |
	d8 e e d e2~ | e8 d e f e4 d | bes'1~ | bes2. r4 |

	%% part "A'"
	g8 a a g a2~ | a8 g a bes a4 g | f8 g g f g2~ | g8 f g a g4 f |
	e8 f f e f2~ | f8 e f g f4 e | c'1~ | c |

	%% part "B"
	c8 bes bes a a2~ | a8 bes bes c c bes bes a | c bes bes a a2~ | a8 bes bes c c bes bes a |
	bes a a g g2 | bes8 a a g g2 | bes8 a a g g f e f | a g g f f e d e |

	%% part "A"
	f8 g g f g2~ | g8 f g a g4 f | e8 f f e f2~ | f8 e f g f4 e |
	d8 e e d e2~ | e8 e f g f4 e | f1~ | f2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Stran -- gers In The Night __ ex -- chang -- ing glanc -- es
	won -- d'ring in the night __ what were the chanc -- es
	we'd be shar -- ing love __ be -- fore the night was through. __

	%% part "A'"
	Some -- thing in your eyes __ was so in -- vit -- ing,
	some -- thing in your smile __ was so ex -- cit -- ing,
	some -- thing in my heart __ told me I must have you. __

	%% part "B"
	Stran -- gers In The Night, __ two lone -- ly peo -- ple we were
	Stran -- gers In The Night __ up tp the mo -- ment when we
	said our first hel -- lo. Lit -- tle did we know
	love was just a glance a -- way, a warm em -- brac -- ing dance a -- way and

	%% part "A"
	ev -- er since that night __ we've been to -- geth -- er.
	Lov -- ers at first sight, __ in love for -- ev -- er.
	It turned out so right __ for Strang -- ers In The Night. __
}
% endif
