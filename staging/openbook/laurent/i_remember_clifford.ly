\header {
    title = "I Remember Clifford"
    composer = "Benny Golson"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
    themeid = "1373"
}

%% the tune in ees
Tune = \notes \relative c'' { 
    \key c \major
    \time 4/4

    r8^"Intro" a( c e g f c d | e e ~ )e2. | r8 e( gis b d4. b8 | \break 
    )c1| r8 a,( c d e4 c8 a | c8 c ~ )c4 r4 g'( \break
    \repeat "volta" 2 {
	e2. d8 b | )c2 r8 d( e f | g4. g8 gis f b gis | )a2 r8 e( a b |
    } \alternative { 
	{ c2. b8 a | g16 a )b8 ~ b4 r8 b,( e fis | g2. fis8 e | )f!2. g4( } 
	{ )c2 r8 d,8( g a | )bes2. r8 a( | d,4. a'8 dis,4. b'8 | e,4. c'8 a4. b8 \bar "||" } 
    } \break
    c2 b8 a g a | b4 )bes r8 a,( c d | e a, c d ees4 aes | ) g2. d8( e | 
    f4. f8 g f e d | )e2 r8 e( a b | c4. c8 d c b a | b e, g b a4 g \bar"||"
    e2. d8 b | )c2 r8 d( e f | g4. g8 gis f b gis | )a2 r8 e( a b | 
    )c2 r8 d,( g a | )bes2 r8 a,( c d | e a, c d ees4 b | )c1 \bar "|."
}

Spaces = \context Voice = spaces \notes \transpose c' {
    s1*3 | \stemOff  \headOff d,4 d d d |
}

Chords = \chords {
    aes1:maj | g2:7.5+ bes:7.9- | g:7.9- g:7/+b |
    c4:m7 bes:m7 aes:m7 ges:m7 | f1:m7 | bes4*3:sus4.7 bes4:7.9- |

    \repeat volta 2 {
	ees2:maj g:7 | aes:maj a:dim7 | bes:7 b:dim7 | c:m7 c:m7/+bes |
    } \alternative {
	{ a2:m7.5- d:7.9- | g:m7 g:m7/+f | e:m7.5- a:7.9- | f:m7 bes:7.9- | }
	{ a2:m7.5- d:7.9- | g:m7.5- c:7.9- | f:m7 bes:7.5+ | g:m7 aes:maj | } 
    }

    a2:m7.5- d:7.9- | g:m7.5- c:7.9- | f:m7 bes:7.5+ | ees1:maj |
    d2:m7.5- g:7.9- | c:m7 c:m7/+bes | a:m7.5- d:7.9- | g4:m7 c:7 f:m7 bes:7 |

    ees2:maj g:7 | aes:maj a:dim7 | bes:7 b:dim7 | c:m7 c:m7/+bes |
    a2:m7.5- d:7.9- | g:m7.5- c:7.9- | f:m7 bes:7.5+ | ees1:maj |
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom \notes \transpose ees { <\Tune \Spaces > }
>

#(set! minimumVerticalExtent 5)
