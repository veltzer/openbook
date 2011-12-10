<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Real"

	attributes['title']="If You Could See Me Now"
	attributes['style']="Jazz"
	# from the real book
	attributes['composer']="Tadd Dameron"
	# from wikipedia
	attributes['poet']="Carl Sigman"
	# from the real book
	attributes['piece']="Ballad"

	attributes['structure']="AABA"

	attributes['completion']="5"
	attributes['uuid']="e259226a-11ac-11e1-90cb-0019d11e5a41"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']="http://www.metrolyrics.com/if-you-could-see-me-now-lyrics-natalie-cole.html"

%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- added lyrics url.
	TODO:
	- write the real book chords.
	- write the real book tune.
	- write the real book lyrics.
	- check the real book chords.
	- check the real book tune.
	- check the real book lyrics.
	- hear the real book tune to make sure the tempo and tune is right.
	- put in you tube performances.
	- add another version of this tune? (from where?!?)
	- bring in copyright info from somewhere...
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\mark "A"
	\startPart
	\repeat volta 2 {
		ees1:maj7 | aes:7 | ees:maj7 | aes:7 | \myEndLine
		aes:7 | g2:m7 ges4:m7 b:7 | f2:m7 bes:7 | \myEndLine
	} \alternative {
		{
			g:m7 c:7 | f:m7 bes:7 |
		}
		{
			a:m7.5- | aes:maj7 |
		}
	}
	\endPart

	\mark "A"
	\startPart
	\endPart

	\mark "B"
	\startPart
	\endPart

	\mark "A"
	\startPart
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative a {
	\time 4/4
	\key ees \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Adagio" 4 = 76

	%% A part
	d8 ees g bes d c bes g |

	%% A part

	%% B part

	%% A part
}
% endif

% if part=='LyricsReal':
\lyricmode {
	%% A part
	If you could see me now you'd know how blue I've been.
	One look is all you'd need to see the mood I'm in.
	Per -- haps then you'd re -- al -- ize
	I'm still in love with you. __
	%% Volta
	_
	%% B part
	You'll hap -- pen my way on some mem -- 'ra -- ble day
	and the month will be May for a while.
	I'll try to smile but can I play the part with -- out my heart
	be -- hind the smile?
	%% B part
	The way I feel for you I nev -- er could dis -- guise.
	The look of love is writ -- ten plain -- ly in my eyes.
	I think you'd be mine a -- gain
	if you could see me now. __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	%% A part
	If you could see me now you'd find me be -- ing brave,
	and try -- in aw -- f'lly hard to make my tears be -- have.
	But that's quite im -- pos -- si -- ble.
	I'm still in love with _ you. __
}
% endif
