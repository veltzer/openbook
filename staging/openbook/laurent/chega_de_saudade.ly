\header{
    title = "Chega De Saudade"
    subtitle = "No More Blues"
    composer =	 "Antonio Carlos Jobim"
    enteredby =	 "Laurent Martelli"
    copyright =	 "© 1962,1967 Editora Musical Arapua, Sao Paulo, Brazil"
    tagline = #tagline
    head = #instrument
}

tune = \notes \relative f'' {
    \time 4/4
    \key f \major

    \boxedMark \rehearsalBeginOfLine
    \property  Score.RehearsalMark \override #'extra-offset = #'(0.5 . 2)
    \mark "A"
    f4. a,8 ~ a4. d8 ~ | d2 ~ d8 f4 e8 ~ | e4. b8 ~ b4. d8 ~ | d2 ~ d8 e4 f8 ~ |
    f4. bes,8 ~ bes4. cis8 ~ | cis2 ~ cis8 f4 e8 ~ | e d4 f8 e d4 a8 ~ | a1 |
    f'4. a,8 ~ a4. b8 ~ | b2 ~ b8 d4 c8 ~ | c4. e8 ~ e2 ~ | e4 e8 d ~ d c4 c8 ~ |
    c4. bes8 ~ bes2 ~ | bes4 f'8 e ~ e d4 d8 ~ | d cis4 e8 cis4 bes~ | bes2. r4 \bar "||"

    \property  Score.RehearsalMark \override #'extra-offset = #'(-2 . 2)
    \mark "B"
    f'4. a,8 ~ a4. d8 ~ | d2 ~ d8 f4 e8 ~ | e4. b8 ~ b4. d8 ~ | d2 ~ d8 e4 f8 ~ | 
    f4. bes,8 ~ bes4. cis8 ~ | cis2 ~ cis8 f4 e8 ~ | e8 d4 cis8 d4 ees4 ~ | ees4 d8 fis ~ fis a4 g8 ~ | 
    g4. bes8 ~ bes4. cis,8 ~ | cis2 ~ cis8 a'4 g8 ~ | g f4 a8 ~ a g f4 | e d8 cis ~ cis d4 f8 ~ |
    f d4 b8 ~ b d4 f8 ~ | f cis4 bes?8 ~ bes f'4 d8 ~ | d1 | r1 \bar "||" 


    \key d \major
    \property  Score.RehearsalMark \override #'extra-offset = #'(-3 . 2)
    \mark "C"
    fis2.. a8 ~ | a4. g8 ~ g8 dis4 fis8 ~ | fis4. e8 dis e4 b'8 ~ | b4 g8 e ~ e b4 d8 ~ |
    d4. cis8 ~ cis2 ~ | cis4 e8 cis ~ cis a4 b8~ | b2.. a8 ~ | a2 ~ a8 cis4 e8 ~ | 
    e d4 cis8 ~ cis d4 f8 ~ | f gis4 cis8 ~ cis b4 a8 ~ | a g!4 b,8 ~ b2 ~ | b4 b8 cis ~ cis d4 fis8 ~ |
    fis e4 d8 b4 gis ~ | gis b8 cis ~ cis e4 d8 ~ | d2.. cis8 ~ | cis1 \bar "||"

    \mark "D"
    fis4. a,8 ~ a4. b8 ~ | b2 ~ b8 fis'4 e8 ~ | e4. b8 ~ b4. d8 ~ | d2 ~ d8 e4 fis8 ~ |
    fis4. ais,8 ~ ais 4. cis8 ~ | cis2 ~ cis8 fis4 e8 ~ | e d4 cis8 d4 e ~ | e d8 fis ~ fis b4 a8 ~ |
    a fis4 d8 ~ d8 b4 a'8 ~ | a f4  d8 ~ d bes4 a'8 ~ | a e4 cis8 ~ cis a4 gis'8 ~ |
    gis b4 g8 ~ g b4 fis8 ~ | fis d4 b8 d4 fis ~ | fis d8 b ~ b d4 fis8 ~ | fis2 ~ fis8 fis g a |
    b4 a8 g ~ g fis4 d8 ~ | d b4 d8 fis4 d4 ~ | d b8 d ~ d fis4 d8 ~ | d1 | r 1 \bar "|."
}

harmony = \notes \chords {
				% A
    d1:min    | d:m7/c       | e1*2:7/b                   | \break
    a1*2:7.5+.9-             | d1:min      | e2:m7.5- a:7 | \break
    d1:m7     | b2:m7.5- e:7 | a1*2:m7                    | \break
    bes1:maj  | bes:6        | a1*2:7.9-                  | \break

				%B
    d1:min    | d:m7/c       | e1*2:7/b                   | \break
    a1*2:7.5+.9-             | d1:min      | d:7.9-       | \break
    g:min     | a:7          | d:min       | d:m7/c       | \break \newpage
    e:7.9-    | a:7.9-.5+    | d:min       | e2:m7 a:7    | \break

				%C
    d1:maj    | b:7/ees      | e1*2:m7                    | \break
    a1:9      | a:7          | d:m5-.7-    | d:maj        | \break
    fis:m7    | f:m5-.7-     | e1*2:m7                    | \break
    e1*2:7.9                 | g1:m6       | a:7          | \break

				%D
    d1:maj | b:m7 | e1*2:7 | \break
    fis1*2:7 | b2:m7 bes:m7 | a:m7 d:7 | \break
    g1:maj | g:m7 | fis:m7 | b2:13 b:7.5+ | \break
    e1:9 | a:sus13 | fis:m7 | b:7.5+ | \break
    e1:9 | a:sus9 | d:6 | a:7.5+ |
}


Score =  < 
    \context ChordNames \harmony 
    \context Staff \tune
>

#(set! minimumVerticalExtent 5)
