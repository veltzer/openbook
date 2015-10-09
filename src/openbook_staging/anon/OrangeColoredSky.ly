% This .ly file has text lines below the score, so it embeds the contents of
% lz.ly, rather than \include'ing it.

\version "2.18.0"
\include "english.ly"

% Top-level details for this tune:

myTitle = "Orange Colored Sky"
myComposer = "DeLugg / Stein"
global = { \time 4/4  \tempo "Easy" 4 = 100 \key g \major }

trp = #(define-music-function (parser location notes) (ly:music?)
        #{ \tuplet 3/2 $notes #} )

myMelody = {
  \global
  \relative c'' {
    \set Score.alternativeNumberingStyle = #'numbers

  \partial 4
    b8 c |

  \repeat volta 2 {
    d8 e d e ~ e2 | e8 fs g4 fs8 e8 ~ e4 | d8 e d4 e d8 fs ~ | fs1   | \break
    g4 r^"X" g r^"X" | g8 e g4 e2  |
  } \alternative {
    { g8 e c4 b a8 d ~ | d1 }
    { g8 e c4 b b8 g ~ | g1 \break }
  }

  \bar "||"

  % bridge
  a'4 a a g | bf bf ~ bf2 | b!4 b a b | g2 ~ g4 \trp { r8 e fs } | \break
  g4  g g g | g  g  g  \trp { g8 d e } |
  fs4 \trp { r8 fs g } a4 \trp { r8 a b } | c2 r4 b,8 c | \break
%  \trp { g8 e fs } \trp { g8 ~ g fs } \trp { g8 e fs } \trp { g8 ~ g fs } |
%  \trp { g8 e fs } \trp { g8 ~ g fs } \trp { g8 e fs } \trp { g8 ~ g fs } |
%  a4 a a a | d,2 ~ d4  b8 c | \break

  % last A

  d8 e d e ~ e2 | e8 fs g4 fs8 e8 ~ e4 | d8 e d4 e d8 fs ~ | fs1   | \break
  g4 r^"X" g r^"X" | g8 e g4 e2  | g8 e c4 b a8 g ~ | g1  | \break

%  \alternative { { g1 | } { g1 | \break
%    g4 r^"X" g r^"X" | g8 e g4 e2  | g8 e c4 b a8 g ~ | g1  | \break
%    g4 r^"X" g r^"X" | g8 e g4 e2  | g8 e c4 b a8 g ~ | g1  | \break
%  }

  \bar "|."

} % \relative
} % \myMelody

myChords = \chordmode {

s4    |

\repeat volta 2 {
  g2 gs:dim7 | a:m7 as:dim7 | g  f | e1:7 |
  c2 cs:dim7 | g/d  e:7     |
}
\alternative { { a2:m7 d:7 | g2 a4:min7 d:7 } { a2:m7 d:7 | g cs:7 } }

  c1             | fs:7          | fs2:m7 b:7 | e1:m |
  e2:m e:3-.5.7+ | e:m7 e:3-.5.6 | a1:m7      | d:7  |

  g2 gs:dim7 | a:m7 as:dim7 | g     f  | e1:7          |
  c2 cs:dim7 | g/d  e:7     | a2:m7 d:7| g2  a4:m7 d:7 |

%\alternative { { g2 a4:m7 d:7 } { g2 d1:m7 g7 |
%  c2 cs:dim7 | g/d  e:7     | a2:m7 d:7| g2 d1:m7 g7 |
%  c2 cs:dim7 | g/d  e:7     | a2:m7 d:7| g1 | }
%}

}

% Include some directive text after the score.

myText = \markup {
  \abs-fontsize #12
  \column {
    \line { Intro:  four bars from measure 5 (no drum hits); take 1st ending. }
    \line { Last time:  play last line 3x (total) with D-7 / G7 turnaround. }
  }
}

% These transpose from/to pitches are chosen for their results on this tune.

CFr  = c
CTo  = c
BbFr = bf
BbTo = c'
EbFr = c
EbTo = a,

% Render the tune as a pdf with separate pages in C, Bb and Eb.

\paper {
  % Adjust distance between the lines - default is #8:
  system-system-spacing #'basic-distance = #15
}

\include "lz.ly"
