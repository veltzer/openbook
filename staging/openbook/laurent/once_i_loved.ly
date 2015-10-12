\header {
    title = "Once I Loved"
    subtitle = "O Amor En Paz"
    composer = "Antonio Carlos Jobim \\& Vinicius DeMoraes"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}



Chords = \chords {
    \repeat volta 2 {
	g1:m7 | c:7 | f:maj | fis:dim.7 | g:m7 | aes:dim.7 | a:m7 | a:m7/+g |
	f:m7 | bes:7 | \break ees1*2:maj | e1:m7.5- | a:7.9- |
    } \alternative { { d:maj | d:7.9- } { d:maj | g:7 } }
    c:maj | f:7 | \break bes1*2:maj | 
    b1:dim.7 | bes:m6 | a:m7 | aes:7.4+ | 
    g:7 | g2:m7 a:7.9- \toCoda | d1:m7 | d2:m7 d:7.9+ | \coda \break
    
    \repeat volta 2 { d1:m7 | g:7 | d:m7 | g:7 }
}

Tune = \notes \relative d'' {
    \time 4/4
    \key f \major

    \repeat volta 2 {
	d1 ~ | d2 ~ d8 c4 a8 ~ | a1 ~ | a2 \times 2/3 { r4 bes c } | 
	\times 2/3 { d d d } \times 2/3 { d d d } | d2 \times 2/3 { f4 e d } | 
	\times 2/3 { e c a } ~ a2 ~| a2. r4 \bar "||"
	c1 ~ | c2 ~ c8 bes4 g8 ~ | g1 ~ | g2 \times 2/3 { r4 g a } |
	\times 2/3 { bes bes a } \times 2/3 { c c bes } | a2 \times 2/3 { g4 bes a } |
    } \alternative {
	{ g8 fis4 fis8 ~ fis2 | fis r \break } 
	{ g8 fis4 a8 ~ a2 | g8 f4 a8 ~ a g4 e8 ~ \bar "||" }
    }
    e1 | g2 ~ g8 f4 d8 ~ | d1 ~ | d2 \times 2/3 { r4 d e } | 
    \times 2/3 { f f e ~ } \times 2/3 { e g ges } | f2 ~ f8 f4 des8 | e4 d8 d ~ d2 ~ |
    d2 \times 2/3 { r4 d e } | \times 2/3 { f f e ~ } \times 2/3 {e g ges } | 
    f2 ~ f8 f4 cis8 | e4. d8 d2 ~ | d1 | 

%coda
    \repeat volta 2 { s1*4 }
}

Spaces = \notes \transpose c' {
    \stemOff  \headOff 
    \repeat volta 2 { s1*14 } \alternative  { { s1*2 } { s1*2 } }
    s1*11 | d,2 d |
}

Score = <
    \context ChordNames \Chords
    \context Staff < \Tune \Spaces >
>
