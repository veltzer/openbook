<%page args="part"/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doChordBars']=True
	version['doGuitar']=True
	version['doExtra']=True
	attributes.addVersion('My', version)
	attributes.setDefaultVersionName('My')

	attributes['heb']=True

	attributes['title']=u"גשם"
	attributes['style']="Israeli"
	attributes['composer']=u"יחיאל אמסלם"
	attributes['poet']=u"יעקב גלעד"
	attributes['piece']=u"בלדת רוק"
	attributes['singer']=u"אלי לוזון"
	attributes['typesetter']=u"מרק ולצר <mark.veltzer@gmail.com>"

	attributes['completion']="5"
	attributes['uuid']="c562b5fa-c345-11e0-995c-0019d11e5a41"

	attributes['idyoutube1']="1CBj7q51-BQ"
	attributes['lyricsurl']="http://www.mp3music.co.il/lyrics/448.html"
%>
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {
		g1*2 | d | \myEndLine
		c1 | d | e1*2:m |
	}
	d | \myEndLine
	\repeat volta 2 {
		g1*2 | d | \myEndLine
		c1 | d | e1*2:m |
	}
	d | \myEndLine

	e:m | d | \myEndLine
	c1 | d | g | g2 g/fis | \myEndLine
	e1*2:m | d | \myEndLine
	c1 | d | e:m | \myEndLine
	a:m | b:m | c | des:m7.5- | \myEndLine
	b:m | g | c | e1*2 | \myEndLine

	\repeat volta 2 {
		a | e | \myEndLine
		d1 | e | fis1*2:m |
	}
	e | \myEndLine

	fis:m | e | \myEndLine
	d1 | e | fis1*2:m | \myEndLine
	fis:m | e | \myEndLine
	d1 | e | fis:m | \myEndLine
	\repeat volta 3 {
		b:m | cis:m | d | ees:m7.5- | \myEndLine
		cis:m | a | d | fis1*2 | \myEndLine
	}

	%% commented in order to see the closing repeats
	%%\endSong
	%%\endChords
}
% endif

% if part=='Extra':
%% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small { %% \teeny \tiny \small \normalsize \large \huge
		\fill-line {
			\right-column {
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
			\null
			\right-column {
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
		}
	}
}
% endif
