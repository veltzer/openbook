\header{
    title = "Bewitched"
    subtitle = ""
    composer = "Rogers \& Hart"
    enteredby = "Silvia Bertoluzza"
    tagline = #tagline
    head = #instrument
}


Staff = \notes \context Voice = $Staff {
    \property Staff.midiInstrument = "acoustic grand"
    \time 4/4
    \key c \major
    \clef treble
    \partial 4 g'4 \bar"|:" 
    \repeat volta 2	{ 
	e'8 b' c''2 e'4 |
	f'8 b' c''2 f'4 |
	g'8 b' c''4 gis'8 b' c''4 |
	a'8 b' c''2 b'4 |
				%5
	c'' r b'8 a' g' fis' |
	g'4 d'2 e'4 |
    } \alternative	{
	{ f'1 ~ | f'2. g'4  \bar":|"}
	{ a'1 ~ | a'2. r4 \bar"||"}
    }
    b'8 a' f'2 b'8 a' |
    f'4 f'2. |
    b'8 a' e'2 b'8 a' |
    e'1 |
				%15
    c''8 b' g'2 c''8 b' |
    g'4 g' ~ g'8 a' b' c'' |
    d''2 c'' |
    f'2. g'4 \bar"||"
    e'8 b' c''2 e'4 |
				%20
    f'8 b' c''2 f'4 |
    g'8 b' c''4 gis'8 b' c''4 |
    a'8 b' c''2 b'4 |
    c'' r b'8 a' g' fis' |
    g'4 d''2 g'4 |
				%25
    c''1 ~ |
    c''2. r4 \bar "|."
}


StaffStaff = \context Staff = StaffStaff <
    \property Staff.automaticMelismata = ##t
    \Staff
>

accompaniment = \chords{
    \partial 4 R4 |
    c2 cis:3-.5-.7- d:m7
    g:7 c c:aug7
    f:maj g:7.9- c d:7 g1:7
    d:m7 g:7 f:maj e2:m7 a:7 d1*2:m
    a:m d2:m7 g:7 g1:7 e2:m7
    a:7.9+
    d:m7 g:7
    c2 cis:3-.5-.7- d:m7
    g:7
    c c:aug7 f:maj  
    g:7.9- c d:7 d:m7 g:7 c f:maj c1
}


textb = \lyrics { 
    _
    could -- n't 
    sleep and would -- n't sleep
    when love came and told me I should -- n't sleep
    Be -- witched,
    bo -- thered and be -- wild -- ered
    am
}

texta = \lyrics{
    I'm 
    wild a -- gain be -- guiled a -- gain
    a sim -- per -- ing whim -- per -- ing
    child  a -- gain Be -- witched,
    bo -- thered and be -- wild -- ered
    am
    I? I I
    Lost my heart, but what of it?
    He is cold I a -- gree. He can laugh but I love it
    al -- though the laugh's on me I'll
    sing to him, each spring to him, and long for
    the day when I'll cling to him
    Be -- witched,
    bo -- thered and be -- wild -- ered
    am I.
}

Score = <
    \context ChordNames \accompaniment
    \addlyrics
    \StaffStaff
    \context Lyrics < \texta \textb>
>
