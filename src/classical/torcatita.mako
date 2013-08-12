<%page args="part"/>
% if part=='Vars':
<%
	attributes['doOwn']=True

	attributes['title']="Torcacita"
	attributes['subtitle']="South American tune"
	attributes['composer']="Folk"
	attributes['copyright']="Public Domain"
	attributes['style']="Classical"
	attributes['remark']="Taken from guitar album II by Misha Applebaum"

	attributes['completion']="5"
	attributes['uuid']="29e07ac4-ba42-11e0-a95c-0019d11e5a41"
	attributes['idyoutube']="gVDDRvoVgQg"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- add a scan of the paper (after fixing the printer).
	- fill in the fingerings.
	- write that the tune is for guitar.
	- document what has been done for this tune.
	- document the youtube performances.
% endif

% if part=='Own':
PartChords=\chordmode {
	\startChords

	\startSong

	%% there is no need to worry about which instrument plays the chords
	%% since they will not be heard...

	r2. |

	a:m | d:m | a1*2:m | \myFakeEndLine
	a1:m | d:m | a:m/e | a:m | \myFakeEndLine
	d:m | e:7 | a1*2:m | \myFakeEndLine
	e:7 | a:m | \myFakeEndLine

	\repeat volta 2 {
		e1*2:7 | a:m | \myFakeEndLine
		e1:7 | e:7/d | a1*2:m | \myFakeEndLine
		d:m | a:m | \myFakeEndLine
		e1:7 |
	} \alternative {
		{ e1:7 | a1*2:m | }
		{ e1:7 | a1*2:m | }
	} \myFakeEndLine

	\repeat volta 2 {
		a1*2:m | d1:m | a:m | \myFakeEndLine
		d:m | a:m | e:7 | a:m | \myFakeEndLine
		a1*2:m | d1:m | a:m | \myFakeEndLine
		d:m | a:m/c | e:7/b |
	} \alternative {
		{ a:m | }
		{ a:m | }
	} \myFakeEndLine

	\endSong

	\endChords
}

PartHighVoice=\relative c'' {
	\time 3/4
	\key c \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\voiceOne

	\startTune
	r8 e g f e dis \endPart

	\myMark "A"
	e2\segno e4 | f2 \times 2/3 {f8 g f} | e2. | r8 e g f e dis | \myFakeEndLine
	e2 e4 | f2 \times 2/3 {f8 g f} | e2. | r8 a b a gis a | \myFakeEndLine
	f2. | r8 gis a b a gis | e2. | r8 e g f e f | \myFakeEndLine
	e2. | r8 f e d c b | a2. ~ | a8-\markup { \italic "Fine" }
	\override BreathingSign #'text = \markup {
		\musicglyph #"scripts.caesura.straight"
	}
	\breathe
	c b4 a \endPart \myFakeEndLine

	\myMark "B"
	\repeat volta 2 {
		c4 b2 | r8 d c4 b | d c2 | r8 e d4 c | \myFakeEndLine
		e d2 | r8 f e4 dis | e2. | r8 g f4 e | \myFakeEndLine
		g f2 | r8 a a4 f | e c2 | r8 e a4 e | \myFakeEndLine
		e d2 |
	} \alternative {
		{ r8 b c d e f | e2. | r8 c b4 a | }
		{ r8 f' e4 gis, | a2 e'4 | <c e a>2. | }
	} \myFakeEndLine

	\myMark "C"
	\repeat volta 2 {
		r2. | r4 <a c e> <a c e> | r2. | r4 <a c e> <a c e> | \myFakeEndLine
		r2. | r4 <a c e> <a c e> | r4 <e gis d'> <e gis d'> | r4 <e a c> <e a c> | \myFakeEndLine
		r2. | r4 <a c e> <a c e> | r2. | r4 <a c e> <a c e> | \myFakeEndLine
		r2. | c | b |
	} \alternative {
		{ a2 <c e a>4 | }
		{ r8 e g f e dis_\markup {
			\center-column {
				\line
				{ \italic "D.C. "
				\tiny \raise #1
				\musicglyph #"scripts.segno"
				}
				\italic " al Fine"
			}
		} | }
	} \myFakeEndLine

	\endTune
}

PartMidVoice=\relative c' {
	\voiceTwo

	s2. |

	s4 <a' c> <a c> | s <a d> <a d> | s <a c> <a c> | s2. |
	s4 <a c> <a c> | s <a d> <a d> | s a c | s2. |
	s4 <a d> <a d> | s2. | s4 <a c> <a c> | s2. |
	s4 <gis d'> <gis d'> | s2. | s | s |

	\repeat volta 2 {
		s4 <e gis> <e gis> | s2. | s4 <e a> <e a> | s2. |
		s4 <e gis> <e gis> | s2. | s4 <a c> <a c> | s2. |
		s4 <a d> <a d> | s2. | s4 <e a> <e a> | s2. |
		s4 <e gis> <e gis> |
	} \alternative {
		{ s2. | s4 <a c> <a c> | s2. | }
		{ s2. | s2. | s2. | }
	}

	\repeat volta 2 {
		s2. | s2. | s2. | s2. |
		s2. | s2. | s2. | s2. |
		s2. | s2. | s2. | s2. |
		s2. | s4 e a | s e gis |
	} \alternative {
		{ s2. | }
		{ s2. | }
	}
}

PartLowVoice=\relative c' {
	\voiceFour

	s2. |

	a2. | d | a | a |
	a | d | e | a, |
	d | e, | a | a |
	e | e | a4 c e | a, s s |

	\repeat volta 2 {
		e2. | e | a | a |
		e | d' | a | a |
		d | d | a | a |
		e |
	} \alternative {
		{ e | a | a | }
		{ e | a | s | }
	}

	\repeat volta 2 {
		a8 b c cis d dis | e2. | a4 f d8 dis | e2. |
		a4 f d | c2. | b | c |
		a8 b c cis d dis | e2. | a4 f d8 dis | e2. |
		a4 f d | c2. | b |
	} \alternative {
		{ a | }
		{ a | }
	}
}

%% score for printing
\score {
	<<
		%%\new ChordNames="Partchords" \PartChords
		\new Staff="Melody" <<
			\new Voice="highvoice" \PartHighVoice
			\new Voice="midvoice" \PartMidVoice
			\new Voice="lowvoice" \PartLowVoice
		>>
	>>
	\layout {
	}
}
%% score for midi
\score {
	\unfoldRepeats
	<<
		\new Staff="Melody" <<
			\new Voice="highvoice" \PartHighVoice
			\new Voice="midvoice" \PartMidVoice
			\new Voice="lowvoice" \PartLowVoice
		>>
	>>
	\midi {
	}
}
% endif
