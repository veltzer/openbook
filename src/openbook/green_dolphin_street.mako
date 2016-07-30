<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	attributes['title']='Green Dolphin Street'
	attributes['style']='Jazz'
	attributes['composer']='Bronislau Kaper'
	attributes['poet']='Ned Washington'
	# this is from the real book
	attributes['piece']='Latin/Swing'
	# this is from the new real book, vol 3
	#attributes['piece']='Med. Latin'
	# this is from the new real book, vol 3
	attributes['copyright']='1947 (Renewed 1975) MGM/EMI Feist Catalog, Inc.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='b93bdc7e-0207-11e1-9e68-0019d11e5a41'
	attributes['structure']='ABAC'
	attributes['location']='rbk1:179,tbk:227,gt:126,nrbk3:273'

	attributes['idyoutuberemark1']='Sarah Vaughan from a radio show'
	attributes['idyoutube1']='vHp0IvAEFMQ'
	attributes['idyoutuberemark2']='The great Coltrane'
	attributes['idyoutube2']='Ny1n5E4IdYY'
	attributes['lyricsurl']='http://www.lyricszoo.com/miles-davis/on-green-dolphin-street-miles-davis-washington-ned/'
%>
% endif

% if part=='Doc':
	DONE:
	- added the tune structure.
	- added the real book chords.
	- added the real book notes.
	- checked the real book chords.
	- take care of the repeat signs.
	- added "The book" epdf for this tune.
	- checked the real book tune.
	- checked that the real book version sounds hood.
	- get meta data for this tune from somewhere.
	- added lyrics url.
	- added the lyrics for the real book version.
	- adjusted the real book lyrics to the real book tune.
	- added lyrics url.
	- added youtube performances.
	TODO:
	- add part markings in the lyrics.
	- add more versions of this tune (plenty of epdfs).
	- the \endPart at the end of the B part is blocking the correct repeat signs. Fix this.
	REMARKS:
	- in a lot of books this tune is called "On Green Dolphin Street". Should we build an alias mechanism
	whereby tunes can have alias names? (like new real book vol III).
	- in a lot of books this tune is played in e flat.
	- there is an intro text to this tune and an outgoing text from the film in which it was introduced.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		c1*2:maj7 | c:m7 | \myEndLine
		d1:7/c | d2:7/c des/c | c1*2:maj7 | \myEndLine
		\endPart
	} \alternative {
		{

			\myMark "B"
			\startPart
			d1:m7 | g:7 | c1*2:maj7 | \myEndLine
			f1:m7 | bes:7 | ees1.:maj7 \OPC g2:7 | \myEndLineVolta
			\endPart
		}
		{

			\myMark "C"
			\startPart
			d2:m7 d:m/c | b:m7.5- e:7.9- | a:m7 a:m/g | fis:m7.5- b:7 | \myEndLine
			e:m7 a:7 | d:m7 g:7 | c1:maj7 | \LPC d2:m7 \RPC g:7 | \myEndLineVolta
			\endPart
		}
	}

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 160
	\time 4/4
	\key c \major

	%% part "A"
	\repeat volta 2 {
		c'2 c~ | c \tuplet 3/2 { b4 g e } | bes'1~ | bes |
		a2 a~ | a \tuplet 3/2 { aes4 f des } | g1~ | g |
	} \alternative {
		{

			%% part "B"
			r8 g4. d4 e | f g aes bes | g1~ | g |
			r8 bes4. f4 g | aes bes ces des | bes1~ | bes2 b |
		}
		{

			%% part "C"
			r8 g4. d4 e | f g gis e' | d4. c8~ c2 | c,4 d dis b' |
			a4. g8~ g2 | r8 g4. g4 g | g1~ | g |
		}
	}
}
% endif

% if part=='LyricsReal':
\lyricmode {
	Lo -- ver, __ one love -- ly day __
	A_love came __ plan -- ning to stay __
	Green Dol -- phin Street sup -- plied the setting __
	The_set -- ting for nights be -- yond for -- getting __ And

	When I re -- call the love I found on
	I'm_gonna kiss_the ground I found on Green Dol -- phin Street __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	through these __ mo -- ments a -- part __
	Love come __ here in my heart __
}
% endif
