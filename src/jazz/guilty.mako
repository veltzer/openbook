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

	attributes['title']='Guilty'
	attributes['style']='Jazz'
	attributes['composer']='Gus Kahn, Harry Akst, Richard A. Whiting'
	attributes['poet']='Gus Kahn, Harry Akst, Richard A. Whiting'
	attributes['piece']='Slowly'
	attributes['copyright']='1931 (Renewed 1958) Whiting Publishing and EMI Feist Catalog Inc.'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='16154c88-da81-11e3-b38d-b75a4937af0f'
	attributes['structure']='AABA'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- mark what has been done to this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		bes4 f:m/aes g:7.5+ g:7 | c:m c:m/bes a:7.5+ a:7 | bes2:maj7 bes:7.5+ | ees:maj7 ees:m | \myEndLine
		bes/d des:dim7 | c:m7 f:7 |
	} \alternative {
		{
			c:m7 f:7.5+ | bes f:7 | \myEndLineVoltaNotLast
		}
		{
			c:m7 f:7 | bes a:7 | \myEndLineVoltaLast
		}
	}
	\myEndLine
	\endPart

	\myMark "B"
	\startPart
	d:m d4:m7+ d:m7 | e2:m7.5- a4:7.5+ a:7 | d2:m d:m7 | e:m7 a4:7.5+ a:7 | \myEndLine
	f1:6/c | g2:m7/c f4:6 fis:dim7 | g2:m7 c:9 | f:sus4.9 f:7.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	bes4 f:m/aes g:7.5+ g:7 | c:m c:m/bes a:7.5+ a:7 | bes2:maj7 bes:7.5+ | ees:maj7 ees:m | \myEndLine
	bes/d des:dim7 | c:m7 f:7 | c4:m f2:sus4.9 f4:7.9- | bes aes:6 bes:6 r | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Moderato" 4 = 100
	\time 4/4
	\key bes \major

	%% part "A"
	\repeat volta 2 {
		f8 g f g~ g2 | g8 a g a~ a2 | a8 bes a bes~ bes a bes4 | d2 c |
		c8 bes a g~ g a bes4 | f4 f2. |
	} \alternative {
		{
			\times 2/3 { f4 c f } cis a'8 g~ | g2. r4 |
		}
		{
			g8 ees g4 a8 bes c bes~ | bes2. r4 |
		}
	}

	%% part "B"
	a8 f g a~ a2 | a8 c bes a~ a2 | d8 c bes a~ a f g4 | a1 |
	c8 a bes c~ c2 | bes8 c d c~ c4. a8 | c g a bes~ bes c d4 | c2. r4 |

	%% part "A"
	f,8 g f g~ g2 | g8 a g a~ a2 | a8 bes a bes~ bes a bes4 | d2 c |
	c8 bes a g~ g a bes4 | f4 f2. | ees'8 d ees c~ c4 d | bes2. r4\fermata |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Is it a sin, __ is it a crime, __ lov -- ing you dar, __ like i do? __ _ If it's a crime __ then I'm
	Guilt -- y, Guilt -- y of lov -- ing you. __ Guit -- y of dream -- ing of you. __
	What can I do, __ what can I say, __ af -- ter I've tak -- en the blame? You say you're thu, __
	you'll go your way __ but I'll al -- ways feel __ just the same. May -- be I'm right, __ may -- by I'm wrong.
	lov -- ing you dear, __ like I do. __ _ If it's a crime __ then I'm Gilt -- y, Guilt -- y of love -- ing you.
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {
	May -- be I'm wrong __ dream -- ing of you, __ dream -- ing the lone -- ly night thru, __ _
}
% endif
