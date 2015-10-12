\header {
    title = "Take the \"A\" Train"
    composer = "Billy Strayhorn \\& Lee Gaines"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
				% Intro
    \repeat "unfold" 4  { c2:maj^7/+g aes:7.5+/ges | } \break
    
				% A
    c1*2:6 | d1*2:9.11+ | 
    d1:min7 | g:7 | c:6 | d2:min7 g:7 |
    c1*2:6 | d1*2:9.11+ | 
    d1:min7 | g:7 | c:6 | c:7 \bar "||" \break
    
				% B
    g1*4:maj |
    d1*2:7.9 | d1:min7.9 | g2:7.9 g:7.9- \bar "||"
    
				% C
    c1*2:6 | d1*2:9.11+ | 
    d1:min7 | g:7 | c:6 | d2:min7 g:7 |
}

Tune = \notes \relative c'' {
    \time 4/4
    \key c \major
    
				% Intro
    \repeat percent 2 {
	r8 e ~ [ e \times 2/3 { d16 c bes } ] aes2 |
	e'4 ~ [ e8 \times 2/3 { d16 c bes } ] aes8 aes r4 |
				%	r8 e' ~ [ e \times 2/3 { d16 c bes } ] aes2 |
				%	e'4 ~ [ e8 \times 2/3 { d16 c bes } ] aes8 aes r4
    } \bar "||"
    
				% A
    \repeat "unfold" 2 {
	g1 ~ | g8 e'4. g,4 c | e8 gis, ~ gis2. ~ | gis1 |
	a1 | a8 ais b e g, ges f des' | c e, ~ e2. ~ | e1 |
    } 
    
				% B
    a8 c ~ c2. | e8 f,4. a4 c | e8 a, ~ a2. ~ | a1 |
    a8 c ~ c2. | e8 fis,4. a4 c | e8 a, ~ a2. ~ | a2 aes |
    
				% C
    g1 ~ | g8 e'4. g,4 c | e8 gis, ~ gis2. ~ | gis1 |
    a1 | a8 ais b e g, ges f des' | c e, ~ e2. ~ | e1 \bar "||"
    
}

Score = <
    \context ChordNames { \Chords }
    \context Staff { \Tune }
>

