\header {
    title = "Round Midnight"
    composer = "Cootie Williams \& Thelonious Monk"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
}

intro =  \notes \relative f' {
    r4 f16 g a b \grace{dis8(} )e8 b16 a \grace{dis8(} )e8 b16 a |
    \grace{fis'8(} )g4 ~ g16 fis c gis ais2 |
}

Tune = \notes \transpose c' {
    \time 4/4
    \key aes \major

% INTRO
    \intro |
    \transpose bes \intro |
    \transpose aes \intro | \break

    \transpose c'' \notes { 
	\repeat "unfold" 3 { 
	    r16 <a,16 e gis bis> <a,8 e gis bis> <a,8 e gis bis> 
	    <a,16 e gis bis> <a,16 e gis bis> 
	}
	r16 <a,16 e gis bis> <a,8 e gis bis> <bes,4 e fis c'> 
    }
    
    \relative c' {

% theme
	\repeat "volta" 2 {
	    r4 c16 f g c aes4. c,8 | f8 f ~ f4 ~ f8 f c'16 bes8. | 
	    r4 f16 aes c ees d4. aes8 | b4 bes bes8 aes ~ aes4 | 
	    r4 bes16 des f aes g4. des8 | c2. f,8 g | 
	} \alternative { 
	    { \times 2/3 {aes g aes} g4 ~ g4. f8 | e c ~ c2. | \break } 
	    { aes8 g4 f8 ~ f4 f8 f8 | ~ f2. f8 g | } 
	}
	\times 2/3 {aes g aes} g4 ~ g4. f8 | e c ~ c2 f8 g |
	\times 2/3 {aes8 g aes} g4 ~ g4. f8 | e c'8 ~ c2. |
	des4 des8. des16 c8 c ~ c4 | aes8. aes16 aes8 g8 ~ g4. c8 |
	f4. f16 f ees4. ees16 ees | des4. ees16 des c2 | 
	
	\break r4 c,16 f g c aes4. c,8 | f8 f ~ f4 ~ f8 f c'16 bes8. | 
	r4 f16 aes c ees d4. aes8 | b4 bes bes8 aes ~ aes4 | 
	r4 bes16 des f aes g4. des8 | c2. f,8 g | 
	aes8 g4 f8 ~ f4 f8 f8 | ~ f2. r4 \bar "||"

% coda
	\break \coda r8 c \times 2/3 {d8 e f} g f ~ \times 2/3 {f8 ees d} |
	aes'1 | ~ aes4 ~ \times 2/3 {aes8 g f} g8. e16 f g aes bes |
	\times 2/3 {b8 des ais} b2. ~ | \break
	b4 ~ \times 2/3 {b8 ais gis} ais8. gis16 g gis ais b |
	cis2. ~ \times 2/3 {cis8 fis, g} |
	c4 \times 2/3 {bes8 f d} <cis4 fis a>  r8 c | \break
	f4 c' f bes,! ees! aes,! des! fis, c'2
	<b1 gis e b-\fermata>
    }

}

Score = \notes \transpose bes <
    \context ChordNames \Chords
    \context Staff \Tune
> 

#(set! shortestDurationSpace 1.5)
#(set! minimumVerticalExtent 4)