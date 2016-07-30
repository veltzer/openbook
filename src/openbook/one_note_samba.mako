<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	attributes['title']='One Note Samba'
	attributes['style']='Jazz'
	attributes['subtitle']='Samba de uma nota so'
	attributes['composer']='Antonio Carlos Jobim'
	attributes['poet']='Newton Mendonca'
	# this is from the fake book
	attributes['piece']='Samba'
	attributes['copyright']='1961, 1962 by Antonio Carlos Jobim and Mrs. Mendonca, Brazil'
	attributes['copyrightextra']='Sole Selling Agent Duchess Music Croporation (MCA), New York, NY for all English Speaking Countries'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='21bc8284-a26f-11df-a829-0019d11e5a41'
	attributes['structure']='ABA\''
	attributes['location']='jfb:289,rbk1:331'

	attributes['idyoutuberemark1']='Dizzy Gilespie in a great version'
	attributes['idyoutube1']='Jb7LqPmWBKw'
	attributes['idyoutuberemark2']='The only performance of Jobim in Japan'
	attributes['idyoutube2']='eEkMwotUuic'
	attributes['lyricsurl']='http://www.lyricsfreak.com/f/frank+sinatra/one+note+samba_10122272.html'
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

	\myMark "A"
	\startPart
	d1:m7 | des:7 | c:m7 | b:7.5- | \myEndLine
	d:m7 | des:7 | c:m7 | b:7.5- | \myEndLine
	f:m7 | bes:7 | ees:maj7 | aes:7 | \myEndLine
	d:m7 | des:7 | c2:m7 b:7.5- | bes1:6 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	ees:m7 | aes:7 | des1*2:maj7 | \myEndLine
	des1:m7 | ges:7 | ces:maj7 | c2:m7.5- b:7.5- | \myEndLine
	\endPart

	\myMark "A'"
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
{
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

	%% part "A"
	This is just a lit -- __ tle sam -- __ ba
	built up -- on a sin -- __ gle note. __
	Oth -- er notes are bound __ to fol -- __ low
	but the root is still __ that note. __
	Now the new one is __ the con -- __ sequence __
	of the one we've just __ been through __
	as I'm bound to be __ the un -- __ a -- void -- __ a -- ble
	con -- se -- quence __ of you. __

	%% part "B"
	There's so man -- y peo -- ple who can talk and talk and talk
	and just say no -- thing or near -- ly no -- thing
	I have used up all the scale I know and at the end I've come to no -- thing
	or near -- ly no -- thing

	%% part "A"
	So I come back to my first __ note as I must come back __ to you. __
	I will pour in -- to __ that one __ note all the love I feel __ for you __
	A -- ny -- one who wants __ the whole __ show, Re, Mi, Fa, Sol, La, __ Te, Doh. __
	he will find him -- self __ with no __ show.
	Bet -- ter play __ the note __ you know.
}
% endif
