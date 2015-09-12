% Show rehearsal marks (Coda...) only at the end of lines
rehearsalEndOfLine = \property Score.RehearsalMark \override #'break-visibility = #begin-of-line-invisible
% Show rehearsal marks (Coda...) only at the beginning of lines
rehearsalBeginOfLine = \property Score.RehearsalMark \override #'break-visibility = #end-of-line-invisible
% Show rehearsal marks (Coda...) at the end and beginning of lines
rehearsalAll = \property Score.RehearsalMark \override #'break-visibility = #all-visible

toCoda = \notes {
    \rehearsalEndOfLine
    \mark #'(music "scripts-coda")
}

coda =  \notes {
    \rehearsalBeginOfLine
    \mark #'(music "scripts-coda")
}

codaAll =  \notes {
    \rehearsalAll
    \mark #'(music "scripts-coda")
}

tupletBracketUp = \property Voice.TupletBracket \override #'direction = #1
tupletBracketDown = \property Voice.TupletBracket \override #'direction = #-1
tupletBracketBoth = \property Voice.TupletBracket \revert #'direction

tupletNumberOff = \property Voice.TupletBracket \override #'number-visibility = ##f
tupletBracketOff = \property Voice.TupletBracket \override #'bracket-visibility = ##f
tupletNumberOn = \property Voice.TupletBracket \override #'number-visibility = ##t
tupletBracketOn = \property Voice.TupletBracket \override #'bracket-visibility = ##t
tupletIfNoBeam = \property Voice.TupletBracket \override #'bracket-visibility = #'if-no-beam

% Hide stems
stemOff = \property Voice.Stem \override #'molecule-callback = #'()
% Hide note heads
headOff = \property Voice.NoteHead \override #'molecule-callback = #'()

barOff = \property Staff.BarLine \override #'molecule-callback = #'()

beamOff = \property Voice.Beam \override #'transparent = ##t

restOff = \property Voice.Rest \override #'molecule-callback = #'()

invisibleNotes = {
    \stemOff
    \headOff 
    \beamOff
    \restOff
}

#(define tagline "http://partoches.bearteam.org/")
#(define shortestDurationSpace 3.0)
#(define minimumVerticalExtent 6)

% Four 4th notes with slash heads: / / / /
fourBeats = \notes \transpose c'' {
    \stemOff
    \property Voice.NoteHead \set #'style = #'slash
    b4 b b b
%    \stemOn
}

% Three 4th notes with slash heads: / / / /
threeBeats = \notes \transpose c'' {
    \stemOff
    \property Voice.NoteHead \set #'style = #'slash
    b4 b b
}

autoBeamOff = \property Voice.autoBeaming = ##f
autoBeamOn = \property Voice.autoBeaming = ##t

boxedMark = \property Score.RehearsalMark \override #'molecule-callback =
   #(make-molecule-boxer 0.15 0.3 0.3 Text_item::brew_molecule)

unboxedMark = \property Score.RehearsalMark \revert #'molecule-callback
firstMarkOffset = \property  Score.RehearsalMark \override #'extra-offset = #'(0.5 . 2)
markOffset = \property  Score.RehearsalMark \override #'extra-offset = #'(-2 . 2)