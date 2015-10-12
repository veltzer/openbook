\version "2.18.0"
\include "english.ly"

% Top-level details for this tune:

myTitle = "Tergiversation"
myComposer = "Gene Perla"
global = { \time 4/4  \tempo "Up" 4 = 150 \key bf \minor }

myMelody = {
  \global
  \relative c'' {
    \set Score.alternativeNumberingStyle = #'numbers

\partial 2
  a8 bf4. |

\repeat volta 2 {
  df1    | r4 bf df f  | a,2 gf8 af a4 | df4 b8 a af gf ~ gf4 | \break
  f2 df2 ~ | df2 ef4 af, | bf2 ef4 af |
} \alternative {
  { f4 r a8 bf4. }
  { f2. r8 bf8 \break }
}

\bar "||"

  g'4 f8 ef d bf4 df8 ~ | df1 | f4 ef8 df c af4 b8 ~ | b1 | \break
  bf8 af bf af ~ af bf af4 | ef'8 df ef df ~ df ef df4 |
  c4.-^ bf-^ a4-^ ~ | a2 a8 bf4. | \break

\bar "||"

  df1    | r4 bf df f  | a,2 gf8 af a4 | df4 b8 a af gf ~ gf4 | \break
  f2 df2 ~ | df2 ef4 af, | bf2 ef4 af | f1 | \break

\bar "||"

} }

myChords = \chordmode {

s2    |

\repeat volta 2 {
  bf1:m7 | af:m7 | b:m7  | b:m7   | bf:m7 | af:m7 | f:m7            |
}
\alternative { { gf:maj } { gf:maj } }

  bf:m   | e:7   | ef:m7 | d:7/af | df    | gf    | f4.:m bf:m b4:7 | s1     |
  bf1:m7 | af:m7 | b:m7  | b:m7   | bf:m7 | af:m7 | f:m7            | gf:maj |

}

% These transpose from/to pitches are chosen for their results on this tune.

CFr  = c
CTo  = c
BbFr = bf
BbTo = c'
EbFr = c
EbTo = a

% Render the tune as a pdf with separate pages in C, Bb and Eb.

\paper {
% Adjust distance between the lines - default is #8:
  system-system-spacing #'basic-distance = #15
}

\include "lz.ly"
