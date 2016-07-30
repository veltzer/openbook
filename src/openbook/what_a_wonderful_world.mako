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
	attributes['title']='What A Wonderful World'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='George David Weiss, Bob Thiele'
	# from the fake book
	attributes['poet']='George David Weiss, Bob Thiele'
	# from the fake book
	attributes['piece']='Slowly'
	# from the fake book
	attributes['copyright']='1967 by Range Road Music Inc. and Quartet Music Inc.'
	# from the fake book
	attributes['copyrightextra']='All rights administered by Hudson Bay Music, Inc.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='39de7d2c-a26f-11df-8dbc-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='jfb:422-423'

	attributes['idyoutuberemark1']='Orchestral version from the film score of \'Meet Joe Black\''
	attributes['idyoutube1']='Qhrpc9FFFAI'
	attributes['idyoutuberemark2']='Louis in the classic version'
	attributes['idyoutube2']='m5TwT69i1lU'
	attributes['lyricsurl']='http://www.lyrics007.com/Louis%20Armstrong%20Lyrics/What%20A%20Wonderful%20World%20Lyrics.html'
%>
% endif

% if part=='Doc':
	DONE:
	- wrote down fake book location.
	- filled in the structure.
	- filled in meta data from the fake book.
	- filled in chords from the fake book.
	- filled in tune from the fake book.
	- filled in lyrics from the real book.
	- checked the chords from the fake book.
	- checked the tune from the fake book.
	- checked the lyrics from the fake book.
	- heard the tune to make sure it sounds ok.
	- added you tube performances and lyrics url.
	TODO:
	- get another version of this tune from somewhere.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	f2 a:m | bes a:m | g:m7 f | a:7 d:m | \myEndLine
	des1 | g2:m7/c c:7 | f f:5+ | bes:maj7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f2 a:m | bes a:m | g:m7 f | a:7 d:m | \myEndLine
	des1 | g2:m7/c c:7 | f bes | bes f | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	c1:7 | f | c:7 | f | \myEndLine
	d2:m c | d:m c | d:m fis:dim7 | g4:m7 fis:dim7 g:m7 c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f2 a:m | bes a:m | g:m7 f | a:7 d:m | \myEndLine
	des1 | g2:m7/c c:7 | f a:m7.5- | d1:7 | \myEndLine
	g:m7 | g2:m7/c c:7.9- | f bes:6 | bes:6 f | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Andante" 4 = 76
	\time 4/4
	\key f \major

	\partial 4 c8 e |

	%% part "A"
	f4. a8 c2 | r8 d d d c2 | r8 bes bes bes a2 | r8 g g g f4~ \tuplet 3/2 { f8 f f } |
	f4~ \tuplet 3/2 { f8 f f } f2 | r4 f8 f \tuplet 3/2 {e4 f g} | a1~ | a2 r4 c,8 e |

	%% part "A"
	f4. a8 c4. c8 | d4. d8 c4. c8 | bes4~ \tuplet 3/2 { bes8 bes bes } a4. a8 | g4~ \tuplet 3/2 { g8 g g } f4~ \tuplet 3/2 { f8 f f } |
	f4~ \tuplet 3/2 { f8 f f } f2 | r4 f8 f \tuplet 3/2 {e4 f g } | f1~ | f2 r4 f4 |

	%% part "B"
	g8 g g g g c,4 c8 | bes' a a gis a4. f8 | g g g g g c,4 g'8 | bes a a gis a4 a8 c |
	d4 d8 d c4~ \tuplet 3/2 { c8 a c } | d4 d8 d c2 | r8 d d d c c4. | bes4 a g c,8 e |

	%% part "A"
	f4. a8 c4. c8 | d4. d8 c2 | r8 bes bes bes a4. a8 | g4~ \tuplet 3/2 { g8 g g } f4~ \tuplet 3/2 { f8 f f } |
	f4~ \tuplet 3/2 { f8 f f } f2 | r4 f8 f \tuplet 3/2 {e4 f g} | a1~ | a4 r a a |
	\tuplet 3/2 {a4 f g} f2 | r4 f8 f \tuplet 3/2 {e4 f g} | f1~ | f\fermata |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	I see trees of green, red ros -- es too, I see the bloom for me and you, __
	and I think __ to my -- self What A Won -- der -- ful World. __

	%% part "A"
	I see skies of blue and clouds of white, the bright __ bless -- ed day, the dark __ sac -- red night, __
	and I think __ to my -- self What A Won -- der -- ful World. __

	%% part "B"
	The col -- ors of the rain -- bow, so pret -- ty in the sky
	are al -- so on the fa -- ces of peo -- ple go -- in' by,
	I see friends shak -- in' hands, __ say -- in' "\"How" do you "do!\""
	They're real -- ly say -- in' "\"I" love "you,\""

	%% part "A"
	I hear ba -- bies cry, I watch them grow.
	They'll learn much more than I'll __ ev -- er know, __
	and I think __ to my -- self What A Won -- der -- ful World. __
	Yes, I think to my -- self What A Won -- der -- ful World. __
}
% endif
