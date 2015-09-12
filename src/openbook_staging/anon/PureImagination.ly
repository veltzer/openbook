\version "2.18.2"
\include "english.ly"

myTitle = "Pure Imagination"
myComposer = "Bricusse / Newley"

global = { \time 4/4  \tempo "Warm" 4 = 80 \key bf \major }

myMelody = {
  \global
  \relative c'' {
    \set Score.alternativeNumberingStyle = #'numbers

\textSpannerDown
\override TextSpanner.bound-details.left.text = "Intro (piano) "
g'4\startTextSpan fs, g!2 | g'4 fs, g!2 | g'4 fs, g!2 | g'4 fs,\stopTextSpan

\override TextSpanner.bound-details.left.text ="Pickup"
g\startTextSpan bf\stopTextSpan | \bar "||" \break

\mark \markup { \box A }
f'2. g,8 bf | f'2.  d8 f  | a4. bf8 a bf a bf | a4 f g, bf |
d2.  ef8 f  | d2.   c8 bf | a4. bf8 a bf a bf | a4 f g bf  | \break
f'2. g,8 bf | f'2.  d8 f  | a4. bf8 a bf a bf | a4 f g, bf |
d2.  ef8 f  | d2.   c8 bf | a8  a' ~ a2. ~    | a1         | \bar "||" \break

\mark \markup { \box B }
bf8 c bf c bf2    | a4 f d2    | d8 ef d ef d4. bf8 | d4 f ~ f2      |
a8 bf a bf a4. e8 | g4 a4 ~ a2 | g8 a g a g g, a bf | b4 c ~ c g8 bf | \break

\mark \markup { \box C }
f'2. g,8 bf | f'2.  d8 f  | a4. bf8 a bf a bf | a4 f g, bf |
d2.  ef8 f  | d2.   c8 bf | \break
a2 a'2 ~ | a2 af,4 a | bf1 ~ | bf2 r2_\markup { "back to" \box "A" } |
\bar "||"

  }
}

myChords = \chordmode {

s1 | s1 | s1 | s1 |

c1:m9  | f:7sus4 | bf:maj  | g:m            |
c:m9   | f:7sus4 | bf:dim7 | bf:6           |
c:m    | f:7     | bf:maj  | g2:m e:3-.5-.7 |
c1:m9  | f:7sus4 | d:maj   | s              |

ef:maj         | d2:m7 g:m | c:m7 f:7     | bf1:maj      |
e2:3-.5-.7 a:7 | d:m7 g:m7 | c2:7sus4 c:9 | f2:7sus4 f:7 |

c1:m9  | f:7sus4 | bf:maj  | g:m      |
c:m9   | f:7sus4 | d:maj   | c2:m f:7 | bf1:maj | s1

}

% These transpose from/to pitches are chosen for their results on this tune.

CFr  = c
CTo  = c
BbFr = c
BbTo = d
EbFr = c
EbTo = a,

% Render the tune as a pdf with separate pages in C, Bb and Eb.

\paper {
% Adjust distance between the lines - default is #8:
  system-system-spacing #'basic-distance = #15
}

lsmode = ##t   % landscape mode
\include "lz.ly"
