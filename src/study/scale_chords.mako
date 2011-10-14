include(src/include/common.lyi)
\header {
	default_header

	title="Jazz chords on the major scale"
	style="Jazz"
	piece="Upbeat Jazz"

	copyright=copyright_val_study

	completion="4"

	uuid="ffbec224-36a6-11e0-aecb-0019d11e5a41"
}

<%doc>
	TODO:
</%doc>

myVoice=\relative c' {
	\time 4/4
	\key bes \major

	%% both hands

	%% upwards and then downwards on the scale

	<c e g b>1 <d f a c> <e g b d> <f a c e>
	<g b d f> <a c e g> <b d f a> <c e g b>

	%% downwards and then upwards on the scale

	<c e g b> <b d f a> <a c e g> <g b d f>
	<f a c e> <e g b d> <d f a c> <c e g b>

	%% now left hand plays 1 and 7 only while right hand plays all but the root

	%% now left hand plays 1 and 7 only while right hand plays all but the root and 7 goes down to 6

	%% now left hand plays 1 and 7 only while right hand plays all but the root and 7 goes to approach to 6 from below and then 6
}
%% score for printing
\score {
	<<
		\new Voice="myvoice" \myVoice
	>>
	\layout {
	}
}
%% score for midi
\score {
	\unfoldRepeats
	<<
		\new Voice="myvoice" \myVoice
	>>
	\midi {
	}
}
