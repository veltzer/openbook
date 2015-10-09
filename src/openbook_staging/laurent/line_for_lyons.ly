\header {
    title = "Line for Lyons"
    composer = "Gerry Mulligan"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
% A
    \repeat "volta" 2 {
	g2:6 g:7.9- | c:min7 f:7  | b:min7 e:7 | a:min7 d:7 | \break
	g:maj e:7 | a:min7 d:7 | 
    } \alternative { { g:6 e:7 | a:min7 d:7 |  \break } { g1:6 | g:7 \bar "||" } } 

% B
    c1:maj | cis2:min7.5- fis:7.9- | b1:min7 | b2:min7 e:7.9- |
    a1:min7 | a2:min7 d:7.9- | b:min7 e:7 | a:min7 d:7 \bar "||"

% C
    g2:6 g:7.9- | c:min7 f:7  | b:min7 e:7 | a:min7 d:7 |
    g:maj e:7 | a:min7 d:7 | g1:6 | a2:min7 d:7 |

% Coda
    g2:6 e:7 | a:min7 d:7 | g:6 e:7 | a:min7 d:7 | g1:maj \bar "|."
}

Tune = \notes \relative c'' {
    \time 4/4
    \key g \major

% A
    \repeat "volta" 2 {
	g8 b d g f4 d8 ees ~ | ees2 r8 f ees d | 
	r ees d d r e d des | c d c c ~ c2 |
	b8 c b d ~ d4 g,-. | a8 b a c ~ c4 fis,8 g ~ | 
    } \alternative { 
	{ g4. d'8 ~ d2 ~ | d2. r4  | \break }
	{ g1 | r4 g8 a b c d dis | } 
    } 

% B
    e'1 ~ | \times 2/3 { e4 dis e } g fis | 
    d1 ~ | \times 2/3 { d4 cis d } f e |
    c1 | r8 b c ees ~ ees4 d | b2 r8 d c a ~ | a2. r4 |

% C
    g8 b d g f4 d8 ees ~ | ees2 r8 f ees d | 
    r ees d d r e d des | c d c c ~ c2 |
    b8 c b d ~ d4 g,-. | a8 b a c ~ c4 fis,8 g ~ \toCoda | 
    g1 | r1 \bar "||" \coda

				% Coda
    g4. d'8 ~ d2 | r8 gis, a b c4 fis,8 g ~ | 
    g4. d'8 ~ d2 | r8 gis, a b c4-. g8 fis ~ | fis1-\fermata

}

Score = <
    \context ChordNames { \Chords }
    \context Staff { \Tune }
>

#(set! shortestDurationSpace 3)
