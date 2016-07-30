<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Newreal', version)
	attributes.setDefaultVersionName('Newreal')

	attributes['title']='The Way You Look Tonight'
	attributes['style']='Jazz'
	# from the new real book of jazz vol 1
	attributes['composer']='Jerome Kern'
	# from the new real book of jazz vol 1
	attributes['poet']='Dorothy Fields'
	# from the new real book of jazz vol 1
	attributes['piece']='Med.-Up Swing'
	# from the new real book of jazz vol 1
	attributes['copyright']='1936 T B Harms Co.'
	# from the new real book of jazz vol 1
	attributes['copyrightextra']='Copyright Renewed c/o The Welk Music Group, Santa Monica, CA 90401 Authorized Selling Agent in Japan High Note Publishing Co, Ltd, used by permission of JASRAC License #8670719. International Copyright Secured. All Right Reserved. Used By Permission.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='30fc7894-d8f8-11e3-84a6-77203dda2123'
	attributes['structure']='AABA'
	attributes['structureremark']='The New Real Book marks this one as AABC but the C is too damn close to the A'
	attributes['location']='nrbk1:395-396'

	attributes['idyoutuberemark1']='The cannonical performance by Frank Sinatra'
	attributes['idyoutube1']='h9ZGKALMMuc'
	attributes['idyoutuberemark2']='Nat King Cole in a great version'
	attributes['idyoutube2']='qLVvHtKUrdQ'
	attributes['idyoutuberemark3']='Monk and Rollins in an instrumental version'
	attributes['idyoutube3']='V0fPYzyB2AQ'
	attributes['lyricsurl']='http://www.lyrics007.com/Frank%20Sinatra%20Lyrics/The%20Way%20You%20Look%20Tonight%20Lyrics.html'
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the epdf from the new real book
	- filled in the meta data from the new real book.
	- added a lyrics url.
	- added youtube performances.
	- wrote down the new real book vol1 chords.
	- wrote down the new real book vol1 tune.
	- wrote down the new real book vol1 lyrics.
	- played the midi to hear that it sounds right.
	- check the new real book vol1 chords.
	- check the new real book vol1 tune.
	- check the new real book vol1 lyrics.
	TODO:
	- there is a second voice which is already written in the notes of the new real book vol1 version
	but which is marked out because of lyrics adjustment problems. Enable it.
	- there are more details (senor, fine, etc) in the new real book vol1 version which are not there.
	- add another version of this tune.
% endif

% if part=='ChordsNewreal':
\chordmode {
	\startChords
	\startSong

	\myMark "Instr."
	\repeat volta 2 {
		f2:6 d:m7 | g:m9 c:7 | f:maj7 d:m7 | g:m9 c:7 | \myEndLine
	}

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f1:maj7 | d:m7 | g:m7 | c:7 | \myEndLine
		f2:maj7 ees:13 | d1:7 | g:m7 | c:7 | \myEndLine
		c:m7.11 | f:7 | bes:maj7 | g2:m7 c:7 | \myEndLine
		f:6 d:m7 | g:m9 c:7 | f:maj7 d:m7 |
	} \alternative {
		{
			g:m9 c:7 | \myEndLineVoltaNotLast
		}
		{
			bes:m7 ees:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	aes1:maj7 | a:dim7 | bes:m7 | ees:7 | \myEndLine
	aes:maj7 | c2:m7 b:dim7 | bes1:m7 | ees:9 | \myEndLine
	aes:maj7 | a:dim7 | bes:m7 | ees:13 | \myEndLine
	aes:maj7 | des:maj7 | g:m7.11 | c:7 | \myEndLine
	\endPart

	\myMark "C"
	\startPart
	f1:maj7 | d:m7 | g:m7 | c:7 | \myEndLine
	f2:maj7 ees:13 | d1:7 | g:m7 | c:7 | \myEndLine
	c:m7.11 | f:7 | bes:maj7 | g2:m7 c:7 | \myEndLine
	f:6 d:m7 | g:m9 c:7 | f:maj7 d:m7 | g:m9 c:7 | \myEndLine
	g1:m7 | c:7 | f2:6 d:m7 | g:m7 c:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceNewreal':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

	%% part "Instr."
	\repeat volta 2 {
		r4 c' d2 | r4 a' g2 | r4 e d2 | r4 a g2 |
	}

	%% part "A"
	%%\mark \markup { \musicglyph #"scripts.segno" }
	\repeat volta 2 {
		c1 | f, | g4 a bes a | g1 |
		a4 bes c bes | a1 | bes4 c d c | bes c d e |
		f1 | f, | g4 a c bes | a2 g |
		%%<< { r4 c d2 } \\ { f,1 } >> | << { r4 a' g2 } \\ { r1 } >> | << { r4 e d2 } \\ { r1 } >> |
		f1 | r1 | r1 |
	} \alternative {
		{
			%%<< { r4 a g2} \\ { r4 d e g } >> |
			r4 d e g |
		}
		{
			%%<< { r1 } \\ { r4 aes g2 } >> |
			r1 |
		}
	}

	%% part "B"
	c2 c | c c | c4 ees des bes~ | bes1 |
	bes4 c aes g~ | g2 aes | f'1~ | f2. r4 |
	ees2 ees | ees ees | ees4 f des c~ | c1 |
	bes4 c2 aes4 | g2 aes | c1~ | c2. r4 |

	%% part "C"
	c1 | f, | g4 a bes a | g1 |
	a4 bes c bes | a1 | bes4 c d c | bes c d e |
	f1 | f, | g4 a c bes | a2 g |
	%%<< { r4 c d2 } \\ { f,1 } >> | << { r4 a' g2 } \\ { r1 } >> | << { r4 e d2 } \\ { r1 } >> | << { r4 a g2} \\ { r1 } >> |
	f1 | r1 | r1 | r1 |
	g4 a c bes | a2 g | f4 r r2 | r1 |
}
% endif

% if part=='LyricsNewreal':
\lyricmode {

	%% part "Instr."
	_ _ _ _ _ _ _ _

	%% part "A"
	Some -- day when I'm aw -- fly low,
	When the world is cold,
	I will feel a glow just think -- ing
	of you,
	And the way you look to -- night.
	Oh, but you're

	%% part "B"
	With each word your ten -- der -- ness grows, __
	tear -- ing my fear __ a -- part, __
	And that laugh that wrin -- kles your nose __
	touch -- es my fool -- ish heart. __

	%% part "C"
	Love -- ly, nev -- er, nev -- er change,
	Keep that breath -- less charm,
	Won't you please ar -- range it 'cause I love you,
	Just the way you look to -- night,
	Just the way you look to -- night.
}
% endif

% if part=='LyricsmoreNewreal':
\lyricmode {

	%% part "Instr."
	_ _ _ _ _ _ _ _

	%% part "A"
	Love -- ly, with your smile so warm,
	And your cheek so soft,
	There is noth -- ing for me but to
	love you,
	Just the way you look to -- night.
}
% endif
