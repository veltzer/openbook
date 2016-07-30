<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doExtra']=True
	attributes.addVersion('Epdf0', version)
	attributes.setDefaultVersionName('Epdf0')

	attributes['heb']=True

	attributes['title']=u'איך זה שכוכב'
	attributes['style']='Israeli'
	attributes['composer']=u'מתי כספי'
	attributes['poet']=u'נתן זך'
	attributes['piece']=u'בוסה נובה'
	attributes['singer']=u'מתי כספי'
	attributes['typesetter']=u'מרק ולצר <mark.veltzer@gmail.com>'

	attributes['completion']='5'
	attributes['uuid']='d936b39a-971e-11e0-9c44-0019d11e5a41'
	# my own deduction
	attributes['structure']='AB'
	attributes['location']='file:eich_ze_shekochav.pdf'

	attributes['idyoutube1']='1GI5Vst5a-o'
%>
% endif

% if part=='Doc':
	DONE:
	- added the epdf from a scan.
	- divided the song into parts and put the structure in the headers.
	- adjust the lyrics.
	- checked the lyrics are adjusted.
	TODO:
	- add description to the youtube link and add another link.
	- add nikud? Is that possible ?
% endif

% if part=='ChordsEpdf0':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	a1*3:maj7 | e2:m7 e:m6 | e1:m | \myEndLine
	d:m7 | d2:m7 d:m6 | a1*2:maj7 | \myEndLine
	f:maj7 | c:maj7 | \myEndLine
	f2 b:m7 | e1:7 | a1*2:maj7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	d1:7 | d:m | fis:dim | a:m | \myEndLine
	b:m7 | a:7 | d:m/f | fis1*2:m | \myEndLine
	a:maj7 | e2:m7 e:m6 | e1:m | \myEndLine
	d:m7 | d2:m6 d:m7 | a1*2:maj7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceEpdf0':
{
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key a \major

	%% part "A"
	e2 e | gis4 a8 gis~ gis4 a8 gis~ | gis4 fis8 e~ e4 fis8 g~ | g1 |
	r2 g8 fis e f~ | f1 | r4. f8 g a b cis~ | cis1 |
	r2. cis8 e~ | e4 e8 d~ d4 d8 c~ | c2. b8 d~ | d d d c~ c c c b~ |
	b4 r r8 a b d~ | d2. a8 d~ | d d~ d cis~ cis4 b8 a~ | a1~ | a2 r |

	%% part "B"
	c2 c | c4 c8 c~ c4 c8 c~ | c4 c8 c~ c4 c8 c~ | c2 r |
	r d8 d d cis~ | cis2 r | r4 r8 a b b b a~ | a4 r r2 |
	r4 r8 a b b b a~ | a4 r r2 | r a8 gis fis g~ | g2 r |
	r g8 fis e f~ | f2 r | r4 r8 f g a b a~ | a1~ | a |
}
% endif

% if part=='LyricsEpdf0':
\lyricmode {

	%% part "A"
	איך זה ש -- כו -- כב __ א -- חד __ ל -- בד __ מ -- עז. __
	איך הוא מ -- עז, __ ל -- מ -- ען ה -- שם. __
	כו -- כב __ א -- חד __ ל -- בד. __
	א -- ני __ לא ה -- יי -- __ תי מ -- עז. __
	ו -- א -- ני, __ ב -- ע -- __ צם, __ לא __ ל -- בד. __ __

	%% part "B"
	איך זה ש -- כו -- כב __ א -- חד __ ל -- בד __ מ -- עז. __
	איך הוא מ -- עז, __ ל -- מ -- ען ה -- שם. __
	ל -- מ -- ען ה -- שם. __
	לה לה לה לה __
	לה לה לה לה __
	לה לה לה לה לה __ __
}
% endif

% if part=='Extra':
%% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\fill-line {
			\hspace #0
			\concat {
				\right-column {

					\box "A"
					"איך זה שכוכב אחד לבד מעז."
					"איך הוא מעז, למען השם."
					"כוכב אחד לבד."
					"אני לא הייתי מעז."
					"ואני, בעצם, לא לבד."
				}
			}
		}
	}
}
% endif
