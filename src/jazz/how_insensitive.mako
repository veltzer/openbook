<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Real"

	attributes['title']="How Insensitive"
	# this is from the real book
	attributes['composer']="A.C. Jobim"
	# this is from the fake book
	attributes['composer']="Antonio Carlos Jobim"
	# this is from the fake book
	attributes['poet']="Vincius De Moraes, Norman Gimbel"
	attributes['style']="Jazz"
	# this is from the real book
	attributes['piece']="Bossa"
	# this is from the fake book
	attributes['piece']="Moderately"

	# this is from the fake book
	attributes['copyright']="1963, 1964 by Antonio Carlos Jobim and Vincius De Moraes, Brazil"
	attributes['copyrightextra']="Sole Selling Agent Duchess Music Corporation (MCA), New York, NY for the U.S.A. and Canada"

	attributes['completion']="4"
	attributes['uuid']="ee9c0d62-15fd-11e1-bd56-0019d11e5a41"

	attributes['structure']="AB"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- filled in the meta data from the real book.
	- put in the tunes structure.
	- put in the real book chords.
	TODO:
	- put in the real book tune.
	- put in the real book lyrics.
	- checked the real book chords.
	- checked the real book tune.
	- checked the real book lyrics.
	- played the real book version to hear that it sounds well.
	- fill in missing meta data.
	- put in you tube performances with documentation.
	- put in a lyrics url.
	- this song has two poets one for the original portugese and one for english. This is not reflected in the output,
		make it not so.
	REMARKS:
	- this tunes structure can also be categorised as "ABAC" since the first 8 bars of both the first and second part are the same.
	- this tune was written in the real book under a C major scale (or A minor scale) where the B is always flat.
		Obviously this is a serious mistake.
	- how do I put the last two chords in the real book version (the turn around chords) in parenthesis?
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\mark "A"
	\startPart
	d1*2:m9 | cis:dim7 | \myEndLine
	c:m6 | g:7/b | \myEndLine
	bes:maj7 | ees:maj7 | \myEndLine
	e1:m7.5- | a:7.9- | d:m7 | des:13 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	c1*2:m7 | b:dim7 | \myEndLine
	bes1:maj7 | e2:m7.5- a:7 | d1.:m7 des2:7 | \myEndLine
	c1:m9 | f:7 | b:m7 | e:7.9- | \myEndLine
	bes:maj7 | a:7 | d:m7 | e2:m7.5- a:7.9- | \myEndLine
	\endPart

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

	%% part "A"
	a1~ | a8 bes4 a bes a8~ | a1~ | a8 bes4 a bes a8~ |
	a2~ \times 2/3 { a4 gis a } | c8 b4 bes8~ bes a4 | a4. g8~ g2~ | g1 |
	g~ | g8 a4 g a g8~ | g1~ | g8 a4 g a g8~ |
	g2~ \times 2/3 { g4 fis g } | bes4. a8 \times 2/3 { aes4 g g~ } | g4. f8~ f2~ | f1 |

	%% part "B"
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
	%% part "A"
	%% part "B"
}
% endif
