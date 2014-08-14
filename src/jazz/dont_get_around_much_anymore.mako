<%page args="part"/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']="Don't Get Around Much Anymore"
	attributes['style']="Jazz"
	attributes['composer']="Duke Ellington"
	attributes['poet']="Bob Russell"
	attributes['piece']="Medium Swing"
	attributes['copyright']="1973 Herrison Music Corp. and Robbins Music"

	attributes['typesetter']="Jordan Eldredge <jordaneldredge@gmail.com>"
	attributes['completion']="5"
	attributes['uuid']="09a63a8e-da81-11e3-b649-339a89e65802"
	attributes['structure']="AABA"
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- the ends of lines are not right for this tune. check it out.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		s1 | s4 c d:m7 dis8:dim7 c/e | c1/e | c4/e a b:m7 c8:dim7 a:7/cis | \myEndLine
		a1:7/cis | d:7 | g:7 | c4 c/e ees:dim7 d8:m7 c | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		c1 | c4 c d:m7 dis8:dim7 c/e | c1/e | c4/e a b:m7 c8:dim7 a:7/cis | \myEndLine
		a1:7/cis | d:7 | g:7 | c4 c/e ees:dim7 d8:m7 c | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		g2:m7 c:7 | f2..:6 bes8:9 | bes1:9 | c:maj7 | \myEndLine
		c2.:7 c4:7.5+ | d1:7 | fis2:7.5- b:7 | e4:m7 ees:dim7 d4.:7 g8:7 |
		g1:7 | g4:7 c d:m7 dis8:dim7 c/e |
		\endPart

		\myMark "A"
		\startPart
		c1 | c4/e a b:m7 c8:dim7 a:7/cis | a1:7/cis | d:7 | \myEndLine
		g:7 |
	} \alternative {
		{
			c | c | \myEndLineVoltaNotLast
		}
		{
			s4 c/e ees:dim7 d8:m7 c | c1 | c | c:7.9+ | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative {
	\time 2/2
	\key c \major
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130

	%% part "A"
	\repeat volta 2 {
		r8 e'4 d8 c g f4 | e1 | r8 e'4 d8 c g f4 | e1 |
		r8 g4 f8 e d c c'~ | c4. a8~ a2 | r8 e f fis g c, dis e | c1 |
		r8 e'4 d8 c g f4 | e1 | r8 e'4 d8 c g f4 | e1 |
		r8 g4 f8 e d c c'~ | c4. a8~ a2 | r8 e8 f fis g c, dis e | c1 | R1 |
		d'2 c4 a8 c~ | c2. c8 d~ | d2 c4 g8 e~ | e2. c'4 | d2 c8 a4 c8~ | c1 |
		r8. b16 b8. b16 b8 a4 g8~ | g e'4 d8 c g f4 | e1 | r8 e'4 d8 c g f4 |
		e1 | r8 g4 f8 e d c c'~ | c4. a8~ a2 | r8 e f fis g c, dis e |
	} \alternative {
		{
			c1 | r8 e'4 d8 c g f4 |
		}
		{
			c1 | R1*3 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Missed the Sat -- ur -- day dance, heard they crowd -- ed the floor;
	cound -- n't bear it with -- out you, __ Don't Get A -- round Much An -- y -- more.
	Thougt I'd vis -- it the club, got as far as the door;
	they'd have ask'd me a -- bout __ you, __ Don't Get A -- round Much An -- y more.
	Dar -- ling, I guess __ my mind's __ more at ease, __ but nev -- er -- the -- less __
	why stir up mem -- o -- ris? __ Been in -- vi -- ed on dates, might have gone but what
	four? Aw -- f'lly dif -- f'rent with -- out __ you, __ Don't Get A -- round Much An -- y --
	more. Missed the Sat -- ur -- day
	more.
}
% endif
