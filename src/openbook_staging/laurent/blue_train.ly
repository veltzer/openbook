\header {
    title = "Blue Train"
    composer = "John Coltrane"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 8*5 R2 R8 |
    \repeat volta 2 { ees1*4:7 | aes1*2:13 | ees:7 | bes:7
	} \alternative { {ees1*2:7} {ees1*2:7} }
}

Tune = \notes \relative c'' {
    \time 4/4
    \key ees \major

    \partial 8*5 bes8 des f-\accent des ees ~ |
    \repeat volta 2 {
	ees1 | r4 r8 bes des f-\accent des ees ~ |
	ees1 | \break r4 r8 ees, ges bes-\accent ges aes ~ |
	aes1 | r4 r8 bes des f-\accent des ees ~ |
	ees1 | \break r4 r8 bes des ges-\accent ees des ~ | 
	des1 | r4 r8 bes des f-\accent des ees ~ |
    } \alternative { 
	{ ees1 | \break r4 r8 bes des f-\accent des ees ~ | } 
	{ ees4 r4 r2| r1 | } 
    }
    \invisibleNotes c4 c c c \barOff |
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

