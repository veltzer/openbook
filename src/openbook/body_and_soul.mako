<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	version['doLyricsmoremore']=True
	attributes.addVersion('Fake', version)
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']='Body And Soul'
	attributes['style']='Jazz'
	# this is from the fake book
	attributes['composer']='John Green'
	# this is from the fake book
	attributes['poet']='Edward Heyman, Robert Sour, Frank Eyton'
	# this is from the fake book
	attributes['piece']='Slowly, with expression'
	# this is from the fake book
	attributes['copyright']='1930 Warner Bros. Inc & Chappell & Co. Ltd.'
	attributes['copyrightextra']='Copyright Renewed & Assigned to Warner Bros. Inc.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='b2076c06-e025-11e0-ab4c-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='rbk1:59,jfb:67'

	attributes['idyoutuberemark1']='Billie Holiday'
	attributes['idyoutube1']='CMDlk6lGQOk'
	attributes['idyoutuberemark2']='Dexter Gordon from the ballads. Excellent'
	attributes['idyoutube2']='rMd9oZ4O0bs'
	attributes['lyricsurl']='http://www.azlyrics.com/lyrics/dianakrall/bodyandsoul.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added the fake book epdf.
	- added the real book epdf.
	- added the structure of the tune.
	- added youtube performances.
	- added lyrics url.
	- put the fake book chords.
	- put the fake book tune.
	- put the fake book lyrics.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- heard the fake book tune and check that it sounds well.
	- put the real book chords.
	- put the real book lyrics.
	- put the real book tune.
	- checked the real book chords.
	- checked the real book tune.
	- checked the real book lyrics.
	- heard the real book tune and check that it sounds well.
	TODO:
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
		{
			des2:6 f4:m7 bes:7.9- | \myEndLineVoltaNotLast
		}
		{
			des2:6 e4:m7 a:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	d2 e:m7 | d/fis g4:m7 c:7 | fis:m7 b:m7 e:m7 a:7 | d1 | \myEndLine
	d2:m7 g:9 | c:maj7 ees:dim7 | d:m7 g4:7 g:7.5+ | c:9 b:9 bes:9 e:9.11+ | \myEndLine
	\endPart

	%%\myMark ""
	\startPart
	\mark \markup { \musicglyph #"scripts.coda" } des1 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Andante" 4 = 80
	\time 4/4
	\key des \major

	%% part "A"
	\repeat volta 2 {
		r8. ees16 f8. ees16 f4 ees | bes' bes2. | r8. aes16 bes8. aes16 bes4 aes | ees'4 des c bes |
		r4 des bes8 ges4 bes,8 | f'2 ees | r8. des16 ees8. f16 aes4 \tuplet 3/2 { aes8 bes fes^\markup {To Coda \musicglyph #"scripts.coda"} } |
	} \alternative {
		{
			des1 |
		}
		{
			des2. r4 |
		}
	}

	%% part "B"
	\key d \major
	r8. d16 e8. fis16 a8 a4 a8 | d d4 fis,8 a a4 g8 | fis fis4 d8 e4 cis8 a~ | a2~ a8 r r4 |
	\key c \major
	r8. d16 e8. f16 a8 a4 g8 | e' e4 b8 d d4 a8 | c c4 a8 b b4 g8 | e4 ees d bes'^\markup {D.C. al Coda} |

	%% part "Coda"
	\key des \major
	des,1 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	My heart is sad and lone -- ly,
	for you I sigh, for you, dear, on -- ly.
	Why have -- n't you seen it?
	I'm all for you, Bod -- y And Soul! _

	%% part "B"
	I can't be -- lieve it,
	it's hard to con -- ceive it
	that you'd turn a -- way ro -- mance. __
	Are you pre -- tend -- ing,
	it looks like the end -- ing
	un -- less I could have one more chance to prove, dear,
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {

	%% part "A"
	I spend my days in long -- ing
	and won -- d'ring why it's me you're wrong -- ing,
	I tell you I mean it,
	I'm all for you, Bod -- y And _ Soul!
}
% endif

% if part=='LyricsmoremoreFake':
\lyricmode {

	%% part "A"
	my life a wreck you're mak -- ing,
	you know I'm yours for just the tak -- ing;
	I'd glad -- ly sur -- ren -- der
	my -- self to you, Bod -- y And

	%% part "B"
	_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
	_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

	%% part "Coda"
	Soul!
}
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		ees2:m7 bes:7.9- | ees:m7 d:7 | des:maj7 ges:7 | f:m7 e:dim7 | \myEndLine
		ees1:m7 | c2:m7.5- f:7 | bes4:m7 ees:7 ees:m7 aes:7 |
	} \alternative {
		{
			des2:6 bes:7 | \myEndLineVoltaNotLast
		}
		{
			des a:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	d2:maj7 e:m7 | d/fis g4:m7 c:7 | fis:m7 b:m7 e:m7 a:7 | d1:maj7 | \myEndLine
	d2:m7 g:7 | c:maj7 ees:dim7 | d:m7 g:7 | c4:7 b:7 bes2:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees2:m7 bes:7.9- | ees:m7 d:7 | des:maj7 ges:7 | f:m7 e:dim7 | \myEndLine
	ees1:m7 | c2:m7.5- f:7 | bes4:m7 ees:7 ees:m7 aes:7 | des2:6_\markup { \italic { Fine } } \OPC bes:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Andante" 4 = 80
	\time 4/4
	\key des \major

	%% part "A"
	\repeat volta 2 {
		r8 ees f ees f4. ees8 | bes'4 bes2. | r8 aes bes aes bes4. aes8 | ees'4 des c bes |
		r4 des \tuplet 3/2 { bes ges bes, } | f'2 ees | r8 des ees f aes4 \tuplet 3/2 { aes8 bes e, } |
	} \alternative {
		{
			des1 |
		}
		{
			des1 |
		}
	}

	%% part "B"
	\key d \major
	r8 d e fis a a4 a8 | d d4 fis,8 a a4 g8 | fis fis4 d8 e4 cis | a2. r4 |
	\key c \major
	r8 d e f a a4 g8 | e' e4 b8 d d4 a8 | c c4 a8 b4 g | e dis d bes' |

	%% part "A"
	\key des \major
	r8 ees, f ees f4. ees8 | bes'4 bes2. | r8 aes bes aes bes4. aes8 | ees'4 des c bes |
	r4 des \tuplet 3/2 { bes ges bes, } | f'2 ees | r8 des ees f aes4 \tuplet 3/2 { aes8 bes e, } | des1 |
}
% endif

% if part=='LyricsReal':
\lyricmode {

	%% part "A"
	My heart is sad and lone -- ly,
	for you I sigh, for you, dear, on -- ly.
	Why have -- n't you seen it?
	I'm all for you, Bod -- y And Soul! _

	%% part "B"
	I can't be -- lieve it,
	it's hard to con -- ceive it
	that you'd turn a -- way ro -- mance.
	Are you pre -- tend -- ing,
	it looks like the end -- ing
	un -- less I could have one_more chance to prove, dear,

	%% part "A"
	my life a wreck you're mak -- ing,
	you know I'm yours for just the tak -- ing;
	I'd glad -- ly sur -- ren -- der
	my -- self to you, Bod -- y And Soul!
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	I spend my days in long -- ing
	and won -- d'ring why it's me you're wrong -- ing,
	I tell you I mean it,
	I'm all for you, Bod -- y And _ Soul!
}
% endif
