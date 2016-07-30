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

	attributes['title']='Don\'t Explain'
	attributes['style']='Jazz'
	attributes['composer']='Billie Holiday'
	attributes['poet']='Arthur Herzog, Jr.'
	# this is from the fake book
	attributes['piece']='Slowly'
	# this is from the fake book
	attributes['copyright']='1946 by Northern Music Company'
	attributes['copyrightextra']='Rights Administered by MCA Music Publishing, A Division of MCA INC., New York, NY. Copyright Renewed.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='070df83e-0676-11e1-b7fe-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='jfb:102,jltd:90'

	attributes['idyoutuberemark1']='Billie in a radio show'
	attributes['idyoutube1']='XxwJ9lh-id4'
	attributes['idyoutuberemark2']='The great Dexter Gordon at the height of his power'
	attributes['idyoutube2']='k2Lx3n10fkc'
	attributes['lyricsurl']='http://www.elyrics.net/read/b/billie-holiday-lyrics/don_t-explain-lyrics.html'
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the tune structure.
	- filled in the tune meta data from the fake book.
	- put in the fake book chords.
	- put in the fake book lyrics.
	- put in the fake book tune.
	- added the fake book epdf.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- checked that the tune sounds good.
	- add you tube performances.
	- add lyrics url.
	- added the jazz ltd epdf.
	TODO:
	- do the jazz ltd version (the epdf is there).
	REMARKS:
	- in the fake book lyrics there are dual parts for girl and boy and I only put the girl
	version cause I don't know how to write dual parts.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	d2:m d:m/c | g:m6/bes a:7 | d:m d:m/c | e:7/b bes4:7.5- a4:9 | \myEndLine
	ees2:9 d4:9.5+ d:7.5+.9- | des2:9 c:9 | f:maj7 bes4:maj7 a:m7 | bes:m6/des c:7.9- bes:7 a:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	d2:m d:m/c | g:m6/bes a:7 | d:m d:m/c | e:7/b bes4:7.5- a4:9 | \myEndLine
	ees2:9 d4:9.5+ d:7.5+.9- | des2:9 c:9 | f b:m7.5- | e:7.9- a:7.9- | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	d:m7 g:m7 | c:7 f:maj7 | bes:maj7 e:m7.5- | bes:7 a:7 | \myEndLine
	d:m7 g:m7 | c:7 f:maj7 | bes:maj7 e:m7.5- | bes:7 a:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	d2:m d:m/c | g:m6/bes a:7 | d:m d:m/c | e:7/b bes4:7.5- a4:9 | \myEndLine
	ees2:9 d:9.5+ | des:9 c:9 | f bes:6 | f1 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Adagio" 4 = 72
	\time 4/4
	\key f \major

	%% part "A"
	d4 f2 a8 d, | e1 | d4 f2 e8 f | e1 |
	c'4 bes2. | bes4 a2 a8 d, | e1~ | e4 r r2 |

	%% part "A"
	d4 f2 a8 d, | e1 | d4 f2 e8 f | e1 |
	c'4 bes2. | bes4 a2 a8 d, | f1~ | f |

	%% part "B"
	a8 a c a bes bes4. | g8 g bes g a2 | f8 f a f g g4. | e8 f g g g f e4 |
	a8 a c a bes bes4. | g8 g bes g a2 | f8 f a f g g4. | e8 f g f e2 |

	%% part "A"
	d4 f2 a8 d, | e1 | d4 f2 e8 f | e1 |
	c'4 bes2. | bes4 a2 a8 d, | f1~ | f |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Hush now, Don't Ex -- plain!
	Just say youl'll re -- main,
	I'm glad you're back,
	Don't Ex -- plain! __

	%% part "A"
	Qui -- et, Don't Ex -- plain!
	What is there to gain?
	Skip that lip -- stick,
	Don't Ex -- plain! __

	%% part "B"
	You know that I love you
	and what love en -- dures.
	All my thoughts are of you
	for I'm so com -- plete -- ly yours.
	Cry to hear folks chat -- ter,
	and I know you cheat.
	Right or wrong don't mat -- ter
	when you're with me, sweet.

	%% part "A"
	Hush now, Don't Ex -- plain!
	You're my joy and pain.
	My life's yours love,
	Don't Ex -- plain! __
}
% endif
