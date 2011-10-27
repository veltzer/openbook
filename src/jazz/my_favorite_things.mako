<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['render']="Real"

	attributes['title']="My Favorite Things"
	attributes['subtitle']="From 'The Sound Of Music'"
	attributes['composer']="Richard Rodgers"
	attributes['poet']="Oscar Hammerstein II"
	attributes['style']="Jazz"
	attributes['piece']="Med Swing"
	attributes['copyright']="1959 by Richard Rodgers and Oscar Hammerstein II. Copyright Renewed."
	attributes['copyrightextra']="Williamson Music Co., owner of publication and allied right throughout the Westen Hemisphere and Japan. All Rights Administered by Chappell & Co., Inc."

	attributes['completion']="5"
	attributes['uuid']="02c22208-a26f-11df-98fd-0019d11e5a41"

	attributes['idyoutuberemark']="Sarah Vaughan"
	attributes['idyoutube']="dusavln6Cjw"
	attributes['idyoutuberemark']="The great version by Coltrane"
	attributes['idyoutube']="0I6xkVRWzCY"
	attributes['lyricsurl']="http://www.stlyrics.com/songs/s/soundofmusic9841/myfavouritethings323514.html"
%>
% endif

% if part=='Doc':
	DONE:
	- added epdf for the real book.
	- added epdf for the fake book.
	- put in the chords for the real book.
	- checked the chords for the real book.
	- put in the notes for the real book.
	- filled in meta data for this tune (copyright and more).
	- checked the notes for the real book.
	- checked how the tune sounds.
	- added lyrics url and youtube performances.
	TODO:
	- add lyrics for the real book version.
	- check the lyrics for the real book version.
	- add the fake book version.
	NOTES:
	- in the real book version the last repeat sign is not taken because it seems out of place.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\mark "A"
	\startPart
	\repeat volta 2 {
		e2.:m7 | fis:m7 | e:m7 | fis:m7 | \myEndLine
		c2.*4:maj7 | \myEndLine
		a2.:m7 | d:7 | g:maj7 | c:maj7 | \myEndLine
		g:maj7 | c:maj7 | fis:m7.5- | b:7 | \myEndLine
	}
	%% removed in order to show the repeat sign...
	%%\endPart

	\mark "B"
	\startPart
	e2.:maj7 | fis:m7 | e:maj7 | fis:m7 | \myEndLine
	a2.*4:maj7 | \myEndLine
	a2.:m7 | d:7 | g:maj7 | c:maj7 | \myEndLine
	g:maj7 | c:maj7 | fis:m7.5- | b:7.9- | \myEndLine
	\endPart

	\mark "C"
	\startPart
	e2.*2:m7 | fis2.:m7.5- | b:7 | \myEndLine
	e2.*2:m7 | c:maj7 | \myEndLine
	c:maj7 | a:7 | \myEndLine
	g2.:maj7 | c2.*2:maj7 | d2.:7 | \myEndLine
	g:6 | c:maj7 | g:6 | c:maj7 | \myEndLine
	g:maj7 | c:maj7 | fis:m7.5- | b:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative e' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 3/4
	\key g \major

	%% part "A"
	\repeat volta 2 {
		\repeat unfold 2 { e4 b' b | fis e e | b e e | fis e2 | }
		e4 b' a | e fis d | d a' g | c,2. |
		b4 c d | e fis g | a b a | dis,2. |
	}

	%% part "B"
	\repeat unfold 2 { e4 b' b | fis e e | b e e | fis e2 | }
	e4 b' a | e fis d | d a' g | c,2. |
	b4 c d | e fis g | a ais b | c2. |

	%% part "C"
	r4 b b | b2 e,4 | r a a | a2 dis,4 |
	r g g | g2 b,4 | e2.~ | e2 e4 |
	e fis e | fis e fis | g a g |
	a2 g4 | b c b | c2.~ | c | b |
	g~ | g~ | g~ | g |
	r | r | r | r |
}
% endif
