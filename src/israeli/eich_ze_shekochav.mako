<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Epdf0"
	attributes['heb']=True

	attributes['title']=u"איך זה שכוכב"
	attributes['style']="Israeli"
	attributes['composer']=u"מתי כספי"
	attributes['poet']=u"נתן זך"
	attributes['piece']=u"בוסה נובה"
	attributes['singer']=u"מתי כספי"
	attributes['typesetter']=u"מרק ולצר <mark.veltzer@gmail.com>"

	attributes['completion']="5"
	attributes['uuid']="d936b39a-971e-11e0-9c44-0019d11e5a41"
	# my own deduction
	attributes['structure']="AB"
	attributes['location']="file:eich_ze_shekochav.pdf"

	attributes['idyoutube1']="1GI5Vst5a-o"
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
	a1:maj7 | a1:maj7 | a1:maj7 | e2:m7 e2:m6 | \myEndLine
	e1:m | d1:m7 | d2:m7 d2:m6 | a1:maj7 | \myEndLine
	a1:maj7 | f1:maj7 | f1:maj7 | c1:maj7 | \myEndLine
	c1:maj7 | f2 b2:m7 | e1:7 | a1:maj7 | a1:maj7 | \myEndLine
	\endPart

	\myMark "B"
	\startPart
	d1:7 | d1:m | fis1:dim | a1:m | \myEndLine
	b1:m7 | a1:7 | d1:m/f | fis1:m | \myEndLine
	fis1:m | a1:maj7 | a1:maj7 | e2:m7 e2:m6 | \myEndLine
	e1:m | d1:m7 | d2:m6 d2:m7 | a1:maj7 | a1:maj7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceEpdf0':
\relative {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key a \major

	%% Part A
	e2 e | gis4 a8 gis~ gis4 a8 gis~ | gis4 fis8 e8~ e4 fis8 g~ | g1 |
	r2 g8 fis e f~ | f1 | r4. f8 g a b cis~ | cis1 |
	r2. cis8 e~ | e4 e8 d~ d4 d8 c~ | c2. b8 d~ | d d d c~ c c c b~ |
	b4 r4 r8 a8 b d~ | d2. a8 d~ | d d~ d cis~ cis4 b8 a~ | a1~ | a2 r |

	%% Part B
	c2 c | c4 c8 c~ c4 c8 c~ | c4 c8 c~ c4 c8 c~ | c2 r |
	r2 d8 d d cis~ | cis2 r | r4 r8 a b b b a~ | a4 r r2 |
	r4 r8 a b b b a~ | a4 r r2 | r2 a8 gis fis g~ | g2 r |
	r2 g8 fis e f~ | f2 r | r4 r8 f g a b a~ | a1~ | a1 |
}
% endif

% if part=='LyricsEpdf0':
\lyricmode {
	%% Part A
	איך זה ש -- כו -- כב __ א -- חד __ ל -- בד __ מ -- עז. __
	איך הוא מ -- עז, __ ל -- מ -- ען ה -- שם. __
	כו -- כב __ א -- חד __ ל -- בד. __
	א -- ני __ לא ה -- יי -- __ תי מ -- עז. __
	ו -- א -- ני, __ ב -- ע -- __ צם, __ לא __ ל -- בד. __ __

	%% Part B
	איך זה ש -- כו -- כב __ א -- חד __ ל -- בד __ מ -- עז. __
	איך הוא מ -- עז, __ ל -- מ -- ען ה -- שם. __
	ל -- מ -- ען ה -- שם. __
	לה לה לה לה __
	לה לה לה לה __
	לה לה לה לה לה __ __
}
% endif
