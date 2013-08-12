<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="Bye Bye Blackbird"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['composer']="Ray Henderson"
	# this is from the fake book
	attributes['poet']="Mort Dixon"
	# this is from the fake book
	attributes['piece']="Moderately"
	# this is from the fake book
	attributes['copyright']="1926 (Renewed) Warner Bros. Inc."

	attributes['completion']="5"
	attributes['uuid']="7b863bbe-f2a2-11e0-9257-0019d11e5a41"
	attributes['structure']="ABCD"

	attributes['idyoutube']="HMPHMu7LVhQ"
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the this tunes structure.
	- filled in the meta data for this tune from the fake book.
	- added the real book epdf.
	- added the fake book epdf.
	- added the fake book chords.
	- added the fake book tune.
	- added the fake book lyrics.
	- check the fake book chords.
	- check the fake book tune.
	- check the fake book lyrics.
	- heard the fake book version to make sure it sounds ok.
	TODO:
	- document the youtube performance and add another one.
	- add a lyrics url.
	- write the real book version.
		This is it's harmonization to save some time:
		f1 f f f f aes:dim7 g:m7 c:7
		g1:m7 g:m7 g:m7 c:7 g:m7 c:7 f f
		f1:7 f:7 a:m7.5- d:7 g:m7 g:m7 bes2:m7 ees2:7 g2:m7 c2:7
		f1 f a:m7.5- d:7 g:m7 c:7 f f
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {
		\myMark "A"
		\startPart
		f1. d2:7 | g:m7 c:7.9 | f1 | \myEndLine
		f/a | aes:dim7 | g2:m7 c1.:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		g2:m ees/g | g:m6 ees/g | g1:m7 | c:7 | \myEndLine
		g:m7 | c:7 | f2:maj7 f1.:6 | \myEndLine
		\endPart

		\myMark "C"
		\startPart
		f1*2:7 | a1:m7.5- | d:7 | \myEndLine
		g1*2:m | g1:m7.5- | c:7 | \myEndLine
		\endPart

		\myMark "D"
		\startPart
		f1*2 | ees1:7 | d:7 | \myEndLine
		g1.:m7 c2:7 |
	} \alternative {
		{
			f d:m7 | g:m7 c:7 |
		}
		{
			f bes | bes:m6 f:6 |
			\endPart
		}
	}

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative f' {
	\time 4/4
	\key f \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Moderato" 4 = 116

	\repeat volta 2 {
		%% A part
		a4 a a a | bes a a2 | a4 g g2 | g4 f f2 |
		f1 | g | f2 e2~ | e1 |
		%% B part
		bes'4 bes bes bes | c bes bes2 | bes4 a a2 | a4 g g2 |
		g1 | a | g2 f~ | f1 |
		%% C part
		f4 c' c c | c bes a g | g1 | fis |
		d4 bes' bes bes | bes a g f | f1 | e |
		%% D part
		a4 a a a | bes a a2 | a4 g g2 | g4 fis fis2 |
		g2 bes~ | bes e, |
	} \alternative {
		{
			f2 r | r1 |
		}
		{
			f1~ | f |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% A part
	Pack up all my care and woe,
	here I go, Sing -- ing low,
	Bye Bye Black -- bird, __
	%% B part
	Where some -- bod -- y waits for me,
	sug -- ar's sweet, so is she,
	Bye Bye Black -- bird. __
	%% C part
	No one here can love or un -- der -- stand me,
	oh, what hard luck sto -- ries they all hand me.
	%% D part
	Make my bed and light the light,
	I'll ar -- rive late to -- night,
	black -- bird __ bye bye.
	bye. __
}
% endif
