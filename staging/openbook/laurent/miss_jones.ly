\header {
    title = "Have You Met Miss Jones"
    composer = "Lorenz Hart \& Richard Rodgers"
    enteredby = "Laurent Martelli"
    themeid = "792"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    f1:maj | d:7.9- | g:min7 | c:7 | a:min7 \break | d:min7 | g:min7 | c:7 |
    f1:maj | d:7.9- | g:min7 \break | c:7 | a:min7 | d:min7 | c:min7 | f:7 \break

    bes1:maj | aes2:min7 des:7 | ges1:maj | e2:min7 a:7 | d1:maj \break
    aes2:min7 des:7 | ges1:maj | g2:min7 c:7 \bar "||"

    f1:maj | d:7.9- | g:min7 \break | c:7 | a2:min7 d:7 | g:min7 c:7 | 
    f1:maj | g2:min7 c:7 \bar "|."
}

Tune = \notes \relative a' {
    \time 4/4
    \key f \major

    \repeat "unfold" 2 {
	a4 d, c d | c2. r4 | d e f g | a bes c2 | d4 g, f g | f2. a4 | } 
    \alternative { { bes1 ~ | bes2. r4 \bar "||"} {c1 ~ | c4 d d d \bar "||" } }
    c4 bes f g | aes aes aes aes | aes ges des ees | e! e e e | e d fis a | 
    des2 des | bes1 ~ | bes2. r4 \bar "||"
    a4 d, c d | c2. r4 | d e f g | a bes c d | e1 ~ | e4 d a g | f1 | r \bar "|."
}

Score =   <
    \context ChordNames \Chords
    \context Staff \Tune
>

