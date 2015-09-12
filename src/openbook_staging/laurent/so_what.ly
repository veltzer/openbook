\header {
    title = "So What"
    composer = "Miles Davis"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

Chords = \chords {
    R1 |
    \repeat "volta" 2 { d1*7:min7 | } \alternative { { R1 } { R1 } }
    ees1*8:min7 | d1*8:min7 |
}



Piano = <
    \context Staff = treble {
	\notes \relative c' {
	    \key c \major
	    r1 
	    \repeat "volta" 2 { 
		r2 <d4. g b> <c8 f a> | r1 | 
		r2 <d4. g b> <c8 f a> | r1 | 
		r2 <d4. g b> <c8 f a> | r1 | 
		r2 <d4. g b> <c8 f a> | 		
	    } \alternative { { r1 | } { r1 | } }

	    r2 <ees4. aes c> <des8 ges bes> | r1 | 
	    r2 <ees4. aes c> <des8 ges bes> | r1 | 
	    r2 <ees4. aes c> <des8 ges bes> | r1 | 
	    r2 <ees4. aes c> <des8 ges bes> | r1 |

	    r2 <d4. g b> <c8 f a> | r1 | 
	    r2 <d4. g b> <c8 f a> | r1 | 
	    r2 <d4. g b> <c8 f a> | r1 | 
	    r2 <d4. g b> <c8 f a> | r1 
	}

    }
    \context Staff = bass {
	\clef bass 
	\notes \relative f, {
	    \key c \major
	    r8 e a b c( )d e c |
	    \repeat "volta" 2 {
		d2 <e4. a> <d8 g> | r8 e, a b c( )d e c |
		d a4. <e'4. a> <d8 g> | r8 e, a b c( )d e c |
		d2 <e4. a> <d8 g> | r8 e4. e4 e | 
		d8( )a4. <e'4. a> <d8 g> | 
	    }
	    \alternative  { { r8 e, a b c( )d e c | }
			    { r8 f, bes c des( )ees f des \bar "||" } }

	    ees2 <f4. bes> <ees8 aes> | r8 f, bes c des( )ees f des |
	    ees bes4. <f'4. bes> <ees8 aes> | r8 f, bes c des( )ees f des |
	    ees2 <f4. bes> <ees8 aes> | r8 f4. f4 f | 
	    ees8( )bes4. <f'4. bes> <ees8 aes> | 

	    r8 e, a b c( )d e c \bar "||"
	    d2 <e4. a> <d8 g> | r8 e, a b c( )d e c |
	    d a4. <e'4. a> <d8 g> | r8 e, a b c( )d e c |
	    d2 <e4. a> <d8 g> | r8 e4. e4 e | 
	    d8( )a4. <e'4. a> <d8 g> | r1 \bar "||"
	    
	}
    }
>

Score = <
  \context ChordNames \Chords
  \context GrandStaff { \Piano }
>

#(set! minimumVerticalExtent 4)
