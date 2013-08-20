<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="Cry Me A River"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['composer']="Arthur Hamilton"
	# this is from the fake book
	attributes['poet']="Arthur Hamilton"
	# this is from the fake book
	attributes['piece']="Slowly and Rhythmically"
	attributes['copyright']="1953, 1955 by Saunders Publications, Inc."
	attributes['copyrightextra']="Copyright renewed, assigned to Arthur Hamilton and Chappell & Co., Inc."
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
		c2:m c:m5+ | c:m6 c:m7 | f:m7 bes4:7 bes:7.5+ | ees2:maj7 d4:m7 g:7 | g2:m7 c:7.5+ |
		f1:9 | f2:m7 f:m7/bes | ees:6 d4:7.9- g:7 |
		\endPart
		\myMark "A"
		\startPart
		c2:m c:m5+ | c:m6 c:m7 | f:m7 bes4:7 bes:7.5+ | ees2:maj7 d4:m7 g:7 | g2:m7 c:7.5+ |
		f1:9 | f2:m7 f:m7/bes | ees:6 a4:m7.5- d:7.9- |
		\endPart
		\myMark "B"
		\startPart
		g1:m | c2:m6 d:7 |
		g:m e:m7.5- | c:m6/ees d:7 | g1:m | c2:m6/ees d4:sus4.7 d:7 |
		g1 | d2:m7 g:7 | c:m c:m5+ | c:m6 c:m7 |
		f:m7 bes4:7 bes:7.5+ | ees2:maj7 d4:m7 g:7 | g2:m7 c:7.5+ | f1:9 |
		f2:m7 f:m7/bes |
	} \alternative {
		{
			ees:6 g:7.5+.9- |
		}
		{
			ees1:6 |
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
	\tempo "Andrante Moderato" 4 = 88
	\time 4/4
	\key ees \major
	%% part "A"
	\repeat volta 2 {
		d2~ d8 c g ees | d c4.~ c2 | r8 c ees c' bes4 bes | g2~ g8. g16 fis8. g16 | c4~ \times 2/3 { c8 des c } des8 c4. |
		%% part "A"
		r8 g8~ \times 2/3 { g8 f ees } f8 g4. | r8 ges f ees f ees c ees | ees2~ ees4. r8 | d'2~ d8 c g ees | d c4.~ c2 |
		r8 c ees c' bes4 bes | g2~ g8. g16 fis8. g16 | c4~ \times 2/3 { c8 des c } des8 c4. | r8 g8~ \times 2/3 { g8 f ees } f8 g4. |
		r8 ges f ees f ees c ees | ees1 |
		%% part "B"
		r8. g16 a bes8.~ \times 2/3 { bes8 d, e } fis8 g | a8. g16 bes8 a~ a4. g8 |
		bes4~ \times 2/3 { bes8 g d' } c4 bes8 c~ | c1 | r8. g16 a bes8.~ \times 2/3 { bes8 d, e } fis8 g | a8. g16 bes8 a~ a2 |
		r8 a16 g a8. g16 a8. g16 b16 g8. | r8 a16 g a8. g16 a8. g16 b16 g8. |
		%% part "A"
		d'2~ d8 c g ees | d c4.~ c2 |
		r8 c ees c' bes4 bes | g2~ g8. g16 fis8. g16 | c4~ \times 2/3 { c8 des c } des c4. | r8 g~ \times 2/3 { g8 f ees } f8 g4. |
		r8 c ges ees f ees c ees |
	} \alternative {
		{
		ees2~ ees8 r r4 |
		}
		{
			ees1 |
		}
	}

}
% endif

% if part=='LyricsFake':
\lyricmode {
	Now __ you say you're lone -- ly, __ you cry the long night thru; __ well, you can Cry __ Me A Riv --er,
	Cry __ Me A Riv -- er, I cried a riv -- er o -- ver you. __ Now __ you say you're sor -- ry __
	for be -- in' so un -- true; __ well, you can Cry __ Me A Riv -- er, Cry __ My A Riv -- er,
	I cried a riv -- er o -- ver you. You drove me, __ near -- ly drove me, out of my head, __
	while you __ nev -- er shed a tear. __ Re -- mem -- ber? __ I re -- mem -- ber, all that you said; __
	told me love was too ple -- be -- ian, told me you were thru with me, an' Now __ you say you love me, __
	well, just to prove you do, __ Come on, an' Cry Me A Riv -- er, Cry Me A Riv -- er,
	I cried a riv -- er o -- ver you. __
	you. __
}
% endif
