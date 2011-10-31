<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Real"

	attributes['title']="'Round Midnight"
	attributes['composer']="Cootie Williams, Thelonious Monk"
	attributes['poet']="Bernie Hanighen"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['piece']="Slowly"
	# this is from the real book
	attributes['piece']="Ballad"
	attributes['copyright']="1944 (Renewed) Warner Bros. Inc. and Thelonian Music"

	attributes['structure']="AABA"

	attributes['completion']="5"
	attributes['uuid']="1c99c334-a26f-11df-b3cb-0019d11e5a41"
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- brought in the fake book epdf.
	- fill in the meta data for the this tune.
	TODO:
	- put in the real book chords.
	- make sure the repetition marks show.
	- put in the structure of the tune.
	- put in the real book tune.
	- put in the real book lyrics.
	- check the real book chords.
	- check the real book tune.
	- check the real book lyrics.
	- hear the tune to make sure it sounds good.
	- add youtube performances.
	- add lyrics url.
	- add the fake book version.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\mark "A"
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

	\mark "B"
	\startPart
	c2:m7.5- f:7.9- | bes1:7 | c2:m7.5- f:7.9- | bes1:7 | \myEndLine
	aes4:m7 des:7 ges2:maj7 | ces:7 bes:7 | ees:7 des:7 | ces:7 bes:7 | \myEndLine
	\endPart

	\mark "A"
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
}
% endif

% if part=='LyricsReal':
\lyricmode {
}
% endif
