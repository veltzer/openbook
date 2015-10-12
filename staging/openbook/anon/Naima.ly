\version "2.18.2"
\include "english.ly"

% Top-level details for this tune:

myTitle = "Naima"
myComposer = "John Coltrane"

global = { \time 4/4  \tempo "Slow, warm" 4 = 60 \key af \major }

trp = #(define-music-function (parser location notes) (ly:music?)
        #{ \tuplet 3/2 $notes #} )

myMelody = {
  \global
  \relative c' {
    \set Score.alternativeNumberingStyle = #'numbers
    \override Glissando #'style = #'zigzag

  \repeat volta 2 {
    c'2. ~ \trp { c8 bf ef } | f,1 | af2 gf4 ~ \trp { gf8 ef gf } | ef1 |
  }
  \break

  bf'2. ~ \trp { bf8 bf bf } | g2.  ~ \trp { g8  ef  f   } |
  bf2.  ~ \trp { bf8 bf bf } | g2.  ~ \trp { g8  f   ef  } |
  \break

  df'2. ~ \trp { df8 bf df } | bf2. ~ \trp { bf8 ef, bf' } |
  g2.   ~ \trp { g8  c, g' } | ef1 |

  \bar "||"
  \break

  c'2.  ~ \trp { c8  bf ef } | f,1 |
  af2 gf4 ~ \trp { gf8 ef gf } | <>_\markup { (back to top) } ef1 |

  \bar "||"
  \break

  % Here's the coda.
  | <>_\markup { (ending only) }

  af2 gf4 ~ \trp { gf8 ef gf } | ef1 | af2 gf4 ~ \trp { gf8 ef gf } |
  \break

  ef2 f | g2 af4 ~ \trp { af8 af8 f } |
  bf2 c4 ~ \trp { c8 c af\glissando } | ef'1 |
  \bar "||"

  }
}

myChords = \chordmode {

  \repeat volta 2 {
    bf1:m7/ef | ef:m7 | a2:maj/ef g:maj/ef | af1:maj |
  }

  b:maj/bf | bf:6.9-/bf | b:maj/bf | bf:6.9-/bf |
  b:maj/bf | bf:6.9-/bf | f:m7/bf  | e:maj      |

  bf:m7/ef | ef:m7 | a2:maj/ef g:maj/ef | af1:maj |

  % coda
  a2:maj/ef g:maj/ef | af1:maj | a2:maj/ef g:maj/ef | af2:maj df:maj |
  af:maj df:maj | af:maj df:maj | af1:maj |

}

% These transpose from/to pitches are chosen for their results on this tune.

CFr  = c
CTo  = c
BbFr = c
BbTo = d
EbFr = c
EbTo = a

% Render the tune as a pdf with separate pages in C, Bb and Eb.

\paper {
% Adjust distance between the lines - default is #8:
  system-system-spacing #'basic-distance = #15
}

\include "lz.ly"
