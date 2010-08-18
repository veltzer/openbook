\include "src/include/common.lyi"
\header{
	title="Desafinado"
	subtitle="Slightly Out Of Tune"
	composer="Antonio Carlos Jobim"
	copyright="1959 1962, Editora Musical Arapua, Sao Paulo, Brazil"
	style="Jazz"
	piece="Medium Bossa Nova"
	poet="Newton Mendonca, Jon Hendricks and Jessie Cavanaugh"

	completion="5"
	uuid="c3fff540-a26e-11df-9435-0019d11e5a41"
}

%{
	TODO:
	- turn the tune to be relative.
%}

myChords=\chordmode {
	\set chordChanges = ##t
%%	list of instruments can be found at
%%	http://lilypond.org/doc/v2.11/Documentation/user/lilypond/MIDI-instruments#MIDI-instruments
%%	\set ChordNames.midiInstrument = #"acoustic grand"

	\mark "A"
	f1:maj7 | f1:maj7 | g1:7.5- | g1:7.5- | g1:m7 | c1:7 | a1:m7.5- | d1:9- |
	g1:m7 | a1:9- | d1:7 | d1:9- | g1:9- | g1:9- | ges1:maj7 | ges1:maj7 |

	\mark "B"
	f1:maj7 | f1:maj7 | g1:7.5- | g1:7.5- | g1:m7 | c1:7 | a1:m7.5- | d1:9- |
	g1:m7 | bes1:m | a1:m7 | b2:m7.5- e2:9+ |

	\mark "C"
	a1:maj7 | bes1:dim | b1:m11 | e1:7 |
	a1:maj7 | bes1:dim | b1:m11 | e1:7 |
	a1:maj7 | fis1:m7 | b1:m11 | e1:7 |
	c1:maj7 | cis1:dim | d1:m11 | g1:7 |
	g1:m7 | fis1:m7 | g1:7 | c1:7 |

	\mark "D"
	f1:maj7 | f1:maj7 | g1:7.5- | g1:7.5- | g1:m7 | c1:7 | a1:m7.5- | d1:9- |
	g1:m7 | bes1:m | a1:m7 | aes1:dim | g1:7 | g1:7 | bes1:m7 | ees1:9 |
	g1:7 | g2:m7 c2:9+ | f1:6.9 | f1:6.9 |
	\bar "|."
}
myVoice=\relative c'{
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major
%%	list of instruments can be found at
%%	http://lilypond.org/doc/v2.11/Documentation/user/lilypond/MIDI-instruments#MIDI-instruments
%%	\set Staff.midiInstrument = #"flute"

	r8 c'4 d8 e4 f |
	e4. d8 cis4 d |
	f4. des8 des2 ~ |
	des2. r4 |
	r8 d4 e8 f4 g |
	f4. e8 dis4 e |
	c4. ees8 ees2 ~ |
	ees2. r4 |
	r8 d c' bes a g4 bes8 ~ |
	bes4. a8 dis4 e |
	fis8 a fis2 d4 |
	ees1 |
	r8 aes4 g8 f4 d |
	aes4. g8 f4 d |
	f4. des8 des2 ~ |
	des r |

	r8 c'4 d'8 e'4 f' |
	e'4. d'8 cis'4 d' |
	f'4. des'8 des'2 ~ |
	des'2. r4 |
	r8 d'4 e'8 f'4 g' |
	f'4. e'8 dis'4 e' |
	c''4. ees'8 ees'2 ~ |
	ees'2. r4 |
	r8 c''4 bes'8 a' g'4 bes'8 ~ |
	bes'4. a'8 g'4 f' |
	g'8 f' g'2. ~ |
	g'2 r |
	
	e'4 fis' e'8 fis'4 e'8 ~ |
	e'4. d'8 cis'4 d' |
	e'1 ~ |
	e'2 r4 cis' |
	e' fis' e'8 fis'4 e'8 ~ |
	e'4. d'8 cis'4 d' |
	e'4. b8 e'2 ~ |
	e' r |
	r8 e'4 fis'8 gis'4 a' |
	b'4. a'8 cis'4 d' |
	e'8 fis' e' fis' e'2 ~ |
	e' r4 e' |
	g' a' g'8 a'4 g'8 ~ |
	g'4. f'8 e'4 f' |
	g' d'8 g' ~ g' d' g'4 ~ |
	g' r r8 d' g' a' |
	bes'4 a' bes'8 a'4 c''8 ~ |
	c''4. bes'8 a'4 bes' |
	g'1 ~ |
	g'4 r r2 |
	
	r8 c'4 d'8 e'4 f' |
	e'4. d'8 cis'4 d' |
	f'4. des'8 des'2 ~ |
	des'2. r4 |
	r8 d'4 e'8 f'4 g' |
	f'4. e'8 dis'4 e' |
	d'' des'' c'' b' |
	bes' d'' r a' |
	c''4. b'8 bes'4 a' |
	bes' a' g' f' |
	a'2. e'4 |
	g'2. d'8 e' |
	f' f' f' f' f'4 f' |
	r8 d'4 e'8 f'4 f' |
	f'8 f' f' f' c''4 bes' ~ |
	bes'2. d'8 e' |
	f' f' f' f' f'4 e'8 f' ~ |
	f'4 r8 e' dis'4 e' |
	g'4. f'8 f'2 ~ |
	f'2. r4 |
}
myLyrics=\lyricmode {
	Love is like a nev -- er end -- ing mel -- o -- dy;
	po -- ets have com -- pared it to a sym -- pho -- ny,
	a sym -- pho -- ny con -- duc -- ted by the light -- ing of the moon,
	but our song of love is Slight -- ly Out Of Tune.

	Once your kiss -- es raised me to a fev -- er pitch,
	now the orch -- es -- tra -- tion does -- n't seem so rich.
	Seems to me you've changed the tune we used to sing;

	like the Bos -- sa No -- va, love should swing.
	We used to har -- mo -- nize two souls in per -- fect time.
	Now the song is dif -- f'rent and the words don't e -- ven rhyme,
	'cause you for -- got the mel -- o -- dy our hearts would al -- ways croon,
	and so what good's a heart that's Slight -- ly Out Of Tune.

	Tune your heart to mine the way it uysed to be;
	join with me in har -- mo -- ny and sing a song of lov -- ing.
	We're bound to get in tune a -- gain be -- fore too long.
	There'll be no De -- sa -- fi -- na -- do when your heart be -- longs to me com -- plete -- ly.
	Then you won't be Slight -- ly Out Of Tune, you'll sing a -- long with me.
}
%% score for printing
\score {
	<<
		\new ChordNames="mychords" \myChords
		\new Voice="myvoice" \myVoice
		\new Lyrics \lyricsto "myvoice" \myLyrics
	>>
	\layout {
	}
}
%% score for midi
\score {
	\unfoldRepeats
	<<
		\new ChordNames="mychords" \myChords
		\new Voice="myvoice" \myVoice
	>>
	\midi {
	}
}
