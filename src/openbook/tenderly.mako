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
	attributes['title']='Tenderly'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Walter Gross'
	# from the fake book
	attributes['poet']='Jack Lawrence'
	# from the fake book
	attributes['piece']='Moderately'
	# from the fake book
	attributes['copyright']='1946, 1947, 1987 EDWIN H. MORRIS & COMPANY, A Division of MPL Communications, Inc.'
	# from the fake book
	attributes['copyrightextra']='Renewed 1974, 1975 EDWIN H. MORRIS & COMPANY, A Division of MPL Communications, Inc. International Copyright Secured. All Rights Reserved.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='37e8d9d8-db6c-11e3-8007-f7449ea11e17'
	attributes['structure']='ABAC'
	attributes['location']='jfb:381'

	attributes['idyoutuberemark1']='Beautiful lyric version by Chet Baker'
	attributes['idyoutube1']='H6mfWun73vI'
	attributes['idyoutuberemark2']='Vocal version by Sarah Vaughn'
	attributes['idyoutube2']='qNi6M_A9AzU'
	attributes['lyricsurl']='http://www.metrolyrics.com/tenderly-lyrics-ella-fitzgerald.html'
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

	\partial 4. s4. |

	\myMark "A"
	\startPart
	ees2.:maj7 | aes:9 | ees:m7 | aes:9 | \myEndLine
	f:m7 | des:9 | ees4 g:m7 f:m7 | ees2.:maj7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	f2.:m7.5- | bes:7 | f:m7.5- | bes2:7 b4:dim7 | \myEndLine
	c2.:m7 | f:7 | f:m9 | bes:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees2.:maj7 | aes:9 | ees:m7 | aes:9 | \myEndLine
	f:m7 | des:9 | ees4 g:m7 f:m7 | ees2.:maj7 | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	f2.:m7.5- | bes2:7 b4:dim7 | c2.:m7 | f2:9 fis4:dim7 | \myEndLine
	g4.:m7 c:7 | f2:m7 bes4:7 | ees2.*2 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 3/4
	\key ees \major

	\partial 4. bes'8 c ees |

	%% part "A"
	d4. bes8 c ees | d2 bes8 ges | f2.~ | f4 r8 ees f aes |
	g4. ees8 f aes | g2 ees8 ces | bes2.~ | bes4 r bes |

	%% part "B"
	ces2 bes'4 | g2 bes,4 | ces ees bes' | g2 f4 |
	ees g f' | d2 f,4 | bes2.~ | bes4 r8 bes8 c ees |

	%% part "A"
	d4. bes8 c ees | d2 bes8 ges | f2.~ | f4 r8 ees f aes |
	g4. ees8 f aes | g2 ees8 ces | bes2.~ | bes4 r bes |

	%% part "C"
	ces ees bes' | g2 f4 | ees g f' | d4. ees8 c d |
	bes4. c8 aes bes | g4. f8 aes d, | ees2.~ | ees4. r8 r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	The eve -- ning breeze ca -- ressed the trees Ten -- der -- ly, __
	The termb -- ling trees em -- braced the breeze Ten -- der -- ly. __

	%% part "B"
	Then you and I came wand -- er -- ing by and lost in a sigh were we. __

	%% part "A"
	The shore was kissed by sea and mist Ten -- der -- ly. __
	I can't for -- get how two hearts met breath -- less -- ly. __

	%% part "C"
	Your arms op -- ened wide and closed me in -- side; you took my lips, you took my love so Ten -- der -- ly. __
}
% endif
