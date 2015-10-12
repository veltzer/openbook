\header{
    title = "One note samba"
    subtitle = "(Samba de uma nota so)"
    composer = "Antonio Carlos Jobim"
    indexTitle = "One note samba (with english lyrics)"
    enteredby = "Laurent Martelli"
    copyright = "© 1959 editora musical arapua, brazil"
    tagline = #tagline
    head = #instrument
}

melody = \notes {
    \time 4/4
    \key bes \major
    \clef treble

    \partial 4. f'4 f'8 |
    f'4 f'8 f' ~ f' f'4 f'8 ~ |
    f'4. f'8 r f'4 f'8 |
    f'4 f'8 f' ~ f' f'4 f'8 ~ |
				%5
    f'2 r8 f'4 f'8 |
    f'4 f'8 f' ~ f' f'4 f'8 ~ |
    f'4. f'8 r f'4 f'8 |
    f'4 f'8 f' ~ f' f'4 f'8 ~ |
    f'2 r8 bes'4 bes'8 |
				%10
    bes'4 bes'8 bes' ~ bes' bes'4 bes'8 ~ |
    bes' bes' bes'4 ~ bes'8 bes'4 bes'8 |
    bes'4 bes'8 bes' ~ bes' bes'4 bes'8 ~ |
    bes'2 r8 f'4 ees'8 |
    f'4 f'8 f' ~ f' f'4 f'8 ~ |
				%15
    f' f'4 f'8 ~ f' f' f'4 |
    f' f'8 f' ~ f' f'4 bes'8 ~ |
    bes'2. r4 |
    bes'8 c'' des'' ees'' des'' c'' bes' aes' |
    ges' f' ees' des' c' des' ees' f' |
				%20
    c'4. bes8 r c' des' ees' |
    c'4. bes8 ~ bes4 r |
    aes'8 bes' ces'' des'' ces'' bes' aes' g' |
    fes' ees' des' ces' bes ces' des' ees' |
    bes4. aes8 r bes ces' ees' |
				%25
    ges'4. f'8 r f'4 f'8 |
    f'4 f'8 f' f' ~ f'4 f'8 ~ |
    f'4. f'8 r f'4 f'8 |
    f'4 f'8 f' ~ f' f'4 f'8 ~ |
    f'2 r8 f'4 f'8 |
				%30
    f'4 f'8 f' ~ f' f'4 f'8 ~ |
    f'4. f'8 r f'4 f'8 |
    f'4 f'8 f' ~ f' f'4 f'8 ~ |
    f'2 r8 bes'4 bes'8 |
    bes'4 bes'8 bes' ~ bes' bes'4 bes'8 ~ |
				%35
    bes'4. bes'8 r bes'4 bes'8 |
    bes'4 bes'8 bes' ~ bes' bes'4 bes'8 ~ |
    bes'2 r8 bes'4 bes'8 |
    bes'4 bes'8 bes' ~ bes' bes'4 bes'8 ~ |
    bes' bes'4 bes'8 bes'4 bes' ~ |
				%40
    bes' bes'8 bes' ~ bes' bes'4 bes'8 ~ |
    bes'2 r8 f'4 f'8 \bar "|."
}

harmony = \notes \chords {
    \partial 4. R4. |
				% 1
    d1:m7 | des:7 | c:m11 | b:7.5- | d:m7 | des:7 | c:m7 | b:7.5- |
				% 9
    f:m7  | e:7.5- | ees:maj | aes:9 | d4.:m7 des2:7 c8:m11 | R1 |  b:7.5- bes:6 |
				% 17
    ees:m7 | aes:7 | des4.:maj des2:6 R8 | des4.:maj des2:6 R8 | des1:m7 | des:7 | ces:maj | 
    c4.:m7.5- b2:7.5- R8 | d1:m7 | des:7 | c:m7 | b:7.5- | d:m7 | des:7 | c:m7 | b:7.5- | 
    f:m7 | e:7.5- | ees:maj | aes:9 | des2.:6 R8 c:7 | R2. ces1:maj R8 bes1:6 R8 |  
}

text = \lyrics {
    This is just a lit -- tle sam -- ba 
    built up -- on a sin -- gle note.
    Oth -- er notes are bound to fol -- low 
    but the root is still that note.

    Now the new one is the con -- se -- quence
    of the one we've just been through
    as I'm bound to be the un -- a -- void -- a -- ble
    con -- se -- quence of you.

    There's so man -- y peo -- ple who can talk and talk and talk 
    and just say no -- thing or near -- ly no -- thing

    I have used up all the scale I know and at the end I've come to no -- thing
    or near -- ly no -- thing

    So I come back to my first note as I must come back to you.
    I will pour in -- to that one note all the love I feel for you
    A -- ny -- one who wants the whole show, Re, Mi, Fa, Sol, La, Te, Doh.
    he will find him -- self with no show.
    Bet -- ter play the note you know.

}

Score = <
    \context ChordNames \harmony
    \addlyrics
    \context Staff \melody
    \context Lyrics \text
>
