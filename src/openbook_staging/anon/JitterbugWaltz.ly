\version "2.18.0"
\include "english.ly"

% Top-level details for this tune:

myTitle = "Jitterbug Waltz"
myComposer = "Fats Waller"

% Note that this file is in C -- easier to write and maintain.  So it gets
% transposed for the 'C' version (to Db), as for the other versions.

global = { \time 3/4  \tempo "Up" 4 = 150 \key c \major }

trp = #(define-music-function (parser location notes) (ly:music?)
        #{ \tuplet 3/2 $notes #} )

myMelody = {
  \global
  \relative c'' {
    \set Score.alternativeNumberingStyle = #'numbers

    \repeat volta 2 {
      r8 c e b d a  | c g b f  a e       | g d f c e b | d a c g b g | \break
      a2. ~         | a2 \trp {g8 a c }  | g'2 ~ g8 a  | ef2.        | \break

      r8 c' e b d a | c g b f  a e       | g d f c e b | d b c g b g | \break
      a2. ~         | a2 \trp {a8 df e } | a2 ~ a8 b   | e,2.        | \break

      r8 a,   c a  c a  | c a  c a  c a  | e'4 e2 ~ | e2. |            \break
      r8 af,8 c af c af | c af c af c af | e'4 e2 ~ | e2. |            \break

      r8 a,   c a  c a  | c a  c a  c a  |
    } \alternative {
      { b4 c df | d  b a | \break g2. ~ | g ~ | g ~ | g | \break }
      { a'2.    | r4 g e | c2. ~        | c ~ | c ~ | c | \break }
    }

  }
}

myChords = \chordmode {
  \repeat volta 2 {
    c2.:maj | s  | s       | s  |
    f:7     | s  | s       | s  |
    c:maj   | s  | s       | s  |
    e:m7    | s  | a:7.9-  | s  |
    a:m7    | s  | d:7.9   | s  |
    f:m7    | s  | bf:7.5- | s  |
    a:m7    | s  |
  } \alternative {
    { d:7 | g:7 | e:m7  | ef:7 | d:m7 | df:7 }
    { d:7 | g:7 | c:maj | ef:7 | d:7  | df:7 }
  }
}

% These transpose from/to pitches are chosen for their results on this tune.

CFr  = c
CTo  = df
BbFr = a
BbTo = c'
EbFr = c
EbTo = bf

% Render the tune as a pdf with separate pages in C, Bb and Eb.

\paper {
% Adjust distance between the lines - default is #8:
  system-system-spacing #'basic-distance = #12
}

\include "lz.ly"
