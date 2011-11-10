<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Real"

	attributes['title']="Alone Together"
	attributes['composer']=""
	attributes['poet']=""
	attributes['style']="Jazz"
	# this is from the real book
	attributes['piece']="Ballad"
	attributes['copyright']=""
	attributes['copyrightextra']=""

	attributes['completion']="5"
	attributes['uuid']="b647880a-0b68-11e1-b491-0019d11e5a41"

	attributes['structure']="AABA"
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- filled in the real book chords.
	TODO:
	- fill in meta data from somewhere.
	- bring in the fake book epdf.
	- put in you tube performances with documentation.
	- put in the tunes structure.
	- put in a lyrics url.
	- filled in the meta data.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- played the fake book version to hear that it sounds well.
	- checked the real book chords.
	- checked the real book tune.
	- checked the real book lyrics.
	- played the real book version to hear that it sounds well.
	MORE TODO:
	- how do I put the last two chords in the real book version in parenthesis? (the turn around chords).
	REMARKS:
	- this tunes structure can also be categorised as "ABAC" since the first 8 bars of both the first and second part are the same.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 8 r8 |

	\mark "A"
	\startPart
	\repeat volta 2 {
		d1:m | e2:m7.5- a:7.9- | d1:m | e2:m7.5- a:7.9- | \myEndLine
		d1:m | a2:m7.5- d:7.9- | g1:m | g:m7 | \myEndLine
		b2:m7 e:7 | g:m7 c:7 | f f:7 | e:m7.5- a:7 | \myEndLine
	} \alternative {
		{ d1:maj7 | e2:m7.5- a:7 | }
		{ d1*2:maj7 | }
	}
	\endPart

	\mark "B"
	\startPart
	a1:m7.5- | d:7.9- | g1*2:m | \myEndLine
	g1:m7.5- | c:7.9- | f2 f:7 | e:m7.5- a:7.9- | \myEndLine
	\endPart

	\mark "A"
	\startPart
	d1:m | e2:m7.5- a:7.9- | d1:m | e2:m7.5- a:7.9- | \myEndLine
	d1:m | bes2:7 a:7 | d1:m | e2:m7.5- a:7 | \myEndLine

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key d \minor

	\partial 8 d8 |

	%% part "A"
	f2. d8

	%% part "B"

}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
}
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 4 r4 |

	\repeat volta 2 {

	\mark "A"
	\startPart
	f1:maj7 | a2:m7.5- d:7.9- | g1:m7 | c:7 | \myEndLine
	f2. d4:m7.5- | d1:m7.5- | g:7 | g2:m7 c:7 | \myEndLine
	f1:maj7 | c2:m7 f:7 | bes1:maj7 | bes:m6 | \myEndLine
	f:maj7 | a2:m7 d:7 | g1:7.9 | g2:m7 c:7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	f1:maj7 | a2:m7.5- d:7.9- | g1:m7 | c:7 | \myEndLine
	f2. d4:m7.5- | d1:m7.5- | g:7 | g2:m7 c:7 | \myEndLine
	c1:m7 | f:7 | bes:maj7 | ees:7 | \myEndLine
	f2 g:m7 | a:m7 bes:m6 | a:m7 d:m7 | g:m7 c:7 |

	} \alternative {
		{
			f1 | g2:m7 c:7 |
		}
		{
			f1 | bes2:7 bes:m6 | f1:maj7 | \myEndLine
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

	\partial 4 c4 |

	\repeat volta 2 {

	%% part "A"
	c c2 ees4~ | ees2. ees4 | d d2 a'4~ | a1 |
	f2 f4 aes~ | aes2. aes4 | g2 g4 d'4~ | d1 |
	r4 e e e | c c2. | a2 a4 f~ | f2. f4 |
	a a a c~ | c c2 c4 | a2 a4 d,~ | d2. c4 |

	%% part "B"
	c2 c4 ees~ | ees ees2 ees4 | d2 d4 a'~ | a2 a4 a |
	f2 f4 aes~ | aes bes aes2 | g g4 d'~ | d2. d4 |
	f2 f4 d~ | d2. d4 | c2 c4 a~ | a2 a4 bes |
	c f, g bes | a f g bes | a2 f' | f, g |

	} \alternative {
		{
			f1 | r2 r4 c |
		}
		{
			f1~ | f~ | f |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% A part
	A Fog -- gy Day __ in Lon -- don town __ had me low __ and had me down. __
	I viewed the morn -- ing with a -- larm, __ the Brit -- ish Mu -- se -- um had lost its charm. __
	%% B part
	How long I won -- dered could this thing last? __ But the age of mir -- a -- cles had -- n't passed, __
	for sud -- den -- ly, __ I saw you there __ and through fog -- gy Lon -- don town the sun was shin -- ing ev -- 'ry where.
	%% Voltas
	A where. __
}
% endif
