<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="How Deep Is the Ocean"
	attributes['subtitle']="How High Is the Sky"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['composer']="Irving Berlin"
	# this is from the fake book
	attributes['poet']="Irving Berlin"
	# this is from the fake book
	attributes['piece']="Slowly"
	attributes['copyright']="1932 Irving Berling (Renewed)"
	attributes['copyrightextra']=""
	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"

	attributes['completion']="5"
	attributes['uuid']=""
	attributes['structure']="ABAC"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
% endif

% if part=='ChordsFake':
\chordmode {
	\startSong
	\startChords

	\startPart
	\myMark "A"
    c1:m7 | d2:m7.5- g:7 | c1:m7 | a2:m7.5- d:7 |
    g1:m7 | a2:m7.5- d:7 | g:m7 c:7 | f:m7 bes:7 |
    \myMark "B"
    ees1:maj7 | bes2:m7 ees:7 | aes1:7 | aes:7 |
    c:m7.5- | f:7 | bes:7 | d2:m7.5- g:7 |
	\myMark "A"
    c1:m7 d2:m7.5- g:7 | c1:m7 | a2:m7.5- d:7 |
    g1:m7 | a2:m7.5- d:7 | g:m7 c:7 | f:m7 bes:7 |
    \myMark "C"
    ees1:7 | g2:m7.5- c:7 | f1:m7 | aes2:m7 des:7 |
    ees1:maj7 | f:7 | f2:m7 bes:7 | ees1:maj7 |
	\endPart

	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Andante" 4 = 88
	\time 4/4
	\key ees \major

    r4 ees, \times 2/3 { ees d ees } | g4 g2. | r4 ees \times 2/3 { ees d ees } | g2. r4 |
    r4 bes \times 2/3 { bes a bes } | c4 c2. | r4 bes \times 2/3 { bes a bes } | c1 |
    r4 ees ees ees | ees8 bes4 bes8~ bes4 bes4 | bes ges ges ges~ | ges1 |
    ges4 ees ees ees~ | ees d2 ees4 | ges f f f~ | f2 r |
    r4 ees \times 2/3 { ees d ees } | g4 g2. | r4 ees \times 2/3 { ees d ees } | g2. r4 |
    r4 bes \times 2/3 { bes a bes } | c4 c2. | r4 bes \times 2/3 { bes a bes } | c1 |
    r4 ees ees des | des c c bes | r aes \times 2/3 { aes g f } | aes1 |
    r4 g \times 2/3 { g f ees } | g4 g2. | r4 f \times 2/3 { f ees d } | ees2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {
    How much do I love you? I'll tell you no lie.
    How Deep Is The O -- cean, how high is the sky?
    How man -- y times a day __ do I think of you? __
    How man -- y ros -- es are sprink -- led with dew? __
    How far would I trav -- el to be whre you are?
    How far is the jour -- ney for here to a star?
    And if I ev -- er lost you, how much would I cry?
    How Deep Is The O -- cean, how high is the sky?
}
% endif
