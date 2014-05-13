<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Fake"

	attributes['title']="I Got Plenty O' Nuttin'"
	attributes['subtitle']="(From \\\"Porgy and Bess\\\")"
	attributes['style']="Jazz"
	attributes['composer']="George Gershwin"
	attributes['poet']="Ira Gershwin, DuBose Hayward"
	attributes['piece']="Moderately"
	attributes['copyright']="1935 Gershiwin Publishing Corporation"
	attributes['copyrightextra']="Corporation Renewed, Assigned to Chappell & Co., Inc."

	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"
	attributes['completion']="5"
	attributes['uuid']="51444eaa-da7f-11e3-a1f7-4b82298467da"
	attributes['structure']=""

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

	\partial 4
	s4

	\repeat volta 2 {
		\myMark "A"
		\startPart
		g2 a:m7 | b:m7 a:m7 | g a:m7 | g b:7 | e a |
		e a e a4 e | cis1 | cis2 d |
		\endPart
		\myMark "A"
		\startPart
		g2 a:m7 | b:m7 a:m7 | g a:m7 | g b:7 | e a |
		e a e a4 e | cis1 | cis2 d | g2 a:m7 | b:m g |
		\endPart

		\myMark "B"
		\startPart
		b:m e:m/b |
		b:m6 e:m/b | b:m e:m/b | b:m6 e:m/b | b:m e:m/b | b:m6 e:m/b |
		b:m a:m7 | d a:m7 | d1:7 | d:7 |

		\endPart
		\myMark "A'"
		\startPart
		g2 a:m7 | b:m7 a:m7 | g a:m7 | g b:7 | e a |
		e a e a4 e | cis1 | cis | cis2 d | g a:m7 | g d:m7 | g a:m7 |
		g c |
	} \alternative {
		{
			g1 | g | b2:m a:m7 |
		}
		{
			g4 c2:7 d4:7 | g1 |
		}
	}
	\endPart
	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	%%\tempo "Allegro" 4 = 130
	\time 2/2
	\key g \major

	\partial 4
	d,4
	%% part "A"
	\repeat volta 2 {
		g4 g a g8 a | b8 d4.~ d4 r8 d, | b'4 b8 a~ a b a4 | g2 fis | e4 e cis4. r8 |
		e4 e cis4. cis8 | e4 e cis e | eis1~ | eis2 fis | g4 g a g8 a | b8 d4.~ d4 r |
		b4 b8 a~ a b a4 | g2 fis | e4 e cis8 cis4 cis8 | e8 e4 e8 cis cis cis cis |
		e4 e cis e | eis1~ | eis2 fis | g1~ | g2 r | fis4 d8 b d4 b8 d |
		fis2 e8 fis e d | d1~ | d4 r e8 fis e b | d4 b8 d fis2~ | fis e8 fis e b |
		d4 b8 d e4 c8 e | fis4 d8 fis g4 e8 g | a4 fis8 a c2~ | c r4 d, | g4 g a g8 a |
		b8 d4.~ d4 r8 d, | b'4 b8 a~ a b a4 | g2 fis | e4 e cis4. r8 | e4 e cis4. cis8 |
		e8 e4 e8 cis4 e | eis1 | \xNote { \times 2/3 { b'4 b b } g e } | r2 fis4 fis | g1~ | g4 r f f g1~ |
		g4 r e4 e |
	} \alternative {
		{
			g1~ | g2 r | R1 |
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
	got no mule, I got no mis -- er -- y. __ De folks wid plen -- ty o' plen -- ty __
	got a lock __ on de door, _ __ faid some -- bod -- y's a go -- in' to rob 'em while dey's
	out a mak -- in' more. __ What for? __ I got no lock on de
	door, (dat's no way to be.) __ Day kin steal de rug from de floor, __ dat's o -- keh wid
	me, 'cause de things dat I prize, like de stars in de skies, all are free. __ Oh, I Got Plen -- ty O'
	Nut -- tin; __ an' nut -- tin's plen -- ty fo' me. I got a gal, got my song, got
	heb ben the whole day logn. No use com -- plain -- in'! Got my gal, __ got my Lawd, __
	go tmy song. __
	song. __

}
% endif

% if part=='LyricsmoreFake':
\lyricmode {
	\skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1
	got the sun, got the moon, _ got the deep blue sea. __ De folks wid plen -- ty o' plen -- ty __
	got to pray __ all de day, _ __ Seems wid plen -- ty you sure got to wor -- ry how to
	keep the debbel a -- way, __ a -- way. __ I ain't a -- fret -- tin' 'bout
	hell 'til de time ar -- rive. __ Nev -- er wor -- ry long as I'm well, __ nev -- er one to strive to be good, to be bad, what the hell? I is glad I's a love. __
}
% endif
