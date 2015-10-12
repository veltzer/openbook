\header{
    title = "The End Of A Love Affair"
    subtitle = ""
    composer = ""
    enteredby = "Silvia Bertoluzza"
    tagline = #tagline
    head = #instrument
}


Staff = \notes \context Voice = $Staff {
    \property Staff.midiInstrument = "acoustic grand"
    \time 4/4
    \key f \major
    \clef treble
    \partial 4 f'8 g' 
    \repeat volta 2 { a'4. a'8   \times 2/3 { a'4 g' f'  } |
		      e'2 r4 d'8 c' |
		      g'4. g'8 \times 2/3 { g'4 f' ees' } |
		      d'2 r4 c'8 bes |
				%5
		      f'4 f'8 f' f'4 aes'8 bes' |
		      f'4 f'8 f' f'4 ees'8 des' |
		      c'4 c'8 bes c'4. c'8 |}
    \alternative	{{c'2 r4 f'8 g' |}
			 {c'2 r4 d'8 e' |}}
				%10
    f'4 d'8 f' a'4 f'8 d' |
    f'4 f'2 d'8 e' |
    f'4 d'8 f' a'4 f'8 d' |
    f'2 r4 e'8 f' |
    g'4 e'8 g' b'4 a'8 g' |
				%15
    a'4 b'8 c'' d''4. d''8 |
    d''1 ~ |
    d''2 r4 f'8 g' |
    a'4. a'8   \times 2/3 { a'4 g' f'  } |
    e'2 r4 d'8 c' |
    g'4. g'8 \times 2/3 { g'4 f' ees' } |
    d'2 r4 c'8 bes |
				%5
    f'4 f'8 f' f'4 aes'8 bes' |
    f'4 f'8 f' f'4 ees'8 des' |
    c'4 c'8 bes c'4. c'8 |
    c''2 r4 bes'8 a' |
    a'4 a'8 g' \times 2/3 { a'4 a' g' } |
				%20
    bes'2 r8 a' g' f' |
    e'4 e'8 d' e'4 e'8 d' |
    g'2 r4 f'8 e' |
    d'4 d'8 c' d'4 d'8 c' |
    d'4 f'8 bes' d''4. e'8 |
				%25
    f'1 ~ |
    f'2. r4 \bar "|."
}

StaffStaff = \context Staff = StaffStaff <
    \property Staff.automaticMelismata = ##t
    \Staff
>


accompaniment = \chords{
    \partial 4 R4 |
				%diminuito:3-.5-.7-
				%semidiminuito:m7.5-
    g2:m7 c:7 f1:maj 
    f2:m7 bes:7 ees1:maj
    ees2:m7 aes:7 ees:m7 aes:7 des:maj c4:sus 
    c:7 f2 d:m7 f1
    d2:m7 g:7 
    d2:m7 g:7 
    d2:m7 g:7 
    d2:m7 g:7 
    c1:maj a2:m7 
    d:7 d2:m7 g:7 
    g:m7 c:7 g2:m7 c:7 f1:maj 
    f2:m7 bes:7 ees1:maj
    ees2:m7 aes:7 ees:m7 aes:7 des:maj c4:sus 
    c:7 c2:m7 f:7
    bes1:maj ees:9 f gis:3-.5-.7-
    g2:m7 c:7 g:m7 c:9 
    f
}

texta = \lyrics{
    So I walk a lit -- tle too fast, and I drive a lit -- tle too
    fast and I'm reck -- less, it's true, but what else can you do at
    the end of a love af -- fair? So I stare 
    Do they know, do they care that it's on -- ly that I'm 
    lone -- ly and low as can be?
    And the smile on my face is -- n't real -- ly a smile at all?
    So I smoke a lit -- tle too much, and I drink a lit -- tle too
    much, and the tunes I re -- quest are not al -- ways the best
    but the ones where the trum -- pets blare! 
    So I go at a mad -- den -- ing pace, and I pre -- tend that it's 
    ta -- king his place. But what else can you do at
    the end of a love af -- fair? 
}

textb = \lyrics{ _ _
		 talk a lit -- tle too much, and a laugh a lit -- tle too much,
		 and my voice is too loud when I'm out in a crowd, so that peo -- ple are
		 apt to  

	     }

Score = <
    \context ChordNames \accompaniment
    \addlyrics
    \StaffStaff
    \context Lyrics <\texta \textb>
>
