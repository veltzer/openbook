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

	attributes['title']='The Things We Did Last Summer'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Sammy Chan, Jule Styne'
	# from the fake book
	attributes['poet']='Sammy Chan, Jule Styne'
	# from the fake book
	attributes['piece']='Slow Ballad'
	attributes['copyright']='1946 by Edwin H. Morris & Co., Inc'
	attributes['copyrightextra']='Copyright renewed, assigned to Producers Music Pub. Co., Inc. (Chappell & Co., Inc., administrator) and Cahn Music Co. for the U.S.A. only'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='31587e4e-ab0c-11e1-9dc8-3765c038b685'
	attributes['structure']='AABA'
	attributes['structureremark']='This is not a perfect AABA (last A is a little different) but very very close'
	attributes['location']='jfb:392-393'

	attributes['idyoutuberemark1']='Fats Navaro blowing cool'
	attributes['idyoutube1']='extdr--C3jI'
	attributes['idyoutuberemark2']='The classic Dean Martin version'
	attributes['idyoutube2']='yRWfc-8wLm4'
	attributes['idyoutuberemark3']='The classic Sinatra version'
	attributes['idyoutube3']='f_88dKZHeF4'
	attributes['lyricsurl']='http://www.lyricsfreak.com/f/frank+sinatra/the+things+we+did+last+summer_20055125.html'
%>
% endif

% if part=='Doc':
	DONE:
	- put in the fake book meta data.
	- put in the fake book chords.
	- put in the fake book lyrics.
	- put in the fake book tune.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- heard the tune to make sure it sounds good and in the right tempo.
	- put in youtube performances.
	- added a lyrics url.
	TODO:
	- add another version of this tune (the amit golan version with the C7 after the G7 and the G7.5+ in the chorus instead
	of a regular G).
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	%% Intro
	\partial 8 s8 |

	\myMark "A"
	\startPart
	g2 e:7 | a:m7 d:7 | g1 | b2:m7.5- e:7.9- | \myEndLine
	a:m7 d:7 | g e:m7 | a:m7 d:7 | g d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2 e:7 | a:m7 d:7 | g1 | b2:m7.5- e:7 | \myEndLine
	a:m7 d:7 | g e:m7 | a:m7 d:7 | g1 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	d2:m7 g:7 | d:m7 g:7 | c g:7 | c1 | \myEndLine
	e2:m7 a:7 | e:m7 a:7 | d a:7.9- | d1:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2 e:7 | a:m7 d:7 | g1 | b2:m7.5- e:7 | \myEndLine
	a:m7 d:7 | b:m7 e:7 | a:m7 d:7 | g1 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Adagio" 4 = 66
	\time 4/4
	\key g \major

	%% Intro
	\partial 8 b8 |

	%% part "A"
	d8.[ e16 b8. c16] d4. b'8 | b8.[ c16 e,8. g16] a4. b8 | a8.[ g16 d'8. b16] a8.[ g16 fis8. d16] | f!2. r8 e |
	c4 b' b a | d, d2 a'8. g16 | d4 d~ d8. a'16 g8. fis16 | e2. r8 b |

	%% part "A"
	d8.[ e16 b8. c16] d4. b'8 | b8.[ c16 e,8. g16] a4. b8 | a8.[ g16 d'8. b16] a8.[ g16 fis8. d16] | f!2. r8 e |
	c4 b' b a | d, d2 a'8. g16 | d4 d~ d8. a'16 g8. fis16 | g2. r8 gis |

	%% part "B"
	a8.[ d,16 e8. f!16] g4. gis8 | a8.[ d,16 e8. f!16] g4. dis8 | e8.[ g16 a8. c16] b4 g8 e~ | e2. r8 ais |
	b8.[ e,16 fis8. g16] a4. ais8 | b8.[ e,16 fis8. g16] a4. g8 | fis[ d d d] g4 e8 a~ | a2. r8 b,8 |

	%% part "A"
	d8.[ e16 b8. c16] d4. b'8 | b8.[ c16 e,8. g16] a4. b8 | a8.[ g16 d'8. b16] a8.[ g16 fis8. d16] | f!2. r8 e |
	c4 b' b a | d, d2 b'8. b16 | b4 c~ c8. a16 g8. fis16 | g2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	The boat rides we would take,
	the moon -- light on the lake,
	the way we danced and hummed our fav -- 'rite song.
	The Things We Did Last Sum -- mer
	I'll re -- mem -- ber __ all win -- ter long.

	%% part "A"
	The mid -- way and the fun,
	the kew -- pie dolls we won,
	the bell I/you rang to prove that I/you was/were strong;
	The Things We Did Last Sum -- mer
	I'll re -- mem -- ber __ all win -- ter long.

	%% part "B"
	The ear -- ly morn -- ing hike.
	The rent -- ed tan -- dem bike.
	The lunch -- es that we used to pack: __
	We nev -- er could ex -- plain
	that sud -- den sum -- mer rain.
	The looks we got when we got back. __

	%% part "A"
	The leaves be -- gan to fade
	like prom -- is -- es we made.
	How could a love that seemed so right go wrong?
	The Things We Did Last Sum -- mer
	I'll re -- mem -- ber __ all win -- ter long.
}
% endif
