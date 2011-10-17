<%page args="part"/>
% if part=='Vars':
<%
	attributes['type']="harmony_tune_lyrics"
	attributes['render']="Unknown"

	attributes['title']="One Note Samba"
	attributes['subtitle']="Samba de uma nota so"
	attributes['composer']="Antonio Carlos Jobim"
	attributes['poet']="Newton Mendonca"
	attributes['copyright']="1961 1962, Antonio Carlos Jobim and Mrs. Mendonca"
	attributes['style']="Jazz"
	attributes['piece']="Samba"

	attributes['completion']="0"
	attributes['uuid']="21bc8284-a26f-11df-a829-0019d11e5a41"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- turn this tune relative!
	- mark whats been done.
	- mark the origins of the tune.
	- add youtube performances.
% endif

% if part=='ChordsUnknown':
\chordmode {
	\startChords

	\startSong

	\partial 4. r4. |
	d1:m7 | des:7 | c:m11 | b:7.5- | d:m7 | des:7 | c:m7 | b:7.5- |
	f:m7 | e:7.5- | ees:maj7 | aes:9 | d4.:m7 des2:7 c8:m11 | r1 | b:7.5- bes:6 |
	ees:m7 | aes:7 | des4.:maj7 des2:6 r8 | des4.:maj7 des2:6 r8 | des1:m7 | des:7 | ces:maj7 |
	c4.:m7.5- b2:7.5- r8 | d1:m7 | des:7 | c:m7 | b:7.5- | d:m7 | des:7 | c:m7 | b:7.5- |
	f:m7 | e:7.5- | ees:maj7 | aes:9 | des2.:6 r8 c:7 | r2. ces1:maj7 r8 bes1:6 r8 |

	\endSong

	\endChords
}
% endif

% if part=='VoiceUnknown':
\relative c' {
	\time 4/4
	\key bes \major
	\clef treble

	\partial 4. f'4 f'8 |
	f'4 f'8 f'~ f' f'4 f'8~ |
	f'4. f'8 r f'4 f'8 |
	f'4 f'8 f'~ f' f'4 f'8~ |
	%%5
	f'2 r8 f'4 f'8 |
	f'4 f'8 f'~ f' f'4 f'8~ |
	f'4. f'8 r f'4 f'8 |
	f'4 f'8 f'~ f' f'4 f'8~ |
	f'2 r8 bes'4 bes'8 |
	%%10
	bes'4 bes'8 bes'~ bes' bes'4 bes'8~ |
	bes' bes' bes'4~ bes'8 bes'4 bes'8 |
	bes'4 bes'8 bes'~ bes' bes'4 bes'8~ |
	bes'2 r8 f'4 ees'8 |
	f'4 f'8 f'~ f' f'4 f'8~ |
	%%15
	f' f'4 f'8~ f' f' f'4 |
	f' f'8 f'~ f' f'4 bes'8~ |
	bes'2. r4 |
	bes'8 c'' des'' ees'' des'' c'' bes' aes' |
	ges' f' ees' des' c' des' ees' f' |
	%%20
	c'4. bes8 r c' des' ees' |
	c'4. bes8~ bes4 r |
	aes'8 bes' ces'' des'' ces'' bes' aes' g' |
	fes' ees' des' ces' bes ces' des' ees' |
	bes4. aes8 r bes ces' ees' |
	%%25
	ges'4. f'8 r f'4 f'8 |
	f'4 f'8 f' f'~ f'4 f'8~ |
	f'4. f'8 r f'4 f'8 |
	f'4 f'8 f'~ f' f'4 f'8~ |
	f'2 r8 f'4 f'8 |
	%%30
	f'4 f'8 f'~ f' f'4 f'8~ |
	f'4. f'8 r f'4 f'8 |
	f'4 f'8 f'~ f' f'4 f'8~ |
	f'2 r8 bes'4 bes'8 |
	bes'4 bes'8 bes'~ bes' bes'4 bes'8~ |
	%%35
	bes'4. bes'8 r bes'4 bes'8 |
	bes'4 bes'8 bes'~ bes' bes'4 bes'8~ |
	bes'2 r8 bes'4 bes'8 |
	bes'4 bes'8 bes'~ bes' bes'4 bes'8~ |
	bes' bes'4 bes'8 bes'4 bes'~ |
	%%40
	bes' bes'8 bes'~ bes' bes'4 bes'8~ |
	bes'2 r8 f'4 f'8 |
}
% endif

% if part=='LyricsUnknown':
\lyrics {
	This is just a lit __ -- tle sam __ -- ba
	built up -- on a sin __ -- gle note. __
	Oth -- er notes are bound __ to fol __ -- low
	but the root is still __ that note. __

	Now the new one is __ the con __ -- se -- quence __
	of the one we've just __ been through __
	as I'm bound to be __ the un __ -- a -- void __ -- a -- ble
	con -- se -- quence __ of you. __

	There's so man -- y peo -- ple who can talk and talk and talk
	and just say no -- thing or near -- ly no -- thing __

	I have used up all the scale I know and at the end I've come to no -- thing
	or near -- ly no -- thing __

	So I come back to __ my first __ note as I must come back __ to you.__
	I will pour in -- to __ that one __ note all the love I feel __ for you __
	A -- ny -- one who wants __ the whole __ show, Re, Mi, Fa, Sol, La, __ Te, Doh. __
	he will find him -- self __ with no __ show.
	Bet -- ter play __ the note __ you know. __
}
% endif
