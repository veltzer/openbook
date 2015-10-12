\header{
    title = "O Barquino"
    subtitle = "Little Boat"
    composer =	 "Roberto Menescal"
    enteredby =	 "Laurent Martelli"
    copyright =	 "© 1962-1964 Editions SACHA s.q.r.l. Paris, France"
    tagline = #tagline
    head = #instrument
}

melody = \notes \relative g' {
    \time 4/4
    \key bes \major

    a8 bes4 a8 c4 a8 bes | ~ bes a c4 b bes | a8 a a a a4 ees8 e | a8 a a a a2 |
    g8 aes4 g8 bes4 g8 aes | ~ aes g bes4 a aes | g8 g g g g4 cis,8 d | g8 g g g g2 |
    f8 ges4 g8 aes4 f8 ges | ~ ges f aes4 g ges | f8 f f f f4 b,8 c | f2 r8 c'4 bes8 |
    f2. g4 | aes2 ~ aes8 ees'4 d8 | ees,2. f4 | ges2. r4 |
    
    s1*8 s1-\fermata
}


harmony = \notes \chords {
    \rehearsalAll
    bes1*2:maj | e2:m7.5- a:7 | e2:m7.5- a:7 | \break
    aes1*2:maj | d2:m7.5- g:7 | d2:m7.5- g:7 \bar "||" \break
    ges1*2:maj | c2:m7.5- f:7 | c2:m7.5- f:7 | \break
    d1:m7 | g:7.9- | c:m7 | f:7.9- \mark #'(music "scripts-coda") \bar "|." \break

    \repeat unfold 2 { d:m7 | g:7.9- | c:m7 | f:7.9- |  }
    bes:maj
}

\midi { \tempo 4 = 144 }

Score =  < 
    \context ChordNames \harmony
    \context Staff \melody
>
