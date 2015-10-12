\header{
    title = "Lover Man"
    subtitle = ""
    composer = "Davis, Ramirez \& Sherman"
    tagline = #tagline
    head = #instrument
}

beats = \notes \context Voice = beats {
    \property Voice.Stem \override #'molecule-callback = #'()
    \property Voice.NoteHead \override #'style = #'slash
    e''4 e'' e'' e''
    \property Voice.Stem \revert #'molecule-callback
    \property Voice.NoteHead \revert #'style 
}

Staff = \notes \context Voice = $Staff {
    \property Staff.midiInstrument = "acoustic grand"
    \time 4/4
    \key f \major
    \clef treble
    \repeat volta 2{
        r8 d' e' d' g'4 d'8 e' |
	f' d' a' g' ~ g'2 |
	r8 g' a' g' c''4 g'8 a' |
	bes' g' d'' c'' ~ c''2 |
				%5
	aes'8 f' g' f' aes' f'4. |
	aes'8 f' g' f' c'' f'4. |
	des'8 f' g' aes' g'4 f'8 d' |
	} \alternative {
        {<f'1  { \beats } > \bar ":|"}
	{f'1 \bar "||"}
    }
				%10
    c''4 a'8 b' c''4 a'8 b' |
    c''4. a'8 \times 2/3 { c''4 d'' c'' } |
    b' g'8 a' \times 2/3 { b'4 a' g' } |
    < b'1 { \beats } >|
    bes'4 g'8 a' bes'4 g'8 a' |
				%15
    bes'4 g'8 a' \times 2/3 { bes'4 c'' bes' } |
    a'2 \times 2/3 { a'4 g' f' } |
    a'1 \bar"||"
    r8 d' e' d' g'4 d'8 e' |
    f' d' a' g' ~ g'2 |
    r8 g' a' g' c''4 g'8 a' |
    bes' g' d'' c'' ~ c''2 |
				%5
    aes'8 f' g' f' aes' f'4. |
    aes'8 f' g' f' c'' f'4. |
    des'8 f' g' aes' g'4 f'8 d' |
    f'2. r4 \bar "|."
}

StaffStaff = \context Staff = StaffStaff <
				%  \property Staff.automaticMelismata = ##t
    \Staff
>



accompaniment = \chords{
				%  \property ChordNames.ChordName \override #'word-space = #2
    d2:m7 g:7 | d:m7 g:7 | g:m7 c:7 | g:m7 c:7 | 
    f1:7 bes:7 | bes4:m7 ees:7 g:m7 c:7 | f2:maj e4:m7 a:7 | 
    f2:maj bes:7 | a:m a:m.7+ | a:m7 d:7 | g:maj a:m7 | 
    b:m7 a4:m7 d:7 | g2:m g:m.7+ | g:m7 c:7 |
    f:maj ees:7 g:m6  a:7 
    d:m7 g:7 d:m7 g:7 g:m7 c:7 g:m7 c:7 f1:7 bes:7 
    bes4:m7 ees:7 g:m7 c:7 
    f2:maj}

texta = \lyrics {
    I don't know why but I'm fee -- ling so sad.
    I long to try some -- thing I've ne -- ver had.
    Ne -- ver had no kiss -- in'
    Oh, what I've been miss -- in'.
    Lo -- ver man oh where can you be? " " " " " "  
    be?
    I've heard it said that the thrill of ro -- mance can be
    like a hea -- ven -- ly dream, " " " " " "
    I go to bed with a prayer that he'll make love to me,
    Stange as it seems.
    Some day we'll meet and you'll dry all my tears,
    Then whis -- per sweet lit -- tle things in my ears.
    Hug -- gin'  and   a kiss -- ing.
    Oh, what I've been miss -- in'.
    Lo -- ver man oh where can you be? }

textb = \lyrics {
    The night is cold and I'm so all a -- lone.
    I'd give my soul just to call you my own.
    Got a moon a -- bove me, but no -- one to love me.
    Lo -- ver man oh where can you }

\midi {	\tempo 4 = 60 }

Score = \notes <
    \context ChordNames \accompaniment
    \addlyrics
    \StaffStaff
    \context Lyrics < \texta \textb >
>
