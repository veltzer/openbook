\header{
    filename = "desafinado.ly"
    title = "Desafinado"
    subtitle = "Slightly Out Of Tune"
    composer = "Antonio Carlos Jobim"
    enteredby = "Laurent Martelli"
    copyright = "© 1959 editora musical arapua, brazil"
    tagline = #tagline
    head = #instrument
}

tune = \notes {
    \time 4/4
    \key f \major
    \clef treble

    r8 c'4 d'8 e'4 f' | e'4. d'8 cis'4 d' |
    f'4. des'8 des'2 ~ | des'2. r4 |
    r8 d'4 e'8 f'4 g' | f'4. e'8 dis'4 e' |
    c''4. ees'8 ees'2 ~ | ees'2. r4 \bar "||" \break

    r8 d' c'' bes' a' g'4 bes'8 ~ | bes'4. a'8 dis'4 e' |
    fis'8 a' fis'2 d'4 | ees'1 |
    r8 aes'4 g'8 f'4 d' | aes'4. g'8 f'4 e' |
    f'4. des'8 des'2 ~ | des' r \bar "||" \break

    r8 c'4 d'8 e'4 f' | e'4. d'8 cis'4 d' |
    f'4. des'8 des'2 ~ | des'2. r4 |
    r8 d'4 e'8 f'4 g' | f'4. e'8 dis'4 e' |
    c''4. ees'8 ees'2 ~ | ees'2. r4 \bar "||" \break

    r8 c''4 bes'8 a' g'4 bes'8 ~ | bes'4. a'8 g'4 f' |
    g'8 f' g'2. ~ | g'2 r |
    e'4 fis' e'8 fis'4 e'8 ~ | e'4. d'8 cis'4 d' |
    e'1 ~ | e'2 r4 cis' \bar "||" \break

    e' fis' e'8 fis'4 e'8 ~ | e'4. d'8 cis'4 d' |
    e'4. b8 e'2 ~ | e' r |
    r8 e'4 fis'8 gis'4 a' | b'4. a'8 cis'4 d' |
    e'8 fis' e' fis' e'2 ~ | e' r4 e' \bar "||" \break

    g' a' g'8 a'4 g'8 ~ | g'4. f'8 e'4 f' |
    g' d'8 g' ~ g' d' g'4 ~ | g' r r8 d' g' a' |
    bes'4 a' bes'8 a'4 c''8 ~ | c''4. bes'8 a'4 bes' |
    g'1 ~ | g'4 r r2 | \bar "||" \break

    r8 c'4 d'8 e'4 f' | e'4. d'8 cis'4 d' |
    f'4. des'8 des'2 ~ | des'2. r4 |
    r8 d'4 e'8 f'4 g' | f'4. e'8 dis'4 e' |
    d'' des'' c'' b' | bes' d'' r a' | \bar "||" \break

    c''4. b'8 bes'4 a' | bes' a' g' f' |
    a'2. e'4 | g'2. d'8 e' |
    f' f' f' f' f'4 f' | r8 d'4 e'8 f'4 f' |
    f'8 f' f' f' c''4 bes' ~ | bes'2. d'8 e' | \break
    f' f' f' f' f'4 e'8 f' ~ | f'4 r8 e' dis'4 e' |
    g'4. f'8 f'2 ~ | f'2. r4 \bar "|."

}

harmony = \notes \chords {
				% 1
    f1*2:maj         | g1*2:7.4+         | g1:m7  | c:7    | a:m7.5-  | d:9-
    g:m7   | a:9-    | d:7     | d:9-    | g1*2:9-         | ges1*2:maj         |

    f1*2:maj         | g:7.4+            | g1:m7  | c:7    | a:m7.5-  | d:9- |
    g:m7   | bes:min6 | a:m7    | b2:m7.5- e:9+ |

    a1:maj | c:7 | b:m7  | e:7 |
    a:maj  | bes:dim7 | b:m7  | e:7     | a:maj  | fis:m7 | b:m7 | e:7  |

    c:maj  | cis:dim7 | d:m7  | g:7     | g:m7   | d:7.9- | g:m7 | c:7   |

    f1*2:maj         | g:7.4+           | g1:m7  | c:7    | a:m7.5- | d:9-  |
    g:m7   | ees:7   | f:maj | aes:dim7 |
    g1*2:7           | bes1:m7 | ees:9  |
    g:7    | c:7 | f1:6.9^7 | g:m7/+c | 
}

Score = <
    \context ChordNames \harmony
    \context Staff \tune
>

#(set! minimumVerticalExtent 5)
