<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Fake', version)
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Fake')

	# from the jazz fake book
	attributes['title']='All The Things You Are'
	attributes['style']='Jazz'
	# from the jazz fake book
	attributes['subtitle']='From \'Very Warm For May\''
	# from the jazz fake book
	attributes['composer']='Jerome Kern'
	# from the jazz fake book
	attributes['poet']='Oscar Hammerstein II'
	# from the jazz fake book
	attributes['piece']='Moderately'
	# from the jazz fake book
	attributes['copyright']='1939 T.B. Harms Company. Copyright Renewed.'
	# from the jazz fake book
	attributes['copyrightextra']='(c/o The Welk Music Group, Santa Monica, CA 90401)'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='a064f20e-fb85-11e0-8d5d-0019d11e5a41'
	attributes['structure']='ABC'
	attributes['location']='rbk1:18,jfb:40'

	attributes['idyoutuberemark1']='Charlie Parker, great performance'
	attributes['idyoutube1']='UTORd2Y_X6U'
	attributes['idyoutuberemark2']='Art Tatum. Brilliant'
	attributes['idyoutube2']='_bPgf_olXeE'
	attributes['lyricsurl']='http://www.lyrics007.com/Jerome%20Kern%20Lyrics/All%20The%20Things%20You%20Are%20Lyrics.html'
%>
% endif

% if part=='Doc':
	DONE:
	- bring in real book pdf.
	- bring in fake book pdf.
	- wrote the real book chords.
	- wrote the real book tune.
	- filled in the meta data from the fake book.
	- write the fake book lyrics fitted for the real book tune.
	- checked the real book chords.
	- check the real book notes.
	- hear the tune, adjust it's speed and see it's ok.
	- check the lyrics.
	- wrote the lyrics for the fake book vesion.
	- wrote the fake book chords.
	- wrote the fake book tune.
	- checked the chords of the fake book version.
	- check the tune of the fake book version.
	- check the lyrics of the fake book version.
	- put you tube performances and lyrics url.
	- put in where the meta data came from.
	TODO:
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	f1:m7 | bes:m7 | ees:7 | aes:maj7 | \myEndLine
	des:maj7 | g:7 | c1*2:maj7 | \myEndLine
	c1:m7 | f:m7 | bes:7 | ees:maj7 | \myEndLine
	aes:maj7 | d:7 | g1*2:maj7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	a1:m7 | d:7 | g1*2:maj7 | \myEndLine
	fis1:m7 | b:7 | e:maj7 | c:7.5+ | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	f1:m7 | bes:m7 | ees:7 | aes:maj7 | \myEndLine
	des:maj7 | des:m7 | c:m7 | b:dim7 | \myEndLine
	bes:m7 | ees:7 | aes:maj7 | \LPC g2:7 \RPC c:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key aes \major

	%% part "A"
	aes'1 | des2. aes4 | g g g g | g c2 g4 |
	f f f f | f b2 f4 | e1~ | e |
	ees | aes2. ees4 | d d d d | d g2 d4 |
	c c c c | \tuplet 3/2 { c d ees } d c | b1~ | b4 d g d' |

	%% part "B"
	d2 c~ | c4 ees, e c' | b1~ | b4 d, g b |
	b2 a~ | a4 bes,? b a' | aes1~ | aes |

	%% part "C"
	aes | des2. aes4 | g g g g | g c2 g4 |
	f1 | ees'2 des | ees,4 ees \tuplet 3/2 { ees ees ees } | g2. f4 |
	des f aes des | f2 g | aes1~ | aes |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

	%% part "A"
	You are the prom -- ised kiss of spring -- time
	That makes the lone -- ly win -- ter seem long. __
	You are the breath -- less hush of eve -- ning
	That trem -- bles on the brink of a love -- ly song. __

	%% part "B"
	You are the angel glow __ that lights a star. __
	The dear -- est things_I know __ are what you are. __

	%% part "C"
	Some day my hap -- py arms will hold you,
	And some day I'll know that mo -- ment di -- vine,
	When All The Things You Are, are mine. __
}
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords

	\startSong

	\myMark "A"
	\startPart
	f1:m7 | bes:m7 | ees:7 | aes:maj7 | \myEndLine
	des:maj7 | g:7 | c1*2:maj7 | \myEndLine
	c1:m7 | f:m7 | bes:7 | ees:maj7 | \myEndLine
	aes:maj7 | a2:m7.5- d:7.9- | g1:maj7 | g2:maj7 e:7.9+ | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	a1:m7 | d:7 | g:maj7 | c:maj7 | \myEndLine
	fis:m7.5- | b:7 | e:maj7 | c:7.5+ | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	f:m7 | bes:m7 | ees:7 | aes:maj7 | \myEndLine
	des:maj7 | des2:m7 ges:7.9 | aes1:maj7 | b:dim7 | \myEndLine
	bes:m7 | ees:7.9 | aes1*2:maj7 | \myEndLine
	\endPart

	\endSong
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key aes \major

	%% part "A"
	aes'1 | des2. aes4 | g g g g | g c2 g4 |
	f f f f | f b2 f4 | e1~ | e |
	ees | aes2. ees4 | d d d d | d g2 d4 |
	c c c c | c d8 ees d4 c | b1~ | b4 d g d' |

	%% part "B"
	d4. c8 c2~ | c4 dis, e c' | b1~ | b4 d, g b |
	b4. a8 a2~ | a4 bes,? b a' | gis1 | r |

	%% part "C"
	aes | des2. aes4 | g g g g | g c2 g4 |
	f1 | ees'2. des4 | ees, ees \tuplet 3/2 { ees ees ees } | g2. f4 |
	des des f aes | f'2 g, | aes1~ | aes2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	You are the prom -- ised kiss of spring -- time
	That makes the lone -- ly win -- ter seem long. __
	You are the breath -- less hush of eve -- ning
	That trem -- bles on the brink of a love -- ly song. __

	%% part "B"
	You are the an -- gel glow __ that lights a star. __
	The dear -- est things I know __ are what you are.

	%% part "C"
	Some day my hap -- py arms will hold you,
	And some day I'll know that mo -- ment di -- vine,
	When All The Things You Are, are mine. __
}
% endif
