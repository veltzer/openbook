<%page args='part'/>
% if part=='Vars':
<%
	from scripts import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.add_version('Fake', version)
	attributes.set_default_version_name('Fake')

	attributes['title']='A Nightingale Sang in Berkeley Square'
	attributes['style']='Jazz'
	attributes['composer']='Manning Sherwin'
	attributes['poet']='Eric Maschwitz'
	attributes['piece']='Slowly'
	attributes['copyright']='1951, Bourne Co. Copyright Renewed.'
	attributes['copyrightextra']='Sole Selling Agent-Shapiro, Bernstein & Co., Inc., New York, NY'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='f8e2cbc2-da80-11e3-a7c9-dbe4f674fe15'
	attributes['structure']='AABBA'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\repeat volta 2 {

		\myMark "A"
		\startPart
		ees2:maj7 c:m7 | g:m7 ees:7 | aes g:7 | c:m7 aes:m6 | \myEndLine
		ees:maj7 bes:7 | ees:7 aes4:m7 des:7 | ees2:maj7 c:m7 | f:m7 bes:7 | ees:6 c:m7 | \myEndLine
		f:m7 bes:7 |
		\endPart

		\myMark "A"
		\startPart
		ees:maj7 c:m7 | g:m7 ees:7 | aes:maj7 g:7 | c:m7 aes:m6 | \myEndLine
		ees:maj7 bes:7 | ees:7 aes4:m7 des:7 | ees2:maj7 c:m7 | f:m7 bes:7 | ees:6 c4:m7 c:m7/bes | a2:m7.5- d:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		g e:m7 | a:m7 d4:7 d:7/c | b2:m7 bes:dim7 | a:m7 d:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		g e:m7 | a:m7 d4:7 d:7/c | b2:m7 bes:dim7 | f:m7 bes:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		ees2:maj7 c:m7 | g:m7 ees:7 | aes g:7 | c:m7 aes:m6 | \myEndLine
		ees bes:7 | ees:7 aes4:m7 des:7 | ees,2 c:m7 | f:m7 bes:7 |
	} \alternative {
		{
			ees c:m7 | f:m7 bes:7 | \myEndLineVoltaNotLast
		}
		{
			ees c:m7 | f:m7 bes4:7 bes:7/aes | g2:m7.5- c:7 | f:m7.5- aes4/bes bes:7 | ees2 c4:m c:m7/bes | aes2:m6 ees:6 | \myEndLineVoltaLast
		}
	}
	\myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key ees \major

	\partial 8 bes8 |

	\repeat volta 2 {
		g'4 g ees4. ees8 | bes'4 bes g ees8 ees | \tuplet 3/2 { c'4 c c d d d } | ees2. ees8 ees |
		d4 bes c4. aes8 | bes4 ees, bes' aes8 aes | g aes bes4 ees, ees | ees2 f | ees1 |
		r2 r4 r8 bes | g'4 g ees4. ees8 | bes'4 bes g ees8 ees | \tuplet 3/2 { c'4 c c d d d } | ees2. ees4 |
		d4 bes c4. aes8 | bes4 ees, bes'4. aes8 | g aes bes4 ees, ees | ees2 f | ees1 | r |
		r8. d16 e8. fis16 g8. a16 b8. c16 | d8 d4 b8~ b4. b8 | a4 a fis4. fis8 | e4 e d2 |
		r8. d16 e8. fis16 g8. a16 b8. c16 | d8 d4 b8~ b4. b8 | a4 a g4. g8 | c4 c bes4. bes,8 |
		g'4 g ees4. ees8 | bes'4 bes g ees8 ees | \tuplet 3/2 { c'4 c c d d d } | ees2. ees4 | d bes c4. aes8 |
		bes4 ees, bes'4. aes8 | g8 aes bes4 ees, ees | ees2 f |
	} \alternative {
		{
			ees1~ | ees4 r r r8 bes8 |
		}
		{
			ees1 | r8 c' bes aes g4 f | g1 | r8 aes g f ees4 d | ees1~ ees2. r4 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	That cer -- tain night, the night we met there was ma -- gic a -- broad in the air, there were
	an -- gels din -- in at the Ritz, and A Nigh -- in -- gale Sang In Ber -- k'ley Square.
	I may be right, I may be wrong, but I'm per -- fect -- ly will -- ing to swear that
	when you turn'd and smiled at me A Night -- in gale Sang In Ber -- k'ley Square.
	The moon that lin -- gered o -- ver Lon -- don town, __ poor Puz -- zled moon, he wore a frown.
	How could he know we two were so in love. __ The whole darn world seemed up -- side down, the
	streets of town were paved with stars. It was such a ro -- man -- tic af -- fair, and as we kiss'd and
	said "\"good" -- "night\"" A Night -- in gale Sang In Ber -- k'ley Square. __ How Square.
	I know, 'cause I was there that night in Ber -- k'ly Square. __
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {
	_
	strange it ws, how sweet and strange. There was nev -- er a dream to com -- pare with that
	ha -- zy, cra -- zy night we met, when A Night -- in -- gale Sang In Ber -- k'ley Square.
	This heart of mine beat loud and fast like a mer -- ry -- go -- round in a fair. For
	we were dan -- cing cheek to cheek "and A" Night -- in -- gale Sang In Ber -- k'ley Square.
	When dawn came steal -- ing up all gold and blue __ to in -- ter -- rupt our ren -- dez -- vous,
	I still re -- mem -- ber how you smiled and said __ "\"was" that a dream of was it "true?\"" our
	home -- ward step was just as light as the tap -- dan -- cing feet of As -- taire and like an e -- cho
	far a -- way A Night -- in -- gale Sang In Ber -- k'ley Square. __
}
% endif
