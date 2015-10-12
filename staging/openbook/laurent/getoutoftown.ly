\header{
    title = "Get Out Of Town"
    subtitle = ""
    composer = "Cole Porter"
    enteredby = "Silvia Bertoluzza"
    tagline = #tagline
    head = #instrument
}


Staff = \notes \context Voice = $Staff {
    \property Staff.midiInstrument = "acoustic grand"
    \time 4/4
    \key bes \major
    \clef treble
    d'8 d' d' d' ~ d'2 |
    r4 d'8 d' ~ d' d' d'4 |
    e' e'8 e' ~ e'2 ~ |
    e' r | \break
				%5
    g'8 g' g' g' ~ g'2 |
    r4 g'8 g' ~ g' fis' g'4 |
    d''1 ~ |
    d''2 r | \break
    d''8 d'' d'' d'' ~ d''2 | 
				%10
    r4 a' gis' a' |
    c''8 c'' c'' c'' ~ c''2 |
    r4 g' fis' g' | \break
    bes'8 bes' bes' bes' ~ bes'2 |
    r4 a'8 c'' ~ c'' c''4 bes'8 |
				%15
    a'1 ~ |
    a'2 r | \break
    d'8 d' d' d' ~ d'2 |
    r4 d'8 d' ~ d' d' d'4 |
    e' e'8 e' ~ e'2 |
				%20
    r r4 d' | \break
    g'8 g' g' g' ~ g'2 |
    g'8 g' g' fis' ~ fis'4 g' |
    d'' d''8 d'' ~ d''2 |
    r r4 d'' | \break
				%25
    \times 2/3 { d'' b' c'' } f''4. ees''8 |
    \times 2/3 { ges'4 f' ges'  }  d''4. c''8 |
    a' c''4 bes'8 cis' d' f' aes' ~ |
    aes'2. g'4 | \break
    ees'' ees''8 ees'' ~ ees''4 ees'' |
				%30
    ees'' r \times 2/3 { d'' des'' c'' } |
    bes'1 |
    r \bar "|."
}

StaffStaff = \context Staff = StaffStaff <
    \property Staff.automaticMelismata = ##t
    \Staff
>


accompaniment = \chords {
    g1*2:m6
    g:m6 g:m6 d1:m7.5- g:7
    c:m9 f:7 bes:maj ees:9
    e:m7.5- 
    a:7 a:m7.5-
    d:7
    g1*2:maj g:m6
    g:m6 d1:m7.5- g:7 c:m9 
    ees2:m7 aes:7 bes:maj ees:7
    d:m7.5- g:7 c1:m7 c2:m7.5- f:7 bes1:6 a2:m7.5- d2:7
}

text = \lyrics {
    Get out of town be -- fore it's too late my love
    Get out of town, Be good to me, please.
    Why wish me harm? Why not re -- tire to a farm,
    and be con -- tent -- ed to charm The birds of the trees?
    Just dis -- ap -- pear, I care for you much too much, And when you are 
    near, close to me dear, We touch too much, 
    The thrill when we meet 
    Is so bit -- ter sweet
    that dar -- ling, it's get -- ting me down.
    So on your mark, get
    set, Get out of town.
}

\midi { \tempo 4 = 160 }

Score = \notes <
    \context ChordNames \accompaniment
    \property ChordNames.SeparatingGroupSpanner \set #'kern = #70
    \addlyrics
    \StaffStaff
    \context Lyrics \text
>

#(set! minimumVerticalExtent 4)
