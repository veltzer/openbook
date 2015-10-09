\header{
    title = "You Go To My Head"
    subtitle = ""
    composer = "J. Fred Coots"
    enteredby = "Silvia Bertoluzza"
    tagline = #tagline
    head = #instrument
}

Staff = \notes \context Voice = $Staff {
    \property Staff.midiInstrument = "acoustic grand"
    \time 4/4
    \key c \major
    \clef treble
    \partial 4 a4 \bar "|:"
    \repeat volta 2	{
	g'8 g' g' g' ~ g'2 |
	r4 g'8 g' f' f' g' g' |
	d' d' c' d' ~ d'2 |
	r4 c'8 c' ees' ees' d' d' |
				%5
	d' d' c' d' ~ d'2 |
	r4 c'8 c' ees' ees' d' d' |
	d' c' c' c' ~ c'2 |
    } \alternative {	
	{ r r4 g \bar ":|"}
	{ r2 r8 c'4. \bar "||"} 
    }
				%10
    d'8 d' d' a' ~ a'4 a'8 a' |
    dis' dis' dis' a' ~ a' a' aes'4 |
    g' e'8 c' a c' e' a' ~ |
    a'2. g'8 a' |
    \times 2/3 { b'4 b' b' } \times 2/3 { b' b' b' } |
				%15
    \times 2/3 { b' b' b' } \times 2/3 { b' b' b' } |
    \times 2/3 { b b b } \times 2/3 { b b b } |
    b2. g4 |
    g'8 g' g' g' ~ g'2 |
    r4 g'8 g' f' f' g' g' |
				%20
    d' d' c' d' ~ d'2 |
    r4 c'8 c' ees' ees' d' d' |
    d' d' c' d' ~ d'2 |
    r4 c'8 c' ees' ees' d' d' |
    d' d' c' g' ~ g'2 ~ |
				%25
    g'2. g'8 gis' \bar"||"
    a'4 a b c' |
    e'8 d'4 f'8 ~ f'2 |
    \times 2/3 { e'4 c' e' } \times 2/3 { g' e' g' }  |
    \times 2/3 { a' e' a' } \times 2/3 { b' b' a' } |
				%30
    g'1 ~ |
    g'4 g' \times 2/3 { g' g' g' } |
    g'1 ~ |
    g' \bar "|."
}


StaffStaff = \context Staff = StaffStaff <
    \property Staff.automaticMelismata = ##t
    \Staff
>



accompaniment = \chords{
    r4 c2:maj e:m7 f:m7 bes:7.9- ees:maj a:m7.5- 
    d:7 g:7.5+.9-
    c:m9 a:m7.5- d:7 g:7.9-.5+
    c:maj a:m7 d:m7 des:7 g:m7
    c:7 f1:6  fis:3-.5-.7- c:maj
    c:6 fis2:m7 b:7 e:maj f:maj 
    fis:m7 b:7 e4:m7 ees:m7 d:m7 des:7 
    c2:maj des:maj f:m7 bes:7.9- ees:maj a:m7.5- 
    d:7 g:7.9-.5+ c:m9 a:m7.5- d:7 g:7.9-.5+
    c1:maj g2:m7 c:7 f1:maj f2:m.7+ bes:7
    c:maj d:m7/b ees:m7 fis4:m7 bes:7 e2:m7 a:7 d:m7 g:7
    c1:maj }


texta = \lyrics{
    You  go to my head and you lin -- ger like a hunt -- ing  re -- frain
    and I find you spin -- ning 'round in my brain lika the bub -- bles in a
    glass of cham -- pagne. You
    The thrill of the thought that you might give  a thought to my plea cast a spell o -- ver
    me. So I say to my -- self get a hold of your -- self can't you see that it ne -- ver can be.
    You  go to my head with a smile that make my temp -- era -- ture rise
    Like a sum -- mer with a thou -- sand Ju -- lys.
    You in -- tox -- i -- cate my soul with your eyes.
    Though I'm cer -- tain that this heart of mine has -- n't a ghost of a chance
    in this cra -- zy ro -- mance. 
    You  go to my head.
}

textb = \lyrics { 
    _
    go to my head like a sip of spar -- kling bur -- gun -- dy brew
    And I find the ve -- ry men -- tion of you 
    Like the kick -- er in a ju -- lip for two.
}

Score = <
    \context ChordNames \accompaniment
    \addlyrics
    \StaffStaff
    \context Lyrics <\texta \textb>
>
