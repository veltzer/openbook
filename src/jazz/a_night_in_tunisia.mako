<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=False
	attributes['doLyricsmore']=False
	attributes['render']="Fake"

	attributes['title']="A Night In Tunisia"
	attributes['style']="Jazz"
	# Sorry for all the slashes. They have to be escaped by mako and then
	# still escaped for Lilypond
	attributes['composer']="John \\\"Dizzy\\\" Gillespie, Frank Paparelli"
	attributes['poet']=""
	# this is from the fake book
	attributes['piece']="Bright Swing"
	# this is from the fake book
	attributes['copyright']="1944 by MCA Music Publishing, A division of MCA Inc, New York, NY"
	attributes['copyrightextra']="Copyright Renewed"
	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"

	attributes['completion']="5"
	attributes['uuid']=""
	attributes['structure']="ABA"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 8
	s8
	\repeat volta 2 {
		\myMark "A"
		\startPart
		ees1:7 | d:m6 | ees:7 | d:m6 | ees:7 | d:m6 |
		ees2:m7.5- a4.:7.5-.9- d8:m6 |
	} \alternative {
		{
			d1:m6 |
		}
		{
			d1:m6 |
		}
	}
	\endPart
	\myMark "B"
	\startPart
	a:m7.5- | d:7.9- |
	g2:m6 d:7.9- | g1:m6 | g1:m7.5- | c:7.9- | f:maj |
	e2:m7.5- a:7.9- |
	\endPart
	\myMark "A"
	\startPart
	ees1:7 | d:m6 | ees:7 | d:m6 |
	ees:7 | d:m6 | e2:m7.5- a:7.5- | d1:m7+ |
	\endPart
	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	%%\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

	%% A part
	\partial 8
	a,8
	\repeat volta 2 {
		\times 2/3 { bes des f } c'2 bes8 f | gis a4. r4 r8 a, | \times 2/3 { bes des f } c' c~ c4 bes8 f | a2. r8 a, | \times 2/3 { bes des f } c'2 bes8 f | gis a4. r2 |
		a8 bes \times 2/3 { a16 bes a } g8 ees4 cis8 d~ |
	} \alternative {
		{
			d4 r r r8 a |
		}
		{
			d4 r r r8 a' |
		}
	}
	%% B part
	c4. a8~ a4. g8 | ges4 ees'8 cis d c4 a8 |
	bes g4 fis8~ fis4 a8 fis | g a e4 r r8 \grace a8 bes8~ | bes \grace a8 bes4 r8 r4 \times2/3 { g16 aes g } f8 | e4 \times 2/3 { des'16 ees des } b8 c bes4 gis8 | a4. f8 \times 2/3 { g?16 aes g } f8 \times 2/3 { g16 aes g } f8 |
	e2. r8 a, |
	%% A part
	\times 2/3 { bes des f } c'2 bes8 f | gis a4. r4 r8 a, | \times 2/3 { bes des f } c' c~ c4 bes8 f | a2. r8 a, | \times 2/3 { bes des f } c'2 bes8 f | gis a4. r2 | a8 bes \times 2/3 { a16 bes a } g8 ees4 cis8 d~ | d4 r r2 |
}
% endif
