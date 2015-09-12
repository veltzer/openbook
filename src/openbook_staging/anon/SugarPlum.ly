\version "2.18.2"
\include "english.ly"

% Top-level details for this tune:

myTitle = "Sugar Plum"
myComposer = "Bill Evans"

global = { \time 4/4  \tempo "Moderate" 4 = 140 }

myMelody = {
  \global
  \relative c' {
    \set Score.alternativeNumberingStyle = #'numbers

  \key g \major
  d4 r8 fs a4 r8 fs | g8 b d g ~ g2 |
  r4 r8 e8 d4.   a8 | g2         r2 | \break

  r2        fs16 g gs a fs8 d | b4 d8 fs a af g fs |
  f4 d8 a ~ a2                | r4 c8 a  b d  f a  | \break

  \key c \major
  g4 r8 b  d4 r8 b  | c8 e g c ~ c2 |
  r4 r8 a8 g4.   d8 | c2         r2 | \break

  r2         b16 c cs d b8 g | e4 g8 a d df c b |
  <>_\markup { ( fine ) }
  bf4 g8 d ~ d2              | r4 f8 d e g bf d | \break

  \key f \major

  }
}

myChords = \chordmode {

  g1:maj | g:maj  | f:maj  | f:maj  |
  g:maj  | g:maj  | d:m7   | g:7    |

  c:maj  | c:maj  | bf:maj | bf:maj |
  c:maj  | c:maj  | g:m7   | c:7    |

}

% Include some directive text after the score.

myText = \markup {
  \abs-fontsize #12
  \column {
    \line { Continue to modulate in a descending circle of 5ths. }
    \line { Last time:  slow to end at ( fine ). }
  }
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
