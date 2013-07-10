<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="My"
	attributes['heb']=True
	attributes['doExtra']=True

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
	- put in the chords
	TODO:
	- put in the melody
	- put in the lyrics
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong
	
	\mark "Intro"
	\startPart
	f1:m | bes:m | f:m | c:7 | \myEndLine
	\endPart

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

	%% Intro
	f8 aes bes b c f, c' b | bes f ees' d f, d' des f, | des' c f, c' b f bes aes | c, e g bes c4 c' | 

	%% A part
	f,,8 aes8~ aes2. | f'4 des8 bes4 g4 c8~ | c4 aes8 f4 c4 bes'8~ | bes4 g8 e4 c4. |
	f8 aes8~ aes2. | f'4 des8 bes4 g4 c8~ | c4 aes8 f4 c4 bes'8~ | bes4 g8 e4 c4. |
	g'4 f8 f4 c g'8~ | g f4 f2~ f8 | g4 f8 f4 c g'8~ | g f4 f c4. |
	g'4 f8 f4 c g'8~ | g f4 f bes,4. | g'4 f8 f4 c g'8~ | g f4 c'8~ c2 |
	c4 bes8 bes4 f c'8~ | c bes4 bes ees,4. | c'4 bes8 bes4 ges4 c8~ | c8 bes4 bes aes8 g aes~ |
	aes1 | f'4 des8 bes4 g f8~ | f c' bes aes bes aes f aes | c, e g bes c2 |
}
% endif

% if part=='LyricsMy':
\lyricmode {
	%% Intro
	_ _ _ _ _ _ _ _
	_ _ _ _ _ _ _ _
	_ _ _ _ _ _ _ _
	_ _ _ _ _ _

	%% A part
	נ -- ח- __ לא ש -- כ -- חנו איך __ ב -- ג -- שם ו __ -- ב -- ס -- ער
	נ -- ח- __ ל -- תי -- בה א -- ספ __ -- ת את ח -- יות __ ה -- י -- ער.
	שת -- יים, שת -- יים מ __ -- כל מין __
	ה -- אר -- יה ו -- ה __ -- מ -- מו -- תה, ה -- ג -- מל ו -- ה __ -- שי -- בו -- טה
	ו -- גם ה -- הי -- פו __ -- פו -- טם. __
	איך פ -- תח -- ת את __ ה -- צו -- הר
	ו -- מ -- תוך ה -- תכ __ -- לת ה -- ל -- ב -- נה __
	ב -- אה ה -- יו -- נה. __

}
% endif

% if part=='Extra':
%% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\fill-line {
			\right-column {
				%% part
				"נח - היונה כבר שבה עם עלה של זית"
				"נח - תן לנו לצאת ולחזור לבית"
				"כי כבר נמאסנו זה על זה"
				"האריה על הממותה, הגמל על השיבוטה"
				"וגם ההיפופוטם."
				"פתח לרגע את הצוהר"
				"ונעוף לתכלת הלבנה"
				"כך עם היונה."
			}
			\null
			\right-column {
				%% part
				"נח - כמה זמן נמשיך לשוט על פני המים?"
				"נח - כל החלונות סגורים כמעט חודשיים."
				"וכבר אין לנו אויר"
				"לאריה ולממותה לגמל ולשיבוטה"
				"וגם להיפופוטם."
				"פתח לרגע את הצוהר"
				"ואל תוך התכלת הלבנה"
				"שלח את היונה."
				\null
				%% part
				"נח - מה אתה דואג, הן כבר חדל הגשם"
				"נח - פתח את החלון, אולי הופיעה קשת"
				"ויראו אותה כולם"
				"האריה והממותה, הגמל והשיבוטה"
				"וגם ההיפופוטם."
				"פתח לרגע את הצוהר"
				"ואל תוך התכלת הלבנה"
				"שלח את היונה."

			}
		}
	}
}
% endif
