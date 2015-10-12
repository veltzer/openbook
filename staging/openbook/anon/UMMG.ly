\version "2.18.0"
\include "english.ly"

% Top-level details for this tune:

myTitle = "U.M.M.G."
myComposer = "Billy Strayhorn"
global = { \time 4/4  \tempo "Up" 4 = 150 \key c \major }

trp = #(define-music-function (parser location notes) (ly:music?)
        #{ \tuplet 3/2 $notes #} )

myMelody = {
  \global
  \relative c'' {
    \set Score.alternativeNumberingStyle = #'numbers

\repeat volta 2 {
  a2. g8 bf ~ | bf4. a8 ~ a2  | r8 g4. g4 f8 e8 ~ | e2 r8 d4. | \break
} \alternative {
  { af4.  a8 ~ a4. b8 ~ | b4 c \trp {e4 g b} | d2. c8 fs, ~ | fs2 g2 \break }
  { af,4. a8 ~ a4. b8 ~ | b4 c \trp {e4 g c} | f2. e8 f8  ~ | f2  e2 \break }
}

\bar "||"   % bridge

  e,2. ef4 | b'4 a  gs fs | fs2. e8 ds ~ | ds4. e8 ~ e2 | \break
  fs2. e4  | c'4 bf af g  | g2.  f8 e  ~ | e1           | \break

\bar "||"   % last A

  a2.  g8 bf ~ | bf4. a8 ~ a2 | r8 g4. g4 f8 e8 ~ | e2 r8 d4. | \break

  % Add the end phrase mark over the start of measure 21:
  \once \override Score.RehearsalMark.font-size = #3
  \mark \markup { \musicglyph #"scripts.coda" }

  af2. c8 a  ~ | a1           | af2.      c8 a  ~ | a1        | \break

\bar "|."   % end phrase

  \once \override Score.RehearsalMark.font-size = #3
  \mark \markup { \musicglyph #"scripts.coda" }
  | <>_\markup { (ending only) }

  \repeat volta 4 { af1 ~ | af2. c8 a ~ | a1 ~ | a | }

} }

myChords = \chordmode {

\repeat volta 2 {
  e1:3-.5-.7 | a:3.5.7.9- | d:m7 | g:7 |
} \alternative {
  { c2:dim7 c:6 | c1:maj | c:m7      | f:7       }
  { c2:dim7 c:6 | c1:maj | g2:m7 c:7 | g2:m7 c:7 }
}

  fs1:3-.5-.7 | b:7.9-  | e:maj | e:maj |
  g:3-.5-.7   | c:7.9-  | f:m   | g:7   |

  e1:3-.5-.7 | a:3.5.7.9- | d:m7   | g:7   |
  c:dim7     | c:6        | c:dim7 | c:6   |

  % end phrase chords:
  \repeat volta 4 { c:dim7 | c:dim7 | c:6 | c:6 }

}

% These transpose from/to pitches are chosen for their results on this tune.

CFr  = c
CTo  = df
BbFr = bf
BbTo = df'
EbFr = c
EbTo = bf

% Render the tune as a pdf with separate pages in C, Bb and Eb.

\paper {
% Adjust distance between the lines - default is #8:
  system-system-spacing #'basic-distance = #15
}

\include "lz.ly"
