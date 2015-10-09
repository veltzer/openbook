\header {
    title = "Lullaby of birdland"
    composer = "George Shearing"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Tune = \notes \relative c''{
    \key a \minor

    \repeat "volta" 2 {
	e4 d8 c b a ~ a4 | fis4 a8 gis ~ gis4 r4 | e4 b'8 a ~ a4 r8 e8 | 
	f e e' d ~ d2 | g8 g f e d c4. a8 e' d aes8 ~ aes e'8 d g, ~ | 
    } \alternative {
	{ g2. r8 d'8 | c f, ~ f c' b e, ~ e4 | }
	{ g2. r8 g8  | b c r4 r2 | }
    }
    
    \repeat "unfold" 2 {
	e'4 f8 fis g e g f | ~ f d ~ d2 r4 | d4 dis8 e f g f e ~ | e
    } \alternative {
	{ r8 r4 r2 \break } 
	{ f8 e d ~ d4 r }
    }
}

Harmony = \chords {
    \repeat "volta" 2 {
	f2:min7 d:min7.5- | g:7.9+ c:7.5+ | f1:min7.9 | bes2:min7 ees:7.9- |
	aes:maj f:min7 | bes:min7 ees:7.9- |
    } \alternative {
	{ aes1:maj | des2:7.9 c:7.9- | }
	{ aes2:maj aes:6 | aes:maj g4:9 ges:9 | \break }
    }
    f2:9 f:9- | bes1:min7 | des2:6 c:min7/+cis | f1:min7.9/c | 
    f2:9 f:9- | bes1:min7 | des2:6 c:min7/+cis | f2:min7.9/c c:7 | 
}

Score = <
    \context ChordNames { 
        \Harmony
    }
    \context Staff = bottom {	
	\notes \transpose aes \transpose c' {
	    \Tune
	}
    }
>
