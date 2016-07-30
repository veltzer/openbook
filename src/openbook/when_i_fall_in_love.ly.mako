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

	attributes['title']='When I Fall In Love'
	attributes['style']='Jazz'
	# from the fake book
	attributes['composer']='Victor Young'
	# from the fake book
	attributes['poet']='Edward Heyman'
	# from the fake book
	attributes['piece']='Moderately'
	# from the fake book
	attributes['copyright']='1952 by Victor Young Publications, Inc. Copyright Renewed, Assigned to Chappell & Co., Inc. and Intersong -USA,Inc.'
	# from the fake book
	attributes['copyrightextra']='All Rights Administered by Chappell & Co., Inc.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='4e2019f6-f9ef-11e1-b796-174ce4bd9471'
	attributes['structure']='ABAC'
	attributes['structureremark']='You can think of this as AB but its really an ABAC tune'
	attributes['location']='jfb:423,rbk1:461'

	attributes['idyoutuberemark1']='Nat King Cole in an excellent lyric version'
	attributes['idyoutube1']='GfAb0gNPy6s'
	attributes['idyoutuberemark2']='Bill Evans Trio (Wow!)'
	attributes['idyoutube2']='adPpG0Dnxeg'
	attributes['lyricsurl']='http://www.lyricsfreak.com/n/nat+king+cole/when+i+fall+in+love_20098122.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added the real book epdf.
	- added the fake book epdf.
	- filled in the tunes structure.
	- filled in the tunes meta data from the fake book.
	- filled in the lyrics url.
	- filled in youtube performances.
	- filled in the fake book lyrics.
	- filled in the fake book chords.
	- filled in the fake book tune.
	- checked the fake book chords.
	- checked the fake book lyrics.
	- checked the fake book tune.
	- heard that the fake book version sounds good.
	- adjusted the fake book tunes speed.
	TODO:
	- add the real book version (epdf is already here).
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		ees2 c:7.9-.5+ | f:m7 bes:7 | ees c:7.9-.5+ | f:m7 bes:7 | \myEndLine
		ees1 | des2:9 c:9.5+ | f1:m7 | bes:7.9- | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		ees1 | f2:m7 bes:7 | g1:m7 | c:7 | \myEndLine
		f:m | c:7.9- | f:m7 | bes:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		ees2 c:7.9-.5+ | f:m7 bes:7 | ees c:7.9-.5+ | f:m7 bes:7 | \myEndLine
		ees1 | des2:9 c:9.5+ | f1:m7 | bes:7 | \myEndLine
		\endPart

		\myMark "C"
		\startPart
		ees1 | aes | g2:m7 c:7 | f:m7 des:9 | \myEndLine
		ees c:7.9-.5+ | f:m7 bes:7 |
	} \alternative {
		{
			ees c:m7 | f:m7 bes:7.9- | \myEndLineVoltaNotLast
		}
		{
			ees1*2 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Andante" 4 = 88
	\time 4/4
	\key ees \major

	\repeat volta 2 {

		%% part "A"
		bes4 ees aes g | ees1 | bes4 ees aes g | ees f2. |
		bes,4 ees c' bes | aes2. g4 | f1~ | f2. g8 aes |

		%% part "B"
		bes4. ees,8 ees4 ees | g f2 g8 aes | \tuplet 3/2 { bes4 g aes } \tuplet 3/2 { bes g aes } | bes2. aes8 bes |
		c4. f,8 f4 f | aes g2 aes8 bes | \tuplet 3/2 { c4 aes bes } \tuplet 3/2 { c aes c } | bes1 |

		%% part "A"
		bes,4 ees aes g | ees1 | bes4 ees aes g | ees f2. |
		bes,4 ees c' bes | aes2. g4 | f1~ | f2. g8 aes |

		%% part "C"
		bes4. ees,8 ees4 ees | d' c2 c,4 | c' bes2 c4 | aes2. f4 |
		bes, ees aes g | ees2 f |
	} \alternative {
		{ ees1~ | ees4 r r2 | }
		{ ees1~ | ees2. r4 | }
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	When I Fall In Love
	it will be for -- ev -- er,
	or I'll nev -- er
	fall in love. __

	%% part "B"
	in a rest -- less world like this is,
	love is end -- ed be -- fore it's be -- gun,
	and too man -- y moon -- light kiss -- es
	seem to cool in the warmth of the sun.

	%% part "A"
	When I give my heart
	it will be com -- plete -- ly
	or I'll nev -- er
	give my heart. __

	%% part "C"
	And the mo -- ment I can feel that
	you feel that way too,
	is When I Fall In
	Love with you. __

	%% part "Volta"
	you. __
}
% endif
