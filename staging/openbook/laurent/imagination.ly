\header {
    title = "Imagination"
    subtitle = ""
    composer = "Burke \& Van Heusen"
    enteredby = "Silvia Bertoluzza"
    tagline = #tagline
    head = #instrument
}


Staff = \notes \context Voice = $Staff {
    \property Staff.midiInstrument = "acoustic grand"
    \time 4/4
    \key ees \major
    \clef treble
    \partial 4.  d'8 ees' f' 
    \repeat volta 2 { 
	g'4 g'2 bes'4 |
	aes' aes'2 c''4 |
	bes' bes' \times 2/3 { bes' c'' des'' } |
	bes' bes'2. |
				%5
	aes'4 aes' \times 2/3 { aes' bes' c''  } |
	aes' aes' c'' bes'8 g' ~ |
    } \alternative { 
	{ g'2 bes'4 aes'8 f' ~ | f'2 r8 d' ees' f' |}
	{ g'2 bes'4 g'8 f' ~ | f'2. r4 |}
    }
    r ees'8 f' g' aes' bes' c'' |
    d''4 d'' a'4. bes'8 |
    c''4 c'' g'4. a'8 |
    bes'4 r8 bes' e'2 |
				%15
    r4 f'8 g' a' bes' c'' d'' |
    ees''4 ees'' \times 2/3 { a' bes' c'' } |
    bes'2. c''4 |
    fis'2 r8 d' ees' f' |
    g'4 g'2 bes'4 |
				%20
    aes' aes'2 c''4 |
    bes' bes' \times 2/3 { bes' c'' des'' } |
    bes' bes'2. |
    aes'4 aes' \times 2/3 { aes' bes' c'' } |
    aes' aes' \times 2/3 { aes' a' bes' } |
				%25
    g'1 ~ |
    g'4 bes' aes' g' |
    f' f' \times 2/3 { f' g' aes' } |
    f' f'2 g'4 |
    ees'1 ~ |
				%30
    ees'2 r \bar "|."
}

StaffStaff = \context Staff = StaffStaff <
    \property Staff.automaticMelismata = ##t
    \Staff
>




accompaniment = \chords{
    \partial 4. R8*3
				%diminuito:3-.5-.7-
				%semidiminuito:m7.5-
    ees2 e:m7.5- f:m
    bes:7 ees bes:m 
    c1:7.9- 
    f2:m c:7.5+.9-
    f:m bes:7 g:m 
    c:7.9- f:m bes:7
    ees1:7 bes2:m ees:7
    aes1 a2:m d:7 g1:m c:7.9-
    bes c2:m f:7 f1:m 
    bes:7.5+.9-
    ees2 
    e:m7.5- f:m
    bes:7 ees bes:m 
    c1:7.9- 
    f2:m c:7.5+.9-
    f:m bes:7 g1:7.9+
    c:7.9- f:m f2:m/+bes bes:7.9- ees1 f2:m bes:7 
}

texta = \lyrics{
    I -- ma -- gi  -- na -- tion is fun -- ny it
    makes a clou -- dy day sun -- ny,
    makes a bee think of ho -- ney, Just as I
    think of you I -- ma -- gi 
    _ what to do?
    Have you e -- ver felt a gen -- tle touch and then
    a kiss and then, and then find it's on -- ly your 
    i -- ma -- gi -- na -- tion a -- gain? Oh, well,
    I -- ma -- gi -- na -- tion is sil -- ly you go a -- round wi -- lly -- ni -- lly
    For e -- xam -- ple I go a -- round wan -- ting you. And yet I can't i -- ma -- gine that
    you want me too. 
}

textb = \lyrics{ _ _ _
		 na -- tion is cra -- zy, Your whole per -- spec -- tive gets 
		 ha -- zy. Stary you as -- king a dai -- sy what to do?
	     }

\midi { \tempo 4 = 60 }

Score = \notes <
    \context ChordNames \accompaniment
    \property ChordNames.SeparatingGroupSpanner \set #'kern = #70
    \addlyrics
    \StaffStaff
    \context Lyrics  < \texta \textb>
>
