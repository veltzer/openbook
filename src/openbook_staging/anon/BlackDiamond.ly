\version "2.18.0"
\include "english.ly"

% Top-level details for this tune:

myTitle = "Black Diamond"
myComposer = "Roland Kirk"
global = { \time 3/4  \tempo "Up" 4 = 150 \key c \major }

\paper { ragged-last = ##t }   % for the coda measures

myMelody = {
  \global
  \relative c' {
    \set Score.alternativeNumberingStyle = #'numbers

    \repeat volta 2 {
      r4 d8 d f f    | g f d c d4   | r a'8 d af g | f d f4 g | \break
      e'8 d g4 r8 f8 | e d e4  d8 e | a,2.         |
    } \alternative {  % first, second endings
      { r4 a8 g f e }
      { b'4 g'4. gf8 \break }
    }
    \repeat volta 2 {
      bf,2.          | a4 f' e      | af,2.        | g4 ef' d | \break
      gf,4 g  a      | bf df c      |

      % Add the coda mark over the start of measure 15:
      \once \override Score.RehearsalMark.font-size = #3
      \mark \markup { \musicglyph #"scripts.coda" }

                                      c2.          |  % that's measure 15
    } \alternative {
      { b4 g'4. fs8  }
      { r4 a,8 g f e }
    }

   % Here's the coda:

   \break
   \once \override Score.RehearsalMark.font-size = #3
   \mark \markup { \musicglyph #"scripts.coda" }
   | <>_\markup { (ending only) }

   % Without this, the two-measure coda is rendered too squashed.  This is a
   % kludgy way to make the measures stretch -- using tied notes in each
   % measure, where dotted-half notes would do just fine otherwise.
   \override Slur #'minimum-length = #16
   \repeat volta 2 {  c'2(c4) |  cs2(cs4)  | }

  }
}

myChords = \chordmode {
  \repeat volta 2 {
    d2.:m  | d:3-.5+ | d:m6  | d:7  |
    g:m7   | c:7     | f:maj |
  } \alternative { { a:5+ } { b:5+ } }
  \repeat volta 2 {
    e2.:5+ | a:5+    | d:5+  | g:5+ |
    g:m7   | c:7.9-  | f:maj |
  } \alternative { { b:5+ } { a:5+ } }

  % coda chords:
  \repeat volta 2 { f2.:maj | fs:7 }

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
