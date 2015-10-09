\header {
    title = "Early Autumn"
    composer = "Ralph Burns"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 2 R2 |
    \repeat "volta" 2 {
	bes1:maj | a:7 | aes:maj | g:7 | ges:maj | f:7 | bes:maj |
    } \alternative { { c2:m7 f:7 | } { bes2:maj des:7 | } }
    aes2:m7 des:7 | ges:maj aes:7 | 
    aes:m7 des:7 | ges1:maj | ges2:m7 b:7 | e:maj aes:7 | 
    a:7.5+ ges:7 | c:m7 f:7 | 

    bes1:maj | a:7 | aes:maj | g:7 | ges:maj | f:7 | bes1*2:maj |
}

Tune = \notes \relative c' {
    \time 4/4
    \key bes \major
    
    \partial 2 f8 fis g gis | 
    \repeat "volta" 2 {
	a8 f d bes a'16 bes c bes a4 | r cis,16 e g bes a g f e a8 cis, |
	g' ees c aes g'16 aes bes c g4 | r b,16 d f aes g f ees d g8 b, | 
	f'4 \times 2/3 {des8 bes ges} \times 2/3 {f' ges aes} f4 |
	r a,16 c ees ges f ees d c f4 | d1 |
    } \alternative { 
	{ r2 f8 fis g gis | }
	{ r2 r8 d8 ees f \bar "||" } 
    } 
    ges4. ees8 bes'16 a aes g ~ g4 | r8 f aes ges f'16 e ees d ~ d4 |
    ees4 des8 b \times 2/3 {bes4 aes bes} | des2 r8 des, ees f | 
    ges4. e8 aes4 ~ \times 2/3 {aes8 f ges} | g!8 aes b dis f16 e ees d ~ d4 |
    ees2 e | bes b \bar "||"

    a8 f d bes a'16 bes c bes a4 | r cis,16 e g bes a g f e a8 cis, |
    g' ees c aes g'16 aes bes c g4 | r b,16 d f aes g f ees d g8 b, | 
    f'4 \times 2/3 {des8 bes ges} \times 2/3 {f' ges aes} f4 |
    r a,16 c ees ges f ees d c f4 | d1 ~ | d2 r \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

#(set! minimumVerticalExtent 4)
