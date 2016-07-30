<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	attributes['title']='I Love You'
	attributes['style']='Jazz'
	# from the real book
	attributes['composer']='Cole Porter'
	# from the internet
	attributes['poet']='Cole Porter'
	# from the real book
	attributes['piece']='Slowly'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='b806ce6c-b405-11e1-9daf-1fdf93f5ba36'
	attributes['structure']='AB'
	attributes['location']='rbk1:215'

	attributes['idyoutuberemark1']='John Coltrane in a great version'
	attributes['idyoutube1']='MzSVV1sI57g'
	attributes['idyoutuberemark2']='Peter Bernstein on guitar'
	attributes['idyoutube2']='C9gT-6K-cgE'
	attributes['lyricsurl']='http://www.lyricstime.com/cole-porter-i-love-you-lyrics.html'
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- filled in meta data from the real book.
	- filled in the tunes structure.
	- added a lyrics url.
	- filled in the real book chords.
	- filled in the real book tune.
	- filled in the real book lyrics.
	- checked the real book chords.
	- checked the real book tune.
	- checked the real book lyrics.
	- heard the real book version to make sure that the tempo and tune is right.
	- add you tube performances.
	TODO:
	- find the copyright for this tune.
	- bring in another version of this (from where?)
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	g1:m7.5- | c:7.9- | f1*2:maj7 | \myEndLine
	g1:m7 | c:7 | f1*2:maj7 | \myEndLine
	g1:m7.5- | c:7.9- | f:maj7 | b2:m7 e:7 | \myEndLine
	a1:maj7 | b2:m7 e:7 | a1*2:maj7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	g1:m7 | c:7 | f1*2:maj7 | \myEndLine
	a1:m7.5- | d:7.9- | g:7 | c:7 | \myEndLine
	g1:m7.5- | c:7.9- | f:maj7 | a2:m7.5- d:7 | \myEndLine
	g1:7 | g2:m7 c:7 | f1*2:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 160
	\time 4/4
	\key f \major

	\partial 4 c'4 |

	%% part "A"
	c2 des,~ | des bes'4. a8 | gis4. a8 a2~ | a r4 a |
	a2 bes,~ | bes \tuplet 3/2 { g'4 f e } | d1~ | d2 r4 c' |
	c2 des,~ | des4. bes'8 bes4. a8 | gis4. a8 a2~ | a a4 a |
	b4. cis8 cis2 | d2. e4 | e1~ | e2 r4 e |

	%% part "B"
	f4. f8 f2~ | f4 e \tuplet 3/2 { e d c } | e4. e8 e2~ | e4 r c d |
	ees4. ees8 ees2~ | ees4. d8 c4 bes8 a | g1~ | g2 r4 c |
	c2 des,~ | des bes'4. a8 | gis4. a8 a2~ | a bes4 c |
	cis4. d8 d4 d, | a'2 a | f1 | r |
}
% endif

% if part=='LyricsReal':
%% these are lyrics from the internet adjusted for the real book
\lyricmode {

	%% part "A"
	I love you __
	Hums the Ap -- ril breeze. __
	I love you __
	E -- cho the hills. __
	I love you __
	The gol -- den dawn ag -- rees __
	As once more she sees
	Daf -- fo -- dils. __

	%% part "B"
	It's spring a -- gain __
	And birds on the wing a -- gain __
	Start to sing a -- gain __
	The old me -- lo -- dy. __
	I love you, __
	That's the song of songs __
	And it all be -- longs
	To you and me.
}
% endif
