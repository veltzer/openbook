\version "2.18.2"
\include "english.ly"

% Top-level details for this tune:

myTitle = "Infant Eyes"
myComposer = "Wayne Shorter"

% This shows a 'C' (common time) as the time signature, on the first line only.
global = { \time 4/4  \tempo "Slow" 4 = 80 \key ef \major }

myMelody = {
  \global
  \relative c' {
    \set Score.alternativeNumberingStyle = #'numbers

\partial 2         % pickup notes
c4 c | \bar "||"

f2 ~ f8 d f g       | af2. g4   | f2  ~ f8  d   c  bf  | bf'2. f4 | \break
af2 ~ af8 bf, ef af | f2.  bf,4 | df2 ~ df8 ef, gf df' | bf1 ~    |
bf2. gf'8 af | \break

\bar "||"
bf2 ~ bf8 g f ef | df'2. ~ df8 bf | a2 ~ a8 g f c | ds'2. bf4 | \break
cs2 ~ cs8 ds, gs cs | bf2.  ef,4 | gf2 ~ gf8 af, cf gf' | ef1 ~ |
ef2. c4 | \break

\bar "||"
f2 ~ f8 d f g | af2.  g4 | f2 ~ f8 d c bf | bf'2. f4 | \break
af2 ~ af8 bf, ef af | f2.  bf,4 | df2 ~ df8 bf ef df | bf1 ~ |
bf2. r4 | \bar "||"

  }
}

myChords = \chordmode {

s2    |

g1:m7  | f:m7       | ef:maj    | a:13.9-    |
gf:maj | f:5.4.9^3  | ef:m7     | bf:5.4.9^3 | bf:7   |

ef:maj | e:maj/ef   | ef:7+.11+ | e:maj      |
b:maj  | bf:5.4.9^3 | af:m7     | ef:5.4.9^3 | d:7.9- |

g:m7   | f:m7       | ef:maj    | a:13.9-    |
gf:maj | f:5.4.9^3  | ef:m7     | bf:5.4.9^3 | r      |

}

% These transpose from/to pitches are chosen for their results on this tune.

CFr  = c
CTo  = c
BbFr = c
BbTo = d'
EbFr = c
EbTo = a

% Render the tune as a pdf with separate pages in C, Bb and Eb.

\paper {
% Adjust distance between the lines - default is #8:
  system-system-spacing #'basic-distance = #15
}

\include "lz.ly"
