<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Real"

	attributes['title']="Alice In Wonderland"
	attributes['composer']=""
	attributes['poet']=""
	attributes['style']="Jazz"
	# this is from the real book
	attributes['piece']="Med."
	attributes['copyright']=""
	attributes['completion']="5"

	attributes['uuid']="718a13e0-023a-11e1-924f-0019d11e5a41"
	attributes['structure']="AABA"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	- put in the real book chords.
	- brought in the real book epdf.
	- put in the real book tune.
	- checked the real book chords.
	- checked the real book tune.
	TODO:
	- hear the tune to make sure it's ok.
	- put in youtube performances.
	- put in lyrics url.
	- put in the real book lyrics (are there lyrics?)
	- put more versions in here (from where?)
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\mark "A"
	\startPart
	\repeat volta 2 {
		d2.:m7 | g:7 | c:maj7 | f:maj7 | \myEndLine
		b:m7.5- | e:7 | a:m7 | ees:7 | \myEndLine
		d:m7 | g:7 | e:m7 | a:m7 | \myEndLine
		d:m7 | g:7 |
	} \alternative {
		{
			%% the chords a:m7 d:7 are a mistake in the real book 
			e4.:m7 a:7 | d:m7 g:7 |
		}
		{
			c2.:maj7 | a:m7 | \myEndLine
		}
	}
	\endPart

	\mark "B"
	\startPart
	d2.:7 | g:7 | e:m7 | a:m7 | \myEndLine
	d:m7 | g:7 | c:maj7 | f:maj7 | \myEndLine
	fis:m7.5- | b:7.9- | e:m7 | a:7 | \myEndLine
	d2:m7 a4:7 | d2:m7 a4:7 | d2:m7 aes4:7 | g2.:7 | \myEndLine
	\endPart

	\mark "A"
	\startPart
	d2.:m7 | g:7 | c:maj7 | f:maj7 | \myEndLine
	b:m7.5- | e:7 | a:m7 | ees:7 | \myEndLine
	d:m7 | g:7 | e:m7 | a:m7 | \myEndLine
	d:m7 | g:7 | c1*2:maj7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 3/4
	\key c \major

	%% A part
	\repeat volta 2 {
		g2. | g'2 f4 | e2 c4 | g2. |
		d'4 e f | e2 d4 | e2 c4 | g2. |
		d'4 e f | e2 d4 | e2 g4 | c2 a4 |
		g2 f4 | e2 d4 |
	} \alternative {
		{ g2.~ | g | }
		{ c,2.~ | c2 cis4 | }
	}

	%% B part
	d2. | a' | g | c, |
	d4 e f | g2 a4 | b2 g4 | e2. |
	fis | c' | b2 g4 | e2. |
	a2 g4 | f2 e4 | d2 c4 | b2. |

	%% A part
	g2. | g'2 f4 | e2 c4 | g2. |
	d'4 e f | e2 d4 | e2 c4 | g2. |
	d'4 e f | e2 d4 | e2 g4 | c2 a4 |
	g2 f4 | e2 d4 | c2.~ | c |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
}
% endif
