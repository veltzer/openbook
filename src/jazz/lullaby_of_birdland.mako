<%def name="vars()">
<%
	attributes['jazzTune']=True
	attributes['type']="harmony_tune"
	attributes['render']="Unknown"

	attributes['title']="Lullaby of birdland"
	attributes['composer']="George Shearing"
	attributes['style']="Jazz"
	attributes['piece']="Med Swing"

	attributes['completion']="0"
	attributes['uuid']="f9668406-a26e-11df-8542-0019d11e5a41"
%>
</%def>

<%def name="myChordsUnknown()">
\chordmode {
	\startChords

	\startSong

	\repeat volta 2 {
		a2:m7 fis:5- |
	}

	\endSong

	\endChords
}
</%def>

<%def name="myVoiceUnknown()">
\relative c'' {
	\time 4/4
	\key a \minor

	\repeat volta 2 {
	e4 d8 c b a~ a4 | fis4 a8 gis~ gis4 r4 | e4 b'8 a~ a4 r8 e8 |
	f e e' d~ d2 | g8 g f e d c4. a8 e' d aes8~ aes e'8 d g,~ |
	}
	\alternative {
		{ g2. r8 d'8 | c f,~ f c' b e,~ e4 | }
		{ g2. r8 g8 | b c r4 r2 | }
	}

	\repeat "unfold" 2 {
		e4 f8 fis g e g f~ | f d~ d2 r4 | d4 dis8 e f g f e~ | e
	}
	\alternative {
		{ r8 r4 r2 }
		{ f8 e d~ d4 r }
	}
}
</%def>
