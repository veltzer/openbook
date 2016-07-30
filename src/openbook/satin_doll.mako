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

	# this is from the fake book
	attributes['title']='Satin Doll'
	attributes['style']='Jazz'
	# this is from the fake book and wikipedia
	attributes['composer']='Duke Ellington, Billy Strayhorn'
	# this is from the fake book and wikipedia
	attributes['poet']='Johnny Mercer'
	# this is from the fake book
	attributes['piece']='Smoothly'
	# this is from the fake book
	attributes['copyright']='1958 Tempo Music, Inc.'

	attributes['typesetter']='Jordan Eldredge <JordanEldredge@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='42beeace-da80-11e3-933c-cbd0bd4c5a97'
	attributes['structure']='AABA'
	attributes['location']='jfb:324-325'

	attributes['idyoutuberemark1']='Duke with his orchestra'
	attributes['idyoutube1']='TrytKuC3Z_o'
	attributes['idyoutuberemark2']='Clark Terry on the trumpet'
	attributes['idyoutube2']='GivaZbLzaoQ'
	attributes['lyricsurl']='http://www.metrolyrics.com/satin-doll-lyrics-ella-fitzgerald.html'
%>
% endif

% if part=='Doc':
	DONE:
	- put in the location in the fake book.
	- put in the meta data from the fake book.
	- put in the tune structure.
	- put in youtube performances and lyrics url.
	- put in the fake book chords.
	- put in the fake book tune.
	- put in the fake book lyrics.
	- check the fake book chords.
	- check the fake book tune.
	- check the fake book lyrics.
	- heard the tune the tune to make sure its ok and the tempo is fine.
	TODO:
	- get another version of the tune in here.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		d2:m7 g:7 | d:m7 g:7 | e:m7 a:7 | e:m7 a:7 | \myEndLine
		a:m9 d:9 | aes:m9 des:9 |
	} \alternative {
		{
			c d:m7 | e:m7 a:7 | \myEndLineVoltaNotLast
		}
		{
			c f:7 | c1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	g2:m7 c:7 | g:m7 c:9- | f:maj7 g:m7 | a:m7 bes:m7 | \myEndLine
	a:m7 d:7 | a:m7 d:9- | g:7 d:m7 | g1:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	d2:m7 g:7 | d:m7 g:7 | e:m7 a:7 | e:m7 a:7 | \myEndLine
	a:m9 d:9 | aes:m9 des:9 | c4 c:7/e f aes/ges | c/g g:7 c2:6.9 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key c \major

	%% part "A"
	\repeat volta 2 {
		a'8. g16 a8 g~ g a4. | r8 a4. g8 a4. | b8. a16 b8 a~ a b4. | r8 b4. a8 b4. |
		r8 d4. c8 d4. | r8 bes4. aes4 bes8 g~ |
	} \alternative {
		{
			g1~ | g |
		}
		{
			g1\repeatTie | r2 r4 r8 g |
		}
	}

	%% part "B"
	c4 bes8. a16 g8. a16 bes4 | c4 bes8. a16 g8. a16 bes8 c~ | c1~ | c2. r8 c |
	d8. c16 b8. a16~ a8. b16 c4 | d8. c16 b8 a~ a8. b16 c8 d~ | d1~ | d8 \xNote { d4^"(Spoken)" d8 d d4. } |

	%% part "A"
	a8. g16 a8 g~ g a4. | r8 a4. g8 a4. | b8. a16 b8 a~ a b4. | r8 b4. a8 b4. |
	r8 d4. c8 d4. | r8 bes4. aes4 bes8 g~ | g1~ | g2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Cig -- a -- rette hold -- er which wigs me, o -- ver her shoul -- der, she digs me.
	Out cat -- tin' that Sat -- in Doll. __

	%% part "B"
	_ She's no -- bod -- y's fool, so I'm play -- ing it cool as can be. __
	I'll give it a whirl, __ but I ain't for no girl __ catch -- ing me. __
	\markup \italic Switch -- \markup \italic E -- \markup \italic Roo -- \markup \italic ney

	%% part "A"
	Tel -- e -- phone num -- bers well you know, do -- ing my rhum -- bas
	with u -- no, and that 'n' my Sat -- in Doll. __
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {

	%% part "A"
	Ba -- by shall we __ go out skip -- pin' care -- ful a -- mi -- go, you're flip -- pin'.
	Speaks lat -- in that Sat -- in Doll.
}
% endif
