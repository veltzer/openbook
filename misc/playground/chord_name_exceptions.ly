%% This example shows how to customize chord names...
%% I use it for altered chords.

myChordDefinitions = {
	<c ees ges bes des' fes' aes'>-\markup \super {7alt}
}

myChordExceptions = #(append
	(sequential-music-to-chord-exceptions myChordDefinitions #t)
	ignatzekExceptions)

myChordInit = {
	\set chordNameExceptions = #myChordExceptions
}

Chord = \chords { \myChordInit c:7.3-.5-.9-.11-.13- }

music = { c'2 }

\score {
	<<
		\Chord
		\music
	>>
}
