<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']='Desafinado'
	attributes['style']='Jazz'
	attributes['subtitle']='Slightly Out Of Tune'
	attributes['composer']='Antonio Carlos Jobim'
	# this is from the fake book
	attributes['poet']='Newton Mendonca, Jon Hendricks, Jessie Cavanaugh'
	# this is from the fake book
	attributes['piece']='Medium Bossa Nova'
	# this is from the fake book
	attributes['copyright']='1959 and 1962, Editora Musical Arapua, Sao Paulo, Brazil'
	attributes['copyrightextra']='1959 1962, Editora Musical Arapua, Sao Paulo, Brazil'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='c3fff540-a26e-11df-9435-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='rbk1:112-113,jfb:97'

	attributes['idyoutuberemark1']='Joao Gilberto in a nice brasilian version'
	attributes['idyoutube1']='g6w3a2v_50U'
	attributes['idyoutuberemark2']='Stan Getz in a nice instrumental version'
	attributes['idyoutube2']='lo1SiVwVqic'
	attributes['lyricsurl']='http://www.hotlyrics.net/lyrics/E/Ella_Fitzgerald/Desafinado.html'
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- brought in the fake book epdf.
	- put in the tunes meta data from the fake book.
	- put in the tunes chords from the fake book.
	- put in the tunes tune from the fake book.
	- put in the tunes lyrics from the fake book.
	- filled in the tunes structure
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- heard the tune to make sure it sounds ok.
	- documented the you tube performances.
	- added a lyrics url.
	TODO:
	- add the real book version of this tune.
	- in the fake book version the rythm for this tune is cut time instead of regular 4/4.
	make it so. (how do I do that in lilypond?)
	REMARKS:
	- the tune structure is marked as AABA but all the A's in there are not exactly the same.
	still AABA is a good description of this tune (better than ABCD which would be a description
	that a pedantic would give).
% endif

% if part=='ChordsFake':
\chordmode {
%%	list of instruments can be found at
%%	http://lilypond.org/doc/v2.11/Documentation/user/lilypond/MIDI-instruments#MIDI-instruments
%%	\set ChordNames.midiInstrument = #"acoustic grand"

	\startChords
	\startSong

	\myMark "A"
	\startPart
	f1*2:maj7 | g:7.5- | \myEndLine
	g1:m7 | c2.:7 c4:7/bes | a1:m7.5- | d:7.9- | \myEndLine
	g:m7 | a:7.9- | d:7 | d:7.9- | \myEndLine
	g1*2:7.9- | ges:maj7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1*2:maj7 | g:7.5- | \myEndLine
	g1:m7 | c2.:7 c4:7/bes | a1:m7.5- | d:7.9- | \myEndLine
	g:m7 | bes2:m7 ees:7 | f1:maj7 | b2:m7.5- e:9- | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	a1:maj7 | bes:dim7 | b:m7 | e:7 | \myEndLine
	a | bes:dim7 | b:m7 | e:7 | \myEndLine
	a | fis:m7 | b:m7 | e:7 | \myEndLine
	c:maj7 | cis:dim7 | d:m7 | g:7 | \myEndLine
	g:m7 | fis:dim | g:7 | c2:7 c:7.5- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1*2:maj7 | g:7.5- | \myEndLine
	g1:m7 | c2.:7 c4:7/bes | a1:m7.5- | d:7.9- | \myEndLine
	g:m7 | bes2:m ees:7 | f1:maj7 | d:m7 | \myEndLine
	g1*2:7 | bes1:m7 | ees:7.9 | \myEndLine
	g:7 | g2:m7 c:7 | f1*2:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

%%	list of instruments can be found at
%%	http://lilypond.org/doc/v2.11/Documentation/user/lilypond/MIDI-instruments#MIDI-instruments
%%	\set Staff.midiInstrument = #"flute"

	%% part "A"
	r8 c4 d8 e4 f | e4. d8 cis4 d | f4. des8 des2~ | des1 |
	r8 d!4 e8 f4 g | f4. e8 dis4 e | c'4. ees,8 ees2~ | ees1 |
	r8 d c' bes a g4 bes8~ | bes4. a8 dis,4 e | fis8 a fis2 d4 | ees1 |
	r8 aes4 g8 f4 d | aes'4. g8 f4 d | f4. des8 des2~ | des r |

	%% part "A"
	r8 c4 d8 e4 f | e4. d8 cis4 d | f4. des8 des2~ | des1 |
	r8 d!4 e8 f4 g | f4. e8 dis4 e | c'4. ees,8 ees2~ | ees1 |
	r8 c'4 bes8 a g4 bes8~ | bes4. a8 g4 f | g8 f g2.~ | g2 r |

	%% part "B"
	e4 fis e8 fis4 e8~ | e4. d8 cis4 d | e1~ | e2 r4 cis |
	e fis e8 fis4 e8~ | e4. d8 cis4 d | e4. b8 e2~ | e1 |
	r8 e4 fis8 gis4 a | b4. a8 cis,4 d | e8 fis e fis e2~ | e r4 e |
	g a g a | g f e f | g d8 g~ g d g4~ | g r r8 d g a |
	bes4 a bes a | c bes a bes | g1~ | g4 r r2 |

	%% part "A"
	r8 c,4 d8 e4 f | e4. d8 cis4 d | f4. des8 des2~ | des1 |
	r8 d!4 e8 f4 g | f4. e8 dis4 e | d' des c b | bes! d r a |
	c4. b8 bes4 a | bes a g f | a2. e4 | g2. d8 e |
	f f f f f4 f | r8 d4 e8 f4 f | f8 f f f c'4 bes~ | bes2. d,8 e |
	f f f f f4 e8 f~ | f4 r8 e dis4 e | g4. f8 f2~ | f1 |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	Love is like a nev -- er end -- ing mel -- o -- dy; __
	po -- ets have com -- pared it to a sym -- pho -- ny, __
	a sym -- pho -- ny con -- duc -- ted by the light -- ing of the moon,
	but our song of love is Slight -- ly Out Of Tune. __

	Once your kiss -- es raised me to a fev -- er pitch, __
	now the orch -- es -- tra -- tion does -- n't seem so rich. __
	Seems to me you've changed __ the tune we used to sing; __

	like the Bos -- sa No -- va, love should swing. __
	We used to har -- mo -- nize __ two souls in per -- fect time. __
	Now the song is dif -- f'rent and the words don't e -- ven rhyme, __
	'cause you for -- got the mel -- o -- dy our hearts would al -- ways croon, __
	and so what good's a heart that's Slight -- ly Out Of Tune. __

	Tune your heart to mine the way it uysed to be; __
	join with me in har -- mo -- ny and sing a song of lov -- ing.
	We're bound to get in tune a -- gain be -- fore too long.
	There'll be no De -- sa -- fi -- na -- do when your heart be -- longs to me com -- plete -- ly. __
	Then you won't be Slight -- ly Out Of Tune, __ you'll sing a -- long with me. __
}
% endif
