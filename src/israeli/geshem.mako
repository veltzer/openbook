<%inherit file="/src/include/common.makoi"/>
<%
	attributes['jazzTune']=True
	attributes['type']="harmony"
	attributes['render']="My"
	attributes['guitar']=True
	attributes['extra']=True

	attributes['title']=u"גשם"
	attributes['composer']=u"יחיאל אמסלם"
	attributes['singer']=u"אלי לוזון"
	attributes['poet']=u"יעקב גלעד"
	attributes['piece']=u"בלדת רוק"

	attributes['completion']="5"
	attributes['uuid']="c562b5fa-c345-11e0-995c-0019d11e5a41"

	attributes['idyoutube']="1CBj7q51-BQ"
	attributes['lyricsurl']="http://www.mp3music.co.il/lyrics/448.html"
%>

<%def name="myChordsMy()">
\chordmode {
	\startChords

	\startSong

	\repeat volta 2 {
		g1 | g | d | d | \myEndLine
		c | d | e:m | e:m | \myEndLine
		g | g | d | d | \myEndLine
		c | d | e:m | e:m | \myEndLine

		d | d |
	}

	e:m | e:m | d | d | \myEndLine
	c | d | g | g2 g/fis | \myEndLine
	e1:m | e:m | d | d | \myEndLine
	c | d | e:m | \myEndLine
	a:m | b:m | c | des:m7.5- | \myEndLine
	b:m | g | c | e | e | \myEndLine

	a1 | a | e | e | \myEndLine
	d | e | fis:m | fis:m | \myEndLine
	a | a | e | e | \myEndLine
	d | e | fis:m | fis:m | \myEndLine

	e | e |

	fis:m | fis:m | e | e | \myEndLine
	d | e | fis:m | fis:m | \myEndLine
	fis:m | fis:m | e | e | \myEndLine
	d | e | fis:m | \myEndLine
	b:m | cis:m | d | ees:m7.5- | \myEndLine
	cis:m | a | d | fis | fis | \myEndLine
	b:m | cis:m | d | ees:m7.5- | \myEndLine
	cis:m | a | d | fis | fis | \myEndLine
	b:m | cis:m | d | ees:m7.5- | \myEndLine
	cis:m | a | d | fis | fis | \myEndLine

	\endSong

	\endChords
}
</%def>

<%def name="myFretsMy()">
myFrets=\new FretBoards {
	\myChords
}
</%def>

<%def name="extra()">
%% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small { %% \teeny \tiny \small \normalsize \large \huge
		\fill-line {
			\column {
				"ברחובות כיבו מזמן את הניאון"
				"את נראית לי עייפה נלך לישון"
				"האור דולק בחדר השני"
				"אבל מישהו בוכה וזה לא אני."
				\null
				"אני רוצה לשמור עלייך ועלי"
				"היום עבר עלינו יום קשה מדי"
				"בחוץ יורדים עכשיו גשמי ברכה"
				"ואת בוכה, ואת בוכה."
				\null
				"ספרי לי מה כבד עלייך"
				"את כל מה שחבוי בך ונרדם"
				"אני אמחה את דמעותייך"
				"ורק שלא תבכי עוד לעולם."
			}
			\null
			\column {
				"אין מקום לדאגה היי שקטה"
				"אני איתך, את לא לבד לעת עתה"
				"עכשיו הכל זורם כאן במנוחה"
				"ואת בוכה, ואת בוכה."
				\null
				"ספרי לי מה כבד עלייך"
				"את כל מה שחבוי בך ונרדם"
				"אני אמחה את דמעותייך"
				"ורק שלא תבכי עוד לעולם."
			}
		}
	}
}
</%def>
