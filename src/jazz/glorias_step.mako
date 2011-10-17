<%def name="vars()">
<%
	attributes['render']="Real"
	attributes['type']="harmony_tune"

	attributes['title']="Gloria's Step"
	attributes['composer']="Scott LaFaro"
	attributes['style']="Jazz"
	attributes['piece']="Swing"
	attributes['copyright']="1962, Orpheum Music."

	attributes['completion']="5"
	attributes['uuid']="892e5552-f2ad-11e0-8c10-0019d11e5a41"

	attributes['structure']="AABA"
	attributes['idyoutuberemark']="Bill Evans, not the orignal Sunday at the Village version..."
	attributes['idyoutube']="C84KmJwtPeI"
	attributes['idyoutuberemark']="the original Sunday at the Village version (take 2)..."
	attributes['idyoutube']="Aib_RL_x7PA"
	attributes['lyricsurl']="NONE"
%>
</%def>

<%doc>
	DONE:
	- added the chords.
	- added the notes.
	- added youtube performances.
	- added the tunes structure.
	- checked the speed of the tune.
	- added epdfs for real book and new real book.
	- filled in the copyright
	TODO:
	- do the rythm markings on the second bar of the real book version.
	- enter the new real book version.
</%doc>

<%def name="ChordsReal()">
\chordmode {
	\startChords

	\startSong

	\mark "A"
	\startPart
	\repeat volta 2 {
		f1:maj7 | ees2:maj7 d:maj | des1:maj7 | c:7.9+ | f:m7 | \myEndLine
	}
	%% this is remarked ON PURPOSE to keep the repetition sign in the chart...
	%%\endPart

	\mark "B"
	\startPart
	e1:m7 | f:maj1 | a:m7.5- | e:m7.5- | g:m7.5- |
	d:m7.5- | g:7.9+ | c:7.9+ | ees1*2:7.9+ | \myEndLine
	\endPart

	\mark "A"
	\startPart
	f1:maj7 | ees2:maj7 d:maj | des1:maj7 | c:7.9+ | f:m7 | \myEndLine
	\endPart

	\endSong

	\endChords
}
</%def>

<%def name="VoiceReal()">
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 160
	\time 4/4
	\key c \major

	%% part "A"
	\repeat volta 2 {
		r8 g4 c8 \times 2/3 { b c a } \times 2/3 { r a e } | g1 | r8 f g f~ f ees c ees~ | ees2 r8 c bes c~ | c1 |
	}
	%% part "B"
	g'4 a8 b~ b2 | r8 a4. b4 c8 d~ | d2 r8 c g bes~ | bes2. a4 | c2 r8 bes f aes~ |
	aes2. g4 | bes2 r8 aes16 bes aes8 des, | ees'2 r8 des16 ees des8 aes | ges'1~ | ges |
	%% part "A"
	r8 g,4 c8 \times 2/3 { b c a } \times 2/3 { r a e } | g1 | r8 f g f~ f ees c ees~ | ees2 r8 c bes c~ | c1 |
}
</%def>
