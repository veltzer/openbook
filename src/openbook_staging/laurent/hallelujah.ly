\include "defs.ly"
#(define instrument "C")
\header {
    title = "Hallelujah I Love Him(her) So"
    subtitle = ""
    composer = "Ray Charles"
    style = "blues"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

\include "chord-name.ly"

global = \notes {
    \key f \major
    \time 4/4
}

phraseA = \notes { r4 d'8. c'16 aes8. g16 f8. d16 }
phraseB = \notes { r8. c'16 d'8. c'16 aes8. g16 f8. d16 }

melody = \notes \transpose c'' {
    \phraseA | f4 f8 aes8 ~ aes8 r8 r4 | 
    \phraseB | f4 f8 d8( ~ d8. )c16 r4 |
    \phraseA | f4 f8 f8 ~ f8 r8 r4 |
    \phraseB | f4 f8 f8 ~ f8. c16 d8. f16 | 
    a8( )c'4. r4 a8. a16 | g8( )f4. r4 aes8. g16 |
    aes8. g16 f8. d16 f4 f8 f8( | )f8 r8 r4 r2 |

    \phraseB | f4 f8 aes8 ~ aes8 r8 r4 | 
    \phraseB | f4 f8 d8( ~ d8. )c16 r4 |
    \phraseA | f4 f8 f8 ~ f8 r8 r4 |
    \phraseB | f4 f8 f8 ~ f8. c16 d8. f16 | 
    a8( )c'4. r4 a8. a16 | g8( )f4. r4 aes8. g16 |
    aes8. g16 f8. d16 f4 f8 f8( | )f8 r8 r4 r2 |
}

text = \lyrics {
    Let me tell you 'bout a boy I know
    He is my ba -- by and he lives next door.
    Ev -- 'ry morn -- ing 'fore the sun comes up, 
    He brings my cof -- fe in my fav -- 'rite cup.
    That's why I know, yes, I know, Hal -- le -- lu -- jah, I just love him so.


    When I'm in trou -- ble an I have no friends,
    I know he'll go with me un -- til the end.
    Ev -- 'vry bo -- dy asks me how I know. 
    I smile at them and say he told me so.
    That's why I know, yes I know,  Hal -- le -- lu -- jah, I just love him so.

}

harmony = \chords {
    f1 | bes4. b4:dim7 R4. | f1 | bes4. b8:dim7  R8. c16:7 R4 | f1 | f2.:7 f4:7.5+ |
    bes1 | b:dim7 | f2 a:7 | d:min bes:7 | g:7 c4.:7.4 f8 | R1 | 

    f1 | bes4. b4:dim7 R4. | f1 | bes4. b8:dim7  R8. c16:7 R4 | f1 | f2.:7 f4:7.5+ |
    bes1 | b:dim7 | f2 a:7 | d:min bes:7 | g:7 c4.:7.4 f8 | R2 f:7.5+ | 
}

piano = \context GrandStaff <
    \context Staff = treble {
	\global
	\notes \transpose c'' {
	    < \context Voice = va { \stemUp  
				    \phraseA | f4 f8 aes8 ~ aes8 r8 r4 |
				    \phraseB | f4 f8 d8 ~ d8. c16 r4 |
				    \phraseA | f4 f8 f8 ~ f8 r16 f'16( g'4 | 
				    )f'8 r16 c'16 d'8. c'16 aes8. g16 f8. d16 | f4 f8 f8 ~ f8. c16 d8. f16 |
				    a8 c'4. r4 a8. a16 | g8 f4. ~ f4 aes8. g16 | 	
				    aes8. g16 f8. d16 f4 f8 f8( | )f8 r8 r4 r2 |
				}
	      \context Voice = vb { \stemDown 
				    r4 <f a> r <a, c> | r4 d8 <d f> ~ <d f> r8 r4 |
				    r4 <f a> r <a, c> | r4 <bes,8 d> <f, aes,> ~ <f,8. aes,> <e,16 bes,> r4 |
				    <a,8 c f> r8 r4 r2 | <a,8 e> r r4 r4 <a cis'> |
				    <bes8 d'> r8 r4 r2 | <aes,8 d> r8 r4 r2 | r4 <c f a> <cis g> <cis g>
				    r4 <a, d> <aes, d> <bes, d> | r <a, d> <aes, d> <aes,8 d> <a, c> ~ |
				    <a, c> r8 r4 r2 | 
				}
	  >

	    < \context Voice = va { \stemUp  
				    \phraseB | f4 f8 aes8 ~ aes8 r8 r4 |
				    \phraseB | f4 f8 d8 ~ d8. c16 r4 |
				    \phraseA | f4 f8 f8 ~ f8 r16 f'16( g'4 | 
				    )f'8 r16 c'16 d'8. c'16 aes8. g16 f8. d16 | f4 f8 f8 ~ f8. c16 d8. f16 |
				    a8 c'4. r4 a8. a16 | g8 f4. ~ f4 aes8. g16 | 	
				    aes8. g16 f8. d16 f4 f8 f8( | )f2 f8. f16 f4 |
				}
	      \context Voice = vb { \stemDown 
				    r4 <f a> r <a, c> | r4 d8 <d f> ~ <d f> r8 r4 |
				    r4 <f a> r <a, c> | r4 <bes,8 d> <f, aes,> ~ <f,8. aes,> <e,16 bes,> r4 |
				    <a,8 c f> r8 r4 r2 | <a,8 e> r r4 r4 <a cis'> |
				    <bes8 d'> r8 r4 r2 | <aes,8 d> r8 r4 r2 | r4 <c f a> <cis g> <cis g> | 
				}
	  >

	}
    }
    \context Staff = bass {
	\global
	\clef bass
	\notes \transpose c {
	    \repeat unfold 2 {
		f4 r a r | bes bes8 b8 ~ b8. c16 d8. e16 | 
		f4 r a r | bes bes8 b8 ~ b8. c'16 d8. e16 | 
		f8 r r4 r2 | f8 r r4 r4 f | 
		bes,8 r r4 r2 | b,8 r r4 r2 |
		f4 r e a, | d r bes, bes | g r c' c8 f ~ | 
	    } \alternative {
		{ f8 bes4 b8 ~ b8. c'16 d'8. c'16 | } 
		{ f4 d'8. c'16 f8. f16 f4 | }
	    }
	}
    }
>

\score {
    < \context ChordNames \harmony
      \addlyrics
      \context Staff { \global \melody }
      \context Lyrics \text
      \piano
  >

    \paper {
	
	\translator { \ScoreContext \consists Bar_number_engraver }
    }
}

