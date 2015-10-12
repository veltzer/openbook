\version "2.18.2"
\include "english.ly"

% ref app:p:/1t/fakebooks/Jazz/RealBook/Z/Zingaro_br_224.pdf
% output app:f:/Briefcase/LilyPond/Zingaro.pdf

% Top-level details for this tune:

myTitle = "Retrato em Branco e Preto"
mySubtitle = "aka Zingaro"
myComposer = "Jobim / Buarque"
global = { \time 4/4  \tempo "Romantic" 4 = 96 \key bf \major }

myMelody = {
  \global
  \relative c' {
    \set Score.alternativeNumberingStyle = #'numbers

d'4. cs8 ~ cs ef4 c8 | d8 cs4 ef8 ~ ef c4 d8 ~ |
d4.  cs8 ~ cs ef4 c8 | d8 cs4 ef8 ~ ef c4 d8 ~ | \break
d4.  cs8 ~ cs ef4 c8 | d8 cs4 ef8 ~ ef c4 d8 ~ |
d1                   | r                       | \break

f4.  ef8 ~ ef fs4 d8 | f8  ef4 fs8  ~ fs d4  f8  ~ |
f4.  d8  ~ d  g4  d8 | a'8 d,4 bf'8 ~ bf d,4 c'8 ~ | \break
c4.  bf8 ~ bf cs4 a8 | c8  bf4 cs8  ~ cs a4  cs8 ~ |
cs4. b8  ~ b  d4  c8 | d8  c4  af8  ~ af ef4 d8  ~ | \break

d4.  cs8 ~ cs ef4 c8  | d   bf4 c8   ~ c8  a4  bf8 ~ |
bf4. a8  ~ a8 c4  a8  | bf8 a4  ef'8 ~ ef8 cs4 d8  ~ | \break
d4.  c8  ~ c8 ef4 cs8 | d8  c4  ef8  ~ ef8 d4  g8  ~ |
g1                    | r                            | \break

\bar "||"

g4._\markup { \bold "(end tag)" }
    fs8 ~ fs8 af4 g8 | a8 gs4 bf8 ~ bf8 a4 c8 ~ |
c4. bf8 ~ bf8 cs4 a8 | c8 bf4 a8 ~ a8 g4 f8 ~   | \break
f4. ef8 ~ ef8 fs4 d8 | f8 ef4 fs8 ~ fs8 d4 g8 ~ |
g1_\markup { \bold "(end)" } ~ | g4 r r2 |

\bar "||"

  }
}

myChords = \chordmode {

g1:m     | s            | d:7/fs   | s        |
f:m6     | e:7          | ef:5+    | ef:6.7+  |
c:m7     | d:7.9+       | bf:maj   | bf:6     |
a:7.9.13 | a:7.13-      | d:maj    | af:7.11+ |
g:m      | s            | d:7/fs   | s        |
f:m6     | e:7          | ef:5-.7+ | ef:maj   |
c:m7     | cs:dim7      | g:m/d    | ef:maj   |
c:m7     | d2:maj9  d:7 | g1:m     | d:7      |

}

CFr  = c
CTo  = c
BbFr = c
BbTo = d
EbFr = c'
EbTo = a

\paper {
% Adjust distance between the lines - default is #8:
  system-system-spacing #'basic-distance = #15
}

\include "lz.ly"
