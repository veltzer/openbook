\header {
    title = "Mack The Knife"
    indexTitle = "Mack The Knife (with lyrics)"
    composer = "Kurt Weill \\\\Blitzstein"
    enteredby = "Laurent Martelli"
    tagline = #tagline
    head = #instrument
}

\include "mack_the_knife_inc.ly"

Score = <
    \context ChordNames \Chords
    \addlyrics
        \context Staff < \Tune \Breaks >
        \context Lyrics < 
	    \context LyricsVoice = "A" \LyricsA
	    \context LyricsVoice = "B" \LyricsB
	    \context LyricsVoice = "C" \LyricsC
	>
>

