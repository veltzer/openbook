<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Fake"

	attributes['title']="Body And Soul"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['composer']="John Green"
	# this is from the fake book
	attributes['poet']="Edward Heyman, Robert Sour, Frank Eyton"
	# this is from the fake book
	attributes['piece']="Slowly, with expression"
	# this is from the fake book
	attributes['copyright']="1930 Warner Bros. Inc & Chappell & Co. Ltd."
	attributes['copyrightextra']="Copyright Renewed & Assigned to Warner Bros. Inc."

	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"
	attributes['completion']="5"
	attributes['uuid']="b2076c06-e025-11e0-ab4c-0019d11e5a41"
	attributes['structure']="AABA"

	attributes['idyoutuberemark']="Billie Holiday"
	attributes['idyoutube']="CMDlk6lGQOk"
	attributes['idyoutuberemark']="Dexter Gordon from the ballads. Excellent"
	attributes['idyoutube']="rMd9oZ4O0bs"
	attributes['lyricsurl']="http://www.azlyrics.com/lyrics/dianakrall/bodyandsoul.html"
%>
% endif

% if part=='Doc':
	DONE:
	- added the fake book epdf.
	- added the real book epdf.
	- added the structure of the tune.
	- put the fake book chords.
	- put the fake book tune.
	- put the fake book lyrics.
	TODO:
	- check the fake book chords.
	- check the fake book tune.
	- check the fake book lyrics.
	- play the fake book tune and check that it sounds well.
	- write the real book version.
	- the e9.11+ does at the end does not show on the sheet. On the sheet it says e:7.11+
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		ees2:m7 bes:9 | ees:m7 aes:7 | des:maj7 ges:7 | f:m7 e:dim7 | \myEndLine
		ees:m7 ees:m7/des | c:m7.5- f:7 | bes:m7 ees4:m7 aes:7.5+ |
	} \alternative {
		{ des2:6 f4:m7 bes:7.9- | }
		{ des2:6 e4:m7 a:7 | }
	} \myEndLine
	\endPart

	\myMark "B"
	\startPart
	%%\key d \major
	d2 e:m7 | d/fis g4:m7 c:7 | fis:m7 b:m7 e:m7 a:7 | d1 | \myEndLine
	%%\key c \major
	d2:m7 g:9 | c:maj7 ees:dim7 | d:m7 g4:7 g:7.5+ | c:9 b:9 bes:9 e:9.11+ | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees2:m7 bes:9 | ees:m7 aes:7 | des:maj7 ges:7 | f:m7 e:dim7 | \myEndLine
	ees2:m7 ees2:m7/des | c:m7.5- f:7 | bes:m7 ees4:m7 aes:7.5+ | des1 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative f' {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Andante" 4 = 80
	\time 4/4

	%% part "A"
	\key des \major
	\repeat volta 2 {
		r8. ees16 f8. ees16 f4 ees | bes' bes2. | r8. aes16 bes8. aes16 bes4 aes | ees'4 des c bes |
		r4 des bes8 ges4 bes,8 | f'2 ees | r8. des16 ees8. f16 aes4 \times 2/3 { aes8 bes fes } |
	} \alternative {
		{ des1 | }
		{ des2. r4 | }
	}
	%% part "B"
	\key d \major
	r8. d16 e8. fis16 a8 a4 a8 | d8 d4 fis,8 a8 a4 g8 | fis8 fis4 d8 e4 cis8 a~ | a2~ a8 r8 r4 |
	\key c \major
	r8. d16 e8. f16 a8 a4 g8 | e'8 e4 b8 d8 d4 a8 | c8 c4 a8 b8 b4 g8 | e4 ees d bes' |
	%% part "A"
	\key des \major
	r8. ees,16 f8. ees16 f4 ees | bes' bes2. | r8. aes16 bes8. aes16 bes4 aes | ees'4 des c bes |
	r4 des bes8 ges4 bes,8 | f'2 ees | r8. des16 ees8. f16 aes4 \times 2/3 { aes8 bes fes } | des1 |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% part "A"
	My heart is sad and lone -- ly,
	for you I sigh, for you, dear, on -- ly,
	Why have -- n't you seen it?
	I'm all for you, Bod -- y And Soul! _
	%% part "B"
	I can't be -- lieve it,
	it's hard to con -- ceive it
	that you'd turn a -- way ro -- mance. __
	Are you pre -- tend -- ing,
	it looks like the end -- ing
	un -- less I could have one more chance to prove, dear,
	%% part "A"
	my life a wreck you're mak -- ing,
	you know I'm yours for just the tak -- ing;
	I'd glad -- ly sur -- ren -- der
	my -- self to you, Bod -- y And Soul!
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {
	%% part "A"
	I spend my days in long -- ing,
	and won -- d'ring why it's me you're wrong -- ing,
	I tell you I mean it,
	I'm all for you, Bod -- y And _ Soul!
}
% endif
