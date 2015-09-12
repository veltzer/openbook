\header {
    title = "Cantaloupe Island"
    composer = "Herbie Hancock"
    enteredby = "Laurent Martelli"
    indexTitle = "Cantaloupe Island (with piano)"
    tagline = #tagline
    head = #instrument
}

\include "cantaloupe_island_melody.ly"

PianoIntro = <
    \context Staff = treble {
	\repeat "percent" 4 {
	    \notes \relative c' {
		\key aes \major
		r8 <aes c f(>  <)bes4-. d f> \grace {b8(}  <)c4 ees f> 
		<bes8 d f(> <)aes-. c f> |
	    }
	}
    }
    \context Staff = bass {
	\clef bass 
	\repeat "percent" 4 {
	    \notes \relative f, {
		\key aes \major
		f4. c'8 ~ c4 ees8( )f-. |
	    } 
	}
    }
>

PianoA = <
    \context Staff = treble {
	\repeat "percent" 4 {
	    \notes \relative c' {
		r8 <aes c f(>  <)bes4-. d f> \grace {b8(}  <)c4 ees f> 
		<bes8 d f(> <)aes-. c f> |
	    }
	}
    }
    \context Staff = bass {
	\clef bass 
	\repeat "percent" 4 {
	    \notes \relative f, {
		f4. c'8 ~ c4 ees8( )f-. |
	    } 
	}
    }
>

PianoB = <
    \context Staff = treble {
	\repeat "percent" 4 {
	    \notes \relative c' {
		r8 <aes ces f(>  <)bes4-. des f> \grace {bes8(}  <)ces4 ees f> 
		<bes8 des f(> <)aes-. ces f> |
	    }
	}
    }
    \context Staff = bass {
	\clef bass 
	\repeat "percent" 4 {
	    \notes \relative f, {
		des4. aes'8 ~ aes4 b8( )des-. |
	    } 
	}
    }
>


PianoC = <
    \context Staff = treble {
	\context Voice {
	    \repeat "percent" 4 {
		\notes \relative g {
		    <g4. c f> <g8 c f> ~ <g2 c f>
		}
	    }
	}
    }
    \context Staff = bass {
	\context Voice {
	    \clef bass 
	    \repeat "percent" 4 {
		\notes {
		    <d,4. a,> <d,8 a,> ~ <d,2 a,>
		} 
	    }
	}
    }
>


Score = <
    \context ChordNames \Chords
    \context Staff \Tune
    \context GrandStaff { \PianoIntro \PianoA \PianoB \PianoC \PianoA }
>

