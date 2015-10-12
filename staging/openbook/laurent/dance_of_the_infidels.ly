\header {
    title = "Dance of the Infidels"
    composer = "Bud Powell"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    R1*4 | 
    a1:min7 | aes:min7 | g:min7 | ges:min7 |
    \repeat "volta" 3 {
	f | f2:min7 bes:7 | a:min7 g:min7 | ges:min7 b:7 | 
	bes1:7 | bes2:min7 ees:7 | a1:min7 | aes2:min7 des:7 |
	g:min7 c:7 | des:min7 ges:7 | g1 | c | g |
    } \alternative { { d1:7 | } { g1*2 } }
}

Tune = \notes \relative c' {
    \time 4/4
    \key f \major
    
    <a8 c> <c e> <bes d> <d fis> <c4 e> <c e> | 
    <c8 e> <bes16 d> <aes c> <g8 bes> <d'8 fis> <c4 e> r | 
    <bes8 d> <d fis> <c e> <e gis> <d4 fis> <d4 fis> |
    <d8 fis> <c16 e> <bes d> <aes8 c> <d fis> <c4 e> r |
    R1*3 | r2 r4 r8 d16 des | \break
    \repeat "volta" 3 {
	c8 d e f g e f g | aes bes c g r4 r8 f | 
	\times 2/3 {a8 bes b} c a b a g f | a8 ges e16 des ees8 r4 bes'16 a8 g16 |
	aes8 c, f g aes! bes c aes! | [ \times 2/3 {g16 aes g} f8 ] [bes aes!] r f g f | 
	[ \times 2/3 {e16 f e} c8 ] [f g] c4 r | des8 ees des b bes aes r d | 
	~ d fis, g a bes c d ees \break | ~ ees ees des b bes aes ges r | 
	r8 c, f g a bes c <g e> | ~<g e> <d f> <e2 g> <d4 f> | \break
	r4 <e2 g> <d4 f> | 
    } \alternative { 
	{ r4 <e2 g> <d8 f> d16 des | }
	{ r4 <e2. g> | ~ <e2. g> <d4 f> \bar "|." } 
    } 
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

