<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	# from the fake book
	attributes['title']='Stormy Weather'
	attributes['style']='Jazz'
	# from the fake book
	attributes['subtitle']='Keeps Rainin\' All the Time'
	# this is from the fake book
	attributes['composer']='Harold Arlen'
	# this is from the fake book
	attributes['poet']='Ted Koehler'
	# this is from the fake book
	attributes['piece']='Slowly'
	# this is from the fake book
	attributes['copyright']='1933 MILLIS MUSIC, INC.'
	# this is from the fake book
	attributes['copyrightextra']='Renewed 1961 ARKO MUSIC CORP. This Arrangement 1987 ARKO MUSIC CORP. International Copyright Secured. All Rights Reserved.'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='6204de70-da80-11e3-95e9-fbc293b14fcd'
	attributes['structure']='AABA'
	attributes['location']='jfb:363'

	attributes['idyoutuberemark1']='Ella in a great version'
	attributes['idyoutube1']='ezGHapF8-lY'
	attributes['idyoutuberemark2']='Ella in 1975 with Joe Pass'
	attributes['idyoutube2']='teXOPAFMOp0'
	attributes['lyricsurl']='http://www.lyricsfreak.com/b/billie+holiday/stormy+weather_20018077.html'
%>
% endif

% if part=='Doc':
	DONE:
	- put in the location from the fake book.
	- put in the meta data from the fake book.
	- put in the tune structure.
	- added the chords from the fake book.
	- added the tune from the fake book.
	- added the lyrics from the fake book.
	- checked the chords from the fake book.
	- checked the tune from the fake book.
	- checked the lyrics from the fake book.
	- added youtube performance and lyrics url.
	- heard the tune to find bugs and tempo.
	TODO:
	- get another version of this tune in here.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		g2 gis:dim7 | a:m7 d:9 | g e:7 | a:m7 d:9 | \myEndLine
		g e:7 | a:m7 d:7.5+.9- |
	} \alternative {
		{
			g1 | a2:m7 d:9 | \myEndLineVoltaNotLast
		}
		{
			g2 c | g2 b4:m7 e:7 | a2:m7 d:7.9- | g d4:m7 g:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	%% Jazz Fakebook has the following d:7.5+.9- chord without the augmented, but
	%% given the melody note, and the fact that this exact figure appears in
	%% two other places augmented, I'm assumign this was a typo.
	c1:maj7 | g4/b a:m7 g2:maj7 | c1:maj7 | g2/b a4:m7 g:maj7 | \myEndLine
	c2 cis:dim7 | g/d e:7 | a4:m7 b:7 e2:m7 | a:7 a4:m7 d:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	g2 gis:dim7 | a:m7 d:9 | g e:7 | a:m7 d:9 | \myEndLine
	g e:7 | a:m7 d:7.5+.9- | g1 | a2:m7 d:7.5+.9- | \myEndLine
	g a4:m7 aes:maj7 | g:maj7 c g2:6 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Andante" 4 = 80
	\time 2/2
	\key g \major

	\partial 4 ais'8 b |

	%% part "A"
	\repeat volta 2 {
		d2.~ d8 ais16 b | d8 b d cis c4 ais8 b | d d,4.~ d2 | a'8. a16 a8. a16 a4~ a8 g16 e |
		g8 d4.~ d2 | c8 e g ais~ ais4. ais8 |
	} \alternative {
		{
			b8 g4.~ g2 | r2 r4 ais8 b |
		}
		{
			b8 g4.~ g4 g | e8 d4.~ d2 | c8 e g ais~ ais4. ais8 | b8 g4.~ g2 |
		}
	}

	%% part "B"
	e8. fis16 \tuplet 3/2 { g8 a g~ } g8. g16 g8. g16 | g4. g8 b g4. |
	e8. fis16 \tuplet 3/2 { g8 a g~ } g8. g16 g8. g16 | g4. g8 e d4. | e8. fis16 \tuplet 3/2 { g8 a g~ } g8. g16 g8. g16 | g4. g8 c8 b4. |

	%% part "A"
	d4 b8 a g4 e | a2. ais8 b | d2.~ d8 ais16 b | d8 b d cis c4 ais8 b |
	d d,4.~ d2 | a'8. a16 a8. a16 a4~ a8 g16 e | g8 d4.~ d2 | c8 e g ais~ ais4. ais8 |
	b g4.~ g2 | c,8 e g ais~ ais4. ais8 | b g4.~ g2~ | g2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Don't know

	%% part "Volta"
	why __ there's no sun up in the sky, Storm -- y Weath -- er, __
	since my man and I __ ain't to -- geth -- er, __ keeps rain -- in' all __ the time. __ _
	Life is

	time, __ _ the time. __ _ So wear -- y all __ the time. __ _

	%% part "B"
	When he went a -- way __ the blues walked in and met me. If he stays a -- way __ old rock -- in'
	chair will get me. All I do is pray __ the Lord a -- bove will let me walk in the sun once
	more.

	%% part "A"
	Can't go on, __ ev -- 'ry -- thing I had is gone, Storm -- y Weath -- er, __
	since my man and I __ ain't to -- geth -- er, __ keeps rain -- in' all __ the time. __ _
	Keeps rain -- in' all __ the time. __ _
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {

	%% part "A"
	_ _
	bare __ gloom and mis -- 'ry ev -- 'ry -- where, Storm -- y Weath -- er, __
	just can't get my poor __ self to -- geth -- er, __ I'm wear -- y all __ the
}
% endif
