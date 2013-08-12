<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Real"

	attributes['title']="'Round Midnight"
	attributes['style']="Jazz"
	attributes['composer']="Cootie Williams, Thelonious Monk"
	attributes['poet']="Bernie Hanighen"
	# this is from the fake book
	attributes['piece']="Slowly"
	# this is from the real book
	attributes['piece']="Ballad"
	# this is from the fake book
	attributes['copyright']="1944 (Renewed) Warner Bros. Inc. and Thelonian Music"

	attributes['completion']="5"
	attributes['uuid']="1c99c334-a26f-11df-b3cb-0019d11e5a41"
	attributes['structure']="AABA"

	attributes['idyoutuberemark']="Ella's vocal version"
	attributes['idyoutube']="DEaDj6TXiQQ"
	attributes['idyoutuberemark']="Monk. What can I say?"
	attributes['idyoutube']="OMmeNsmQaFw"
	attributes['lyricsurl']="http://www.sing365.com/music/lyric.nsf/Round-Midnight-lyrics-Ella-Fitzgerald/F7F9D0761ABE750348256AAB0009FEEA"
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- brought in the fake book epdf.
	- fill in the meta data for the this tune.
	- put in the real book chords.
	- make sure the repetition marks show.
	- put in the structure of the tune.
	- added lyrics url.
	- put in the real book tune.
	- heard the tune to make sure it sounds good.
	- checked the real book chords.
	- checked the real book tune.
	- put in the real book lyrics.
	- checked the real book lyrics.
	- added youtube performances.
	TODO:
	- add the fake book version.
	REMARKS:
	- in the real book chords the bes:7 chord that ends the first two bars of the A section (appears
	3 times) is an altered chord and the lead sheet says so. How do I do an altered chord in lilypond?
	I've seen some discussions about it but nothing conclusive.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		%% the bes:7 on the next line should be altered
		ees2:m c:m7.5- | f:m7.5- bes:7 | ees:m7 aes:7 | b4:m7 e:7 bes:m7 ees:7 | \myEndLine
		aes2:m7 des:7 | ees:m7 aes:7 |
	} \alternative {
		{
			b1:7 | bes:7 |
		}
		{
			b2:7 bes:7 | ees1:m7 | \myEndLine
		}
	}
	\endPart

	\myMark "B"
	\startPart
	c2:m7.5- f:7.9- | bes1:7 | c2:m7.5- f:7.9- | bes1:7 | \myEndLine
	aes4:m7 des:7 ges2:maj7 | ces:7 bes:7 | ees:7 des:7 | ces:7 bes:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	%% the bes:7 on the next line should be altered
	ees2:m c:m7.5- | f:m7.5- bes:7 | ees:m7 aes:7 | b4:m7 e:7 bes:m7 ees:7 | \myEndLine
	aes2:m7 des:7 | ees:m7 aes:7 | ces:7 bes:7 | ees1:m | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c' {
	\time 4/4
	\key ees \minor

	%% A part
	\repeat volta 2 {
		r4 bes16 ees f bes ges4. bes,8 | ees4. d16 ees bes'8 aes r4 |
		r ees16 ges bes des c4. ees,8 | a8 fis16 d gis4 aes8 f16 des g4 |
		r4 aes16 ces ees ges f4. ces8 | bes4 \times 2/3 { ees,8 d des } c aes'4 ees16 f |
	} \alternative {
		{
			\times 2/3 { fis8 fis fis fis f dis } f4. dis8 | d bes r4 r2 |
		}
		{
			fis'4 f8 dis f4 ees8 des | ees2. ees8 f |
		}
	}

	%% B part
	ges4 f8 ees f4. ees8 | d bes' r4 r ees,8 f | ges4 f8 ees f4. ees8 | d bes r4 r bes'4 |
	ces4. ces8 bes4. bes8 | aes4 ges f4. bes8 | ees ees ees4 des8 des des4 | ces ees,8 d bes' aes e d |

	%% A part
	r4 bes16 ees f bes ges4. bes,8 | ees4. d16 ees bes'8 aes r4 |
	r ees16 ges bes des c4. ees,8 | a8 fis16 d gis4 aes8 f16 des g4 |
	r4 aes16 ces ees ges f4. ces8 | bes4 \times 2/3 { ees,8 d des } c aes'4 ees16 f |
	ges4 f8 ees f4 ees8 des | ees1 |
}
% endif

% if part=='LyricsReal':
\lyricmode {
	%% A part
	It be -- gins to tell, 'round midnight, mid _ _ -- night.
	I do pre -- tty well, till af -- _ _ ter sun -- _ _ down,
	Sup -- per -- time I'm fee -- lin' sad; _ _ _ _ _
	But it real -- ly gets _ _ _ bad, 'round mid -- night.
	%% second volta
	mid -- _ _ night knows it, too.
	%% B part
	When a quar -- rel we had needs men -- ding,
	Does it mean that our love is end -- ing.
	Dar -- lin' I need you, lately I find
	You're out of my heart,
	And I'm out of my mind. _ _ _
	%% A part
	Let our hearts take wings' 'round midnight, mid _ _ -- night.
	Let the an -- gels sing, for your -- _ _ re tur -- _ _ ning.
	Till our love is safe and sound. _ _ _ _ _
	And old mid -- _ _ night comes a -- round.
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	%% A part
	Memo -- ries al -- ways start 'round midnight, mid _ _ -- night.
	Ha -- ven't got the heart to stand -- _ _ those me -- _ _ mories,
	When my heart is still with you, _ _ _ _ _
	And ol'
}
% endif
