\version "2.17.2"

%% this example should only compile on lilypond of the version
%% listen above...
%% Notes about version:
%% - without \version lilypond will give you a compile time warning
%% - an older version than the lilypond that you are using is ok but
%% you will get behaviour of the old version and will not get any
%% of the new features.
%% - a newer version than the version of lilypond that you have will
%% give you compile time errors

\score {
	<<
		\new ChordNames="mychordname" {
			\chordmode {
			  c1:7.3-.5-.9-.11-.13-
			}
		}
		\new Voice="foo" { c'2 }
	>>
}
