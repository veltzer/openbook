\header {
    title = "I Love You"
    composer = "Cole Porter"
    enteredby = "Laurent Martelli"
    copyright = "© 1943 by Chappell \& Co., Inc."
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 4 R4 |
    bes1:min7 | c:7.9- | f:maj | d:7.9+ | 
    g:min7 | c:7 | \break f1*2:maj | 

    bes1:min7 | c:7.9- | f:maj | b2:min7.5- e:7.9+ | \break
    a1:maj | b2:min7 e:7 | a1*2:maj | 
    
    g1:min7 | c:7 | \break f1*2:maj | 
    a1:min7.5- | d:7.9+ |  g:min7 | c:7 | \break
    
    bes:min7 | c:7.9- | a:min7.5- | d:7.9+ | 
    g:7 | g2:min7 c:7 | f1:maj | a2:min7 d:7 |
}

Tune = \notes \relative c'' {
    \time 4/4
    \key f \major
    \partial 4 c4 \bar "||" 
    c4. des,8 ~ des2 ~ | des bes'4. a8 | gis a4 a8 ~ a2 ~ | a2. a4 | 
    a4. bes,8 ~ bes2 ~ | bes2 g'8 f e d ~ | d2 r | r r4 c' \bar "||" 
    c4. des,8 ~ des2 ~ | des bes'4. a8 | gis a4 a8 ~ a2 ~ | a2 r8 a4. |
    b8 cis4 cis8 ~ cis4 cis | d2 e | e1 ~ | e2. e4 \bar "||"
    f f8 f8 ~ f2 | r e8 d c e ~ | e4 e8 e ~ e2 ~ | e  c4 d |
    ees4. ees8 ees ees4 ees8 | r8 d4. c4 bes! | a1( | )g2. c4 \bar "||" 
    c4. des,8 ~ des2 ~ | des bes'4. a8 | gis a4 a8 ~ a2 ~ | 
    a2 bes4 c | cis4. d8 ~ d4 f, | a4. a8 ~ a2 | f1 | r \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff { \Tune }
>
