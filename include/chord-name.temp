%;; wip (set! chord::names-alist-jazz
#(define chord::names-alist-jazz
      (append
      '(
        (((0 . 0) (2 . -1)) . ("m"))

	;; 7.5+.9-
	(((0 . 0) (2 . 0) (4 . 1) (6 . -1) (1 . -1)) 
	 . ("7" (lines ((raise . 1.5) 
			((font-relative-size . -2) (columns " " (music (named ("accidentals-1"))) ((raise . -0.5) "5"))))
		       ((raise . -0.5)
			((font-relative-size . -2) (columns " " (music (named ("accidentals--1"))) "9"))))))
	;; 7.5-.9-
	(((0 . 0) (2 . 0) (4 . -1) (6 . -1) (1 . -1)) 
	 . ("7" (lines ((raise . 1.5) 
			((font-relative-size . -2) (columns " " (music (named ("accidentals--1"))) ((raise . -0.5) "5"))))
		       ((raise . -0.5)
			((font-relative-size . -2) (columns " " (music (named ("accidentals--1"))) "9"))))))
	;; 7.5+.9+
	(((0 . 0) (2 . 0) (4 . 1) (6 . -1) (1 . 1)) 
	 . ("7" (lines ((raise . 1.5) 
			((font-relative-size . -2) (columns " " (music (named ("accidentals-1"))) ((raise . -0.5) "5"))))
		       ((raise . -0.5)
			((font-relative-size . -2) (columns " " (music (named ("accidentals-1"))) ((raise . -0.5) "9")))))))
	;; 9.11+
	(((0 . 0) (4 . 0) (6 . -1) (1 . 0) (3 . 1)) 
	 . ("9" ((raise . 0.8) ((font-relative-size . -2) (music (named ("accidentals-1"))) "11"))))
	;; 7.4+
	(((0 . 0) (3 . 1) (4 . 0) (6 . -1)) 
	 . ("7" ((raise . 0.8) ((font-relative-size . -2) (music (named ("accidentals-1"))) "4"))))
	;; 7.9-.11+
	(((0 . 0) (4 . 0) (6 . -1) (1 . -1) (3 . 1)) 
	 . ("7" (lines ((raise . 1.5) 
			((font-relative-size . -2) (columns " " (music (named ("accidentals--1"))) "9")))
		       ((raise . -0.5)
			((font-relative-size . -2) (columns " " (music (named ("accidentals-1"))) "11"))))))
	;; 7.9-
	(((0 . 0) (2 . 0) (4 . 0) (6 . -1) (1 . -1)) 
	 . ("7" ((raise . 0.8) ((font-relative-size . -2) (music (named ("accidentals--1"))) "9"))))
	;; 7.5-
	(((0 . 0) (2 . 0) (4 . -1) (6 . -1)) 
	 . ("7" ((raise . 0.8) ((font-relative-size . -2) (music (named ("accidentals--1"))) "5"))))
	;; 7.5+
	(((0 . 0) (2 . 0) (4 . 1) (6 . -1)) 
	 . ("7" ((raise . 0.8) ((font-relative-size . -2) (music (named ("accidentals-1"))) "5"))))
	;; sus4.7
	(((0 . 0) (3 . 0) (4 . 0) (6 . -1))
	 . ("7" ((raise . 0.8) ((font-relative-size . -2) "sus4"))))
	;; 6.9^7
	(((0 . 0) (2 . 0) (4 . 0) (5 . 0) (1 . 0)) 
	 . ("6" ((raise . 0.8) ((font-relative-size . -2) "9"))))
	;; 9
	(((0 . 0) (2 . 0) (4 . 0) (6 . -1) (1 . 0)) . ("9"))
	;; sus9
	(((0 . 0) (3 . 0) (4 . 0) (6 . -1) (1 . 0)) . ("9sus"))
	;; maj9
	(((0 . 0) (2 . 0) (4 . 0) (6 . 0) (1 . 0)) 
	 . ("$\\Delta$" ((raise . 0.8) ((font-relative-size . -2) " 9"))))
	;; 7.9+
	(((0 . 0) (2 . 0) (4 . 0) (6 . -1) (1 . 1))
	 . ("7" ((raise . 0.8) ((font-relative-size . -2) (music (named ("accidentals-1"))) "9"))))
	;; 13
	(((0 . 0) (2 . 0) (4 . 0) (6 . -1) (1 . 0) (3 . 0) (5 . 0)) . ("13"))
	;; sus13
	(((0 . 0) (3 . 0) (4 . 0) (6 . -1) (1 . 0) (3 . 0) (5 . 0)) . ("13sus"))
	;; 11
	(((0 . 0) (4 . 0) (6 . -1) (1 . 0) (3 . 0)) . ("11"))
	;; m11^9
	(((0 . 0) (2 . -1) (4 . 0) (6 . -1) (3 . 0)) . ("$-$11"))
	;; 7.11+^9.5
	(((0 . 0) (6 . -1) (3 . 1))
	 . ("7" ((raise . 0.8) ((font-relative-size . -2) (music (named ("accidentals-1"))) "11"))))
	;; maj.11+^9
	(((0 . 0) (4 . 0) (6 . 0) (3 . 1))
	 . ("$\\Delta$" ((raise . 0.8) ((font-relative-size . -2) " " (music (named ("accidentals-1"))) "11"))))
	;;
	(((0 . 0) (2 . 0)  (3 . 1) (4 . 0) (6 . -1)) .  ("7" ((raise . 0.8) "+4")))

	;; m7+ minor major seventh chord = m triangle
	(((0 . 0) (2 . -1) (4 . 0) (6 . 0)) . (columns ("$-^\\Delta$")))
	;; m7.5- half diminished
	(((0 . 0) (2 . -1) (4 . -1) (6 . -1)) . ((raise . 0.8) "\\o"))
	;; 5^3 (no 3rd)
	(((0 . 0) (4 . 0)) . ("5"))
	;; 7
	(((0 . 0) (2 . 0) (4 . 0) (6 . -1)) . ("7"))
	;; m7.9
	(((0 . 0) (2 . -1) (4 . 0) (6 . -1) (1 . 0)) .  (("$-9$")))
	;; maj.4+
	(((0 . 0) (3 . 1) (4 . 0) (6 . 0)) 
	 . ("$\\Delta$" ((raise . 0.8) ((font-relative-size . -2) " " (music (named ("accidentals-1"))) "4"))))
	; major seventh chord = triangle
	(((0 . 0) (2 . 0) (4 . 0) (6 . 0)) .  ("$\\Delta$"))
	;; min7
	;;(((0 . 0) (2 . -1) (4 . 0) (6 . -1)) .  (("\\rule[0.5ex]{1.5ex}{0.1ex}")))
	(((0 . 0) (2 . -1) (4 . 0) (6 . -1)) .  (("--")))
	;; min6
	(((0 . 0) (2 . -1) (4 . 0) (5 . 0)) .  (("$-$6")))
	;; 6
	(((0 . 0) (2 . 0) (4 . 0) (5 . 0)) .  (("6")))

	)
      ;; '()))
       chord::names-alist-jazz
      ))

#(define (chord::name-jazz tonic exception-part unmatched-steps
			   bass-and-inversion steps)
;;   (newline)
;;   (display (list "tonic" tonic "exception" exception-part "unmatched" unmatched-steps
;;		  "bass" bass-and-inversion "steps" steps))
   (let ((additions (chord::additions-american unmatched-steps))
	 (subtractions (chord::subtractions unmatched-steps)))
     (chord::inner-name-jazz tonic exception-part additions subtractions
			     bass-and-inversion steps)))
