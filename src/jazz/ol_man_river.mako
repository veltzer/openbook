<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="Ol' Man River"
	attributes['style']="Jazz"
	attributes['composer']="Jerome Kern"
	attributes['poet']="Oscar Hammerstein II"
	# this is from the fake book
	attributes['piece']="Very Slowly"
	attributes['copyright']="1927 T.B. Harms Company. Copyright Renewed."
	attributes['copyrightextra']="(c/o The Welk Music Group, Santa Monica, CA 90401)"
	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"

	attributes['completion']="5"
	attributes['uuid']=""
	attributes['structure']=""

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

	\myMark "A"
	\startPart
	\repeat volta 2 {
		ees2 c:m7 | ees aes | ees aes | ees c:m7 |
		f:m7 bes:9 | f:m7 bes:9 | ees aes:6 | ees1 | ees2 c:m7 |
		ees aes | ees c:m | ees ges:dim7 | f:m7 bes:7 |
		f:m7 bes:9 | ees aes | ees a4:m7.5- d:7 | g2:m d:7.9- | g:m d:7.9- |
		g:m d:7.9- | g:m d:7.9- | g:m c:m6 | g:m d:7.9- | g:m d:7.9- |
		g:m f4:m7 bes:7 | ees2 c:m7 | ees aes | ees bes:9 | c:m7 f:7 |
		ees4/bes b:dim c2:m7 | f:m9 bes:7 |
	} \alternative {
		{
			ees aes:m | ees f4:m7 bes:7 |
		}
		{
			ees2 f4:m7 bes:7 | ees1 |
		}
	}
	\endPart

	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	%% \tempo "Andante" 4 = 88
	\time 4/4
	\key ees \major

	\repeat volta 2 {
		%% part "A"
		bes,4 bes c8 ees4 c8 | bes4 bes c8 ees4 f8 | g4 g f8 ees4 f8 | g4 bes c8 bes4 c8 |
		bes4 bes g8 f4 g8 | bes4 bes g8 f4 g8 | ees1~ | ees2. r8 bes8 | bes4 bes c8 ees4 c8 |
		bes4 bes c8 ees4 f8 | g4 bes c8 bes4 c8 | ees4 ees d8 c4 d8 | bes4 bes g8 f4 g8 |
		bes4 bes g8 f4 g8 | ees1~ | ees4 r4 r2 | d'4 bes c4. ees8 | d4 bes c2 |
		d8. d16 bes4 c8. c16 ees4 | d bes c2 | bes8 r g4 a2 | bes4 g a2 | bes8. bes16 g8. g16 a4 c8. c16 |
		bes4 g f2 | bes,4 bes c8 ees4 c8 | bes4 bes c8 ees4 f8 | g4 bes c8 bes4 c8 | ees4 ees f8 ees4 f8 |
		g4 g f8 ees4 f8 | g4 g f8 ees f4 |
	} \alternative {
		{
			ees4 r r2 | R1 |
		}
		{
			ees1~ | ees4 r r2 |
		}
	}

}
% endif

% if part=='LyricsFake':
\lyricmode {
	Ol' Man Riv -- er, dat Ol' Man Riv --er, he must know sump -- in', but don't say noth -- in' he
	jus' keeps roll -- in', he keeps on roll -- in' a -- long. __ He don't plant 'ta -- ters, he
	don't plant cot -- ton, an' dem dat plants 'em is soon for -- got -- ten; but Ol' Man Riv --er, he
	jus' keeps roll -- in' a -- long. __ You an' me, we sweat an' strain,
	bo -- dy all ach -- in' an' racked wid pain. "\"Tote" dat "barge!\"" "\"Lift" dat "bale,\"" git a lit -- tle drunk an' you
	land in jail. Ah gits wea -- ry an' sick of try -- in', Ah'm tired of liv -- in' an' skeered of dy -- in'. But
	Ol' Man Riv -- er, he jus' keeps roll -- in' a -- long.
	long. __
}
% endif
