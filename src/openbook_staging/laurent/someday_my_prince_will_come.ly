\header {
    title = "Someday My Prince Will Come"
    composer = "Music by Franck Churchill\\\\ Lyrics by Larry Morey"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    bes2.:maj d:7.5+ ees:maj g:7.5+ c:min7 \break
    g:7.5+ d:min7 f:7 d:min7 cis:dim7 \break
    c:min7 f:7 d:min7 cis:dim7 c:min7 f:7 \break

    bes:maj d:7.5+ ees:maj g:7.5+ c:min7 \break
    g:7.5+ c:min7 f:7 bes:maj d:7.5+ \break
    ees:maj e:dim7 bes:maj/f g:7 c:min7 f:7 \break
}

Tune = \notes \relative f' {
    \time 3/4
    \key bes \major

    f2. | bes2 fis4 | a2 g4 | g2. | g2. |
    ees'2 b4 | d2 c4 | c d ees | f f f | a a a |
    f2. ~ | f4 d ees | f f f | a a a | f2. ~ | f4 r r \bar "||"

    f,2. | bes2 fis4 | a2 g4 | g2. | g2. |
    ees'2 b4 | d2 c4 | c d ees | f2 f4 | c'2 bes4 |
    b,4. [c8 b c] | a'2 g4 | f f f | f2 f4 | f2. ~ | f2 r4 \bar "|."
    
}

Score = <
    \context ChordNames { 
	\Chords
    }
    \context Staff = bottom {	
	\Tune
    }
>

