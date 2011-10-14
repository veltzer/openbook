<%inherit file="/src/include/common.makoi"/>
<%
	attributes['jazzTune']=True
	attributes['render']="Unknown"
	attributes['type']="harmony_tune_lyrics"

	attributes['title']="Desafinado"
	attributes['subtitle']="Slightly Out Of Tune"
	attributes['composer']="Antonio Carlos Jobim"
	attributes['copyright']="1959 1962, Editora Musical Arapua, Sao Paulo, Brazil"
	attributes['style']="Jazz"
	attributes['piece']="Medium Bossa Nova"
	attributes['poet']="Newton Mendonca, Jon Hendricks & Jessie Cavanaugh"

	attributes['completion']="5"
	attributes['uuid']="c3fff540-a26e-11df-9435-0019d11e5a41"

	attributes['idyoutube']="g6w3a2v_50U"
	attributes['idyoutube']="Vixc_Hu4Ris"
	attributes['idyoutube']="lo1SiVwVqic"
%>

<%doc>
	DONE:
	TODO:
	- document what has been done with this tune.
	- what version is this?
	- document the you tube performances.
</%doc>

<%def name="myChordsUnknown()">
\chordmode {
	\startChords
%%	list of instruments can be found at
%%	http://lilypond.org/doc/v2.11/Documentation/user/lilypond/MIDI-instruments#MIDI-instruments
	\set ChordNames.midiInstrument = #"acoustic grand"

	\startSong

	\mark "A"
	\startPart
	f1:maj7 | f1:maj7 | g1:7.5- | g1:7.5- | \myEndLine
	g1:m7 | c1:7 | a1:m7.5- | d1:9- | \myEndLine
	g1:m7 | a1:9- | d1:7 | d1:9- | \myEndLine
	g1:9- | g1:9- | ges1:maj7 | ges1:maj7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	f1:maj7 | f1:maj7 | g1:7.5- | g1:7.5- | \myEndLine
	g1:m7 | c1:7 | a1:m7.5- | d1:9- | \myEndLine
	g1:m7 | bes1:m | a1:m7 | b2:m7.5- e2:9+ | \myEndLine
	\endPart

	\mark "C"
	\startPart
	a1:maj7 | bes1:dim7 | b1:m11 | e1:7 | \myEndLine
	a1:maj7 | bes1:dim7 | b1:m11 | e1:7 | \myEndLine
	a1:maj7 | fis1:m7 | b1:m11 | e1:7 | \myEndLine
	c1:maj7 | cis1:dim7 | d1:m11 | g1:7 | \myEndLine
	g1:m7 | fis1:m7 | g1:7 | c1:7 | \myEndLine
	\endPart

	\mark "D"
	\startPart
	f1:maj7 | f1:maj7 | g1:7.5- | g1:7.5- | \myEndLine
	g1:m7 | c1:7 | a1:m7.5- | d1:9- | \myEndLine
	g1:m7 | bes1:m | a1:m7 | aes1:dim7 | \myEndLine
	g1:7 | g1:7 | bes1:m7 | ees1:9 | \myEndLine
	g1:7 | g2:m7 c2:9+ | f1:6.9 | f1:6.9 | \myEndLine
	\endPart

	\endSong

	\endChords
}
</%def>

<%def name="myVoiceUnknown()">
\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major
%%	list of instruments can be found at
%%	http://lilypond.org/doc/v2.11/Documentation/user/lilypond/MIDI-instruments#MIDI-instruments
	\set Staff.midiInstrument = #"flute"

	%% A: Bar 1
	r8 c4 d8 e4 f |
	e4. d8 cis4 d |
	f4. des8 des2~ |
	des2. r4 |
	r8 d4 e8 f4 g |
	f4. e8 dis4 e |
	c'4. ees,8 ees2~ |
	ees2. r4 |
	r8 d c' bes a g4 bes8~ |
	bes4. a8 dis,4 e |
	fis8 a fis2 d4 |
	ees1 |
	r8 aes4 g8 f4 d |
	aes'4. g8 f4 d |
	f4. des8 des2~ |
	des r |

	%% B: Bar 17
	r8 c4 d8 e4 f |
	e4. d8 cis4 d |
	f4. des8 des2~ |
	des2. r4 |
	r8 d4 e8 f4 g |
	f4. e8 dis4 e |
	c'4. ees,8 ees2~ |
	ees2. r4 |
	r8 c'4 bes8 a g4 bes8~ |
	bes4. a8 g4 f |
	g8 f g2.~ |
	g2 r |

	%% C: Bar 29
	e4 fis e8 fis4 e8~ |
	e4. d8 cis4 d |
	e1~ |
	e2 r4 cis |
	e fis e8 fis4 e8~ |
	e4. d8 cis4 d |
	e4. b8 e2~ |
	e r |
	r8 e4 fis8 gis4 a |
	b4. a8 cis,4 d |
	e8 fis e fis e2~ |
	e r4 e |
	g a g8 a4 g8~ |
	g4. f8 e4 f |
	g d8 g~ g d g4~ |
	g r r8 d g a |
	bes4 a bes8 a4 c8~ |
	c4. bes8 a4 bes |
	g1~ |
	g4 r r2 |

	%% D: Bar 49
	r8 c,4 d8 e4 f |
	e4. d8 cis4 d |
	f4. des8 des2~ |
	des2. r4 |
	r8 d4 e8 f4 g |
	f4. e8 dis4 e |
	d' des c b |
	bes d r a |
	c4. b8 bes4 a |
	bes a g f |
	a2. e4 |
	g2. d8 e |
	f f f f f4 f |
	r8 d4 e8 f4 f |
	f8 f f f c'4 bes~ |
	bes2. d,8 e |
	f f f f f4 e8 f~ |
	f4 r8 e dis4 e |
	g4. f8 f2~ |
	f2. r4 |
}
</%def>

<%def name="myLyricsUnknown()">
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
</%def>
