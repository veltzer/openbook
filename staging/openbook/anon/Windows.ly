\version "2.18.2"
\include "english.ly"

% Top-level details for this tune:

myTitle = "Windows"
myComposer = "Chick Corea"

global = { \time 3/4  \tempo "Up" 4 = 180 \key c \major }

trp = #(define-music-function (parser location notes) (ly:music?)
        #{ \tuplet 3/2 $notes #} )

myMelody = {
  \global
  \relative c' {
    \set Score.alternativeNumberingStyle = #'numbers

ef'4 g bf | d,4. c | ef  bf' | d,2. | c4 ef g | b,!4. a | c  g' | b,2 a4 |
\break

d,2. ~ | d ~ | d ~ | d | c'4 bf8 ef ~ ef4 ~ | ef2. ~ | ef2. | df4 c bf |
\break

c2. | e4. g | b,2. ~ | b4. a8 ~ \trp {a8 b g} | a2. | c4. e | g,2. ~ | g4. f |
\break
\bar "||"

e4 a e | g4. f | r8 e4 a e8 | f4. g | e4 a e | f4. g | a8 e'4 cs a8 |
\trp {g8 fs e} a4 ~ \trp {a8 g fs} |
\break

e'2. ~ | e ~ | e4. f | d2 ~ d8 c | d2. ~ | d ~ | d4. e | c2 ~ c8 b |
\break

c2. ~ | c | r4 d, ef | b'2 a4 | g2. ~ | g ~ | g ~ | g |
\bar "||"

  }
}

myChords = \chordmode {

c2.:m7 | s | s | s | a:3-.5-.7 | s | s | d:7.9- |
g:m9 | s | s | s | ef:7.11+ | s | s | s |
f:maj | s | f:5.7+.11+ | s | s | s | s | s |
a:7 | bf:7 | a:7 | bf:7 | a:7 | bf:7 | a:7 | s |
f:maj | e:m7 | d:m7 | d:m7/c | b:3-.5-.7 | b:3-.5-.7/a | e:7/gs | e:5+.7 |
a:m7 | a:m7/g | d:7/fs | d:7 | f:maj | e:m7 | d:m7 | df:5.7+.11+ |

}

% These transpose from/to pitches are chosen for their results on this tune.

CFr  = c
CTo  = c
BbFr = c
BbTo = d
EbFr = c
EbTo = a,

\paper {
% Adjust distance between the lines - default is #8:
  system-system-spacing #'basic-distance = #15
}

lsmode = ##t   % landscape mode

\include "lz.ly"
