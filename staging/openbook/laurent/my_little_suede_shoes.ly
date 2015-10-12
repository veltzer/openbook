\header {
    title = "My Little Suede Shoes"
    composer = "Charlie Parker"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

A = \notes \relative c' { bes8 ees g | [f f f f] ees f r g | }
B = \notes \relative c' { bes8 ees g | [f f f f] ees f r ees | }

Tune = \notes \relative c' { 
    \key ees \major
    \time 4/4

    \partial 4. bes8 ees g |
    \repeat "volta" 2 {
	[f f f f] ees f r g | r2 r8 \B r2 r8 \A
	r bes4. a4 aes | [g8 g g g] f f r ees |
    } \alternative { {r2 r8 bes ees g} {r2 r8 bes' c d} }
    [ees'8 ees ees ees] c aes r d | r d4. bes8 g r4 | [c8 c c c] aes f r bes ~ |
    bes2 r8 bes c d | [ees ees ees ees] c aes r d | r d4. bes8 g r4 | 
    [c8 c c c] aes f g ees ~ | ees2 r8 \A r2 r8 \B r2 r8 \A 
    r bes4. a4 aes | [g8 g g g] f f r ees | r1 |
}

Chords = \chords {
    \partial 4. R4. |
    \repeat "volta" 2 {
	f2:m7 bes:7 | g:m7 c:7 | f:m7 bes:7 | ees:maj c:7 |
	f:m7 bes:7 | g:m7 c:7.9+.5+ | f:m7 bes:7 | 
    } \alternative { { ees:maj c:7 | } {ees:maj ees:7 } }
    \bar "||"
    aes:maj aes:m7 | g:m7 c:7.9- | 
    f:m7 bes:7 | ees:maj ees:7 | aes aes:m7 | g:m7 c:7.9- | 
    f:m7 bes:7 | g:m7 c:7 \bar "||"
    f:m7 bes:7 | ees:maj c:7 | f:m7 bes:7 | ees:maj c:7 |
    f:m7 aes:m7 | g:m7 c:7.9+.5+ | f:m7 bes:7 | ees1:maj \bar "||"
}

Score = \notes \transpose d' <
    \context ChordNames \Chords
    \context Staff \Tune
>


