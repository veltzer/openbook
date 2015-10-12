\header {
    title = "Whisper Not"
    composer = "Benny Golson"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Tune = \notes \relative c' { 
    \key f \major
    \time 4/4

    \property Voice.autoBeamSettings \override #'(end * * * *) = #(make-moment 1 4)
    \property Voice.autoBeamSettings \override #'(start * * * *) = #(make-moment 1 4)

    \partial 4 c8 g' ~ 
    \repeat volta 2 {
	g2. c,8 g' ~ | g2. a8 bes ~ | 
	bes2. a8 g | bes2. \times 2/3 {a16 bes a} g8 | 	
    } \alternative { 
	{ \grace gis( )a4 d8 gis, ~ \times 2/3 { gis16 bes gis} f8 g4 ~ | 
	  g2. f8 d ~ |  d2 e4. f8 ~  | f2. c8 g' | }
	{ \grace gis( )a4 d8 gis, ~ gis16 bes gis f g4 ~ | 
	  g2. e8 f ~ | f2 g4. aes8 ~ | aes1 \bar "||" }
    }
    
    r4 r8 g c8. g16 \times 2/3 {f8 ees fis ~ } | fis2 g4 a8 bes ~ | 
    bes2 ~ \times 2/3 {bes4 c a} | bes2 ~ \times 2/3 {bes4 c a} | 
    bes2 ~ bes8 d, g bes | bes2. a4 | aes2 ~ aes8 c, f aes | aes2. c,8 g' ~ \bar "||"

    g2. c,8 g' ~ | g2. a8 bes ~ | 
    bes2. a8 g | bes2. \times 2/3 {a16 bes a} g8 | 
    \grace gis a4 d8 gis, ~ gis16 bes gis f g4 ~ | 
    g2. f8 d ~ | d1 ~ | d2 r \bar "|."

    \repeat volta 2 {
	r4 \times 2/3 {c8 ees g} c8. ees16 c8. g16 | c8. g16 ees8. c16 fis2 |
	r4 \times 2/3 {bes,8 d g} bes8. d16 bes8. g16 | a8. d,16 g8. bes16 cis,8. e16 a8. g16 |
	a8 f r4 r8 a, d8. f16 | aes8( f )g4 r8 a, d8. f16 |
	g8 d f2. ~ | 
    } \alternative {
	{ r2 \times 2/3 {g8 aes g ~ } g4 } { f2. r4 \bar "|." }
    }
}

Chords = \chords {
    \partial 4 R4 | 

    \repeat volta 2 {
	c2:m7 c:m7/bes | a:m7.5- d:7.9- | g:m7 g:m7/f | e:m7.5- a:7.9- |
    } \alternative { 
	{ d:m7 b:m7.5- | e:m7 a:7.9- | d:m7 e:m7 | f:m7 g:7.9- | } 
	{ d:m7 d:m7/c | e:m7 a:7.9- | d:m7 e:m7 | f:m7 bes:7 | } 
    }

    a1:m7.5- | d:7.9- | g:m7 | c:7 |
    e:m7.5- | a:13 | d:m7.5- | g:13 | 

    c2:m7 c:m7/bes | a:m7.5- d:7.9- | g:m7 g:m7/f | e:m7.5- a:7.9- |
    d:m7 b:m7.5- | e:m7 a:7.9- | d1:m7 | aes2:7 g:7.5+ | 

    \repeat volta 2 {
	c2:m7 c:m7/bes | a:m7.5- d:7.9- | g:m7 g:m7/f | e:m7.5- a:7 |
	d:m7 b:m7.5- | e:m7 a:7 | d:m7 e:m7 | 
    } \alternative {  { g1:7 | } { f2.:m7 bes2:7 } }
}

Breaks = \notes {
    \partial 4 s4 |
    \repeat unfold 8 { s1*4 \break }
}

Score = <
    \context ChordNames \Chords
    \context Staff < \Tune \Breaks >
>

#(set! minimumVerticalExtent 4)
