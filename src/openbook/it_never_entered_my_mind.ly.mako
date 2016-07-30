<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']='It Never Entered My Mind'
	attributes['style']='Jazz'
	# this is from the fake book
	attributes['composer']='Richard Rodgers'
	# this is from the fake book
	attributes['poet']='Lorenz Hart'
	# this is from the fake book
	attributes['piece']='Moderately Slow'
	# this is from the fake book
	attributes['copyright']='1940 by Chappell & Co., Inc. Copyright Renewed'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='3ff5de34-5e09-11e5-83ea-3860779cb560'
	attributes['structure']='AABA'
	attributes['location']='jfb:187'

	attributes['idyoutuberemark1']='Sarah Vaughan in a great orchestral version'
	attributes['idyoutube1']='u37lgz7b3lQ'
	attributes['idyoutuberemark2']='I like this version by Miles. So cool.'
	attributes['idyoutube2']='-Np8PJDGq_A'
	attributes['lyricsurl']='http://www.azlyrics.com/lyrics/franksinatra/itneverenteredmymind.html'
%>
% endif

% if part=='Doc':
	DONE:
	- filled in this tunes meta data from the fake book.
	- filled in this tunes structure.
	- brought in the fake book epdf.
	- added youtube performances.
	- added a lyrics url.
	- filled in the fake book lyrics.
	- filled in the fake book chords.
	- filled in the fake book tune.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- heard that the fake book tune sounds well.
	TODO:
	- bring another version of this tune in here.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		f2 a:m | f a:m | f a:m | f a:m | \myEndLine
		f a:m | f a:m | g1:m7 | g2:m ees4:7/g c:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		f2 a:m | f a:m | f a:m | f a:m | \myEndLine
		f a:m | f a:m | g1:m7 | a2:m c:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		f2 f4:6 g:m7 | g2.:m7 c4:7 | f2:maj7 f4:6 g:m7 | g2.:m7 c4:7 | \myEndLine
		f2:6 c:7 | f b:dim7 | c:7 bes4 a:m7 | bes2 a4:m c:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		f2 a:m | f a:m | f a:m | f a:m | \myEndLine
		f a:m | a:m7.5- d:7 | g:m7 c4:7.11 c:7 | f4 f2.:maj7 | \myEndLine
		g2.:m7 c4:7 |
		\endPart

	} \alternative {
		{
			f2:6 g4:7 c:7 | \myEndLineVoltaNotLast
		}
		{
			f1:6 | \myEndLineVoltaLast
		}
	}

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Andante" 4 = 76
	\time 4/4
	\key f \major

	\repeat volta 2 {

		%% part "A"
		a'4 a a a | r8. a16[ g8. f16] e4 e | r8. f16[ e8. d16] c4 c | f e8 c~ c2 |
		r8. f16[ e8. d16] c4 c | f e8 c~ c2 | r8. d16[ f8. g16] a8 f a g~ | g2. r4 |

		%% part "A"
		a4 a a a | r8. a16[ g8. f16] e4 e | r8. f16[ e8. d16] c4 c | f e8 c~ c2 |
		r8. f16[ e8. d16] c4 c | f e8 c~ c2 | r8. d16[ f8. g16] a8 f a c~ | c2. r4 |

		%% part "B"
		d2 f,4 f~ | f2. e4 | g2 f4 f~ | f2 r4 e |
		a8 a4. bes8 bes4. | c8 c4. d8 d4. | e2 c4 c~ | c2. r4 |

		%% part "A"
		a4 a a a | r8. a16[ g8. f16] e4 e | r8. f16[ e8. d16] c4 c | f e8 c~ c2 |
		r8. f16[ e8. d16] c4 c | c'4 bes8 a~ a2 | r8. bes16[ a8. g16] f4 e | a e8 e~ e2 |
		r8. d16[ f8. g16] a8 f g f~ |
	} \alternative {
		{
			f2 r |
		}
		{
			f2. r4 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Once I laughed when
	I heard you say -- ing
	that I'd be play -- ing
	sol -- i -- taire, __
	un -- eas -- y in my
	eas -- y chair, __
	It Nev -- er En -- tered My Mind. __

	%% part "A"
	Once you told me
	I was mis -- tak -- en
	that I'd a -- wak -- en
	with the sun __
	and or -- der or -- ange juice for one, __
	It Nev -- er En -- tered My Mind. __

	%% part "B"
	You have what __
	I lack my -- self, __
	and now I e -- ven have to scratch
	my back my -- self. __

	%% part "A"
	Once you warned me
	that if you scorned me
	I'd sing the maid -- en's
	pray'r a -- gain, __
	and with that you were there a -- gain __
	to get in -- to my hair a -- gain __
	It Nev -- er En -- tered My Mind. __
}
% endif
