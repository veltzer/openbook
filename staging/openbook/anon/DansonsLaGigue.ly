\version "2.18.0"
\include "english.ly"

% Top-level details for this tune:

myTitle = "Dansons La Gigue"
myComposer = "Patricia Barber"

% https://www.youtube.com/watch?v=D2DnvGL9R5c

% Note that this file is in C -- easier to write and maintain.  So it gets
% transposed for the 'C' version (to Ab), as for the other versions.

global = { \time 6/8  \tempo "Mysterious" 8 = 200 \key c \minor }

myMelody = {
  \global
  \relative c' {
    \set Score.alternativeNumberingStyle = #'numbers

    % Intro:
    | <>_\markup { (intro) }

    \repeat percent 4 { r4 r r | r4 r r } \break
    \repeat percent 4 { r4 r r | r4 r r } \break

    % Main section:
    \repeat volta 2 {
      r4 r8 c' d  c | d4.        r8 r8 c  | d ef ef  r  r4 | r4 r r |
      r4 r8 c  d  c | d   c  ef4    r8 ef | c4.      r8 r4 | r4 r r | \break
      r4 r8 c  df c | df4.       r8 r8 c  | df ef ef r  r4 | r4 r r |
      r4 r     r    | r      g      f8 ef | c2.            |
      r4_\markup { "skip turnaround on out" } r8 r4 r8 | \break
    }

    % Outro:
    | <>_\markup { (out only) }

    \repeat percent 4 { r4 r r | r4 r r } \break
    \repeat percent 4 { r4 r r | r4 r r } \break

  }
}

myChords = \chordmode {

  f2.:m7      | s    | c:3-.5.7+ | s          |
  f2.:m7      | s    | c:3-.5.7+ | s          |
  f2.:m7      | s    | c:3-.5.7+ | s          |
  f2.:m7      | s    | d:m7      | g:7        |

  c2.:3-.5.7+ | s    | f:m7      | s          |
  d:m7        | g:7.9-  | c:3-.5.7+ | c:3-.5.6   |
  bf:m7       | ef:7 | af:m7     | df:7       |
  d:3-.5-.7        | g:7  | c:m       | d4.:5-.7 g:7 |

  f2.:m7      | s    | c:3-.5.7+ | s          |
  f2.:m7      | s    | c:3-.5.7+ | s          |
  f2.:m7      | s    | c:3-.5.7+ | s          |
  f2.:m7      | s    | c:3-.5.7+ | s          |

}

% These transpose from/to pitches are chosen for their results on this tune.

CFr  = c
CTo  = af,
BbFr = c
BbTo = bf,
EbFr = c
EbTo = f

% Render the tune as a pdf with separate pages in C, Bb and Eb.

\paper {
% Adjust distance between the lines - default is #8:
  system-system-spacing #'basic-distance = #15
}

lsmode = ##t   % landscape mode

\include "lz.ly"
