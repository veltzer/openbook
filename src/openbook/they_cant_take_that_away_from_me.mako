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

	attributes['title']='They Can\'t Take That Away From Me'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='George Gershwin'
	# from the fake book
	attributes['poet']='Ira Gershwin'
	# from the fake book
	attributes['piece']='Moderately'
	attributes['copyright']='1937 by Gershwin Publishing Corporation'
	attributes['copyrightextra']='Copyright renewed, Assigned to Chappell & Co., Inc.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='d0904c80-d84b-11e3-b741-dbf5614f4f33'
	attributes['structure']='AABA'
	attributes['location']='jfb:390'

	attributes['idyoutuberemark1']='Louis and Ella in a great performance'
	attributes['idyoutube1']='ExmoiGZuiFQ'
	attributes['idyoutuberemark2']='Tony Bennett and Elvis Constello...'
	attributes['idyoutube2']='x6uDp5lYPzs'
	attributes['lyricsurl']='http://www.lyrics007.com/Ella%20Fitzgerald%20Lyrics/They%20Can%27t%20Take%20That%20Away%20From%20Me%20Lyrics.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added a lyrics url.
	- put in the fake book meta data.
	- put in the fake book chords.
	- put in the fake book lyrics.
	- put in the fake book tune.
	- put in youtube performances.
	- brought in the epdf from the fake book for this tune.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- heard the tune to make sure it sounds good and in the right tempo.
	TODO:
	- find another version of this tune?
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	%% Intro
	\partial 8*7 s8*7 |

	\myMark "A"
	\startPart
	ees1:6 | ees2/g ges:dim7 | f:m7 bes:9 | f:m7 bes:7.11 | \myEndLine
	ees1 | bes2:m7 ees:13 | aes c4:7 f:7 | f1:m7/bes | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees1:6 | ees2/g ges:dim7 | f:m7 bes:7 | f:m7 bes:7.11 | \myEndLine
	ees1 | bes2:m7 ees:13 | aes bes:7 | ees1:6 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	g2:m c4:7 d:7.9- | g2:m c4:7 d:7.9- | g2:m a:7 | a:m7 d:7 | \myEndLine
	g2:m c4:7 d:7.9- | g2:m bes4:m c:7 | f2:7 bes:7 | f1:m7/bes | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees1:6 | ees2/g ges:dim7 | f:m7 bes:7 | f:m7 bes:5.11 | \myEndLine
	ees:7 d:7 | bes2:m7 ees:7 | aes bes:7 | c:m aes:m6 | \myEndLine
	ees1 | f2:m7 bes:7 | ees1*2 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 120
	\time 4/4
	\key ees \major

	%% part "Intro"
	\partial 8*7 ees8 ees ees ees4 ees8 g~ |

	%% part "A"
	g1 | r8 ees ees ees ees4 ees8 bes~ | bes1 | r8 ees ees ees ees4 ees8 bes'~ |
	bes1~ | bes8 r c4 c c | ees8.[ c16 bes8. aes16] bes4 g8 f | r ees ees ees ees4 ees8 g~ |

	%% part "A"
	g1 | r8 ees ees ees ees4 ees8 bes~ | bes1 | r8 ees ees ees ees4 ees8 bes'~ |
	bes1~ | bes4 c4 c c | ees8.[ c16 bes8. aes16] bes4 g8 ees~ | ees2. g8 a! |

	%% part "B"
	bes4 g d' c | bes g d' c8 bes | g g g2 f4 | d2. g8 a! |
	bes4 a! d c | bes g c c | f,1 | r8 ees ees ees ees4 ees8 g~ |

	%% part "A"
	g1 | r8 ees ees ees ees4 ees8 bes~ | bes1 | r8 ees ees ees ees4 ees8 c'~ |
	c1~ | c4 ees ees ees | ees8.[ c16 bes8. aes16] bes4 g8 ees~ | ees r bes'2 aes4 |
	g aes g bes | f2 g | ees1~ | ees2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	The way you wear your hat, __
	the way you sip your tea, __
	the mem -- 'ry of all that __
	no, no! They Can't Take That A -- way From Me!

	%% part "A"
	The way your smile just beams, __
	the way you sing off key, __
	the way you haunt my dreams, __
	no, no! They Can't Take That A -- way From Me! __

	%% part "B"
	We may nev -- er, nev -- er meet a -- gain on the bump -- y road to love,
	still I'll al -- ways, al -- ways keep the mem -- 'ry of

	%% part "A"
	the way you hold your knife, __
	the way we danced till three, __
	the way you changed my life, __
	no, no! They Can't Take That A -- way From Me! __
	No! They Can't Take That A -- way From Me! __
}
% endif
