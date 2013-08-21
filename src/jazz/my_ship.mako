<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="My Ship"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['subtitle']="From The Musical Production 'LADY IN THE DARK'"
	# this is from the fake book
	attributes['composer']="Kurt Weil"
	# this is from the fake book
	attributes['poet']="Ira Gershwin"
	# this is from the fake book
	attributes['piece']="Moderately Slow"
	# this is from the fake book
	attributes['copyright']="1941 and renewed 1969 Hampshire House Publishing Corp. and Chappell & Co., Inc., New York, NY"
	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"

	attributes['completion']="5"
	attributes['uuid']="ffe98a96-0a4c-11e3-bcaf-3b8eec526bc3"
	# my own
	attributes['structure']="AABA"
	attributes['locations']="fb:268,269"

	attributes['idyoutuberemark']="Hancock, Brecker and Hargrove"
	attributes['idyoutube']="QTHYSBAZJrQ"
	attributes['idyoutuberemark']="Ella and Joe Pass"
	attributes['idyoutube']="UEOll-nNy4I"
	attributes['lyricsurl']="http://www.stlyrics.com/lyrics/ladyinthedark/myship.htm"
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the meta data from the fake book.
	- filled in structure and fake book location on my own.
	- fill in the fake book chords.
	- fill in the fake book lyrics.
	- fill in the fake book tune.
	- check the fake book chords.
	- check the fake book tune.
	- check the fake book lyrics.
	- hear that the fake book tune sounds well.
	- add youtube performances.
	- add a lyrics url.
	TODO:
	- get another version of this tune in here.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong
	\partial 4 s4

	\repeat volta 2 {
		\myMark "A"
		\startPart
		f2 d:7 | g:m7 c:7 | f d:7 | g:m7 c:7 | \myEndLine
		f d:7 | g:m a:7 | d:m7 g:7 | g:m7 c:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		f2 d:7 | g:m7 c:7 | f d:7 | g:m7 c:7 | \myEndLine
		f d:7 | g:m a:7 | d:m g:m7 | f d:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		g:m7 c:7 | g:m7 c:7 | g:m7 c:7 | f e:7 | \myEndLine
		a:m d:m7 | a:m d:m7 | g:7 g:dim7 | g:7 c:9 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		f2 d:7 | g:m7 c:7 | f d:7 | g:m7 c:7 | \myEndLine
		f d:7 | g:m a:7 |
	} \alternative {
		{
			d:m g4.:m7 c8:7 | f2. c4:7 | %% \myEndLine
		}
		{
			d2:m c:7 | f c:7 | \myEndLine
			f d:m | bes c:7 | f d:m7 | g:m7.5- c:7 | f des:7 | f1 | \myEndLine
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c' {
	\time 4/4
	\key f \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Moderato" 4 = 100

	\partial 4 c4 |

	\repeat volta 2 {
		%% A part
		d f c' a8 c | a4 d, d r8 c | d4 f c' c | d,2. c8 cis |
		d4 f d' c8 d | c4 bes a e8 f | g1~ | g2. c,4 |

		%% A part
		d f c' a8 c | a4 d, d4. c8 | d4 f c' c | d,2. r8 c |
		d4 f d' c8 d | c4 bes a e8 f | g2 g | f2 r4 a8 c |

		%% B part
		bes4 a g4. c8 | bes4 a g2 | d'4 bes g f | a2. b!8 d |
		c4 b! a r8 d | c4 b! a b8 c | d4 b! g e | d2. c4 |

		%% A part
		d f c' a8 c | a4 d, d4. c8 | d4 f c' c | d,2. c8 cis |
		d4 f d' c8 d | c4 bes a4. g8 |
	} \alternative {
		{
			f4. f8 d'4. e,8 | f2 r4 c |
		}
		{
			f4. f8 g4. g8 | a2. c8 c | b!4 c f e8 f | e4 d c bes | c2 f | f, g | f1~ | f4 r r2 |
		}
	}
}
% endif

% if part=='LyricsFake':
%% this is from the fake book
\lyricmode {
	%% A part
	My Ship has sails that are made of silk,
	the decks are trimmed with gold.
	And of jam and spice there's a par -- a -- dise in the hold. __

	%% A part
	My Ship's a -- glow with a mil -- lion pearls and ru -- bies fill each bin;
	the sun sits high in a sap -- phire sky when my ship comes in.

	%% B part
	I can wait the years 'til it ap -- pears one fine day one spring,
	but the pearls and such the won't mean much if there's miss -- ing just one thing.

	%% A part
	I do not care if that day ar -- rives, that dream need nev -- er be,
	if the ship I sing does -- n't al -- so bring my own true love to me.

	%% ending
	My own true love to me,
	if the ship I sing does -- n't al -- so bring my own true love to me. __
}
% endif
