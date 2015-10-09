\version "2.18.2"
\include "english.ly"

% Top-level details for this tune:

myTitle = "All or Nothing At All"
myComposer = "Lawrence / Altman"

global = { \time 4/4  \tempo "Up" 4 = 180 \key c \major }

trp = #(define-music-function (parser location notes) (ly:music?)
        #{ \tuplet 3/2 $notes #} )

myMelody = {
  \global
  \relative c' {
    \set Score.alternativeNumberingStyle = #'numbers

  \repeat volta 2 {
    e2 ~ e^\markup { "(add6)" } ~ | e4^\markup { "(sim.)" } e \trp {e4 f c} |
    e1 ~ | e1 |  e2 e | e \trp {e4 g c,} | d4. d8 d2 ~ | d1 | \break
    d2 d | d \trp{ e4 cs d} |

    % Add the coda mark over the start of measure 11:
    \once \override Score.RehearsalMark.font-size = #3
    \mark \markup { \musicglyph #"scripts.coda" }

                              a'4. a8 a2 ~ | a b4 a |
    g g2 g4 | g g2 g4 | g1 ~ |
  } \alternative {
    { g4 r r2 | }
    { g2.\repeatTie ef4 | \break }
  }

  \bar "||"

  c'4 c c c | c4. c8 \trp {c4 df af} | c1 ~ |c2. ef,4 |
  c'4. c8 c4. c8 | df2 \trp {c4 bf af} | g1 ~ | g2. ef4 | \break
  \trp {bf'4 bf bf} bf4. bf8 | \trp {bf4 bf bf} \trp {bf4 c af} |
  bf1 ~ | bf2 c4 bf |
  af2 af4 af | af af2 af4 | g1  |
  r4 d4 c b_\markup { \right-align { "D.S. al " \musicglyph #"scripts.coda" } }

  \bar "||"

  \break

  \once \override Score.RehearsalMark.font-size = #3
  \mark \markup { \musicglyph #"scripts.coda" }

  | a'1 | b | c ~ | c4 c \trp {c4 c c} | c1 ~ | c |
  \bar "||"

  }

}

myChords = \chordmode {

  \repeat volta 2 {
    a1:3-.5.7+ | s  | s  | s  |  s  | s  | bf:maj | bf:6  |
    g:m7  | s   | d:m7   | ef:dim7 |  d:m7  | g:5+       | c:maj  |
  } \alternative {
    { b2:3-.5-.7 e:7.9+       | }
    { bf2:m7     ef2:3.5.7.9- | }
  }

  af1:maj | df/af | af:maj | df/af |
  af:maj  | f:7   | bf:m7  | ef:7  |
  bf:m7   | ef:7  | bf:m7  | c:5+  |
  f:m7    | df:7  | c:7.9- | e:5+  |

  % coda
  d:m  | e:7.9+ | a:m7 | bf:9 | c | b2:3-.5-.7 e:7.9+ |

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

lsmode = ##t   % landscape mode

\include "lz.ly"
