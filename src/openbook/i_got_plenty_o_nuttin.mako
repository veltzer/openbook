<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']='I Got Plenty O\' Nuttin\''
	attributes['style']='Jazz'
	# from the fake book
	attributes['subtitle']='From \'Porgy and Bess\''
	# from the fake book
	attributes['composer']='George Gershwin'
	# from the fake book
	attributes['poet']='Ira Gershwin, DuBose Heyward'
	# from the fake book
	attributes['piece']='Moderately'
	# from the fake book
	attributes['copyright']='1935 by Gershwin Publishing Corporation'
	# from the fake book
	attributes['copyrightextra']='Copyright Renewed, Assigned to Chappell & Co., Inc.'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='51444eaa-da7f-11e3-a1f7-4b82298467da'
	attributes['structure']='AABA'
	attributes['location']='jfb:157'

	attributes['idyoutuberemark1']='Sinatra in the classic version'
	attributes['idyoutube1']='DvLLQAAr8zQ'
	attributes['idyoutuberemark2']='Classic Gershwin rendition'
	attributes['idyoutube2']='upqf0ts2dSE'
	attributes['lyricsurl']='http://www.stlyrics.com/lyrics/porgy&bess/igotplentyonuttin.htm'
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the meta data from the fake book
	- added epdf for the fake book.
	- put in the tunes structure.
	- added the fake book chords.
	- added the fake book tune.
	- added the fake book lyrics.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- heard the tune to make sure it sounds ok.
	- add youtube urls.
	- add lyrics url.
	TODO:
	- add another version of this tune from somewhere.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		g2 a:m7 | b:m a:m7 | g a:m7 | g b:7 | e a | \myEndLine
		e a | e a4 e | cis1 | cis2 d | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		g2 a:m7 | b:m a:m7 | g a:m7 | g b:7 | e a | \myEndLine
		e a | e a4 e | cis1 | cis2 d | g2 a:m7 | b:m g | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		b:m e:m/b | b:m6 e:m/b | b:m e:m/b | b:m6 e:m/b | \myEndLine
		b:m e:m/b | b:m6 e:m/b | b:m a:m7 | d a:m7 | d1:7 | d:7 | \myEndLine
		\endPart

		\myMark "A'"
		\startPart
		g2 a:m7 | b:m a:m7 | g a:m7 | g b:7 | \myEndLine
		e a | e a | e a4 e | cis1 | cis | \myEndLine
		cis2 d | g a:m7 | g d:m7 | g a:m7 | \myEndLine
		g c |
	} \alternative {
		{
			g1 | g | b2:m a:m7 | \myEndLineVoltaNotLast
		}
		{
			g4 c2:7 d4:7 | g1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key g \major

	\partial 4 d4 |

	\repeat volta 2 {

		%% part "A"
		g4 g a g8 a | b8 d4.~ d4 r8 d, | b'4 b8 a~ a b a4 | g2 fis | e4 e cis4. r8 |
		e4 e cis4. cis8 | e4 e cis e | eis1~ | eis2 fis |

		%% part "A"
		g4 g a g8 a | b8 d4.~ d4 r | b4 b8 a~ a b a4 | g2 fis | e4 e cis8 cis4 cis8 |
		e8 e4 e8 cis cis cis cis | e4 e cis e | eis1~ | eis2 fis | g1~ | g2 r |

		%% part "B"
		fis4 d8 b d4 b8 d | fis2 e8 fis e b | d1~ | d4 r e8 fis e b |
		d4 b8 d fis2~ | fis e8 fis e b | d4 b8 d e4 c8 e | fis4 d8 fis g4 e8 g | a4 fis8 a c2~ | c r4 d, |

		%% part "A"
		g g a g8 a | b8 d4.~ d4 r8 d, | b'4 b8 a~ a b a4 | g2 fis |
		e4 e cis4. r8 | e4 e cis4. cis8 | e e4 e8 cis4 e | eis1 | \xNote { \tuplet 3/2 { b'4 b b } g e } |
		r2 fis4 fis | g1~ | g4 r f f | g1~ |
		g4 r e4 e |
	} \alternative {
		{
			g1~ | g2 r | r1 |
		}
		{
			g1~ | g4 r r2 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Oh, I Got Plen -- ty O' Nut -- tin', __ an' nut -- tin's plen -- ty fo' me. I got no car,
	got no mule, I got no mis -- er -- y. __ De

	%% part "A"
	folks wid plen -- ty o' plen -- ty __ got a lock __ on de door, _
	faid some -- bod -- y's a go -- in' to rob 'em while dey's out a mak -- in' more. __
	What for? __

	%% part "B"
	I got no lock on de door, (dat's no way to be.) __ Day kin steal de rug from de floor, __ dat's o -- keh wid
	me, 'cause de things dat I prize, like de stars in de skies, all are free. __

	%% part "A"
	Oh, I Got Plen -- ty O' Nut -- tin; __
	an' nut -- tin's plen -- ty fo' me.
	I got a gal, got my song, got heb ben the whole day long.
	No use com -- plain -- in'! Got my gal, __ got my Lawd, __
	go my song. __
	song. __
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {

	%% part "A"
	_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
	got the sun, got the moon, _ got the deep blue sea. __ De folks wid plen -- ty o' plen -- ty __
	got to pray __ all de day, _ __ Seems wid plen -- ty you sure got to wor -- ry how to
	keep the debbel a -- way, __ a -- way. __ I ain't a -- fret -- tin' 'bout
	hell 'til de time ar -- rive. __ Nev -- er wor -- ry long as I'm well, __ nev -- er one to strive to be good, to be bad, what the hell?
	I is glad I's a live. __
}
% endif
