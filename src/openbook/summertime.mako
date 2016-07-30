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
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Aebersold', version)

	attributes['title']='Summertime'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='George Gershwin'
	# from the fake book
	attributes['poet']='DuBose Heyward'
	# from the fake book
	attributes['piece']='Slowly'
	# from the fake book
	attributes['copyright']='1935 by Gershwin Publishing Corporation'
	# from the fake book
	attributes['copyrightextra']='Copyright Renewed. Assigned to Chappell & Co., Inc.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='2615b7ec-a26f-11df-b010-0019d11e5a41'
	attributes['structure']='AB'
	attributes['location']='rbk2:323,jfb:370,ja54:4'

	attributes['idyoutuberemark1']='Janis!'
	attributes['idyoutube1']='mzNEgcqWDG4'
	attributes['idyoutuberemark2']='Ella Fitzgerald with Louis'
	attributes['idyoutube2']='MIDOEsQL7lA'
	attributes['lyricsurl']='http://www.stlyrics.com/songs/g/georgegershwin8836/summertime299720.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added the meta data for this tune from the fake book.
	- brought in locations for fake, real and aebersold.
	- put in the aebersold chords.
	- put in the aebersold tune.
	- put in the aebersold lyrics.
	- checked the aebersold chords.
	- checked the aebersold tune.
	- checked the aebersold lyrics.
	- in the aebersold version added parens on the turn around notes.
	- in the aebersold version added phrases.
	- heard the aebersold version to make sure it's ok.
	- added youtube performances.
	- added lyrics url.
	- put in the fakebook chords.
	- put in the fakebook tune.
	- put in the fakebook lyrics.
	- checked the fakebook chords.
	- checked the fakebook tune.
	- checked the fakebook lyrics.
	- hear the fakebook version to hear that the tempo is right and there are no errors.
	TODO:
	- add real book version.
	- in the Aebersold tune there are two versions: one marked out and one not. The only
		difference between then is that the marked out one has phrases lined out (as
		in the Aebersold booklet). The reasons it is not enabled is that it makes
		the lyrics come out wrong. It seems that phrases are related to lyrics rendering.
		Find out why and how and fix it (try to get the phrases back while keeping the
		lyrics intact).
% endif

% if part=='ChordsAebersold':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		d1*3:m | d2:m d:7.9+ | \myEndLine
		g1*2:m | e1:m7.5- | a:7.9+ | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		d1*3:m | g2:m c:7 | \myEndLine
		f1:maj7 | e2:m7.5- a:7.9+ | d1:m | a:7.9+ | \myEndLine
		\endPart
	}

	\endSong
	\endChords
}
% endif

% if part=='VoiceAebersold':
{
	\tempo "Moderato" 4 = 108
	\time 4/4
	\key d \minor

	\partial 4 a'8. f16 |

	\repeat volta 2 {

		%% part "A"
		a1~ | a8 r g8. f16 g8. a16 f4 | d2 a~ | a4 r a' f |
		g8 g~ g2. | r4 f8. d16 f8. d16 f4 | e1~ | e2 r8 a4 f8 |

		%% part "B"
		a8 a~ a2. | r4 g8. f16 g8. a16 f4 | d2 a~ | a r4 a |
		c a8 c d f~ f4 | a8 g~ g4 f2 | d1~ | d4 r r <\parenthesize a'>8. <\parenthesize f>16 |
	}
}
% endif

% if part=='LyricsAebersold':
%% these lyrics are from the Internet and adjusted for this tune...
\lyricmode {

	%% part "A"
	Sum -- mer -- time, __
	And the liv -- in' is eas -- y __
	Fish are jump -- in' __
	And the cot -- ton is high __

	%% part "B"
	Your dad -- dy's rich __
	And yo' mam -- ma's good look -- in' __
	So hush lit -- tle ba -- by __
	Do -- n't __ you cry __

	One_of these
}
% endif

% if part=='LyricsmoreAebersold':
\lyricmode {

	%% part "A"
	One_of these mornings __
	You're going to rise up sing -- ing __
	Then you'll spread your_wings __
	And you'll take to the sky __

	%% part "B"
	But_till that morn -- ing __
	There's a -- 'no -- thing can harm you __
	With da -- ddy and ma -- mma st -- an -- ding by __
}
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 2 s2 |

	\myMark "A"
	\startPart
	a:m6 e:7/b | a:m6/c e:7/b | a:m6 e:7/b | a:m6/c e4:7/b a:m6 | \myEndLine
	d2:m f | f2.:maj7 dis4:dim | e2 b:7 | e e8:m6 e4.:7.5- | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	a2:m6 e:7/b | a:m6/c e:7/b | a:m6 e:7/b | a:m d:7 | \myEndLine
	c a:m | d d:m7/g | a1:m | a2:m a:m7+ | a:m6 a:m7+ | d:9 e:5+ | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	a2.:m6 e4:7/b | a2:m6/c e:7/b | a:m6 e:7/b | a:m6/c e4:7/b a:m6 | \myEndLine
	d2:m f | f2.:maj dis4:dim | e2 b:7 | e e4:m6 e:7.5- | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	a2:m6 e:7/b | a:m6/c e:7/b | a:m6 e:7/b | a:m d:7 | \myEndLine
	c a:m | d d:m7/g | a1:m | d2 f | c f:9 | bes e:13.11 | a1:m | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Moderato" 4 = 108
	\time 2/2
	\key a \minor

	\partial 2 e'4 c |

	%% part "A"
	e1~ | e8 r d8. c16 d8. e16 c4 | a2 e~ | e4 r e' c |
	d8 d4.~ d2 | r4 c8. a16 c8. a16 c4 | b1~ | b2 r8 e4 c8 |

	%% part "B"
	e8 e4 e8~ e2 | r4 d8. c16 d8. e16 c4 | a2 e~ | e r4 e |
	g e8 g a4 c | e8 d4. c2 | a1~ | a1~ | a4 r4 r2 | r \tuplet 3/2 { e'4 e c } |

	%% part "A"
	e4 e2. | r8. e16 d8. c16 d8. e16 c4 | a2 e~ | e e'4 c |
	d8 d4 d8~ d2 | r4 c8. a16 c8. a16 c4 | b1~ | b2 r8 e e c |

	%% part "B"
	e8 e4.~ e2 | r4 d8. c16 d8. e16 c4 | a2 e~ | e r4 e |
	g e8 g a4 c | e8 d4. c2 | a1~ | a1~ | a1~ | a1~ | a2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Sum -- mer -- time __
	an' the liv -- in' is eas -- y, __
	fish are jump -- in'; __
	an' the cot -- ton is high. __

	%% part "B"
	Oh, yo' dad -- dy's rich, __
	an' yo' ma is good look -- in', __
	so hush, lit -- tle ba -- by, __
	don' __ _ yo' cry. __

	%% part "A"
	One of these morn -- in's __
	you goin' to rise __ _ up sing -- in', __
	then you'll spread yo' wings __
	an' you'll take __ _ the sky. __

	%% part "B"
	But 'til that morn -- in' __
	there's a -- noth -- in' can harm you __
	with dad -- dy an' mam -- my
	stand -- _ in' by. __
}
% endif
