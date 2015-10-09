\header {
    title = "Unit Seven"
    composer = "Sam Jones"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    \partial 4. R4. |
    \repeat volta 2 {
	c1*2:7 | c1*2:7 | f1*2:7 | c1:7 | a:7.5+ |
    } \alternative {
	{ aes:maj | des:maj | c:maj | g:7 | }
	{ aes:maj | des:maj | c:maj | a:7 | }
    }
    a:min7 | g:7 | c:maj | a:7.9- |
    d:min7 | g:7.9- | a2:7 a:7.5+ | d1:min7 |
    
    c1*2:7 | c1*2:7 | f1*2:7 | c1:7 | a:7.5+ |
    aes:maj | des2.:maj R8 c8:6 | R1 | R1 | \break

    % SOLOS
    \repeat volta 2 { 
	c1*4:7 | f1*2:7 | c1:7 | a:7.5+ | \break
	aes:maj | g:7.5+ | c:maj |
    } \alternative { { g1:7 } { a1:7 \break } }

    d:min7 | g:7 | c:maj | a:7.9- | \break
    d:min7 | g:7 | e2:7 a:7 | d:min7 g:7 \bar "||" \break
    
    c1*4:7 | f1*2:7 | c1:7 | a:7.5+ | \break
    aes:maj | g:7.5+ | c:maj | g:7 |

    \repeat volta 2 { aes1:maj | des:maj | c:maj | a:7 | }
    aes:maj | des2.:maj R8 c8:6 | R1 | R2 c:7.9+ \bar "|." 
}

Tune = \notes \relative f' {
    \time 4/4
    \key c \major
    
    \partial 4. g8 a bes ~ | 

% A
    \repeat volta 2 {
	bes1 ~ | bes2 r8 g8 a bes ~ | bes1 ~ | bes2  r8 c d ees ~ | \break
	ees1 ~ | ees2 r8 bes a g ~ | g2 ~ g8 g g( )a | r2 r8 c, ees c | \break
    } \alternative {
	{ g' c, ees c' ~ c2 ~ | c2 bes8 g f g ~ | g1 ~ | g2 r8 g a bes ~ |  \break }
	{ g' c, ees c' ~ c2 ~ | c2 bes8 g b c | r1   | r8 e, r f e d cis a \bar "||" \break }
    }

% B
    e cis d e f g a c! | b4-. r8 d8 ~ d4 a8 g ~ | g1 | r8 fis g bes ~ bes4 a8 f ~ | \break
    f1 | r8 e f aes ~ aes4 g8 e ~ | e1 | bes''8( )a r4 r8 g, a bes ~ \bar "||" \break

% C
    bes1 ~ | bes2 r8 g8 a bes ~ | bes1 ~ | bes2  r8 c d ees ~ | \break
    ees1 ~ | ees2 r8 bes a g ~ | g2 ~ g8 g g( )a | r2 r8 c, ees c \toCoda | \break
    g' c, ees c' ~ c2 ~ | 
    c2 bes8 g b c | r1^"Solo break"   | r1 | \break \newpage
}

Solos = \notes \relative c'' {
    \repeat volta 2 {
	\repeat percent 4 { \fourBeats | }
	\repeat percent 2 { \fourBeats | } 
	\repeat unfold 5 \fourBeats
    } \alternative { { \fourBeats | } { \fourBeats | } }
    \repeat unfold 8 \fourBeats
    
    \rehearsalBeginOfLine

    \repeat percent 4 { \fourBeats | }
    \repeat percent 2 { \fourBeats | } \fourBeats | \fourBeats
    \repeat unfold 4 \fourBeats \coda | \break
}


Final =  \notes \relative g' {
    \repeat volta 2 {
	g8 c, ees c' ~ c2 ~ | c2 bes8 g b c | r1   | r2  r8 c, f c | \break 
    }
    g' c, ees c' ~ c2 ~ | c2 bes8 g b c | r1^"Break"   | r2  <d,2:32 fis a c> | \break 
}

Score = <
    \context ChordNames { 
	\Chords
    }
				%    \context Staff = bottom {	
    { \Tune \Solos \Final }
				%    }
>

#(set! minimumVerticalExtent 4)
