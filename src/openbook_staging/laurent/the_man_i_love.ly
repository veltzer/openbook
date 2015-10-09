\header {
    title = "The Man I Love"
    composer = "George Gershwin"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \repeat "volta" 2 {
	ees1:maj | ees:min7 | bes:min7 | c:7.5+ | 
	aes:min6 | 
    } \alternative { 
	{ bes1:7 | ees2:maj aes:maj | f:min7 bes:7.9- | } 
	{ bes1:7 | f2:min7 e:maj | ees:maj d4:min7.5- g:7.9- \bar "||" } 
    }
    c2:min c:min7 | d:7 g:7 | c1:min7 | g:7 | 
    c2:min c:min7 | d:7 g:7 | c2:min g4:min7 c:7 | f4*3:min9 e4:maj |

    ees1:maj | ees:min7 | bes:min7 | c:7.5+ | 
    aes:min6 | f1:min7 | bes2:7 e:maj | ees1:maj
}

Tune = \notes \relative c'' {
    \time 4/4
    \key ees \major
    
    \repeat "volta" 2 {
	r8 bes c bes c bes des4 | r8 bes c bes des2 | 
	r8 bes c bes c bes des4 | r8 aes bes aes c2 | \break
	r8 aes bes aes bes aes ces4 | 
    } \alternative { 
	{ r8 g aes g bes4 aes | g2 g | g1 | \break }
	{ r8 g aes g bes4 g | ees2 ees | ees r | \break } 
    } 

    ees,8 f g fis g4 ees'4 | ees d bes b | d c g a | b1 | \break 
    ees,8 f g fis g4 ees'4 | ees d bes b | d c bes aes | g f g aes \bar "||" \break 

    r8 bes c bes c bes des4 | r8 bes c bes des2 | 
    r8 bes c bes c bes des4 | r8 aes bes aes c2 | \break
    r8 aes bes aes bes aes ces4 | r8 g aes g bes4 c! | ees2 ees | g1 \bar "|."
}

Score = <
    \context ChordNames { \Chords }
    \context Staff = bottom { \Tune }
>

