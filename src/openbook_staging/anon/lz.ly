% This is various statements, settings, functions that complete a score.

\paper {
  #(set-paper-size "letter")
  top-margin = 1\in          % one inch, explicitly
  print-page-number = ##f    % don't print page numbers
}

$(if (defined? 'lsmode) (set-default-paper-size "letter" 'landscape))

% My chords ... evolving.

% From http://lilypond.1069038.n5.nabble.com/Jazz-Chord-Symbols-td10516.html:

raisedSharp = \markup \raise #0.6 \sharp

chVarA = {

  % major
  <c e g>1-\markup ""

  <c e g a>1-\markup  \small "6"
  <c ff g a>1-\markup \small "6"  % enharmonic variant

  <c e g a d'>1-\markup \small {
    \override #`(baseline-skip . 1) {
      \general-align #Y #DOWN \column { "6" "9" }
    }
  }
  <c ff g a d'>1-\markup \small {
    \override #`(baseline-skip . 1) {
      \general-align #Y #DOWN \column { "6" "9" }  % etc.
    }
  }
  <c ef g a d'>1-\markup \small \concat { "-"
    \override #`(baseline-skip . 1) {
      \general-align #Y #DOWN \column { "6" "9" }
    }
  }

  <c e g b>1-\markup   \small "maj7"
  <c e g cf'>-\markup  \small "maj7"
  <c ff g b>-\markup   \small "maj7"
  <c ff g cf'>-\markup \small "maj7"

  <c e gf b>1-\markup     \small \concat { "maj7(" \flat "5)" }
  <c e fs b>1-\markup     \small \concat { "maj7(" \flat "5)" }
  <c e gf cf'>1-\markup   \small \concat { "maj7(" \flat "5)" }
  <c ff gf cf'>1-\markup  \small \concat { "maj7(" \flat "5)" }

  <c e gs b>1-\markup    \small \concat { "maj7(" \raisedSharp "5)" }
  <c e af b>1-\markup    \small \concat { "maj7(" \raisedSharp "5)" }
  <c e gs cf'>1-\markup  \small \concat { "maj7(" \raisedSharp "5)" }
  <c e af cf'>1-\markup  \small \concat { "maj7(" \raisedSharp "5)" }

  <c e g a b>1-\markup \small "maj7 (add6)"

  <c e g b fs'>1-\markup    \small \concat { "maj7(" \raisedSharp "11)" }
  <c e g b gf'>1-\markup    \small \concat { "maj7(" \raisedSharp "11)" }
  <c ff g cf' gf'>1-\markup \small \concat { "maj7(" \raisedSharp "11)" }

  <c e g b d'>1-\markup      \small "maj9"
  <c ff g b d'>1-\markup     \small "maj9"
  <c ff g cf' d'>1-\markup   \small "maj9"

  <c e g b d' f'>1-\markup \small "maj11"
  <c e g b d' a'>1-\markup \small "maj13"

  <c e gs>1-\markup        \small "+5"
  <c ff gs>1-\markup       \small "+5"
  <c e af>1-\markup        \small "+5"
  <c ff af>1-\markup       \small "+5"

  % minor
  <c ef g>1-\markup        \small "-"
  <c ds g>1-\markup        \small "-"   % e.v.
  <c ef g a>1-\markup      \small "-6"
  <c ds g a>1-\markup      \small "-6"  % e.v.

  <c ef g bf>1-\markup     \small "-7"
  <c ef g as>1-\markup     \small "-7"  % e.v.
  <c ds g bf>1-\markup     \small "-7"
  <c ds g as>1-\markup     \small "-7"

  <c ef g b>1-\markup      \small "-(maj7)"
  <c ef g cf'>1-\markup    \small "-(maj7)"  %e.v.
  <c ds g b>1-\markup      \small "-(maj7)"
  <c ds g cf'>1-\markup    \small "-(maj7)"

  <c ef g d'>1-\markup     \small "-(add9)"
  <c ef g bf d'>1-\markup  \small "-9"
  <c ef gf bf>1-\markup    \small \concat { "-7(" \flat "5)" }

  <c ef gs>1-\markup       \small \concat { "-(" \raisedSharp "5)" }
  <c ef af>1-\markup       \small \concat { "-(" \raisedSharp "5)" }  % e.v.

  % dominant
  <c e g bf>1-\markup       \small "7"
  <c ff g bf>1-\markup      \small "7"  % e.v.
  <c e g as>1-\markup       \small "7"
  <c ff g as>1-\markup      \small "7"
  <c e g as>1-\markup       \small "7"
  <c e aff bf>1-\markup     \small "7"
  <c ff aff bf>1-\markup    \small "7"

  <c e g bf d'>1-\markup    \small "9"
  <c e g bf d' f'>1-\markup \small "11"
  <c e g bf d' a'>1-\markup \small "13"

%  <c e g bf d' a'>1-\markup \small "13"
%  <c e g as d' a'>1-\markup \small "13"

  <c e g a df'>1-\markup    \small \concat { "6(" \flat "9)" }
  <c e g a cs'>1-\markup    \small \concat { "6(" \flat "9)" }

  <c e gf bf>1-\markup  \small \concat { "7(" \flat "5)" }
  <c ff gf bf>1-\markup \small \concat { "7(" \flat "5)" }  % e.v.
  <c e gf as>1-\markup  \small \concat { "7(" \flat "5)" }
  <c ff gf as>1-\markup \small \concat { "7(" \flat "5)" }
  <c e fs as>1-\markup  \small \concat { "7(" \flat "5)" }
  <c ff fs as>1-\markup \small \concat { "7(" \flat "5)" }
  <c e fs bf>1-\markup  \small \concat { "7(" \flat "5)" }

  <c ef gf bf>1-\markup \small \concat { "-7(" \flat "5)" }
  <c ds gf bf>1-\markup \small \concat { "-7(" \flat "5)" }  % e.v.
  <c ef gf as>1-\markup \small \concat { "-7(" \flat "5)" }
  <c ds gf as>1-\markup \small \concat { "-7(" \flat "5)" }
  <c ef fs as>1-\markup \small \concat { "-7(" \flat "5)" }
  <c ds fs as>1-\markup \small \concat { "-7(" \flat "5)" }
  <c ds fs bf>1-\markup \small \concat { "-7(" \flat "5)" }
  <c ef fs bf>1-\markup \small \concat { "-7(" \flat "5)" }

  <c e gf bf d'>1-\markup    \small \concat { "9"  \flat "5" }
  <c ff gf bf d'>1-\markup   \small \concat { "9"  \flat "5" }  % etc
  <c e gf bf d' f'>1-\markup \small \concat { "11" \flat "5" }
  <c e gf bf d' a'>1-\markup \small \concat { "13" \flat "5" }

  <c e gs bf>1-\markup       \small \concat { "7" \raisedSharp "5" }
  <c e af bf>1-\markup       \small \concat { "7" \raisedSharp "5" }
  <c ff af bf>1-\markup      \small \concat { "7" \raisedSharp "5" }

  <c e gs bf d'>1-\markup    \small \concat { "9" \raisedSharp "5" }
  <c e gs bf d' f'>1-\markup \small \concat { "11"  \raisedSharp "5" }
  <c e gs bf d' a'>1-\markup \small \concat { "13"  \raisedSharp "5" }

  <c e g bf df'>1-\markup    \small \concat { "7("  \flat "9)" }
  <c e g bf cs'>1-\markup    \small \concat { "7("  \flat "9)" }
  <c e g as cs'>1-\markup    \small \concat { "7("  \flat "9)" }

  <c e g bf ds'>1-\markup    \small \concat { "7("  \raisedSharp "9)" }
  <c e g bf ef'>1-\markup    \small \concat { "7("  \raisedSharp "9)" }
  <c ff g bf ef'>1-\markup   \small \concat { "7("  \raisedSharp "9)" }

  <c e g bf fs'>1-\markup    \small \concat { "7("  \raisedSharp "11)" }
  <c e g bf gf'>1-\markup    \small \concat { "7("  \raisedSharp "11)" }
  <c ff g bf gf'>1-\markup    \small \concat { "7("  \raisedSharp "11)" }

  <c e g bf af'>1-\markup    \small \concat { "7("  \flat "13)" }

  <c e g bf df' f'>1-\markup \small \concat { "11"  \flat "9" }
  <c e g bf df' a'>1-\markup \small \concat { "13(" \flat "9)" }

  <c e g bf ds' f>1-\markup  \small \concat { "11"  \raisedSharp "9" }
  <c e g bf ds' a>1-\markup  \small \concat { "13"  \raisedSharp "9" }

  <c e g bf d' fs' a'>1-\markup \small \concat { "13(" \raisedSharp "11)" }
  <c e g as d' fs' a'>1-\markup \small \concat { "13(" \raisedSharp "11)" }

  % suspended
  <c d g>1-\markup     \small "sus2"
  <c d g bf>1-\markup  \small "7sus2"
  <c d e g>1-\markup   \small "add2"

  <c f g>1-\markup     \small "sus4"
  <c f g bf>1-\markup  \small "7sus4"
  <c e f g>1-\markup   \small "add4"

  <c f g d'>-\markup   \small "9sus"

  % diminished
  <c ef gf>1-\markup     \small "dim"
  <c ds gf>1-\markup     \small "dim"
  <c ds fs>1-\markup     \small "dim"

  <c ef gf a>1-\markup   \small "dim7"
  <c ef gf bff>1-\markup \small "dim7"
  <c ef fs a>1-\markup   \small "dim7"
  <c ds fs a>1-\markup   \small "dim7"
  <c ds fs bff>1-\markup \small "dim7"
  <c ds fs a>1-\markup   \small "dim7"

  % +7(#9)
  <c e af bf ef'>1-\markup \small \concat { "+7(" \raisedSharp "9)" }
  <c e gs bf ef'>1-\markup \small \concat { "+7(" \raisedSharp "9)" }
  <c e af bf ds'>1-\markup \small \concat { "+7(" \raisedSharp "9)" }
  <c e gs bf ds'>1-\markup \small \concat { "+7(" \raisedSharp "9)" }

}

chExceptions = #(sequential-music-to-chord-exceptions chVarA #t)

\layout {
  indent = 0.0\cm
  \context { \ChordNames chordNameExceptions = #chExceptions }
}

%{

Here's code that addresses the occasional double-sharp or -flat notes rendered
after transposing.

From snippets.pdf | Pitches | Transposing pitches with minimum accidentals
("Smart" transpose).

%}

#(define (naturalize-pitch p)
   (let ( (o (ly:pitch-octave p))
          (a (* 4 (ly:pitch-alteration p)))
          ;; alteration, a, in quarter tone steps, for historical reasons
          (n (ly:pitch-notename p)) )

     (cond
       ((and (> a  1) (or (eq? n 6) (eq? n 2)))
	 (set! a (- a 2))
	 (set! n (+ n 1)))
       ((and (< a -1) (or (eq? n 0) (eq? n 3)))
	 (set! a (+ a 2))
	 (set! n (- n 1))) )

     (cond
       ((> a  2) (set! a (- a 4)) (set! n (+ n 1)))
       ((< a -2) (set! a (+ a 4)) (set! n (- n 1))) )

     (if (< n 0) (begin (set! o (- o 1)) (set! n (+ n 7))))
     (if (> n 6) (begin (set! o (+ o 1)) (set! n (- n 7))))

     (ly:make-pitch o n (/ a 4))
))

#(define (naturalize music)
   (let ( (es (ly:music-property music 'elements))
          (e  (ly:music-property music 'element))
          (p  (ly:music-property music 'pitch)) )

   (if (pair? es) (ly:music-set-property! music 'elements
     (map (lambda (x) (naturalize x)) es) ) )
   (if (ly:music? e) (ly:music-set-property! music 'element (naturalize e)) )
   (if (ly:pitch? p)
     (begin
       (set! p (naturalize-pitch p))
       (ly:music-set-property! music 'pitch p))
   )
   music
))

naturalizeMusic = #(define-music-function (parser location m) (ly:music?)
  (naturalize m) )

% Combine the melody and chords into one.

myTune = { <<
  \new ChordNames { \set chordChanges = ##t \myChords }
  \new Staff \with { \consists "Volta_engraver" } \myMelody
>> }

% Render the pdf, with one part for each of three keys.

#(if (not (defined? 'mySubtitle)) (define mySubtitle #f))
#(if (not (defined? 'myText)) (define myText (markup) ))

\book {

  \bookpart {
    \header{
      title = \myTitle
      subtitle = \mySubtitle
      subsubtitle = "Piano (C)"
      composer = \myComposer
      tagline = ##f
    }
    \score {
      \naturalizeMusic \transpose \CFr \CTo \myTune
      \layout {	\context { \Score \remove "Volta_engraver" } }
%      \midi { }
    }
    \myText
  }

  \bookpart {
    \header{
      title = \myTitle
      subtitle = \mySubtitle
      subsubtitle = \markup { "Tenor (B" \flat ")" }
      composer = \myComposer
      tagline = ##f
    }
    \score {
      \naturalizeMusic \transpose \BbFr \BbTo \myTune
      \layout {
	\context { \Score \remove "Volta_engraver" }
      }
    }
    \myText
  }

  \bookpart {
    \header{
      title = \myTitle
      subtitle = \mySubtitle
      subsubtitle = \markup { "Alto (E" \flat ")" }
      composer = \myComposer
      tagline = ##f
    }
    \score {
      \naturalizeMusic \transpose \EbFr \EbTo \myTune
      \layout {
	\context { \Score \remove "Volta_engraver" }
      }
    }
    \myText
  }

}

