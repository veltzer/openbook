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
	attributes['title']='Opus One'
	# from the fake book
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Sy Oliver'
	# from the fake book
	attributes['poet']='Sy Oliver'
	# from the fake book
	attributes['piece']='Moderate Jump Tempo'
	# from the fake book
	attributes['copyright']='1943 (Renewed) Embassy Music Corporation, New York.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='31cf66b6-11b8-11e4-bcfe-f76051fd87b1'
	attributes['structure']='AABA'
	attributes['structureremark']='The A\'s are just a little bit different'
	attributes['location']='jfb:291'

	attributes['idyoutuberemark1']='Nat King Cole swings'
	attributes['idyoutube1']='a33vdj7zoB0'
	attributes['idyoutuberemark2']='Tommy Dorsey\'s Orchestra swings'
	attributes['idyoutube2']='rV9LhjTr5Bc'
	attributes['lyricsurl']='http://www.songlyrics.com/the-mills-brothers/opus-one-lyrics/'
%>
% endif

% if part=='Doc':
	DONE:
	- added the fake book epdf.
	- filled in the meta data from the fake book.
	- put in the tunes structure.
	- wrote down the fake book chords.
	- wrote down the fake book lyrics.
	- wrote down the fake book tune.
	- check the fake book chords.
	- check the fake book tune.
	- check the fake book lyrics.
	- played the midi to hear that it sounds right.
	- added youtube performances.
	- added a lyrics url.
	TODO:
	- get another version in here (from where?)
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\myMark "A"
	\startPart
	g1*2 | c:9 | \myEndLine
	a1:9 | a2:m7 d:9 | g bes:dim7 | a:m7 d4:9 d:aug | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g1*2 | c:9 | \myEndLine
	a1:9 | a2:m7 d:9 | g c:9 | g1 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	bes2 g:m7 | c:m7 f:7.9- | bes:6 g:7.5+ | c:9 f:9.5+ | \myEndLine
	des bes:m7 | ees:m7 aes:7.9- | des2..:6 des8 | des8 d2..:13 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g1*2 | c:9 | \myEndLine
	a1:9 | a2:m7 d:9 | g c:9 | g4 ees:9 g2 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 168
	\time 2/2
	\key g \major

	\partial 8 d8 |

	%% part "A"
	e g fis4 e4. d8 | e g fis e~ e4. d8 | e g fis4 e4. d8 | e g fis e~ e4. d8 |
	e g fis4 e4. d8 | e g fis e~ e4. d8 | e g fis4 e8 g fis4 | e8 g fis e~ e4. d8 |

	%% part "A"
	e g fis4 e4. d8 | e g fis e~ e4. d8 | e g fis4 e4. d8 | e g fis e~ e4. d8 |
	e g fis4 e4. d8 | e g fis e~ e4. d8 | e g e d e g e g~ | g4. b8~ b d b g |

	%% part "B"
	f! bes4 r8 bes4. g8 | c4 c c8 d4 bes8~ | bes4. g8~ g4. g8~ | g4. g8~ g4. g8 |
	aes des4 r8 des4. bes8 | ees4 ees ees8 f4 des8~ | des2~ des4. des8~ | des8 d4.~ d4. d,8 |

	%% part "A"
	e g fis4 e4. d8 | e g fis e~ e4. d8 | e g fis4 e4. d8 | e g fis e~ e4. d8 |
	e g fis4 e4. d8 | e g fis e~ e4. d8 | e g e d e g e g~ | g2~ g8 r r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	I'm wrack -- in' my brain, to think of a name, __
	to give to this tune, so Per -- ry can croon, __
	and may -- be ol' Bing will give it a fling. __
	And that -- 'll start ev -- 'ry -- one hum -- min' the thing. __

	%% part "A"
	The mel -- o -- dy's dumb, re -- peat an' re -- peat. __
	But if you can swing, it's got a good beat. __
	And that's the main thing, to make with the feet. __
	'Cause ev -- 'ry -- one is swing -- in' to day. __

	%% part "B"
	So, __ I'll call it O -- pus One! It's not for Sam -- my Kaye. __
	Hey! __ hey! __ hey! __ It's O -- pus One! It's got to swing,
	not sway. __ May -- be, __

	%% part "A"
	if Mis -- ter Les Brown could make it re -- nown, __
	and Ray An -- tho -- ny could swing it for me. __
	There's nev -- er a doubt you'll knock your -- self out. __
	When -- ev -- er you can hear O -- pus One. __
}
% endif
