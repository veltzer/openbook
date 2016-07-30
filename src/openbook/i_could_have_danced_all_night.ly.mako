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

	attributes['title']='I Could Have Danced All Night'
	attributes['style']='Jazz'
	attributes['subtitle']='From \'My Fair Lady\''
	# from the fake book
	attributes['composer']='Frederick Loewe'
	# from the fake book
	attributes['poet']='Alan Jay Lerner'
	# from the fake book
	attributes['piece']='Moderately'
	# from the fake book
	attributes['copyright']='1956 by Alan Jay Lerner & Frederick Loewe. Copyright Renewed'
	# from the fake book
	attributes['copyrightextra']='Chappell & Co., Inc., owner of publication and allied rights throughout the World'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='47321f34-1a2e-11e4-b94f-232e14538fbe'
	attributes['structure']='ABCD'
	attributes['structureremark']='A, B and D parts are similar in many ways but not in exact harmony so this tune is close to a an AABA tune.'
	attributes['location']='jfb:153'

	attributes['idyoutuberemark1']='Frank in a great version'
	attributes['idyoutube1']='IGqGBu6Ksqk'
	attributes['idyoutuberemark2']='Julie Andrews in a musical like version'
	attributes['idyoutube2']='JNaIor5lxN8'
	attributes['lyricsurl']='http://www.metrolyrics.com/i-could-have-danced-all-night-lyrics-my-fair-lady.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added the fake book epdf.
	- filled in the tunes meta data from the fake book.
	- filled in the tunes structure.
	- filled in the fake book lyrics.
	- filled in the lyrics url.
	- filled in youtube performances.
	- filled in the fake book chords.
	- filled in the fake book tune.
	- checked the fake book chords.
	- checked the fake book lyrics.
	- checked the fake book tune.
	- adjusted the fake book tunes speed.
	- heard that the fake book version sounds good.
	TODO:
	- add another version of this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 2. s2. |

	\myMark "A"
	\startPart
	c1*2 | c:maj7 |
	c:maj7 | c:6 | \myEndLine
	c1*4:maj7 |
	d1*2:m7 | g:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	d:m | d1:m7+ | d:m7 |
	d1*2:m7 | g:7 | \myEndLine
	d:m7/g | d1:m7 | g:7 |
	c1*2:maj7 | c:6 | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	e | fis1:m7 | b:7 |
	e1*2:maj7 | e:6 | \myEndLine
	g:maj7 | a1:m7 | d:7.9- |
	g1*2:9 | g2:9 f | c/e d:m7 | \myEndLine
	\endPart

	\myMark "D"
	\startPart
	c1*2 | c:maj7 |
	f1*4:6 | \myEndLine
	d1*2:m7 | d:m7/g |
	d1:m7/g | g:7 | c1*2 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Prestissimo" 4 = 240
	\time 2/2
	\key c \major

	\partial 2. c4 e g |

	%% part "A"
	c1~ | c2 b | b1~ | b4 b, e g |
	b1~ | b2 a | a1~ | a2 g |
	e1~ | e2 f | g1~ | g2 a |
	d,1~ | d~ | d | r4 d f a |

	%% part "B"
	d1~ | d2 cis | cis1~ | cis4 c, f a |
	c1~ | c2 b | b1~ | b2 a |
	f1~ | f2 g | a1~ | a2 a |
	e1~ | e~ | e | r4 e fis gis |

	%% part "C"
	b1~ | b4 e, fis gis | a1~ | a2 b |
	gis1 | gis~ | gis~ | gis4 g a b |
	d1~ | d2 g, | a1 | c |
	b1~ | b~ | b4 r c2 | c c |

	%% part "D"
	c1~ | c2 b | b1~ | b4 e, g b |
	d1~ | d2 c | c1~ | c4 f, a c |
	e1 | d | f~ | f4 r r2 |
	r1 | b, | c~ | c4 r r2 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	I Could Have Danced __ All Night __
	I Could Have Danced __ All Night! __
	and still __ have begged __ for more. __

	%% part "B"
	I could have spread __ my wings __
	and done a thou -- sand things __
	I've nev -- er done __ be -- fore. __

	%% part "C"
	I'll nev -- er know __ what made it so __
	ex -- cit -- ing, __
	why all at once __ my heart took flight. __

	%% part "D"
	I on -- ly know __ when he __
	be -- gan to dance __ with me. __
	I could have danced, danced, danced, __
	all night. __
}
% endif
