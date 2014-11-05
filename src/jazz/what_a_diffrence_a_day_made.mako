<%page args='part'/>
% if part=='Vars':
<%
	# vim: set filetype=lilypond :
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	# from the fake book
	attributes['title']='What A Diff\'rence A Day Made'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Maria Grever'
	# from the fake book
	attributes['poet']='Stanley Adams'
	# from the fake book
	attributes['piece']='Relaxed'
	# from the fake book
	attributes['copyright']='1934 by Edward B. Marks Music Company. Copyright Renewed.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='d28e02f4-2218-11e4-870b-bfbfa80d68bd'
	attributes['structure']='ABAC'
	attributes['location']='jfb:422'

	attributes['idyoutuberemark1']='Dinah Washington in a classic performance'
	attributes['idyoutube1']='OmBxVfQTuvI'
	attributes['idyoutuberemark2']='Jamie Cullum vocal+piano'
	attributes['idyoutube2']='NzS4ygeE1oQ'
	attributes['lyricsurl']='http://www.azlyrics.com/lyrics/reneeolstead/whatadifferenceadaymakes.html'
%>
% endif

% if part=='Doc':
	DONE:
	- write down fake book location.
	- filled in meta data from the fake book.
	- filled in the structure.
	- filled in chords from the fake book.
	- filled in tune from the fake book.
	- filled in lyrics from the real book.
	- checked the chords from the fake book.
	- checked the tune from the fake book.
	- checked the lyrics from the fake book.
	- heard the tune to make sure it sounds ok.
	- add you tube performances and lyrics url.
	TODO:
	- get another version of this tune from somewhere.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 2. s2. |

	%%\myMark "A"
	\mark \markup { \musicglyph #"scripts.segno" }
	\startPart
	g1:m7 | c:7 | f | f2/a aes:dim7 | \myEndLine
	g1:m7 | c2:7 c:7.5+ | f1*2 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	e1:m7 | a:7 | d1*2:m7 | \myEndLine
	g:7 | g1:m7 | c2:7 r | \myEndLine
	\endPart

	%% end of the "A" part
	\mark \markup { \musicglyph #"scripts.coda" } c1:m7 | f:7 | \myEndLine

	\myMark "C"
	\startPart
	bes1:maj7 | bes:m6 | f | aes:dim7 | \myEndLine
	g:m7 | c:7 | f1*2 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Andante" 4 = 76
	\time 2/2
	\key f \major

	\partial 2. c8 d \tuplet 3/2 { f4 d f } |

	%% part "A"
	g2 g~ | \tuplet 3/2 { g4 f g f e f } | e2 d~ | d4 d8 e \tuplet 3/2 { f4 d f } |
	bes2 bes~ | bes4 c8 c \tuplet 3/2 { c4 c^\markup {To Coda \musicglyph #"scripts.coda"} c } | c1~ | c4 r8 a a a a a |

	%% part "B"
	a2 a~ | a4. a8 a a a a | a2 a~ | a4. a8 a a a aes |
	g2 g~ | g4 d8 e f e f4 | g1~ | g4 c,8 d \tuplet 3/2 { f4 d f^\markup {D.S. al Coda} } |

	%% part "end of A"
	c'2 \tuplet 3/2 { a4 c a } | g2 r8 a c bes |

	%% part "C"
	a2 a~ | a4 g a8 g f e | g2 g~ | g4 f8 g f e4 d8 |
	f2 f | r4 e8 e e f g4 | f1~ | f4 r r2 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	What A Diff -- 'rence A Day Made, __
	twen -- ty -- four lit -- tle ho -- urs, __
	brought the sun and the flow -- ers __
	where there used to be rain. __

	%% part "B"
	My yes -- ter day was blue dear, __
	to -- day I'm part of you dear, __
	my lone -- ly nights are thru dear, __
	since you said you were mine, __

	What A Diff -- 'rence A

	bliss; that thrill -- ing kiss.

	%% part "C"
	It's heav -- en when you __
	find ro -- mance on your men -- u. __
	What A Diff -- 'rence A Day Made,
	and the diff -- 'rence is you. __
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {

	%% part "A"
	_ _ _ _ _
	day makes, __ there's a rain -- bow be -- fore me, __
	skies a -- bove can't be storm -- y __
	since that mo -- ment of
}
% endif
