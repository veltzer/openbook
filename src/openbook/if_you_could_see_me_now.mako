<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	attributes['title']='If You Could See Me Now'
	attributes['style']='Jazz'
	# from the real book
	attributes['composer']='Tadd Dameron'
	# from wikipedia
	attributes['poet']='Carl Sigman'
	# from the real book
	attributes['piece']='Ballad'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='e259226a-11ac-11e1-90cb-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='rbk2:157,file:if_you_could_see_me_now_wikifonia.pdf'

	attributes['idyoutuberemark1']='Sarah Vaughan'
	attributes['idyoutube1']='ySI5ZPhf5Lw'
	attributes['idyoutuberemark2']='Bill Evans (amazing version)'
	attributes['idyoutube2']='NXUxR4wunaE'
	attributes['lyricsurl']='http://www.metrolyrics.com/if-you-could-see-me-now-lyrics-natalie-cole.html'

%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- brought in the wikifonia epdf.
	- added lyrics url.
	- wrote the real book chords.
	- wrote the real book tune.
	- wrote the real book lyrics.
	- checked the real book chords.
	- checked the real book lyrics.
	- checked the real book tune.
	- heard the real book tune to make sure the tempo and tune is right.
	- put in you tube performances.
	TODO:
	- do the wikifonia version.
	- bring in copyright info from somewhere.
	REMARKS:
	- I did lots of fixes to the chords in the real book version:
		- the second volta has really ugly chords. Fixed them up to join nicely with the part "B".
		- the part "B" in the real book lack chords for a whole bar after c:m f7. Put good chords there.
		- the ending does not end with ees:maj7. Fixed it to be so.
		- in the first part "A" the real book says ges:m7 b:7 and should say fis:m7 b:7.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		ees1:maj7 | aes:7 | ees:maj7 | aes:7 | \myEndLine
		g2:m7 fis4:m7 b:7 | f2:m7 bes:7 |
	} \alternative {
		{
			g:7.5+ c:7 | f:m7 bes:7 | \myEndLineVoltaNotLast
		}
		{
			a:m7.5- aes:m7 | g:m7 c4:m7 bes:m7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	a2:m7 d:7 | b:m7 e:7 | a:m7 d:7 | b:m7 e:7 | \myEndLine
	a:m7 c4:m7 f:7 | bes2:maj7 g:m7 | c:m7 f:7 | f:m7 bes:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	ees1:maj7 | aes:7 | ees:maj7 | aes:7 | \myEndLine
	g2:m7 fis4:m7 b:7 | f2:m7 bes:7 | ees \LPC ges:maj7 | b:maj7 e4:maj7 \RPC ees:maj7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Adagio" 4 = 76
	\time 4/4
	\key ees \major

	\repeat volta 2 {

		%% part "A"
		d8 ees g bes d c bes g | bes a aes bes f2 | d8 ees g bes d c bes g | bes a aes bes f4. g8 |
		bes4 g8 bes b e, ees4 | c' aes8 f d'4. bes8 |
	} \alternative {
		{
			g1~ | g2. r4 |
		}
		{
			ees'1~ | ees |
		}
	}

	%% part "B"
	d4 d8 d d4 e8 bes | \tuplet 3/2 { b4 b b } b c8 d | a4 a8 a a4 b8 c | d2. e,4 |
	b'8 a g a bes c d ees | f2 r8 d c bes | ees2 r8 c bes a | bes1 |

	%% part "A"
	d,8 ees g bes d c bes g | bes a aes bes f2 | d8 ees g bes d c bes g | bes a aes bes f4. g8 |
	bes4 g8 bes b e, ees4 | c' aes8 f d'4. bes8 | ees1~ | ees2. r4 |
}
% endif

% if part=='LyricsReal':
\lyricmode {

	%% part "A"
	_ If you could see me now you'd know how blue I've been.
	_ One look is all you'd need to see the mood I'm in.
	Per -- haps then you'd re -- al -- ize
	I'm still in love with you. __

	%% part "Volta"
	_

	%% part "B"
	You'll happen my way on some mem -- 'ra -- ble day
	and the month will be May for a while.
	I'll try to smile but can I play the part with -- out my heart
	be -- hind the smile?

	%% part "B"
	_ The way I feel for you I nev -- er could dis -- guise.
	_ The look of love is writ -- ten plain -- ly in my eyes.
	I think you'd be mine a -- gain
	if you could see me now. __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	_ If you could see me now you'd find me be -- ing brave,
	_ and try -- in aw -- f'lly hard to make my tears be -- have.
	But that's quite im -- pos -- si -- ble.
	I'm still in love with _ you. __
}
% endif
