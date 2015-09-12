\header {
    title = "I Got Rhythm"
    composer = "G. Gershwin"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \repeat volta 2 {
	bes2:6 g:m7 | c:m7 f:7 | bes des:dim7 | c:m7 f:7 | \break
	bes2:6 bes:7 | ees:6 ees:m6 | bes f:7 |
    }
    \alternative { { bes:6 f:7 | } { bes:6 a:7 | } } \break

    d1:7 | a2:m7 d:7 | g1:7 | d2:m7 g:7 | \break
    c1:7 | g2:m7 c:7 | c1:m7 | f:7 | \break

    bes2:6 g:m7 | c:m7 f:7 | bes des:dim7 | c:m7 f:7 | \break
    bes2:6 bes:7 | ees:6 ees:m7 | bes aes:7 | g1:7 | \break
    c2:9 f:7 | bes:6 f:7 |
    c1:m7 | f:7 | bes4 bes:7 ees e:dim7 | bes8. f:7 bes8:6
}

Tune = \notes \relative g' {
    \time 4/4
    \key bes \major
    \repeat volta 2 {
	r4 f2 g8 r | bes4. c8 ~ c2 | r4 c2 bes8 r | g4. f8 ~ f2 |
	r4 f2 g8 r | bes4. c8 ~ c ees4 c8 | d4 d c8 d c4 |
    }
    \alternative { bes1 | } { bes2. r4 \bar "||" }
    
    r4 d2 d4 | d4. e8 ~ e2 |   r4 d2 d4 | d4. g,8 ~ g2 | 
    r4 c2 c4 | c4. d8 ~ d2 |   r4 c2 c4 | c4. c8 ~ c2  \bar "||" 
    
    r4 f,2 g8 r | bes4. c8 ~ c2 | r4 c2 bes8 r | g4. f8 ~ f2 |
    r4 f2 g8 r | bes4. c8 ~ c ees4 c8 | d4 d c8 d c4 | f2 r8 ees4 b8 \toCoda \bar "||"

    d4 d c8 bes c bes-\accent | ~ bes1_"Break" \coda \bar "||" 
    r1 | r |      
    \property Voice.NoteHead \set #'style = #'slash
    c4 c c c | c8. c16 c8 c ~ c2-\fermata \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

