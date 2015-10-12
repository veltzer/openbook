\header{
    title = "Four"
    composer = "Miles Davis"
    enteredby = "Laurent Martelli"
    copyright = "© 1963 Prestige Music"
    tagline = #tagline
    head = #instrument
}

melody = \notes \relative c' {
    \time 4/4
    \key f \major
    
    \property Staff.midiInstrument = "trumpet"
    
    \property Staff.voltaSpannerDuration = #(make-moment 1 1)
    
    \partial 4. c8 d e
    \repeat volta 2 {
	\repeat unfold 2 {
	    r8 c d e r c d e | r g f e r c d ees | ~ ees1 | r2 r8 f g a |
	    r f g  a r f g a | r c bes a r f g aes | ~ aes1 | r2 g8 a bes b |
	    c2 f,8 a c des | r ges,4. f2 | r8 d'4. c4 bes8 a | ~ a2 r8 g a bes |
	} \alternative {
	    { c2 f,8 a c des | ~ des4 ges,8 f ~ f2 | 
	      r8 d'4. c4 bes8 a-\marcato | r2 r8 c,8 d e \bar "||" }
	    { \break \toCoda c4 a8 c des ges, f4 | d'!4 bes8 g e'4 c8 f-\marcato | r1 | r1 | }
	}
    } \break
    \coda c2 des4. d8 | ~ d4. e8 ~ e4 c8 g' | ~g4 f8 e d c b a | 
    gis4 r8 f'8 e4 d8 c | ~ c4 a8 c des ges, f4 | d'4 bes8 g e'4 c8 f-\marcato |
    r2 r8 c, f aes ~ | aes f aes2.-\fermata \bar "|."
}

harmony = \notes \chords {
    \partial 4. R4. |
    \repeat volta 2 {
	\repeat unfold 2 {
	    f1*2:maj                  | f1:m7          | bes:7           |
	    g1*2:m7                   | bes1:m7        | ees:7           |
	    f1:maj/+a | aes2:m7 des:7 | g1:m7          | e2:m7.5- a:7.5- |
	} \alternative {
	    { f1:maj/+a    | aes2:m7 des:7   | g2.:m7 R8 c8:7 | R1        | }
	    { a2:m7 aes:m7 | g:m7 c4.:7 f8:6 | R1             | g2:m7 c:7 | }
	}
    }
    a2:m7 aes:m7 | g:m7 c:7 | b1:m7.5- | e:7 |
    a2:m7 aes:m7 | g:m7 c4.:7 f8 | R2 f:m7 | 
}

Score =  \notes \transpose bes < 
    \context ChordNames \harmony
    \context Staff \melody
>

\midi { \tempo 4 = 178 }

#(set! shortestDurationSpace 3)
#(set! minimumVerticalExtent 4)
