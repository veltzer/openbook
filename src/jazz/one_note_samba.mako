<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Real"

	attributes['title']="One Note Samba"
	attributes['style']="Jazz"
	attributes['subtitle']="Samba de uma nota so"
	attributes['composer']="Antonio Carlos Jobim"
	attributes['poet']="Newton Mendonca"
	attributes['copyright']="1961, 1962 by Antonio Carlos Jobim and Mrs. Mendonca, Brazil"
	attributes['copyrightextra']="Sole Selling Agent Duchess Music Croporation (MCA), New York, NY for all English Speaking Countries"
	# this is from the fake book
	attributes['piece']="Samba"

	attributes['completion']="5"
	attributes['uuid']="21bc8284-a26f-11df-a829-0019d11e5a41"
	attributes['structure']="ABA'"

	attributes['idyoutuberemark']="Dizzy Gilespie in a great version"
	attributes['idyoutube']="Jb7LqPmWBKw"
	attributes['idyoutuberemark']="The only performance of Jobim in Japan"
	attributes['idyoutube']="eEkMwotUuic"
	attributes['lyricsurl']="http://www.lyricsfreak.com/f/frank+sinatra/one+note+samba_10122272.html"
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the meta data.
	- brought in fake book epdf.
	- brought in real book epdf.
	- put in the real book chords.
	- put in the real book tune.
	- put in the real book lyrics.
	- filled in the meta data (from the fake book).
	- checked the chords in the real book version.
	- checked the tune in the real book version.
	- checked the lyrics in the real book version.
	- hear the tune to make sure it sounds good.
	- added youtube performances.
	- added lyrics url.
	TODO:
	- add the fake book version.
	REMARKS:
	- I added turn around notes at the end of the real book version.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 2 s2 |

	\mark "A"
	\startPart
	d1:m7 | des:7 | c:m7 | b:7.5- | \myEndLine
	d:m7 | des:7 | c:m7 | b:7.5- | \myEndLine
	f:m7 | bes:7 | ees:maj7 | aes:7 | \myEndLine
	d:m7 | des:7 | c2:m7 b:7.5- | bes1:6 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	ees:m7 | aes:7 | des1*2:maj7 | \myEndLine
	des1:m7 | ges:7 | ces:maj7 | c2:m7.5- b:7.5- | \myEndLine
	\endPart

	\mark "A'"
	\startPart
	d1:m7 | des:7 | c:m7 | b:7.5- | \myEndLine
	d:m7 | des:7 | c:m7 | b:7.5- | \myEndLine
	f:m7 | bes:7 | ees:maj7 | aes:7 | \myEndLine
	des:6 | c:7 | b:maj7 | bes:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key bes \major

	\partial 2 r8 f4 f8 |

	%% part "A"
	f4 f8 f~ f f4 f8~ | f f4. r8 f4 f8 | f4 f8 f~ f f4 f8~ | f2 r8 f4 f8 |
	f4 f8 f~ f f4 f8~ | f f4. r8 f4 f8 | f4 f8 f~ f f4 f8~ | f2 r8 bes4 bes8 |
	bes4 bes8 bes~ bes bes4 bes8~ | bes bes4. r8 bes4 bes8 | bes4 bes8 bes~ bes bes4 bes8~ | bes4. r8 r f4 f8 |
	f4 f8 f~ f f4 f8~ | f f4 f8~ f f f4 | f f8 f~ f f4 bes8-^ | r1 |

	%% part "B"
	bes8 c des ees des c bes aes | ges f ees des c des ees f | c4. bes8 r c des f | c4. bes8 r2 |
	aes'8 bes ces des ces bes aes ges | fes ees des ces bes ces des ees | bes4. aes8 r bes ces ees | ges4. f8 r f4 f8 |

	%% part "A"
	f4 f8 f f~ f4 f8~ | f f4. r8 f4 f8 | f4 f8 f~ f f4 f8~ | f2 r8 f4 f8 |
	f4 f8 f~ f f4 f8~ | f f4. r8 f4 f8 | f4 f8 f~ f f4 f8~ | f2 r8 bes4 bes8 |
	bes4 bes8 bes~ bes bes4 bes8~ | bes bes4. r8 bes4 bes8 | bes4 bes8 bes~ bes bes4 bes8~ | bes2 r8 bes4 bes8 |
	bes4 bes8 bes~ bes bes4 bes8~ | bes bes4 bes8 bes4 bes~ | bes bes8 bes~ bes bes4 bes8-^ | r2 r8 <\parenthesize f>4 <\parenthesize f>8 |
}
% endif

% if part=='LyricsReal':
%% these are lyrics copied from the internet and adjusted for real book
\lyricmode {
	%% part A
	This is just a lit __ -- tle sam __ -- ba
	built up -- on a sin __ -- gle note. __
	Oth -- er notes are bound __ to fol __ -- low
	but the root is still __ that note. __

	Now the new one is __ the con __ -- sequence __
	of the one we've just __ been through __
	as I'm bound to be __ the un __ -- a -- void __ -- a -- ble
	con -- se -- quence __ of you. __

	%% part B
	There's so man -- y peo -- ple who can talk and talk and talk
	and just say no -- thing or near -- ly no -- thing
	I have used up all the scale I know and at the end I've come to no -- thing
	or near -- ly no -- thing

	%% part A
	So I come back to my first __ note as I must come back __ to you. __
	I will pour in -- to __ that one __ note all the love I feel __ for you __
	A -- ny -- one who wants __ the whole __ show, Re, Mi, Fa, Sol, La, __ Te, Doh. __
	he will find him -- self __ with no __ show.
	Bet -- ter play __ the note __ you know.
}
% endif
