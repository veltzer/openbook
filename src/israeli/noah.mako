<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="My"
	attributes['heb']=True

	attributes['title']=u"נח"
	attributes['style']="Israeli"
	attributes['composer']=u"מתי כספי"
	attributes['poet']=u"יורם טהרלב"
	attributes['singer']=u"מתי כספי"
	attributes['piece']=u"סמבה"

	attributes['completion']="5"
	attributes['uuid']="702eab24-e8ce-11e2-91c8-5b1ff4f22893"

	attributes['structure']="A"

	attributes['lyricsurl']="http://shironet.mako.co.il/artist?type=lyrics&lang=1&prfid=688&wrkid=2292&gclid=CLiirsj_o7gCFci23godXw0A8w"

	attributes['idyoutube']="Eiae247OZXI"

%>
% endif

% if part=='Doc':
	DONE:
	- put in some of the meta data
	TODO:
	- put in the chords
	- put in the melody
	- put in the lyrics
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\mark "A"
	\startPart
	f1:m | bes:m | f:m | c:7 | \myEndLine
	f1:m | bes:m | f:m | c:7 | \myEndLine
	f:7 | bes:7 | c:7 | f | \myEndLine
	f:7 | bes:7 | c:7 | f:7 | \myEndLine
	bes | ees | ees:m7 | c:7 | \myEndLine
	f:m | bes:m | f:m | c:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceMy':
\relative c'{
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 160
	\time 4/4
	\key f \minor

	%% A part
	f8 aes8~ aes2. | f'4 des8 bes4 g4 c8~ | c4 aes8 f4 c4 bes'8~ | bes4 g8 e4 c4. |
	f8 aes8~ aes2. | f'4 des8 bes4 g4 c8~ | c4 aes8 f4 c4 bes'8~ | bes4 g8 e4 c4. |
}
% endif

% if part=='LyricsMy':
\lyricmode {
	נ -- ח- __ לא ש -- כ -- חנו איך __ ב -- ג -- שם ו __ -- ב -- ס -- ער
	נ -- ח- __ ל -- תי -- בה א -- ספ __ -- ת את ח -- יות __ ה -- י -- ער.
	שתיים, שתיים מכל מין
	האריה והממותה, הגמל והשיבוטה
	וגם ההיפופוטם.
	איך פתחת את הצוהר
	ומתוך התכלת הלבנה
	באה היונה. 
}
% endif
