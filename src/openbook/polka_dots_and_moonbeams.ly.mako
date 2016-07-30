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

	attributes['title']='Polka Dots And Moonbeams'
	attributes['style']='Jazz'
	attributes['composer']='Jimmy Van Heusen'
	attributes['poet']='Johnny Burke'
	attributes['piece']='Slowly, with expression'
	attributes['copyright']='1940 by ARC Music Corp., now Bourne Co. and Dorsey Bros.'
	attributes['copyrightextra']='Music, Division of Music Sales Corporation'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='60170b42-46e0-11e0-bf54-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='jfb:304'

	attributes['idyoutube1']='4NTxWQfMSsA'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- document what has been done with this tune.
	- add the real book version.
	- document the youtube performance and add another one.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f2 d:m7 | g:m7 c4:7 c:7/bes | a2:m7 d:m7 | g:m7 e4:m7.5- a:7.9- | \myEndLine
	d2:m d:m7+/cis | d:m7/c a4:m7 aes:m7 | g2:m7 c4:7 c:9/bes | a4:m7 d:7.9- g:m7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f2 d:m7 | g:m9 c4:7 c:7/bes | a2:m7 d:m7 | g:m7 e4:m7.5- a:7.9- | \myEndLine
	d2:m d:m7+/cis | d:m7/c a4:m7 aes:m7 | g2:m7 c4:9 c:7.9- | f2:6 b4:m7.5- e:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	a2 ais:dim7 | b:m7 e4:7 e:7/d | cis2:m7 fis:m7 | b:m7 e:7 | \myEndLine
	a2 ais:dim7 | b:m7 e:7 | a:7 d:7 | g:m7 c:9 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f2 d:m7 | g:m9 c4:7 c:7/bes | a2:m7 d:m7 | g:m7 e4:m7.5- a:7.9- | \myEndLine
	d2:m d:m7+/cis | d:m7/c a4:m7 aes:m7 | g2:m7 c4:9 c:7.9- | f4:6 ees:6 e:6 f:6.9 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
%% the tune was turned into 8'th notes instead of triplets.
{
	\tempo "Adagio" 4 = 76
	\time 4/4
	\key f \major

	%% part "A"
	r8 c d e f g a c | a4 g8 f e d4. | r8 c d e f g a c | d4 c8 bes a g4. |
	f8 g f g f2 | a8 a g f e ees4. | d8 bes' g f e d'4 c8~ | c1 |

	%% part "A"
	r8 c, d e f g a c | a4 g8 f e d4. | r8 c d e f g a c | d4 c8 bes a g4. |
	f8 g f g f2 | a8 a g f e ees4. | d8 bes' g f e a4 f8~ | f2. e8 fis |

	%% part "B"
	e4 cis'2 e8 ees | d cis b a gis e4. | e8 fis fis gis \tuplet 3/2 { gis4 a cis } | e2. e,8 fis |
	e4 cis'2 e8 ees | d cis b a gis e4. | r8 a4 b8 a4 bes | c bes8 g~ g r8 r4 |

	%% part "A"
	r8 c, d e f g a c | a4 g8 f e d4. | r8 c d e f g a c | d4 c8 bes a g4. |
	f8 g f g f2 | a8 a g f e ees4. | d8 bes' g f e a4 f8~ | f2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	A coun -- try dance was be -- ing held in a gar -- den,
	I felt a bump and heard an "\"Oh," beg your par -- "don,\""
	sud -- den -- ly I saw Pol -- ka Dots And Moon -- beams
	all a -- round a pug -- nosed dream. __

	%% part "A"
	The mus -- ic start -- ed and was I the per -- plexed one,
	I held my breath and said "\"may" I have the next "one.\""
	In my fright -- ened arms Pol -- ka Dots And Moon -- beams
	spark -- led on a pug -- nosed dream. __

	%% part "B"
	There were ques -- tions in the eyes of oth -- er danc -- ers
	as we float -- ed o -- ver the floor.
	There were ques -- tions but my heart knew all the an -- swers,
	and per -- haps a few things more. __

	%% part "A"
	Now in a cot -- tage built of li -- lacs and laugh -- ter
	I know the mean -- ing of the words "\"ev" -- er af -- "ter.\""
	And I'll al -- ways see Pol -- ka Dots And Moon -- beams
	when I kiss the pug -- nosed dream. __
}
% endif
