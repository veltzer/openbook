\header{
    title = "Song For My Father"
    composer = "Horace Silver"
    enteredby = "Laurent Martelli"
    copyright = "© 1966 Ecaroh Music Inc."
    tagline = #tagline
    head = #instrument
}

beamHackA = {
    \property Voice.stemLeftBeamCount = #1
    \property Voice.stemRightBeamCount = #2
}
beamHackB = {
    \property Voice.stemLeftBeamCount = #2
    \property Voice.stemRightBeamCount = #2
}

Melody = \notes \relative c' {
    \time 4/4
    \key aes \major

    \property Voice.autoBeamSettings \override #'(end * * * *) = #(make-moment 1 4)
    \property Voice.autoBeamSettings \override #'(start * * * *) = #(make-moment 1 4)

    \partial 4. c8- . f-. aes-. |
    \repeat "volta" 2 {
	c-\accent \times 2/3 {\beamHackA des16 \beamHackB c bes} aes8 bes-\accent ~ bes 
	\times 2/3 {\beamHackA c16 \beamHackB bes aes} f8 aes-\accent ~ |
	aes \times 2/3 {\beamHackA bes16 \beamHackB aes f} ees8 f-\accent ~ f
	\times 2/3 {\beamHackA g16 \beamHackB f ees} c8 <des-\accent ees> ~ |
	<des1 ees> ~ | <des2. ees> g,8 \( ges | f <b des!> ~ < \) b2. des> |
	r2 <d4. f(> <)ees8 g> ~ | <ees1 g> | 
    } \alternative {
	{ ~ <ees2 g> r8 c-. f-. aes-. | }
	{ <ees2 g> r8 <c8-. ees> <c-. ees> <c-. ees> | }
    }
    <c-. ees(> <)bes des> r <des f> ~ <des2 f> | 
    <des2 f> r8 <des-. f> <des-. f> <des-. f> | 
    <des-. f(> <)ees c> r <ees g> ~ <ees2 g> ~ |
    <ees2 g> r8 <c-. ees> <c-. ees> <c-. ees> |
    <c-. ees(> <)bes des> r <des f> ~ <des2 f> | 
    r2 <e4. aes> <g8 bes> ~ | <g1 bes> ~ | 
    <g2 bes> r8 c,-. f-. aes-. \bar "|."
}

Harmony = \notes \chords {
    \partial 4. R4. |
    \repeat "volta" 2 {
	f1*2:m7 | ees1*2:7 | des1:7 | g:m7/+c | f:m7 |
    } \alternative { { f1:m7 } { f1:m7 } }
    ees1*2:7 | f1*2:m7 | ees2:7 des:7 | g1:m7/+c | f1*2:m7 |
}


Score =  < 
    \context ChordNames \Harmony
    \context Staff \Melody
>
