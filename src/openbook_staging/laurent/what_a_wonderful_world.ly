\include "defs.ly"
#(define instrument "C")
\header {
    title = "What a Wonderful World"
    subtitle = ""
    composer = "George David Weiss and Bob Thiele"
    style = "Jazz"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

\include "chord-name.ly"

global = \notes {
    \key f \major
    \time 4/4
}

tupletOff = {
    \tupletBracketOff
    \tupletNumberOff
}

melody = \notes \transpose c'' {
    \tupletNumberOn
    \tupletIfNoBeam

%1
    r1 | r2 r4 c8 e \bar "||"
%3
    f4. a8 c'2 | r8 d' d' d' c'2 | r8 bes bes bes a2 | 
%6
    r8 g g g f4 ~ \times 2/3 {[f8 f f]} | f4 ~ \times 2/3 {[f8 f f]} f2 | 
%8
    r4 f8 f \times 2/3 {e4 f g} | a1 ~ | a2 r4 c8 e | 
%11
    f4. a8 c'4. c'8 | d'4. d'8 c'4. c'8 | 
%13
    bes4 ~ \times 2/3 {[bes8 bes bes]} a4. a8 | 
%14
    g4 ~ \times 2/3 {[g8 g g]} f4 ~ \times 2/3 {[f8 f f]} |
    f4 ~ \times 2/3 {[f8 f f]} f2 |
%16
    r4 f8 f \times 2/3 {e4 f g } | f1 ~ | f2 r4 f4 | g8 g g g g c4 c8 | 
%20
    bes, a a gis a4. f8 | g g g g g c4 g8 | bes, a a gis a4 a8 c' | 
%23
    d'4 d'8 d' c'4 ~ \times 2/3 {[c'8 a c']} | d'4 d'8 d' c'2 | 
%25
    r8 d' d' d' c' c'4. | bes4 a g c8 e | f4. a8 c'4. c'8 | d'4. d'8 c'2 |
%29
    r8 bes bes bes a4. a8 | g4 ~ \times 2/3 {[g8 g g]} f4 ~ \times 2/3 {[f8 f f]} |
%31
    f4 ~ \times 2/3 {[f8 f f]} f2 | r4 f8 f \times 2/3 {e4 f g} | a1 ~ | a4 r a a |
%35
    \times 2/3 {a4 f g} f2 | r4 f8 f \times 2/3 {e4 f g} | f1 ~ | f 
    \bar "|."
}

text = \lyrics {
    I see trees of green, red ros -- es too, I see the bloom for me and you,
    and I think to my -- self what a won -- der -- ful world.
    
    I see skies of blue and clouds of white, 
    the bright bles -- sed day, the dark  sac -- red night, 
    and I think  to my- self what a won -- der -- ful world. 
    
    The col -- ors of the rain- bow so pret -- ty in the sky 
    are al -- so on the fa- ces  of peo -- ple go -- in' by,
    
    I see friends sha -- kin' hands,  say -- in' How do you do!
    They're real -- ly say -- in' I love you
    
    I hear ba -- bies cry, I watch them grow
    They'll learn much more than I'll  ev -- er know 
    and I think  to my -- self what a won -- der -- ful world. 
    Yes, I think to my -- self  what a won -- der -- ful world. 
}

harmony = \chords {
%1
    R1*2 \bar "||"
%3
    f2 a:min bes a:min g:min7 f a:7 d:min des1 c2:7.11 c:7 f f:5+ bes:7+ c:7
    f2 a:min bes a:min g:min7 f a:7 d:min des1 c2:7.11 c:7 f bes bes f
%bridge
    c1:7 f c:7 f
    d2:min c d:min c d:min fis:dim g4:min7 fis:dim c2:7

    f2 a:min bes a:min g:min7 f a:7 d:min
    des1 c2:7.11 c:7 f a:min.7.5- d1:7
    g:min7 R2 c:7.9- f bes:6 R f
}

patternA = \notes \transpose c' {
    \times 2/3 {
    %  F    /  Am   |  Bb   /  Am   |
	[f,8 a, c] [f c a,] [a, c e] [a e c] | 
	[f, bes, d] [f d bes,] [ees, a, c] [ees c a,] |

	\tupletIfNoBeam
  %  Gm7  /  F    |  A7   /  Dm   | 
	[f, bes, d] [g d bes,] [f, a, c] [f c a,] | 
	[e, a, cis] [e cis a,] [d, f, a,] [d a, f,] |
  %  Db           |
	[des, aes, des] [f des aes,] [des, aes, des] [f des aes,] |
  %  C11  /  C7   |
	[c, g, bes,] [d bes, g,] [c, g, bes,] [c bes, g,] |
  }
}

piano = \context GrandStaff <
    \context Staff = treble {
	\global
	\property Voice.tupletSpannerDuration = #(make-moment 1 4)
	\notes \transpose c'' {
%1
	    a2 g2 | a2 g4 c8 e \bar "||"
%3
	    f4. a8 c'2 | r8 d' d' d' c'2 | r8 bes bes bes a2 |
      %6
	    r8 g g g f4 ~ \times 2/3 {[f8 f f]} |
	    < 
		\context Voice = va { 
		    \stemUp 
		    \property Voice.tupletDirection = \down
		    f4 ~ \times 2/3 {[f8 f f]} f2 | r4 f8 f \times 2/3 {e4 f g} | a2. a4 | 
		    a ~ \times 2/3 {[a8 bes a]} <e4 g> c8 e | 
		}
		\context Voice = vb { 
		    \stemDown 
		    <des2 aes,> <des aes,> | <bes,1 c> | r4 c cis2 | d2 
		} 
	    >
      %11
	    f4. a8
	    < 
		\context Voice = va { 
		    \stemUp 
		    c'4. c'8 | d'4. d'8 c'4. c'8 | bes4 ~ \times 2/3 {[bes8 bes bes]} a4. a8 | 
		    g4 ~ \times 2/3 {[g8 g g]} f4 ~ \times 2/3 {[f8 f f]} | 
		    f4 ~ \times 2/3 {[f8 f f]} <aes,2 des f> }
		\context Voice = vb { 
		    \stemDown 
		    <e2 a> | <f bes> <e a> | <d g> <c f> | <cis e> <a, d> | 
		    <aes, des> }
	    >
      %16
	    < \context Voice = va { \stemUp 
				    \property Voice.tupletDirection = \down
				    r4 f8 f \times 2/3 {e4 f g} | f1 ~ | f2 r4 f4 | }
	      \context Voice = vb { \stemDown 
				    <bes,1 c> | r4 a, g,2 | bes,4 ~ \times 2/3 {[bes,8 g, bes,]} c2 | }
	  >
      %19
	    g8 g g g g c4 c8 | <g bes> <f a> <f a> <e gis> <f4. a> f8 |
	    g8 g g g g c4 c8 | <g bes> <f a> <f a> <e gis> <f4 a> a8 c' |
	    < 
		\context Voice = va { 
		    \stemUp 
		    d'4 d'8 d' \tieUp c'4 ~ \times 2/3 {[c'8 a c']} | d'4 d'8 d' c'2 |
		    r8 d' d' d' c' c'4. | bes4 a g c8 e | \tieBoth
		}
		\context Voice = vb { 
		    \stemDown 
		    \property Voice.tupletDirection = \down
		    \property Voice.tupletSpannerDuration = #(make-moment 1 4)
		    \times 2/3 {r8 <d f a> <d f a>} <d4 f a>
		    \times 2/3 {r8 <c e g> <c e g>} <c4 e g> |
		    \times 2/3 {r8 <d f a> <d f a>} <d4 f a>
		    \times 2/3 {r8 <c e g> <c e g> <c e g> <c e g> <c e g>} |
		    <d2 f a> <ees4 fis a c'> \times 2/3 {[<ees8 f a> <ees8 f a> <ees8 f a>]} |
		    \times 2/3 {r8 <d f g> <d f g> r <c ees fis> <c ees fis>} <c4 e> 
		}
	    >
      %27
	    f4. a8 c'4. c'8 | d'4. d'8 c'2 | r8 bes bes bes a4. a8 |
	    g4 ~ \times 2/3 {[g8 g g]} f4 ~ \times 2/3 {[f8 f f]} | 
	    < 
		\context Voice = va { 
		    \stemUp
		    f4 ~ \times 2/3 {[f8 f f]} f2 | r4 f8 f \times 2/3 {e4 f g} | }
		\context Voice = vb { 
		    \stemDown 
		    <aes,2 des> <aes, des> | <bes,1 c> | }
	    >
	    <c2 f a> ~ <ees g a> ~ | <d4 fis a> r4 a a | 
	    < 
		\context Voice = va { 
		    \stemUp 
		    \times 2/3 {a4 f g} f2 | r4 f8 f \times 2/3 {e4 f g-\fermata} | f1 ~ | f }
		\context Voice = vb { 
		    \stemDown 
		    <bes,2. d f> a,4 | bes,2 <bes, des> | r4 a,4 g,2 | 
		    bes,4 d \times 2/3 {[f8 a c']} f'4-\fermata }
	    >
	}
    }
    \context Staff = bass {
    \global
    \clef bass
    \tupletIfNoBeam
    \property Voice.tupletSpannerDuration = #(make-moment 1 4)

    \notes \transpose c' {
	\repeat unfold 2 {
	    \times 2/3 {[f,8 a, c] [f c a,] [f, bes, d] [g d bes,]} | 
	}
	\bar "||"
	\tupletNumberOff
	\patternA
	\times 2/3 {
%  F    /  F5+  |  Bb7M /  C7   |
	    [f, a, c] [f c a,] [f, a, cis] [f cis a,] | 
	    [f, bes, d] [f d bes,] [c, e, g,] [c g, e,] |
	}
	\patternA
	\times 2/3 {
      %  F    /  Bb   |       /  F    |
	    [f, a, c] [f c a,] [f, bes, d] [f d bes,] | 
	    [f, bes, d] [f d bes,] [f, a, c] [f c a,] |
	}
      %  C7  |  F   |  C7  |  F  |
	\repeat unfold 2 {
	    \times 2/3 {
		[c, bes, c] [e c bes,] [c, bes, c] [e c bes,] |	
		[f, c f] [a f c] [f, c f] [a f c] |
	    }
	}
	\tupletNumberOn
	\times 2/3 {r8 <d, d> <d, d>} <d,4 d> \times 2/3 {r8 <e, e> <e, e>} <e,4 e> |
	\times 2/3 {r8 <f, f> <f, f>} <f,4 f> 
	\times 2/3 {r8 <g, g> <g, g>} \times 2/3 {[<g, g> <g, g> <g, g>]} |
    %25
	<f,2 f> <fis,4 fis> \times 2/3 {[<fis,8 fis> <fis, fis> <fis, fis>]} |
	g,4 fis, g, c, |
    %27
	\tupletNumberOff \patternA | 
	\times 2/3 {[f,8 a, c] [f c a,] [a, c ees] [g ees c] | [d fis a] [c' a fis]} d2 |
	<f,1 f> | <g,2 g> c | 
	\times 2/3 {
	    [f,8 c f] [a f c] [f, bes, d] [g d bes,] | [f, bes, d] [g d bes,] } f,2 |
    }
}
>


\score {
    < 
	\context ChordNames \harmony
	\addlyrics
	    \context Staff \melody
	    \context Lyrics \text
	\piano
    >

    \paper {
	\translator { 
	    \ScoreContext \remove Bar_number_engraver 
	}
%    \translator { % \VoiceContext \consists
%      tupletSpannerDuration = #(make-moment 1 4)
%    }
    }
    \midi {
	\tempo 4=90
    }
}

