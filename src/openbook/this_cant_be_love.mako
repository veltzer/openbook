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

	attributes['title']='This Can\'t Be Love'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Richard Rodgers'
	# from the fake book
	attributes['poet']='Lorenz Hart'
	# from the fake book
	attributes['piece']='Moderately'
	attributes['copyright']='1938 by Chappell & Co., Inc. Copyright Renewed'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='c01fbf4c-d7a2-11e3-a29f-abfec0c435b3'
	attributes['structure']='AABA'
	attributes['location']='jfb:392'

	attributes['idyoutuberemark1']='I like this version by Diana Krall'
	attributes['idyoutube1']='9uRGw8Bc0s0'
	attributes['idyoutuberemark2']='Well know version by Nat King Cole'
	attributes['idyoutube2']='dfWsU4IDCS0'
	attributes['lyricsurl']='http://www.lyricsfreak.com/n/nat+king+cole/this+cant+be+love_20098113.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added meta data from the fake book.
	- added a lyrics url.
	- added in youtube performances.
	- put in the fake book chords.
	- put in the fake book lyrics.
	- put in the fake book tune.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- heard the tune to make sure it sounds good and in the right tempo.
	TODO:
	- bring in another version of this tune
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	g1*2:6 | c:7 | \myEndLine
	g1*2 | a2:m7 d:7 | a:m7 d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g1*2:6 | c:7 | \myEndLine
	g1 | a2:m7 d:7 | g c:7 | g1 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	fis:m7 | b:7 | e1*2:m7 | \myEndLine
	f1:13 | e:7.5+ | a:9 | d:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g1*2 | c:7 | \myEndLine
	g1:6 | a2:m7 d:7 | g d:7 | g1 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Presto" 4 = 200
	\time 2/2
	\key g \major

	%% part "A"
	g'2 fis4 g | d g fis g | e2 g4 a~ | a2. g4 |
	b r d, d~ | d e g2 | a1~ | a2. r4 |

	%% part "A"
	g2 fis4 g | d g fis g | e2 g4 a~ | a2. g4 |
	d' r g, g~ | g b a2 | g1~ | g4 b b b |

	%% part "B"
	cis, r e dis~ | dis b' b8 b4. | d1 | r4 b b b |
	d1 | c | b | a |

	%% part "A"
	g2 fis4 g | d g fis g | e2 g4 a~ | a g a g |
	e' r g, g~ | g b a2 | g1~ | g2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	This Can't Be Love be -- cause I feel so well, __
	no sobs, no sor -- rows, no sighs; __

	%% part "A"
	This Can't Be Love, I get no diz -- zy spell. __
	My head is not __ in the skies, __

	%% part "B"
	my heart does not stand still, __ just hear it beat!
	This is too sweet to be love.

	%% part "A"
	This Can't Be Love be -- cause I feel so well; __
	but still I love to look __ in your eyes. __
}
% endif
