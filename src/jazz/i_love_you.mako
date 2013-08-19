<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Real"

	attributes['title']="I Love You"
	attributes['style']="Jazz"
	# from the real book
	attributes['composer']="Cole Porter"
	# from the internet
	attributes['poet']="Cole Porter"
	# from the real book
	attributes['piece']="Slowly"
	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"

	attributes['completion']="0"
	attributes['uuid']="b806ce6c-b405-11e1-9daf-1fdf93f5ba36"
	attributes['structure']="AB"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']="http://www.lyricstime.com/cole-porter-i-love-you-lyrics.html"
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- filled in meta data from the real book.
	- filled in the tunes structure.
	TODO:
	- filled in the real book chords.
	- filled in the real book tune.
	- filled in the real book lyrics.
	- checked the real book chords.
	- checked the real book tune.
	- checked the real book lyrics.
	- heard the real book version to make sure that the tempo and tune is right.
	- added a lyrics url.
	- added you tube performances.
	- added the galit version of the chords. (copied from the real book version).
	- added the galit version of the tune. (copied from the real book version).
	- added the galit version of the lyrics.
	- checked all the parts of the galit version.
	- add copyright to this tune.
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
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Andante" 4 = 76
	\time 4/4
	\key f \major

	\partial 4 c4 |

	%% A part
	c2 des,~ | des bes'4. a8 | gis4. a8 a2~ | a r4 a |
	a2 bes,~ | bes \times 2/3 { g'4 f e } | d1~ | d2 r4 c' |
	c2 des,~ | des4. bes'8 bes4. a8 | gis4. a8 a2~ | a a4 a |
	b4. cis8 cis2 | d2. e4 | e1~ | e2 r4 e |

	%% B part
}
% endif

% if part=='LyricsReal':
%% these are lyrics from the internet adjusted for the real book
\lyricmode {
	%% part "A"
	I love you
	Hums the April breeze.
	I love you
	Echo the hills.
	I love you
	The golden dawn agrees
	As once more she sees
	Daffodils.
	It's spring again
	And birds on the wing again
	Start to sing again
	The old melody.
	I love you,
	That's the song of songs
	And it all belongs
	To you and me.
	%% part "B"
	It's spring again
	And birds on the wing again
	Start to sing again
	The old melody.
	I love you,
	That's the song of songs
	And it all belongs
	To you and me
}
% endif
