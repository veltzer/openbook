\version "2.16.2"

%% Example how to parenthesize chord names
%% http://lilypond.1069038.n5.nabble.com/Parenthesizing-chord-names-td44370.html

#(define (left-parenthesis-ignatzek-chord-names in-pitches bass inversion context) (markup #:line ("(" (ignatzek-chord-names in-pitches bass inversion context))))
#(define (right-parenthesis-ignatzek-chord-names in-pitches bass inversion context) (markup #:line ((ignatzek-chord-names in-pitches bass inversion context) ")")))
#(define (parenthesis-ignatzek-chord-names in-pitches bass inversion context) (markup #:line ("(" (ignatzek-chord-names in-pitches bass inversion context) ")")))
LPC = { \once \set chordNameFunction = #left-parenthesis-ignatzek-chord-names }
RPC = { \once \set chordNameFunction = #right-parenthesis-ignatzek-chord-names }
OPC = { \once \set chordNameFunction = #parenthesis-ignatzek-chord-names }

chordset = \chordmode
{
	c1:7 g:7
	\LPC a:7 f:7
	c:7 \RPC g:7
	c:7 \OPC g:7
}

\score { \new ChordNames \chordset }
