\header{
    title = "Samba De Uma Nota So"
    subtitle = "One Note Samba"
    composer = "Antonio Carlos Jobim"
    enteredby = "Laurent Martelli"
    copyright = "© 1961,1962 Antonio Carlos Jobim and Mrs Newton Mendonca, Brazil"
    tagline = #tagline
}

scale = \notes \relative a'' {
    a8 b c d c b a g | f e d c b c d e | 
}

melody = \notes \relative g' {
    \time 4/4 
    \key bes \major

    \partial 4. f4 f8 \bar "||"
    \repeat unfold 2 {
	f4 f8 f ~ f f4 f8 | ~ f4. f8 r f4 f8 | f4 f8 f ~ f f4 f8 | 
    }
    \alternative { { ~ f2 r8 f4 f8 | } { ~ f2 r8 bes4 bes8 | } }
    
    bes4 bes8 bes ~ bes bes4 bes8 | ~ bes bes bes4 ~ bes8 bes4 bes8 | 
    bes4 bes8 bes ~ bes bes4 bes8 | ~ bes2 r8 f4 f8 |
    f4 f8 f ~ f f4 f8 | ~ f f4 f8 ~ f f f4 | f4 f8 f ~ f f4 bes8 | ~ bes2. r4 |
    
    \transpose des { \scale } c,4. bes8 r c des f | c4. bes8 ~ bes4 r | 
    \transpose ces { \scale } bes4. aes8 r bes b dis | ges4. f8 ~ r f4 f8 | 
    
    \repeat unfold 2 {
	f4 f8 f ~ f f4 f8 | ~ f4. f8 r f4 f8 | f4 f8 f ~ f f4 f8 | 
    }
    \alternative { { ~ f2 r8 f4 f8 | } { ~ f2 r8 bes4 bes8 | } }
    bes4 bes8 bes ~ bes bes4 bes8 | ~ bes4. bes8 r bes4 bes8 | 
    bes4 bes8 bes ~ bes bes4 bes8 | ~ bes2 r8 bes4 bes8 | 
    bes4 bes8 bes ~ bes bes4 bes8 | ~ bes bes4 bes8 bes4 bes | 
    ~ bes bes8 bes ~ bes bes4 bes8 | ~ bes2 r 
}


harmony = \notes \chords {
    \partial 4. R4. |
    d1:m7 | des:7 | c:m7 | b:7.4+ | \break
    d1:m7 | des:7 | c:m7 | b:7.4+ \bar "||"
    
    f:m7 | \break bes:7 | ees:maj | aes:7 |
    d1:m7 | \break des:7 | c2:m7 b:7.4+ | bes1 \bar "||"
    
    ees1:m7 | \break aes:7 | des1*2:maj |
    des1:m7 | ges:7 | bes:maj | c2:min7.5- f:7 \bar "||"
    
    d1:m7 | des:7 | c:m7 | b:7.4+ |
    d1:m7 | des:7 | ges:maj | f:7.4+ \bar "||"
    
    f1:min7 | bes:7.4+ | ees:maj | aes:7 |
    des1:maj | c:7 | b:maj | bes \bar "|."
}

\midi { \tempo 4 = 218 }

Score =  < 
    \context ChordNames \harmony
    \context Staff \melody
>

#(set! minimumVerticalExtent 4)
#(set! shortestDurationSpace 2.5)
