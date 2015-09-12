\header{
    title = "Naima"
    composer =  "John Coltrane"
    enteredby = "Laurent Martelli"
    %copyright = "© 1974 Jowcol Music"
    tagline = #tagline
    head = #instrument
}

melody = \notes \relative c'' {
    \time 4/4
    \key aes \major

    \bar "|:"
    \repeat volta 2 { 
	c2. ~ \times 2/3 {c8 bes es} | f,1 | 
	aes2 ges4 ~  \times 2/3 {ges8 ees ges} | ees1 |
    } \break

    bes'2. ~ \times 2/3 {bes8 bes bes} | g2. ~ \times 2/3 {g8 ees f} | 
    bes2. ~ \times 2/3 {bes8 bes bes} | g2. ~ \times 2/3 {g8 f ees} | \break
    des'2.  ~ \times 2/3 {des8 bes des} | bes2. ~ \times 2/3 {bes8 ees, bes'} |
    g2. ~ \times 2/3 {g8 ees g} | ees1 | \break
    c'2. ~ \times 2/3 {c8 bes es} | f,1 | 
    aes2 ges4 ~  \times 2/3 {ges8 ees ges} | ees1 \codaAll \bar "|." \break
    
    \repeat unfold 2 { aes2 ges4 ~ \times 2/3 {ges8 ees ges} | ees1 | }
    aes2 ges4 ~ \times 2/3 {ges8 ees ges} | ees2 f | g aes | bes c |
    ees-\fermata \bar "|."
}

harmony = \notes \chords {
    \repeat volta 2 { 
	bes1:m7 | ees:m7 | b2:7.5- a:7.5- | aes1:maj |
    }

    b1:maj | bes:7.9- | b:maj | bes:7.9- | 
    e:7 | b:maj | f:m7 | ges:7 | 
    bes1:m7 | ees:m7 | b2:7.5- a:7.5- | aes1:maj |

    b2:7.5- a:7.5- | aes1:maj | b2:7.5- a:7.5- | aes1:maj |
    b2:7.5- a:7.5- | \repeat unfold 3 { aes2:maj des:maj | }
    aes1:maj
}

Score =  \notes < 
    \context ChordNames \harmony
    \context Staff \melody
>

\midi { \tempo 4 = 60 }


