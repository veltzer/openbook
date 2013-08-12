<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['render']="Unknown"

	attributes['title']="Chega De Saudade"
	attributes['style']="Jazz"
	attributes['subtitle']="No More Blues"
	attributes['composer']="Antonio Carlos Jobim"
	attributes['piece']="Med Swing"
	attributes['copyright']="1962,1967, Editora Musical Arapua, Sao Paulo, Brazil"
	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"

	attributes['completion']="0"
	attributes['uuid']="a8d44d0c-a26e-11df-a32b-0019d11e5a41"
	attributes['structure']="AABA"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- document what has been done for this tune.
	- add youtube performances.
	- add words
	- where did this come from
% endif

% if part=='ChordsUnknown':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	d1:m7 | d:m7/c | e1:7/b | r1 | \myEndLine
	a1:7.5+.9- | r1 | d1:m7 | e2:m7.5- a:7 | \myEndLine
	d1:m7 | b2:m7.5- e:7 | a1:m7 | r1 | \myEndLine
	bes1:maj7 | bes:6 | a1:7.9- | r1 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceUnknown':
\relative f'' {
	\time 4/4
	\key f \major

	%% Bar 1
	f4. a,8~ a4. d8~ | d2~ d8 f4 e8~ | e4. b8~ b4. d8~ | d2~ d8 e4 f8~ |
	f4. bes,8~ bes4. cis8~ | cis2~ cis8 f4 e8~ | e d4 f8 e d4 a8~ | a1 |
	f'4. a,8~ a4. cis8~ | cis2~ cis8 d4 c8~ | c4. e8~ e2~ | e4 e8 d~ d c4 c8~ |
	c4. bes8~ bes2~ | bes4 f'8 e~ e d4 d8~ | d cis4 e8 cis4 bes~ | bes2. r4 |
}
% endif
