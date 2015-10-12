\header {
    title = "Jordu"
    composer = "Duke Jordon"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords \transpose bes {
    R1 |
    \repeat volta 2 {
	e2:7 a:7 | d1:m7 | g2:7 c:7 | f1:maj |
	e2:7 a:7 | d1:m7 | 
    } \alternative {
	{ bes:7 | a:7 | } { bes:7 | a:7 | }
    }
    a2:7 d:7 | g:7 c:7 | f:7 bes:7 | ees1:7 |
    g2:7 c:7 | f:7 bes:7 | ees:7 aes:7 | a1:7 |

    e2:7 a:7 | d1:m7 | g2:7 c:7 | f1:maj |
    e2:7 a:7 | d1:m7 | bes2:7 a:7 | d1:m7
}

Tune = \notes \transpose bes \relative c' {
    \time 4/4
    \key f \major

    r8 a [d e] f g a f |
    \repeat volta 2 {
	gis2 g4. f8-. | r a, d e f g a c | b2 bes4. a8-. | r a, [d e] f g a f |
	gis2 g4. f8-. | r2 \times 2/3 {[f16 g f} d8] [f d] ~ |
    } \alternative { 
	{ d2.. d8-. | r a [d e] f g a f | } 
	{ d2.. d8-. | r2 r8 a''4-. a8 ~ \bar "||" } 
    }
    a''4 \times 2/3 {[cis,16 d cis} b8] c4 a'8 fis | 
    g4 \times 2/3 {[b,16 c b} a8] bes4 g'8 e | 
    f4 \times 2/3 {[a,16 bes a} g8] aes4 fis | g2 r8 g'4-. g8 ~ | 
    g4 \times 2/3 {[b,16 c b} a8] bes4 g'8 e | 
    f4 \times 2/3 {[a,16 bes a} g8] aes4 f'8 d | 
    ees4 \times 2/3 {[g,16 aes g} f8] fis4. f8-. | 
    r8 a, d e f g a f \bar "||"    

    gis2 g4. f8-. | r a, d e f g a c | b2 bes4. a8-. | r a, [d e] f g a f |
    gis2 g4. f8-. | r2 \times 2/3 {[f16 g f} d8] [f d] ~ | d2.. d8-. | r1 \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

