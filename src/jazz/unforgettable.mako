<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="Unforgettable"
	attributes['style']="Jazz"
	attributes['composer']="Irving Gordon"
	attributes['poet']="Irving Gordon"
	attributes['piece']="Mederately"
	attributes['copyright']="1951, Bourne Co. Copyright Renewed."

	attributes['completion']="5"
	attributes['uuid']="3162420a-a26f-11df-aacf-0019d11e5a41"
	attributes['structure']="AB"

	attributes['idyoutuberemark']="Nat King Cole the unforgettable..."
	attributes['idyoutube']="S1UEzL9poPM"
	attributes['idyoutuberemark']="Nat King Cole with Natalie Cole duet..."
	attributes['idyoutube']="2uRtNMFfF-g"
	attributes['lyricsurl']="http://www.sing365.com/music/lyric.nsf/unforgettable-lyrics-nat-king-cole/afdec7063791226248256af1000bbaa6"
%>
% endif

% if part=='Doc':
	DONE:
	- put in the chords (fakebook).
	- put in the tune (fakebook).
	- put in the lyrics (fakebook).
	- added the epdf from the fake book.
	- fixed the chords.
	- checked the meta data.
	- fixed the tune.
	- turn the tune relative.
	- checked the chords.
	- checked the tune.
	- make the lyrics go with the tune and not be note based.
	- checked the lyrics.
	- added lyrics url.
	- added youtube performances.
	TODO:
	- add epdf from other sources (new real book vol II).
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	g1 | g:maj7 | g1*2:dim7 | \myEndLine
	c1 | c:maj7 | a2:7.9 e:m7 | a1:7.9 | \myEndLine
	f:6 | f:m7 | c2 e:m7.5-/b | a1:7 | \myEndLine
	d:7.9 | d2.:7.9 des4:7 | d1*2:7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	g1 | g:maj7 | g1*2:dim7 | \myEndLine
	c1 | c:maj7 | a2:7.9 e:m7 | a1:7.9 | \myEndLine
	f:6 | f:m | c | a2:7 a:7.9 | \myEndLine
	d1:7.9 | d2:m7 g:7 | c d4:m7 des:maj7 | c1:6.9 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative g' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key g \major

	\repeat unfold 2 {
		d4 e e8 fis4 fis8~ | fis2 \times 2/3 { d4 e g } | fis1~ | fis2. r4 |
		g4 a a8 b4 b8~ | b2 \times 2/3 { g4 a c } | b1~ | b2. r4 |
		c d d c | c d8 ees~ ees d c4 | g a a g | g a8 b~ b a g4 |
	} \alternative {
		{ e e a e~ | e2. f4 | fis fis c' fis,~ | fis2. r4 | }
		{ d e e d | d e8 g~ g e d4 | c1~ | c2. r4 | }
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	Un -- for -- get -- ta -- ble, __ that's what you are, __
	Un -- for -- get -- ta -- ble, __ tho' near or far. __
	Like a song of love that clings __ to me,
	how the thought of you does things __ to me,
	nev -- er be -- fore __ has some -- one been more __

	Un -- for -- get -- ta -- ble, __ in ev -- 'ry way, __
	and for -- ev -- er more, __ that's how you'll stay. __
	That's why, dar -- ling, it's in -- cred -- i -- ble,
	that some -- one so Un -- for -- get __ -- ta -- ble,
	thinks that I am Un -- for -- get __ -- ta -- ble too. __
}
% endif
